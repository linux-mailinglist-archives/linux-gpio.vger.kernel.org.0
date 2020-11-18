Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39E62B742E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 03:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgKRCaq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 21:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgKRCap (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 21:30:45 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA45CC061A48
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 18:30:45 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id gi3so270519pjb.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 18:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aCwkEmbqVaZtZzev/lt2MLOEMLUuNqOfcTlhvOfZ+CM=;
        b=uwIJoNO4cFwugAloeqDl12ApEiy+TIXcf5uPnQBRfS4a6ubKFTzMGO0WY8hjuCCnx0
         BfNahycr6OtXYMLwosO+LTc6mZPDBezMSjorh0x5bKy3BJUgvKxJNMYFlnpyzkLAdGib
         7xBwh5rtWyPuTkRuB5hJP/mHRx5/Eai302tXKymwuaibKbF6lpjVFqtUcBZICisD7Uw4
         SLvncRnDeRbwrjy/dt2MpB6cy1qF6JfbmcdVIENuW+o+15UGA/dDYXoCgjSmXzHCQ8Kb
         Sj5bUtr3ZFTMWDw2gQFGkJMHNDBEQLjyb8LN3SY8PPKO8imRCU2EJXw+Mx5USr3r8TUb
         jcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aCwkEmbqVaZtZzev/lt2MLOEMLUuNqOfcTlhvOfZ+CM=;
        b=MR64eEWEMSJUeZswZY6y+hi/S+4FIACH0JaR1fozHDPjZ+n7HMi+TWfxGt4mXejtFA
         dUtMJs8v9Omj0f8tKC8V9TFYHNgTYUvafD8ln1WLWZ8wMSjnXeELJbYm0pn9U/QJxegn
         pP+NEq39QnDQR7J5X6npc6FWVGkkk4PVNsPrMPsrwFr7i0scjqvyYRGnte16zSGpb2r1
         cBI/LNpRQNf2T+Y7evxhCunO5zt+ligQeL/eaN1YBR7cCR9rsNZ4WoDoUmLpZSPqmOAj
         jiDFvbNZVb1P1EzdCZuCnXsh8UgDh27ObMxZNE7DatMT5aEus/QtE2Ai7UXWKhUTr0U1
         VhZg==
X-Gm-Message-State: AOAM531zPBH4khotbFbkXQmXEWj4Xz6TgsK9H0V6ly370FgflLw5Lidq
        9Jo87kumHzvrZUc1YbEpVuk1wwqxKFQ2PQ==
X-Google-Smtp-Source: ABdhPJz/DKt/3aKru9Fa1kGUnRg9KXZpx0NUNz2TjR3WpuSqxi6t+I1zSm8xHmf5k8l/Mi/NdYW+dg==
X-Received: by 2002:a17:902:9f98:b029:d6:f124:e297 with SMTP id g24-20020a1709029f98b02900d6f124e297mr2314228plq.81.1605666644822;
        Tue, 17 Nov 2020 18:30:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w4sm482613pjh.14.2020.11.17.18.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 18:30:44 -0800 (PST)
Message-ID: <5fb48754.1c69fb81.f3452.1874@mx.google.com>
Date:   Tue, 17 Nov 2020 18:30:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.10-rc4-34-gfec3b9548c97c
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 62 runs,
 3 regressions (v5.10-rc4-34-gfec3b9548c97c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 62 runs, 3 regressions (v5.10-rc4-34-gfec3b9548c97c)

Regressions Summary
-------------------

platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =

imx8mn-ddr4-evk | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =

meson-gxm-q200  | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/v5.10-=
rc4-34-gfec3b9548c97c/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: v5.10-rc4-34-gfec3b9548c97c
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      fec3b9548c97c2d8e96d1b402a1b376ffcdbf8d5 =



Test Regressions
---------------- =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
bcm2837-rpi-3-b | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb47bd5eb4df9b542d8d916

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-34-gfec=
3b9548c97c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-34-gfec=
3b9548c97c/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5fb47bd5eb4df9b5=
42d8d919
        new failure (last pass: v5.10-rc1-5-gb9bf97105f4b)
        2 lines

    2020-11-18 01:38:50.958000+00:00  Connected to bcm2837-rpi-3-b console =
[channel connected] (~$quit to exit)
    2020-11-18 01:38:50.958000+00:00  (user:khilman) is already connected
    2020-11-18 01:39:06.652000+00:00  =00
    2020-11-18 01:39:06.652000+00:00  =

    2020-11-18 01:39:06.652000+00:00  U-Boot 2018.11 (Dec 04 2018 - 10:54:3=
2 -0800)
    2020-11-18 01:39:06.652000+00:00  =

    2020-11-18 01:39:06.653000+00:00  DRAM:  948 MiB
    2020-11-18 01:39:06.668000+00:00  RPI 3 Model B (0xa02082)
    2020-11-18 01:39:06.756000+00:00  MMC:   mmc@7e202000: 0, sdhci@7e30000=
0: 1
    2020-11-18 01:39:06.788000+00:00  Loading Environment from FAT... *** W=
arning - bad CRC, using default environment =

    ... (388 line(s) more)  =

 =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
imx8mn-ddr4-evk | arm64 | lab-nxp      | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb47d8bd8aece1cccd8d90c

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-34-gfec=
3b9548c97c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-34-gfec=
3b9548c97c/arm64/defconfig/gcc-8/lab-nxp/baseline-imx8mn-ddr4-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb47d8bd8aece1cccd8d=
90d
        new failure (last pass: v5.10-rc1-5-gb9bf97105f4b) =

 =



platform        | arch  | lab          | compiler | defconfig | regressions
----------------+-------+--------------+----------+-----------+------------
meson-gxm-q200  | arm64 | lab-baylibre | gcc-8    | defconfig | 1          =


  Details:     https://kernelci.org/test/plan/id/5fb47d155b39deb6ffd8d903

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/v5.10-rc4-34-gfec=
3b9548c97c/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/v5.10-rc4-34-gfec=
3b9548c97c/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxm-q200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-4-g97706c5d9567/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/5fb47d155b39deb6ffd8d=
904
        new failure (last pass: v5.10-rc1-5-gb9bf97105f4b) =

 =20
