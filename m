Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7019322BBD0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 04:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgGXCDa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jul 2020 22:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGXCDa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jul 2020 22:03:30 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A6DC0619D3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 19:03:30 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id a9so4315624pjd.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2020 19:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=n4YcmiQS65+kd/m7Fcou5QBYQkTkaPc8A2VotdK4H0g=;
        b=F51YuwOrjA1p0rMXWDk0jAsKVlvPa++oRDn3Mvt4ygH075GSR60I0k+KM0kBM7jb4u
         8OaJqYtSLQHz9dNKYNoYAC3P6lcF0bHM/VMsyfdNDihxmHNNeDTMsVrn+aQq3FswS9X6
         GrFhPM2qLgiQpD4tvnSUUzqlCAbWoRddtMkez04K2cQnPtyFUKapdtp01bIq1eiX19Ps
         kXU6LwXO77TaURmBRztbzpdDqiLleLvtEwItVBdAOMbqC6mcgo08mN0CDNII5FhD0Aqz
         BDmZR89hLMADZiYQ9zkNHUTqqmELnd1PdXbEtzL/5GmWL79ry3tLT3WnsCkiXJxFBlhs
         ovrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=n4YcmiQS65+kd/m7Fcou5QBYQkTkaPc8A2VotdK4H0g=;
        b=AR9ZyJQOQafyfn0xvFxgv4aBGL7YG+fGsEnVX5HxeReKUBdLBX7CJEPgNAwUAn7Gz6
         4uqayPueM5/TwFqR1B1ALLqXt8gAUdyZnYclOpQZXAYnL5Al+jRc8PKpXkW90l5qTMsv
         A/COO4rfdy4oOVFS+094E0wCt209FKcHJe5dgpZfLWj13/BrdDVxVES2zl8kyegonD3V
         WlJNSeqTK70IBZthGfxCfoA9hosis9Zd5MJIdU5OpHn5G/K3grPVPB3jQtEKtTC2Qw++
         eil29jEUPNA4aPY7aMvTx67/TkOmggYPHP0/ZvkoDDqVrTqtLvb9lwgpk+MfNfKM6kMQ
         Pztg==
X-Gm-Message-State: AOAM533Lgq4yIsr5EpgL9CMlOVCD7OXoggpb0afkUhJMHennt8n3eDAt
        Nf5ANzWxDu/TXLQNpZYxhn6a3eYfx24=
X-Google-Smtp-Source: ABdhPJyFZV175hWHojWzdLmLrll4fzKYZkCaoqALmxGfVYRyum9QNDBeDYOobdYWqwFyyJ8s0usvhw==
X-Received: by 2002:a17:902:bd8a:: with SMTP id q10mr6490335pls.236.1595556209490;
        Thu, 23 Jul 2020 19:03:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c134sm4361604pfc.115.2020.07.23.19.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 19:03:28 -0700 (PDT)
Message-ID: <5f1a4170.1c69fb81.cd158.d46c@mx.google.com>
Date:   Thu, 23 Jul 2020 19:03:28 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-95-g8fc3ed3a474d
X-Kernelci-Report-Type: test
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel baseline: 121 runs,
 5 regressions (gpio-v5.8-2-95-g8fc3ed3a474d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel baseline: 121 runs, 5 regressions (gpio-v5.8-2-95-g8fc3ed3a474=
d)

Regressions Summary
-------------------

platform                     | arch   | lab          | compiler | defconfig=
          | results
-----------------------------+--------+--------------+----------+----------=
----------+--------
at91-sama5d4_xplained        | arm    | lab-baylibre | gcc-8    | multi_v7_=
defconfig | 0/1    =

bcm2837-rpi-3-b              | arm64  | lab-baylibre | gcc-8    | defconfig=
          | 4/5    =

hifive-unleashed-a00         | riscv  | lab-baylibre | gcc-8    | defconfig=
          | 0/1    =

meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
          | 4/5    =

qemu_x86_64                  | x86_64 | lab-baylibre | gcc-8    | x86_64_de=
fconfig   | 0/1    =


  Details:  https://kernelci.org/test/job/linusw/branch/devel/kernel/gpio-v=
5.8-2-95-g8fc3ed3a474d/plan/baseline/

  Test:     baseline
  Tree:     linusw
  Branch:   devel
  Describe: gpio-v5.8-2-95-g8fc3ed3a474d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gp=
io.git/
  SHA:      8fc3ed3a474d76cd76dd0a154ea904373e9a5530 =



Test Regressions
---------------- =



platform                     | arch   | lab          | compiler | defconfig=
          | results
-----------------------------+--------+--------------+----------+----------=
----------+--------
at91-sama5d4_xplained        | arm    | lab-baylibre | gcc-8    | multi_v7_=
defconfig | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a383530e3ccbe3e85bb26

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4=
_xplained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a383530e3ccbe3e85b=
b27
      failing since 37 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform                     | arch   | lab          | compiler | defconfig=
          | results
-----------------------------+--------+--------------+----------+----------=
----------+--------
bcm2837-rpi-3-b              | arm64  | lab-baylibre | gcc-8    | defconfig=
          | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a2f8ed243e681bd85bb27

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f1a2f8ed243e681=
bd85bb2a
      new failure (last pass: gpio-v5.8-2-75-gedee3bc65894)
      1 lines =



platform                     | arch   | lab          | compiler | defconfig=
          | results
-----------------------------+--------+--------------+----------+----------=
----------+--------
hifive-unleashed-a00         | riscv  | lab-baylibre | gcc-8    | defconfig=
          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a36030092e8427d85bb2b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (riscv64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/riscv/defconfig/gcc-8/lab-baylibre/baseline-hifive-unleashed-a0=
0.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/riscv/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a36030092e8427d85b=
b2c
      failing since 37 days (last pass: gpio-v5.8-1-1-gf6d984418ffd, first =
fail: v5.8-rc1) =



platform                     | arch   | lab          | compiler | defconfig=
          | results
-----------------------------+--------+--------------+----------+----------=
----------+--------
meson-gxl-s805x-libretech-ac | arm64  | lab-baylibre | gcc-8    | defconfig=
          | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f1a3075464cd4212885bb4f

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/arm64/defconfig/gcc-8/lab-baylibre/baseline-meson-gxl-s805x-lib=
retech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/5f1a3075464cd42=
12885bb54
      failing since 3 days (last pass: gpio-v5.8-2-68-g80606cb24161, first =
fail: gpio-v5.8-2-75-gedee3bc65894)
      2 lines =



platform                     | arch   | lab          | compiler | defconfig=
          | results
-----------------------------+--------+--------------+----------+----------=
----------+--------
qemu_x86_64                  | x86_64 | lab-baylibre | gcc-8    | x86_64_de=
fconfig   | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f1a34cc84c62160af85bb40

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: x86_64_defconfig
  Compiler:    gcc-8 (gcc (Debian 8.3.0-6) 8.3.0)
  Plain log:   https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64=
.txt
  HTML log:    https://storage.kernelci.org//linusw/devel/gpio-v5.8-2-95-g8=
fc3ed3a474d/x86_64/x86_64_defconfig/gcc-8/lab-baylibre/baseline-qemu_x86_64=
.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/x86/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f1a34cc84c62160af85b=
b41
      new failure (last pass: gpio-v5.8-2-75-gedee3bc65894) =20
