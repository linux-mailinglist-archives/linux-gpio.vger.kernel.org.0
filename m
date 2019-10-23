Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30581E2709
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 01:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731524AbfJWXjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 19:39:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37443 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731522AbfJWXjx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 19:39:53 -0400
Received: by mail-wm1-f67.google.com with SMTP id q130so457108wme.2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 16:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RyH3iFaZr+Brb4m1z8tljIAM1EOEvmQ94V8ghMhRIjE=;
        b=Fu3CWnN2quYinwEOOVrkTuAZHk8Fd2bRPVySPKaTANKpJUdYZusQ2KhPxiRe4hI/Bk
         3oj8o15YHKb/ITOjdmwr5+wVS241gcvU9xO02yDnRgfhNZpRUyAA06ct9Qfj1cub48Wk
         dMtmzoHMBo7FcsXZUF5nQDQaelZ5fYVfkp9PmsRBI/mAtWXIRGXSKsl7BLBcn22dVfu7
         l49nJfXEMb+RktCEfOy5YVfhM2mb1lbC1XmG6O6Gwby2vbU4PpWj4NrTjPM3q2JhFk6s
         mTsOmbRPUBYpKAzrbrFoBD/nOKsKU9ev5V8HccMKuQOiGKIGEbqs/LxHK433ebr/eD/t
         LcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RyH3iFaZr+Brb4m1z8tljIAM1EOEvmQ94V8ghMhRIjE=;
        b=T6XJKFNtx2c6vJtR4vhjFHxtfNx+1ZKIEE9NggV6tEfqXTARwEXd2rcQsiyObN1LSE
         HkKRtlzwHcW2JImdoj7ImmSS+rrDaF0VuO7u1uP0hlFJXUREwFjJpfU5OUDCAEVn1FNW
         SzzxiFzHrGgbgxG6QFs4ksB2hqmcQGzzHZs7Z2SRFY9ADqzBKTalUpDSu+m9mL6iM1XU
         fWxLYM/I9MPgod5xYP98jvEvuk5MzswDGeeqIuX/2kXMKYmycBtzwXIKTnmyCSeuj6cn
         3zl9gATf1FYV0nuwaedu9tX8XfSzVn3C57MKtVmedGXArDCWLJKWP7SPUVKPvAFEOYK+
         Haig==
X-Gm-Message-State: APjAAAWy9Fkfr7PjsHu21GxJSxnhr3mVTPy7B1l1KRGogEI3tP71p0aQ
        gYiHWhknHpAEI5qj2CH7a2eW6PP+ZQ6xWg==
X-Google-Smtp-Source: APXvYqyeeGHdQXwm/jhYER/CuwQMpkLuXeBp91QfiWh4nKsWE7+83xmosU1VIchfiXFD2FvgRRpPgg==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr1985060wmj.36.1571873986823;
        Wed, 23 Oct 2019 16:39:46 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a2sm10112713wrv.39.2019.10.23.16.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 16:39:46 -0700 (PDT)
Message-ID: <5db0e4c2.1c69fb81.f7fae.5bb4@mx.google.com>
Date:   Wed, 23 Oct 2019 16:39:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-25-gfe12e94375da
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-25-gfe12e94375da)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-25-=
gfe12e94375da)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-25-gfe12e94375da/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-25-gfe12e94375da
Git Commit: fe12e94375da34d62f7d5556161ce7629212ff80
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
@9/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
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
