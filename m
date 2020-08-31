Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F909257C3D
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 17:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgHaPYr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 11:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgHaPYq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 11:24:46 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48A9C061575
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:24:44 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id e33so778039pgm.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2020 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=n19BCtWSpapyVlcXGJkdkIPen1AHLLLhPjgLZUEA6Ws=;
        b=uCxheZw0RZAazoiTIMtatf6C9DjWbCwMKA0opp/a2yfWBFW5FjaPZku5+Y0Pnz72P+
         e/+4r/Y70U4UHg3K+0JWul/P37EVmYMzHOHBgsiFRTsvE2bULudjOXaVwQzOZLEjfqbm
         F6VVt7Q443hfr43bCJNmoCA5vhxMZ33qELiWCHIFAetC5MyDN1MW3+l6yjkXaSE4Yoie
         KbP5HPsuX4cEg/f+u3WO5uBvVzSQ+Py8xnu2iZo9kkuqOvBNMfUHfMRmh6df+0wAvrjr
         HJOQyIH77FZIoRZhs8glMX6keSVglDHQMTr0sZbu9aoiHz4cPQkGDPDlbhPwT78J/zKL
         erTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=n19BCtWSpapyVlcXGJkdkIPen1AHLLLhPjgLZUEA6Ws=;
        b=lxbwM6M2MRvs4OWWcCkpHfSS7P+bBbe4EEjATwfe8y7efdE5zInWmN7wJ6bHcrmhEx
         Dcliq0JECPZF1ccyrwpBNtag0rWy90rJmDlCFSyJe5Oaj+McSQSVtRr4aAPZQIAum6MB
         WVhD2+v9gmZRYr75x0a0u2mFzHHkZs/DR8UXUYd7f0fWNi0xXVdbS3RNueutFFV04/LP
         fhgYuNdXvHpzD5wKDxD8/nQz7cJG9ICONLI2CELu0chnu0skfgtVKh6XKKOogpWESEuj
         4akhKARpeBgN54lwp5eXfbs0P/S75dpYo1Lvih8i91xtT10+pPJKe+iWxuaYhHk/byLV
         HZnQ==
X-Gm-Message-State: AOAM533RPU0n7Y4xeSEhsyHMS2HVdho+J8RYfRiAuZ909T0WHelsbdLQ
        rF+tjD58v4O2KMG4B9Ju8IZHVZjtH9eX5Q==
X-Google-Smtp-Source: ABdhPJx7ReXXR7/f270NsBieHcmgANXao7CLi/aeTGA6XXjDf9jH1qIMZKG1c0rGBuw1CjknwFGgoQ==
X-Received: by 2002:aa7:8b0c:: with SMTP id f12mr1680162pfd.58.1598887483246;
        Mon, 31 Aug 2020 08:24:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t15sm8488065pfl.175.2020.08.31.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 08:24:41 -0700 (PDT)
Message-ID: <5f4d1639.1c69fb81.49fe6.c8d6@mx.google.com>
Date:   Mon, 31 Aug 2020 08:24:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.9-rc1-10-gfeeaefd378ca
X-Kernelci-Report-Type: test
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel baseline: 92 runs,
 4 regressions (v5.9-rc1-10-gfeeaefd378ca)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 92 runs, 4 regressions (v5.9-rc1-10-gfeeaefd378ca)

Regressions Summary
-------------------

platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
bcm2837-rpi-3-b  | arm64 | lab-baylibre  | gcc-8    | defconfig          | =
3/4    =

mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig          | =
0/1    =

omap4-panda      | arm   | lab-collabora | gcc-8    | multi_v7_defconfig | =
4/5    =

rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig          | =
84/88  =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.9-r=
c1-10-gfeeaefd378ca/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.9-rc1-10-gfeeaefd378ca
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      feeaefd378cae2f6840f879d6123ef265f8aee79 =



Test Regressions
---------------- =



platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
bcm2837-rpi-3-b  | arm64 | lab-baylibre  | gcc-8    | defconfig          | =
3/4    =


  Details:     https://kernelci.org/test/plan/id/5f492830a1c554f139dfde64

  Results:     3 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-10-gfeea=
efd378ca/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-10-gfeea=
efd378ca/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f492830a1c554f1=
39dfde66
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)
      1 lines

    2020-08-28 15:50:12.783000  Connected to bcm2837-rpi-3-b console [chann=
el connected] (~$quit to exit)
    2020-08-28 15:50:12.783000  (user:khilman) is already connected
    2020-08-28 15:50:28.039000  =00
    2020-08-28 15:50:28.039000  =

    2020-08-28 15:50:28.039000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -080=
0)
    2020-08-28 15:50:28.040000  =

    2020-08-28 15:50:28.040000  DRAM:  948 MiB
    2020-08-28 15:50:28.055000  RPI 3 Model B (0xa02082)
    2020-08-28 15:50:28.142000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
    2020-08-28 15:50:28.173000  Loading Environment from FAT... *** Warning=
 - bad CRC, using default environment
    ... (378 line(s) more)
      =



platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
mt8173-elm-hana  | arm64 | lab-collabora | gcc-8    | defconfig          | =
0/1    =


  Details:     https://kernelci.org/test/plan/id/5f4928f1152743a0b6dfde72

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-10-gfeea=
efd378ca/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-10-gfeea=
efd378ca/arm64/defconfig/gcc-8/lab-collabora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f4928f1152743a0b6dfd=
e73
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)  =



platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
omap4-panda      | arm   | lab-collabora | gcc-8    | multi_v7_defconfig | =
4/5    =


  Details:     https://kernelci.org/test/plan/id/5f492a8ab3a8958ec3dfde97

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-10-gfeea=
efd378ca/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-10-gfeea=
efd378ca/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f492a8ab3a8958=
ec3dfde9b
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)
      60 lines

    2020-08-28 16:02:12.839000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c802
    2020-08-28 16:02:12.845000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c803
    2020-08-28 16:02:12.851000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c804
    2020-08-28 16:02:12.857000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c805
    2020-08-28 16:02:12.863000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c806
    2020-08-28 16:02:12.869000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c807
    2020-08-28 16:02:12.875000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c808
    2020-08-28 16:02:12.881000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c809
    2020-08-28 16:02:12.886000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80a
    2020-08-28 16:02:12.893000  kern  :alert : BUG: Bad page state in proce=
ss swapper/0  pfn:9c80b
    ... (49 line(s) more)
      =



platform         | arch  | lab           | compiler | defconfig          | =
results
-----------------+-------+---------------+----------+--------------------+-=
-------
rk3399-gru-kevin | arm64 | lab-collabora | gcc-8    | defconfig          | =
84/88  =


  Details:     https://kernelci.org/test/plan/id/5f4928241e3568554ddfde6f

  Results:     84 PASS, 4 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.9-rc1-10-gfeea=
efd378ca/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.9-rc1-10-gfeea=
efd378ca/arm64/defconfig/gcc-8/lab-collabora/baseline-rk3399-gru-kevin.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.bootrr.rockchip-pcie-probed: https://kernelci.org/test/case/id=
/5f4928251e3568554ddfdeaf
      new failure (last pass: gpio-v5.8-2-103-g22cc422070d9)

    2020-08-28 15:52:00.762000  <8>[   53.555870] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Drockchip-pcie-probed RESULT=3Dfail>
      =20
