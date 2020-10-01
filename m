Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A2627FCD1
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Oct 2020 12:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbgJAKHT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Oct 2020 06:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgJAKHT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Oct 2020 06:07:19 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE81C0613D0
        for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2020 03:07:19 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id v14so1620499pjd.4
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2020 03:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Qz1AYpImY8R6X5xsjcuKDnb+FAjcwMo8BokiQYNaZWg=;
        b=M6EXuPQ9PmnYYcpqf6msHBfSeVb+8JtiD1KoMtpbgWksCAMfuMygNnug2WPKUUxWwG
         XTomBoNcQQFhwqbs6aNF0U2wFNJRH0MnJMot6myiCdtDLJbBWg01YuIkezypoOQNkpLn
         vMoHo3RQTPiTmkJ7ENWjAH34qKQj+dypf595/Z8URg+c0N9JAZIZLORpYaGMlnWBME7c
         niym32Omzyz9u48lguOS/VHw25WOCHjP2foy3nyNXLOrWGDlPvozvCP3CoseigeGkDJq
         gu7LcqC/OxZPnL7QFSOdh8APfcfAqybPkjrN3RbK/g0e0VZ42v9Vg8eKKiJ1VfgQDwSP
         HZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Qz1AYpImY8R6X5xsjcuKDnb+FAjcwMo8BokiQYNaZWg=;
        b=bSQq7NcoTwgdyZ2KW4AAuvvch8wbOfeRnPEmaj+qR+5LUf0LyJJdaDbZzXnkG4J5Z5
         sF4ZdP8aAwGoPTczECwXl1kX5eP6mGPVc1oKPV94DaluHpQ5cDOl5ZO5KB9Jpqd6C/2s
         CC77wFf4OILicrjPRY6BDrfBG9h315XrUhOGjYigbGziawZ7WC7CikOnA6hS8bMXItOM
         zucIq9zpUkqKaSl4LXFJO1ZkI3VFisY9B5PfS16o7h2RxtIodyJ7jJMa3kgZ1WS3g42P
         +ukQ91aZTK1eK8en1fHT75DFw/GckyjFMMHGIhcgwf2pQcVUotELZl13jjRokg7ke16O
         m4vQ==
X-Gm-Message-State: AOAM531tQ99os/ZHRjcp8cUaVP8dcb2cWoJyusqFqyDlXN15eRz5VRPY
        UVyfQ0ChqTwFvpUxadnwPR6doDAavCBl9A==
X-Google-Smtp-Source: ABdhPJzLOcT0B5SCzZbayx5+Vmlx0Z5TEFQJuMNmYOgPObK1+260IAFM0e0uIYkMCEGfQkjwKj9xOg==
X-Received: by 2002:a17:90a:ff06:: with SMTP id ce6mr1031305pjb.38.1601546838307;
        Thu, 01 Oct 2020 03:07:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h12sm5541540pfo.68.2020.10.01.03.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:07:17 -0700 (PDT)
Message-ID: <5f75aa55.1c69fb81.3be85.bd67@mx.google.com>
Date:   Thu, 01 Oct 2020 03:07:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc2-17-g8c1f1c34777b
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes baseline: 64 runs,
 6 regressions (v5.9-rc2-17-g8c1f1c34777b)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 64 runs, 6 regressions (v5.9-rc2-17-g8c1f1c34777b)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig | res=
ults
-----------------------+-------+---------------+----------+-----------+----=
----
bcm2837-rpi-3-b        | arm64 | lab-baylibre  | gcc-8    | defconfig | 3/4=
    =

mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig | 0/1=
    =

rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig | 87/=
90  =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig | 0/1=
    =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.9-r=
c2-17-g8c1f1c34777b/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.9-rc2-17-g8c1f1c34777b
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      8c1f1c34777bddb633d4a068a9c812d29974c6bd =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig | res=
ults
-----------------------+-------+---------------+----------+-----------+----=
----
bcm2837-rpi-3-b        | arm64 | lab-baylibre  | gcc-8    | defconfig | 3/4=
    =


  Details:     https://kernelci.org/test/plan/id/5f759a81509465ec4d877266

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-17-g8c1f=
1c34777b/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-17-g8c1f=
1c34777b/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f759a81509465ec=
4d87726a
      new failure (last pass: v5.9-rc2-15-g17479aa39fbf)
      1 lines

    2020-10-01 08:57:37.688000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-10-01 08:57:37.688000  (user:khilman) is already connected
    2020-10-01 08:57:53.147000  =00
    2020-10-01 08:57:53.147000  =

    2020-10-01 08:57:53.147000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-10-01 08:57:53.147000  =

    2020-10-01 08:57:53.148000  DRAM:  948 MiB
    2020-10-01 08:57:53.163000  RPI 3 Model B (0xa02082)
    2020-10-01 08:57:53.250000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-10-01 08:57:53.282000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (378 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig | res=
ults
-----------------------+-------+---------------+----------+-----------+----=
----
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig | 0/1=
    =


  Details:     https://kernelci.org/test/plan/id/5f759b3d6cc2ef85d787716e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-17-g8c1f=
1c34777b/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-17-g8c1f=
1c34777b/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f759b3d6cc2ef85d7877=
16f
      failing since 33 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =



platform               | arch  | lab           | compiler | defconfig | res=
ults
-----------------------+-------+---------------+----------+-----------+----=
----
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig | 87/=
90  =


  Details:     https://kernelci.org/test/plan/id/5f759c23ee036affab877176

  Results:     87 PASS, 3 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-17-g8c1f=
1c34777b/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-17-g8c1f=
1c34777b/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-dp-probed: https://kernelci.org/test/case/id/5=
f759c23ee036affab8771a7
      new failure (last pass: v5.9-rc2-15-g17479aa39fbf)

    2020-10-01 09:06:39.262000  /lava-2674827/1/../bin/lava-test-case
     * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f759c24ee03=
6affab8771d1
      failing since 33 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      11 lines

    2020-10-01 09:06:35.712000  kern  :alert : Mem abort info:
    2020-10-01 09:06:35.715000  kern  :alert :   ESR =3D 0x96000006
    2020-10-01 09:06:35.721000  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2020-10-01 09:06:35.724000  kern  :alert :   SET =3D 0, FnV =3D 0
    2020-10-01 09:06:35.728000  kern  :alert :   EA =3D 0, S1PTW =3D 0
    2020-10-01 09:06:35.731000  kern  :alert : Data abort info:
    2020-10-01 09:06:35.735000  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
006
    2020-10-01 09:06:35.738000  kern  :alert :   CM =3D 0, WnR =3D 0
    2020-10-01 09:06:35.746000  kern  :alert : user pgtable: 4k pages, 48-b=
it VAs, pgdp=3D00000000eb319000
    2020-10-01 09:06:35.758000  kern  :alert : [0000000000000010] pgd=3D000=
00000eb31a003, p4d=3D00000000eb31a003, pud=3D00000000eb31b003, pmd=3D000000=
0000000000
     * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f759c24ee03=
6affab8771d2
      failing since 33 days (last pass: v5.8-rc5, first fail: v5.9-rc2)
      2 lines

    2020-10-01 09:06:35.778000  kern  :emerg : Code: 1a9f07e7 f10000df 7a40=
08e4 54000521 (f94008c8) =

      =



platform               | arch  | lab           | compiler | defconfig | res=
ults
-----------------------+-------+---------------+----------+-----------+----=
----
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig | 0/1=
    =


  Details:     https://kernelci.org/test/plan/id/5f759e34f8c34cfa65877178

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.9-rc2-17-g8c1f=
1c34777b/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.9-rc2-17-g8c1f=
1c34777b/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f759e34f8c34cfa65877=
179
      failing since 30 days (last pass: v5.8-rc5, first fail: v5.9-rc2)  =20
