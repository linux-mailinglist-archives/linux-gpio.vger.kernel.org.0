Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACC2CCBA5
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 19:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbfJERXU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 13:23:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50681 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729352AbfJERXU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 13:23:20 -0400
Received: by mail-wm1-f66.google.com with SMTP id 5so8657807wmg.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 10:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WXN6IVWvczUFbPWWq/6nXY2nLSr2zU9Yw/UWBhmqQd4=;
        b=w4vsT4/LuhaOTc2AOh34x96mKubonx/gmyf7vUtOcC+ZedwwRXVFLst3Vt3wYSH/9N
         MruqACuWY2GsT3mKyCbhHtk07LLClb8zWlQ7B+rBLU2mQ4JjgqKZuDgu8EzP6PnQ5JZ/
         ObaaaTadVeh2AdFEo7gLs2sgYBOcdFk8nxvCQbRt18riUwHb4VEthWqYGOKSrH5lhv0d
         90YpyoMwpl+GoZSqeBahJAJUru9TGhLHOAAiBdYs9/vpHZK8irvD8CQaHtZ/4jXWuD5V
         GYlqsAKktTjGDTdVeem084M0zyUKkEb/JaLWTwnD7fy0gww4MImuUWAu/yeaADBfCOqr
         zc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WXN6IVWvczUFbPWWq/6nXY2nLSr2zU9Yw/UWBhmqQd4=;
        b=lqZn9ucOU3SLBFUKn07fEAhSV2h1ON9TLdL31d3EMbNJkijdT4sVFLhhmiOSlYaf6L
         QP7nxL75/CrdeogLlD6TwMxY8DDflziX40981ditS1xSOtglhW2XjSCchMfj9JAYaY35
         FYNbru1P7u6aNjaWLXSsePlKWbLIc5N+LlZEmdJk2wL8WpA2cJkA3fskDX0QQlwXMEug
         veHb8U5Ka0focVKDq0Q6M1jpt5Tl3AFdGAi5WbIuspG0j+9nalzpx1KEXRNvOHFu52W7
         wOyxTA/DTaw8uBCWYoPuRvNC1bqmCGiGwDCvamphn7xXWfVzq/D7fOOfqcmxrjnTLF/4
         9FJA==
X-Gm-Message-State: APjAAAXHXEwGUdgp6KOWVgjo7vOBbYtiVMawFiFE/eT1HQGLxZKEI4/E
        4ZFirto6skVTPe2bdpXP7vEJGa3XZc8=
X-Google-Smtp-Source: APXvYqwpS/waWHmk+SK4+gZIt9wErhdU7zg2Jc9lD1T63Iu8ZlzEykVuJz57Amem5cXWX42ujj0kbA==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr14910730wmc.15.1570296197356;
        Sat, 05 Oct 2019 10:23:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a3sm17937310wmc.3.2019.10.05.10.23.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 10:23:16 -0700 (PDT)
Message-ID: <5d98d184.1c69fb81.622ac.0da9@mx.google.com>
Date:   Sat, 05 Oct 2019 10:23:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-8-g8c550e94b883
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-8-g8c550e94b883)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-8-g=
8c550e94b883)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-8-g8c550e94b883/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-8-g8c550e94b883
Git Commit: 8c550e94b8835170593169a45b5ba30d3fc72a70
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:
    defconfig (gcc-8): 3 warnings

arm:
    multi_v7_defconfig (gcc-8): 5 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings

riscv:

x86_64:


Warnings summary:

    5    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    2    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYM=
BOL_GPL
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_adjust_quirks
    1    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid=
 for REMOTEPROC
    1    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' =
invalid for REMOTEPROC

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
