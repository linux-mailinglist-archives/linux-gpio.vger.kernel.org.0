Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0080E27D9F3
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 23:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbgI2VZB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 17:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbgI2VZA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 17:25:00 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE94C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 14:24:59 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id md22so4321354pjb.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 14:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=JZMQYe+G5iFn2G+vgZrQSr/7iQmsA2dNhYy3Rf23zGw=;
        b=FW2ZoA/fp18mgaxFFvpaKYzwKoxb0UVbLy1q/PsuNT3Nw4JFFMhxuymyOVSuozCn2K
         zmtebDGMnK98HnMdRaoipehO8Ffh/IJQiLJOfTMZx/9vHQ6nZ7252odX4aJUmRph+pI4
         fXH8BbhWqlP/uUH3Tnb2UsbOV3+qfCGrQ9R8KFEFlwilD0JpPHt35sUiFP52P8qdNzHo
         X0sSMcjVvBbexfrjE3jNG1/c3H9e4BKIPlazaDTJXxDJLQfZ0EhPU7F6sZIVQozs9bhD
         6rZzF7wDnqXX4iaY9vyojEjlu6yF6qu77FUREm6OTHwLvcqZ32Rim3wL6NxLpIiwwenq
         vFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=JZMQYe+G5iFn2G+vgZrQSr/7iQmsA2dNhYy3Rf23zGw=;
        b=bnaTRvPmVF7vsEr6O6FLhQV1fA48lJnEiwdCD+kRd3HZtm9GuvJO6IWekYyeDwvrQk
         EUze2NgyqfD5i4UP/aj61nFjYFTjsMD1YNTi0wqmkBrt0JgRiYtF6kr8Rpf1L8MQe9E1
         zQ/nEq4jxYU56o7Fvf7iUHM5uc1SXHwaM29q2m7zBtIm57H5U0Tmu8JAKcFX00c/xFHh
         Va5vP6Xt30KU9dywJFlaAryujDnAtqEatf3C/tHO7XjMYXsOpD5tPO4taaznO2HHf5Am
         rdxvY/Ubf5G7GZYGr7rLHCn4EasDXGt8Lp2kh3qW+odIu0fSsWMeleBkwz13PxnJKG7q
         7y4A==
X-Gm-Message-State: AOAM530cUdXQD8q7AYed7cvt/+D+Z8ifCcVWk2eH8T3Skz5hI/7vv9oq
        9kE3gAIwbZkdKdnMWF46FOHAXjmaiKMmBg==
X-Google-Smtp-Source: ABdhPJxznkQTanls0r5GPSpF6uunw0jmsCZ9ecXQoK+NkniozsPfM3dw12GgopTMBndbgFZgGPlMow==
X-Received: by 2002:a17:90a:fd98:: with SMTP id cx24mr5327861pjb.181.1601414698361;
        Tue, 29 Sep 2020 14:24:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c7sm6557325pfj.100.2020.09.29.14.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 14:24:57 -0700 (PDT)
Message-ID: <5f73a629.1c69fb81.18f98.db7d@mx.google.com>
Date:   Tue, 29 Sep 2020 14:24:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.9-rc1-39-g12d16b397ce0
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel baseline: 96 runs,
 5 regressions (v5.9-rc1-39-g12d16b397ce0)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 96 runs, 5 regressions (v5.9-rc1-39-g12d16b397ce0)

Regressions Summary
-------------------

platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =

panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =

rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 89/90  =

sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =

sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.9-r=
c1-39-g12d16b397ce0/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.9-rc1-39-g12d16b397ce0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      12d16b397ce0a999d13762c4c0cae2fb82eb60ee =



Test Regressions
---------------- =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
mt8173-elm-hana        | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f739cd0a2327520188772c2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f739cd0a232752018877=
2c3
      failing since 32 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
panda                  | arm   | lab-collabora | gcc-8    | multi_v7_defcon=
fig | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f739c343b36d14956877173

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f739c343b36d14=
956877179
      failing since 32 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)
      60 lines

    2020-09-29 20:42:15.038000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-09-29 20:42:15.044000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-09-29 20:42:15.050000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-09-29 20:42:15.056000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-09-29 20:42:15.062000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-09-29 20:42:15.068000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-09-29 20:42:15.074000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-09-29 20:42:15.080000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-09-29 20:42:15.086000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-09-29 20:42:15.092000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
rk3399-gru-kevin       | arm64 | lab-collabora | gcc-8    | defconfig      =
    | 89/90  =


  Details:     https://kernelci.org/test/plan/id/5f739c3c3b36d14956877197

  Results:     89 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f739c3c3b36d149568771d5
      failing since 32 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)

    2020-09-29 20:42:21.143000  <8>[   50.575628] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
      =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun50i-a64-pine64-plus | arm64 | lab-baylibre  | gcc-8    | defconfig      =
    | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f739dd4026eb18e4587717c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm64/defconfig/gcc-8/lab-baylibre/baseline-sun50i-a64-pine64-plus=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f739dd4026eb18e45877=
17d
      failing since 29 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-10-gfeeaefd378ca)  =



platform               | arch  | lab           | compiler | defconfig      =
    | results
-----------------------+-------+---------------+----------+----------------=
----+--------
sun7i-a20-cubieboard2  | arm   | lab-baylibre  | gcc-8    | multi_v7_defcon=
fig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f739cd3a2327520188772c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-39-g12d1=
6b397ce0/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-sun7i-a20-cubie=
board2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-2-g61393d279614/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f739cd3a232752018877=
2c6
      failing since 17 days (last pass: gpio-v5.8-2-103-g22cc422070d9, firs=
t fail: v5.9-rc1-15-g0a2d411b56b7)  =20
