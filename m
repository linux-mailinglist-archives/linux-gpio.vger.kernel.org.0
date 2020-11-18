Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D2C2B7623
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 07:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgKRGF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 01:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgKRGF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 01:05:57 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CC4C0613D4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 22:05:56 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d3so420042plo.4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 22:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HFoXs+tE9E9HADeW0BVldRIQvpKX1E45/03iLWzdfGg=;
        b=yOEkbg6EH09W9sZyd31fE5v+ZWuXGn0YsSk49Ix7SPG0YkN7KZ3tiTRCoGCDnIUAOE
         K6boVEo/dzYkXFO9HKxdDfjLLlmP8paOxuuqOADKPRKkZn6ALVhfiPQqeTQG7wcyu6vX
         XMdviDAT09D0P5jJKJdHcMyjiKXBSkVxUVfFT/XxwLPlupRUzoBNai04T8Ma4pAE+qV5
         4mNdz+Lz7agQhwTE8oCz+i2l2mwN7QQWx51Ffc6evjlP+ORWoC5wZ0UjN2lRUmuHHLfV
         8TqsddV+KIGg4yBJcTBMAxOuajXHTErHmIqISIjHJx9O2l1Kfu61pGLTYE58nTkYuWKd
         VnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HFoXs+tE9E9HADeW0BVldRIQvpKX1E45/03iLWzdfGg=;
        b=iWPa9z8u4SB4V31JxnB/tz31FuqYkkDR6dF9WF5TDHvMB7uHWUjgI3Io7vYLDNaBtE
         ZEliZFfmOXQQ4IIpjj9xQvrulfEZ5iSvTE0J5jd/ncQ1V5NVAdy0Owm4YjmBSp86jboe
         L6ArBPSjtCZvAWiqpkKeUNu7tTGJ2GXqfLHWEUGFoPFq7o7CTeCDNAhf329FUzBiSU6G
         bjTiybanN6m2VVEfoQfxqrjAwhGYR8fYf7HrLg6QzOvOutYLgaPZh+H2fxRvQiFr/E18
         0vBod3UQ2OlEpi50ZjolyJ78yWinR4QVoss99tUZd+j3i4PZlBfYhGBOMCwVr/fbAxDI
         aPkw==
X-Gm-Message-State: AOAM533jE5+owyswPwiv4TKP3f4qSgribvxSvDG2vBuRENfjhyRiKPsY
        Sx+6U/Gvrb3d9YYWBjuvRheOmSKRR35Ong==
X-Google-Smtp-Source: ABdhPJyH4rGHS2WyPB0ZFJLG6LGcAlNEw3Zm8QYTm4mW1JFRvgT2n9n3tnIup2/i6i0/P00aqQoboA==
X-Received: by 2002:a17:90b:1011:: with SMTP id gm17mr2500174pjb.73.1605679555150;
        Tue, 17 Nov 2020 22:05:55 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y188sm2460970pfy.98.2020.11.17.22.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 22:05:54 -0800 (PST)
Message-ID: <5fb4b9c2.1c69fb81.65d0a.5853@mx.google.com>
Date:   Tue, 17 Nov 2020 22:05:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.10-rc4
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes baseline: 113 runs, 3 regressions (v5.10-rc4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes baseline: 113 runs, 3 regressions (v5.10-rc4)

Regressions Summary
-------------------

platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
bcm2837-rpi-3-b      | arm64 | lab-baylibre | gcc-8    | defconfig | 1     =
     =

meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-8    | defconfig | 1     =
     =

meson-gxm-q200       | arm64 | lab-baylibre | gcc-8    | defconfig | 1     =
     =


  Details:  https://kernelci.org/test/job/linusw/branch/fixes/kernel/v5.10-=
rc4/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   fixes
  Describe: v5.10-rc4
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      09162bc32c880a791c6c0668ce0745cf7958f576 =



Test Regressions
---------------- =



platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
bcm2837-rpi-3-b      | arm64 | lab-baylibre | gcc-8    | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/5fb4aee57cd69a9da2d8d911

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.10-rc4/arm64/d=
efconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.10-rc4/arm64/d=
efconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb4aee57cd69a9d=
a2d8d914
        new failure (last pass: v5.10-rc1-14-gb72de3ff19fd)
        1 lines

    2020-11-18 05:17:17.752000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-18 05:17:17.752000+00:00  (user:khilman) is already connected
    2020-11-18 05:17:33.026000+00:00  =00
    2020-11-18 05:17:33.026000+00:00  =

    2020-11-18 05:17:33.026000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-18 05:17:33.026000+00:00  =

    2020-11-18 05:17:33.026000+00:00  DRAM:  948 MiB
    2020-11-18 05:17:33.042000+00:00  RPI 3 Model B (0xa02082)
    2020-11-18 05:17:33.129000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-18 05:17:33.160000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (381 line(s) more)  =

 =



platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
meson-g12b-odroid-n2 | arm64 | lab-baylibre | gcc-8    | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/5fb4af8c8e5a14566fd8d907

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.10-rc4/arm64/d=
efconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.10-rc4/arm64/d=
efconfig/gcc-8/lab-baylibre/baseline-meson-g12b-odroid-n2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb4af8c8e5a14566fd8d=
908
        new failure (last pass: v5.10-rc1-14-gb72de3ff19fd) =

 =



platform             | arch  | lab          | compiler | defconfig | regres=
sions
---------------------+-------+--------------+----------+-----------+-------=
-----
meson-gxm-q200       | arm64 | lab-baylibre | gcc-8    | defconfig | 1     =
     =


  Details:     https://kernelci.org/test/plan/id/5fb4b29a3ce50e813bd8d90d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/fixes/v5.10-rc4/arm64/d=
efconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//linusw/fixes/v5.10-rc4/arm64/d=
efconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb4b29a3ce50e813bd8d=
90e
        new failure (last pass: v5.10-rc1-14-gb72de3ff19fd) =

 =20
