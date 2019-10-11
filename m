Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D124D376D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 04:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbfJKCPW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 22:15:22 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44671 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727369AbfJKCPW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 22:15:22 -0400
Received: by mail-wr1-f67.google.com with SMTP id z9so10022020wrl.11
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 19:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xG92iCahpJx3p9z/YbIePJ4NBphHPNXpFJHimeaocBs=;
        b=LKUpaK64ZVXOXGgJ69oDcGe+sgDlvVhJJW95/BnY2EvXRV93lCnSstJ0tumOgR9//1
         R38gk0dXXLHiEw8m/GygjnnYf3kQVV2RWZGQQGS/tOU0EtM1OBVCUJWpOyrFLFYpTWCh
         ztL5qljOmPbrFkVR9KseuJ70zr+3ZJkCb8RtoqJ92mv3lRvOG3Y5RYsAXGn6bXxqhsBc
         sgjzjoxUzbLrA4zRCgdY1VXJjOs6howTJCDukDQlPZcI3jkk/AQAteGOd4Tz196uO999
         G8E7zACtc3hGMgVBQyGfZbqDQyqbxm9GNAGstFrohF707eRstxqLRuL9CmyaYIwc8+6B
         H4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xG92iCahpJx3p9z/YbIePJ4NBphHPNXpFJHimeaocBs=;
        b=f5isNtJ1KiyXX9VzseAwbPmzCFkaB78aYkusLpX4bKFZA/L5sbL0YP39qzMvpCp/Nz
         dle0DUfHiMr+sBSYQM139+6agJxmK7jKsinJ3M5pv83tH++6K2zsUyw0l2mJ+iELQRIF
         B3sIer9i07j3mWYG9PCR/sl4B2gMqAlKYwsOo2GxwYYC5bavuGvJZXlk0oK+st/p/1Bk
         j/hEt2VluhtkQ7mSXSqcJv8L0GCmk6CKzRmk0RxA5L06BvcfmkTyevyjRJQI8vA5+bQs
         dYzO48a4nm5nDuCaiRpj6RAfZyS8llS0Syzk8FKuT5+jmoNoTo4BQ0DHn0E5kQdZEj5K
         uFGg==
X-Gm-Message-State: APjAAAX1upDrpUSadzQVqlBfkjekRH/GtT7fg4RRe4Y5kCeqYxwgbnA/
        KQGJUuv0JwJK6Zco7XUMzE3sineV5kPbjw==
X-Google-Smtp-Source: APXvYqxo7KKN2bCN3b2aRLPuU0A31Qftv6sHX67puU+QK1TCWaVy7AVelg3f6bDq4vx5/f+j4qq85Q==
X-Received: by 2002:adf:de85:: with SMTP id w5mr10654748wrl.278.1570760119074;
        Thu, 10 Oct 2019 19:15:19 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z9sm7962681wrl.35.2019.10.10.19.15.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 19:15:18 -0700 (PDT)
Message-ID: <5d9fe5b6.1c69fb81.7ffda.652f@mx.google.com>
Date:   Thu, 10 Oct 2019 19:15:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-11-g95873fba06ae
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-11-g95873fba06ae)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-11-=
g95873fba06ae)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-11-g95873fba06ae/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-11-g95873fba06ae
Git Commit: 95873fba06ae39e4042647dec9c1138c0109ce7b
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
@3/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@3/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@3/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@3/li=
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
