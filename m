Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2556222B0C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 20:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgGPSaP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 14:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726986AbgGPSaO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 14:30:14 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5E1C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 11:30:13 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t6so4232050plo.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 11:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=UwRb/rQ97pnSUU/8gnRjPESQSoSG6aTptnaotfbciPs=;
        b=IWeoZdkzuLMtyTGjwo85oaRqkEZciU6pA7nxH+cUN0ErBB/f2NcfBbJzys8+YlPuXa
         qkQ0ehDuRTo7+jpmybtwTETMpFPvG0bg+twtsrQrkbSY8zhYQ/cqIudlQWS4aZweO1vA
         +MPGWeIb4qhsrJ5j9dRRflvHh3l7ll3D9KT86VY0vEtUvTV04oQdl4stdXHHVtw+C3eT
         5ZlaQIoroFyAk+9KdVzdyWLVBR+Ki+xtI2YT5DO6HjY4IJzVQHzEXdmDzG5Qt8OSQB5s
         X3jcWNeEBFW4bq13YSnqVc5vV9zVegEXsoZp1XUn77l4s68fxOceKKCYv0N0c6CIRBtk
         NXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=UwRb/rQ97pnSUU/8gnRjPESQSoSG6aTptnaotfbciPs=;
        b=gOvapvKlXDVIR4TF10BWIzrgWz2H5zwoTonfzVj6A1FCLaczjUaGMWua3dvyqzffRv
         +hz7yv0AAPjA2w1/MozMC9PJwpvyim5KlRKwcQGPExRS92NnW0J4thmO1XQ5KM6xXfUa
         58y6ghxVkzMlQi5OJlLdRTIA6GstkfZyHSu6Cg55chs2ssSzTVYAz+pyiNgMkjPY6z4Z
         QsNcToEI4mlxM7QbuYRoDhuujGOs4RbVCzMse1TSa9ECvG/LoaaRz/ZJMr5M8BFM7ZX+
         nLJSUsWuGVfVCJs2OuxwoVCXZx4zbkhzJESqIHiaWb+5NafFb8VPz5bf0sQ9mkRwZT7J
         P3yw==
X-Gm-Message-State: AOAM533lo3JlZqrqRcWomQxYHKABo1EV7YAHy7WeMzm8t3Cl883A8HGz
        qVgAwZQaxrwqF/sRtUWbdS0xfpC2Hig=
X-Google-Smtp-Source: ABdhPJxUmK+c3aV4JCZC3LR5QcyzA7hTLwydjz1n5R5hWB9IqWeCecuT7bB0J5C5bSmafZxHgnjdpQ==
X-Received: by 2002:a17:90a:b98d:: with SMTP id q13mr6365794pjr.82.1594924212290;
        Thu, 16 Jul 2020 11:30:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j70sm5496100pfd.208.2020.07.16.11.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 11:30:11 -0700 (PDT)
Message-ID: <5f109cb3.1c69fb81.2074a.057d@mx.google.com>
Date:   Thu, 16 Jul 2020 11:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-67-g761b5c30c206
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 86 runs,
 4 regressions (gpio-v5.8-2-67-g761b5c30c206)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 86 runs, 4 regressions (gpio-v5.8-2-67-g761b5c30c206)

Regressions Summary
-------------------

platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =

bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =

hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/gpio-v=
5.8-2-67-g761b5c30c206/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-2-67-g761b5c30c206
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      761b5c30c206ba1788c6ceb23e5812f319548b52 =



Test Regressions
---------------- =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
at91-sama5d4_xplained        | arm   | lab-baylibre | gcc-8    | multi_v7_d=
efconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f109373afda954af085bbd2

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-67-g7=
61b5c30c206/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-67-g7=
61b5c30c206/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f109373afda954af085b=
bd3
      failing since 30 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
bcm2837-rpi-3-b              | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1091f553d5468e3385bb24

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-67-g7=
61b5c30c206/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-67-g7=
61b5c30c206/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1091f553d5468e=
3385bb27
      new failure (last pass: gpio-v5.8-2-58-g1752911c6d10)
      1 lines =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
hifive-unleashed-a00         | riscv | lab-baylibre | gcc-8    | defconfig =
         | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f108fabb237b4e7c685bb1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-67-g7=
61b5c30c206/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-67-g7=
61b5c30c206/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f108fabb237b4e7c685b=
b1c
      failing since 30 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform                     | arch  | lab          | compiler | defconfig =
         | results
-----------------------------+-------+--------------+----------+-----------=
---------+--------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre | gcc-8    | defconfig =
         | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f10939fcbe0bd126985bb26

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-67-g7=
61b5c30c206/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-67-g7=
61b5c30c206/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f10939fcbe0bd1=
26985bb2b
      new failure (last pass: gpio-v5.8-2-58-g1752911c6d10)
      2 lines =20
