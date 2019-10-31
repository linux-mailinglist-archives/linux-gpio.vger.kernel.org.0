Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDFDCEB57D
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 17:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbfJaQzN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 12:55:13 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33695 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbfJaQzM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 12:55:12 -0400
Received: by mail-wr1-f65.google.com with SMTP id s1so7076375wro.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Os/I0zz00frZd0xsPT5HK3FbyUw22Y7aC6HyxKaRPRM=;
        b=pLTJleTTOOmJpVVOUXao+Wyl5bfscim4jN0hlMJRz6kUG/0syJsx2RhNuRjmA5sJGf
         Rh7i5aFCB3KaAwwWFWalsjHtPTQQblbt+A885yf+jj1nsKuiHQxlbDx003CRsJNyf4yg
         AmRSA9nXLL56aVnrHe5hCDST/y8lMRYSdckdH2Vkd/QUHVm7mFlFT2XVzffaEJ6mY730
         Qyer49fOKmP78zI0nTWW1i49FZqXy1nzmXKmdMxpoExsg2fxrbxNM5kO8MllbH3FXFv5
         4fHdKMjLkgPmBAgRianfqtZup+FLKk3rPPomz5CvGuM0cWUdMPNz6LB5bx1Lcu86spzO
         pM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Os/I0zz00frZd0xsPT5HK3FbyUw22Y7aC6HyxKaRPRM=;
        b=G32L/3wjv3b0yBNYMQtaPgwPFmfXd0ORRDcKuOFiKK0UMpmPwPHJpw6Ax+8h/5os4P
         wq+d/uFmTg784gF3F019+dADIUzNRdOxr7JiTm5+pePZoAUxxXmlpNQvudv1l/nv1Eza
         /mZQMD/rjVOTkajk3bGxLC0Uuj5bQv3HBFVeZ2xvaLAdS8wbVLg3LYGTgKplf9V7sGAO
         5/TE47ibIYB30uc44DDDNVysSvF3tT45dBkW4j08vjO3MFUDvkoLBGiOvbhkervdSZ4I
         hLLcWnlXXOe5nMHmMiyYtCvkoRHWfE8ZsmAkVDMD4Rl8KWaxlE8VN8jDZucNaxs3IA5X
         UWUg==
X-Gm-Message-State: APjAAAWpueDqKJKpa3LTpT1ooLqCYqosxym0N0Oil6NXa9ahPuw5TfKV
        36lZvjrzL3n4gtFiEvcWYCuBsuoM5PLxTQ==
X-Google-Smtp-Source: APXvYqwMdDlTJqR73fgSENQkGjnKu9k6F6FWm64d1PJxtmeOnAaKX0QJSIXj8FOfXUDviALl5CQkGQ==
X-Received: by 2002:a5d:6104:: with SMTP id v4mr6331709wrt.36.1572540910400;
        Thu, 31 Oct 2019 09:55:10 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x5sm2377543wmj.7.2019.10.31.09.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 09:55:09 -0700 (PDT)
Message-ID: <5dbb11ed.1c69fb81.729d3.c13b@mx.google.com>
Date:   Thu, 31 Oct 2019 09:55:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.4-rc1-31-g6a41b6c5fc20
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-31-g6a41b6c5fc20)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-31-=
g6a41b6c5fc20)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-31-g6a41b6c5fc20/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-31-g6a41b6c5fc20
Git Commit: 6a41b6c5fc20abced88fa0eed42ae5e5cb70b280
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

Section mismatches summary:

    1    WARNING: vmlinux.o(.data+0xbe30c): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0x82818): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match

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

Section mismatches:
    WARNING: vmlinux.o(.data+0x82818): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

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

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe30c): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

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
