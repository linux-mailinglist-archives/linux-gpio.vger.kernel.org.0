Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 998E0267B50
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 18:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgILQA0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 12:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgILQAY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 12:00:24 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06768C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 09:00:24 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id mm21so3205697pjb.4
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=wCEzLBxO7DbAHFRF0goeqbQ18sUIULFX4f+gMwnCNnU=;
        b=lUq78OfswnS1bmbuyMOvC0ZfE5uMenBkVbXGfeS+stJsops+9VPwdAAioFqPdkVe0B
         PV4DcW1bCN4zeF4p1w1fsOjEjdtcK/TTwd56jLzhT73fOzT75Lg8t6f7MpIAdy88zc/4
         wQDe8D9bn3imohQsLKUPWn7tArRnbESPRYaGBVkRPia4QTincocBc8sIV29iWi5D5Pxr
         mHA4XbIuyBiisTbMoKoJaFHDSrluDH3RwolNlJILy1DIHIhSwNK5HGW2z9UMQGMMrBcI
         vrmoVVrD1N6hsw9EI/XY315FjPHHj0MOQDgyeffEUh4C007vXBoZNopvHF41dVCEMmoN
         +fEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=wCEzLBxO7DbAHFRF0goeqbQ18sUIULFX4f+gMwnCNnU=;
        b=lyX8n1GoVvM6UY+nmXrlEbaPmV/OdEBZqRw/6ABtZGk68v/2wFWaIvthDo+/VUseCG
         Jyl3xcfQ/yqTsB+Ctf8blUEDkL+ULPs3P+7p7EHeMN3ATCCmOIsh3UIHC5KibsSFikJn
         7Mi0btSujfCfEc/FrPxqBqq+D9cH27OF86BBa3F7LyJE9Rw2i7ieu59y6MtCKf+0yK0b
         rMQqESANxX3drSDdPdUN5xksr+rlzAX1CdvAC1A1DDKCqN+WVPeNDMZCXbTTcN7uen3k
         OUxFqr/kTDwGmaQNBuDoujSSXf08coyZpTJ/04YGpdDFh4qyUzTfUKNqyY4kT5RcF/87
         /ZrA==
X-Gm-Message-State: AOAM5339b+joVXN3jdPTbgd3G9LIC5c8ZEPtwoy4oyzyvvF1z391Qp4Q
        4fUXZvX+T6gWznJYcpETQOhF6UmhGGpgLA==
X-Google-Smtp-Source: ABdhPJzm7Zd3+OHqho+Y4cG0P5gJZdCLhlm4CJ+Z6TAZmYZjqc2uHivQVKzOFmJ2qmpV9v+g4uhbCA==
X-Received: by 2002:a17:90a:bc8d:: with SMTP id x13mr6954095pjr.229.1599926423081;
        Sat, 12 Sep 2020 09:00:23 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 13sm5624420pfp.3.2020.09.12.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 09:00:22 -0700 (PDT)
Message-ID: <5f5cf096.1c69fb81.62842.ea5d@mx.google.com>
Date:   Sat, 12 Sep 2020 09:00:22 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.9-rc1-15-g0a2d411b56b7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 105 runs,
 6 regressions (v5.9-rc1-15-g0a2d411b56b7)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 105 runs, 6 regressions (v5.9-rc1-15-g0a2d411b56b7)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
bcm2837-rpi-3-b        | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 3/4    =

mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =

panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =

rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 84/88  =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.9-r=
c1-15-g0a2d411b56b7/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.9-rc1-15-g0a2d411b56b7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      0a2d411b56b7c661e753bbea568f6b04c4a961c5 =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
bcm2837-rpi-3-b        | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 3/4    =


  Details:     https://kernelci.org/test/plan/id/5f5ce6af358b4aae90a60937

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f5ce6af358b4aae=
90a60939
      failing since 14 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)
      1 lines

    2020-09-12 15:15:47.497000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-09-12 15:15:47.497000  (user:khilman) is already connected
    2020-09-12 15:16:02.869000  =00
    2020-09-12 15:16:02.869000  =

    2020-09-12 15:16:02.885000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-09-12 15:16:02.886000  =

    2020-09-12 15:16:02.886000  DRAM:  948 MiB
    2020-09-12 15:16:02.903000  RPI 3 Model B (0xa02082)
    2020-09-12 15:16:02.993000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-09-12 15:16:03.024000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (380 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5ce76b776e88c960a60945

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5ce76b776e88c960a60=
946
      failing since 14 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f5ce5ab7b8467ad27a6091d

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f5ce5ab7b8467a=
d27a60921
      failing since 14 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)
      60 lines

    2020-09-12 15:13:39.498000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-12 15:13:39.504000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-12 15:13:39.509000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-12 15:13:39.516000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-12 15:13:39.522000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-12 15:13:39.527000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-12 15:13:39.533000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-12 15:13:39.539000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-12 15:13:39.545000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-12 15:13:39.551000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 84/88  =


  Details:     https://kernelci.org/test/plan/id/5f5ce7212121b1bbcda60914

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f5ce7212121b1bbcda60954
      failing since 14 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)

    2020-09-12 15:19:57.479000  <8>[   53.563953] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5ce932c798d3e0d0a6091d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5ce932c798d3e0d0a60=
91e
      failing since 12 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f5ce686e9c213616da6091e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-15-g0a2d=
411b56b7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f5ce686e9c213616da60=
91f
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)  =20
