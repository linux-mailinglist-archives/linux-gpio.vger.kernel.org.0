Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 052B0DA735
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 10:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393072AbfJQI0C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 04:26:02 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38166 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390082AbfJQI0C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 04:26:02 -0400
Received: by mail-wr1-f68.google.com with SMTP id o15so836445wru.5
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=oWoz65EXafNoVNc/6zf4N9bMcGhg7cC7xOqwisSlD24=;
        b=yZbFmMAlLvAGPSP/AJokxdgEvuUu84T1ijpgWTmkzchyyzIhUFEKWmfCqqWMDckQh0
         B4M38b7wM6iMYzh/wb4B8T48jEeK89dTcvjfvE31u/KAso3UhhWEq1Hb0g9IXIT7hMI0
         xXj42Pj24lZtgzV5XQpFOAdVNJ2dlJ+PxLzVRsik6FYiRTN0Mt0Rgh9LBSq0FrcJnAxY
         7UG7d9PQwd26YjqAnxW4+kqUD15x/uOe17Fwqm7gzIqyQTxslPT6p0BbiO0UV7X6UAqX
         H/Uu6z0WBklNQNf/t4sFoSa5Lok58Uvq5yu/tBOF2PtuvxVlZi1C+mqkg4aDASJQXbCv
         TXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=oWoz65EXafNoVNc/6zf4N9bMcGhg7cC7xOqwisSlD24=;
        b=gcMVdC+G1JSXla8ZvVXANKUAKnP88r8PvDBcjKmZSRLhb+WsexynMTG+YFFAz/1mrC
         WUBl+JCByp1q/uQGcZaD3o66R2l1sSG8zIfbITEYKTxwwbfV4BjSo9T16wX8VXrszS/y
         kBumAZ40HqFE0SzKcOzxoO6c6t0N/ziFuUX9zTsBEjNHCd9kmFgBX1k6Vg6wEBQKSJOc
         raEFF8JwJJ+GxUAONmWMoz35M+1Kb7DTBRBN/Nhv4Wb0AetMSVtSEtRtncXGjuT8vTyR
         Dq185LRz0bSG0ir1AAAyO0K4HzBPp6GZm4bLSUvv2Y6YQXxHXscNnsnbywvA+PLuWEUZ
         jUKQ==
X-Gm-Message-State: APjAAAVGlFv1XvNhG7ZmUg7JVSv0h1IdzeQSt5CfZO59jbCE7h8MEp0q
        Iqtd1bLkWSxhl5OfhRHpxa1JW6OMjL0=
X-Google-Smtp-Source: APXvYqzyq1NUDXb6Ohdtk/hId8SuxnKBw6WVTnVgDUiu5ld9KZHDYwLzm2sq7Eyl5hbjHiJ8uIxFiQ==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr1969039wrr.50.1571300758663;
        Thu, 17 Oct 2019 01:25:58 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u1sm1213112wru.90.2019.10.17.01.25.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 01:25:58 -0700 (PDT)
Message-ID: <5da82596.1c69fb81.f3321.5d78@mx.google.com>
Date:   Thu, 17 Oct 2019 01:25:58 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-12-g698b8eeaed72
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-12-g698b8eeaed72)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-12-=
g698b8eeaed72)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-12-g698b8eeaed72/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-12-g698b8eeaed72
Git Commit: 698b8eeaed7287970fc2b6d322618850fd1b1e6c
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
