#!/bin/bash

# ============================
# 네이버 웹툰 다운로더 v1.0.0
# 도전만화 지원 X
# 2023년 10월 작동 확인
# ============================

# 요청 헤더
header="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36"

# 웹툰 다운로드 함수
function download() {
    local title_id=$1
    local episode_number=$2
    local url="https://comic.naver.com/webtoon/detail?titleId=${title_id}&no=${episode_number}"

    # -------------------------------------------------------
    # 에피소드 폴더 이름 형식
    # 예1) "ep-${episode_number}"  -> ep-1, ep-2, ...
    # 예2) "${episode_number}화"   -> 1화, 2화, ...
    # -------------------------------------------------------
    local episode_folder_name="ep-${episode_number}"

    # 에피소드 폴더 생성
    rm -r $episode_folder_name 2> /dev/null
    mkdir $episode_folder_name
    cd $episode_folder_name

    # HTML 파일 다운로드 및 저장
    curl --silent "${url}" > "html-${episode_number}"

    # 이미지 링크 찾아서 파일로 저장
    grep -o "[0-9]*_[0-9a-z]*_IMAG[0-9]*_[0-9]*.jpg" "html-${episode_number}" > "link-list-${episode_number}"

    # 이미지 다운로드
    local img_name=1
    while read link; do
	    curl "https://image-comic.pstatic.net/webtoon/${title_id}/${episode_number}/${link}" -H "${header}" -o "${img_name}.jpg" --silent
	    img_name=$(($img_name + 1))
    done < "link-list-${episode_number}"

    echo "episode ${episode_number} downloaded"

    # HTML 파일과 링크 목록 파일 삭제
    rm "html-${episode_number}"
    rm "link-list-${episode_number}"

    cd ..
}

# 메인 함수
function main() {
    echo "=========================="
    echo " Naver Webtoon Downloader "
    echo "=========================="
    echo

    local titleId
    local folderName     # 생성할 폴더 이름(웹툰 이름)
    local start_episode  # 다운로드 시작 에피소드
    local end_episode    # 다운로드 끝 에피소드

    read -p "Enter title id: " titleId
    read -p "Enter folder name: " folderName
    read -p "Enter start episode number: " start_episode
    read -p "Enter end episode number: " end_episode
    echo

    # 폴더 생성
    rm -r "${folderName}" 2> /dev/null
    mkdir "${folderName}"
    cd "${folderName}"

    # 각 에피소드 다운로드
    echo "[+] start downloading..."
    for (( episode=$start_episode; episode<=$end_episode; episode++ )); do
        download $titleId $episode
    done
    echo "[+] finished downloading!"
}

mkdir "webtoons" 2> /dev/null
cd "webtoons"
main