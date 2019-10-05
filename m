Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 422FECCBA7
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 19:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbfJERYB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 13:24:01 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35827 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfJERYB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 13:24:01 -0400
Received: by mail-wm1-f68.google.com with SMTP id y21so8638275wmi.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4lpbbb6hiDOImwRO3UAPDlXbLJkLrq6H7yOOXqX5zQs=;
        b=oXOX4XyGqbBsDTOyCXOeWY3d34ziOvQZB5DR3RaF2NzHy0o31ZZKc1nqmrqDb3yKa+
         92Au85FrV4NBWaHL02FByAciPDWJ1Lq4jlZi0Zq24ywCGAhqLYA0H9qkSZvEmfJ2XlON
         ViAMRyNMdQRkb36TrrngL8+tjQVMHz1c+U04wJ52crjv5lB2t40eco5tqA4iYUmB/ZjZ
         D7auXKFIxfUUQjLknFmjwTxyOZUdiPPZf7IUcbHQlpLZ+TRFMLk8nNOJvJGuJvZwWh/F
         Mpyk8Y6Iqf78SQozirgr7OTZjMFNSgOzQf4bdNpyVBNiNJCCvAeFAymkSRXfqLWDBW46
         vYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4lpbbb6hiDOImwRO3UAPDlXbLJkLrq6H7yOOXqX5zQs=;
        b=q94lxnNhu0qxpAP7pPu8tKJJii1dPddVRkd6+5wrFI8fD1zOYaSEMDeigJUlbL1Lta
         gwyllJcbOcWXltjQ/sBSuyrHlKJ5hkPvmlcfbw0R58dgwhuQpt/WQYGnpgQ6V+6Ajkfh
         /ld7Ph/X0xLurKPxlXqhyVH1dWalHPMkrNZZUPhnViZMlnZjcWro2NI17hhieYH/5iQc
         FFDUSFysaeD2pBK94POpNRuEUQHZkHWqb5ikYCUKJII5lOaeAR/feBv/LcHAO8VN5pgv
         BeXN/6qHg2DI8Kbzc/VcHw1YJgm1qSWUvCWEXpW3WVuXbBLfgAuGAuZkLPQv21dD2TWx
         Fo/w==
X-Gm-Message-State: APjAAAXfF9dlRxE3b0x+Xsb/OVUZRwd7gUNZ7j6R/PG/D8ppr9r0tETt
        LGjLvhfGIkHD5if6qyyzWIKRsdGEi1A=
X-Google-Smtp-Source: APXvYqzH/xVCj4C87ry1f+1z+dwhhXU8trzMuh2Vz2ELGugfo/FMZC5yOPQtZ4mzeB8iqhmx4jezQA==
X-Received: by 2002:a1c:7f84:: with SMTP id a126mr10352050wmd.42.1570296238448;
        Sat, 05 Oct 2019 10:23:58 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n18sm6655297wmi.20.2019.10.05.10.23.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Oct 2019 10:23:58 -0700 (PDT)
Message-ID: <5d98d1ae.1c69fb81.49db2.c13d@mx.google.com>
Date:   Sat, 05 Oct 2019 10:23:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-5-gfffa6af94894
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-5-gfffa6af94894)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-5-g=
fffa6af94894)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc1-5-gfffa6af94894/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc1-5-gfffa6af94894
Git Commit: fffa6af94894126994a7600c6f6f09b892e89fa9
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
