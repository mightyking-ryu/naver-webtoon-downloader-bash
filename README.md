# 네이버 웹툰 다운로더 (Bash 스크립트)

**주의: 이 스크립트는 개인 소장 목적으로만 사용되어야 합니다. 무단으로 웹툰 이미지를 다운로드하여 배포하는 것은 저작권 침해가 될 수 있습니다.**

## 소개

네이버 웹툰을 이미지로 다운로드하여 소장하기 위해 만들어졌습니다.

## 기능

1. 네이버 웹툰의 각 에피소드를 분할된 이미지 파일로 저장
2. 이미지 병합 기능 추가 예정
3. PDF 변환 기능 추가 예정
4. 즐겨찾기 기능 추가 예정

## 지원

- 네이버 무료 웹툰
- 도전 만화 지원 예정
- 성인 만화 지원 예정

## 사용법

1. 깃 저장소를 클론합니다.

    ```bash
    $ git clone https://github.com/mightyking-ryu/naver-webtoon-downloader-bash.git
    $ cd naver-webtoon-downloader-bash
    ```

2. 스크립트에 실행 권한을 부여합니다.

    ```bash
    $ chmod +x naver-webtoon-downloader-bash.sh
    ```

3. 스크립트를 실행합니다.

    ```bash
    $ bash naver-webtoon-downloader-bash.sh
    ```
    또는
    ```bash
    $ ./naver-webtoon-downloader-bash.sh
    ```

4. 웹툰 아이디와 폴더 이름, 시작 에피소드 번호와 끝 에피소드 번호를 순서대로 입력합니다.

    ```bash
    $ ./naver-webtoon-downloader-bash.sh
    ==========================
     Naver Webtoon Downloader 
    ==========================

    Enter title id: [웹툰 타이틀 아이디]
    Enter folder name: [폴더 이름(웹툰 이름)]
    Enter start episode number: [시작 에피소드 번호]
    Enter end episode number: [끝 에피소드 번호]
    ```

5. 다운로드가 문제없이 끝날 때까지 기다립니다.

    ```bash
    [+] start downloading...
    episode 1 downloaded
    episode 2 downloaded
    ...
    episode n downloaded
    [+] finished downloading!
    ```

6. webtoons 폴더 안에 저장된 웹툰을 확인합니다.

    ```bash
    $ ls ./webtoons/[웹툰 이름]
    ep-1/  ep-2/  ...  ep-n/
    ```

## 예시

![화산귀환](https://od.lk/s/MzhfMTk3OTA0Mzhf/webtoon-downloader-example-screenshot.png)

```bash
$ ./naver-webtoon-downloader.sh 
==========================
 Naver Webtoon Downloader 
==========================

Enter title id: 769209
Enter folder name: 화산귀환
Enter start episode number: 1
Enter end episode number: 2

[+] start downloading...
episode 1 downloaded
episode 2 downloaded
[+] finished downloading!

$ ls ./webtoons/화산귀환
ep-1/  ep-2/

$ ls ./webtoons/화산귀환/ep-1
1.jpg  ...  146.jpg
```

## 라이선스

GNU General Public License v3.0

## 연락처

- 이메일: dongwooryu@snu.ac.kr