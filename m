Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52FE7D378D
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 04:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbfJKCeK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 22:34:10 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39803 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbfJKCeK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 22:34:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so10072706wrj.6
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 19:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=D5yuU0ddbEwmmHgGv/bwGq9OHWXPQWBDDcYZr9v1qLc=;
        b=tmpDFHgNHkaP2/6nAD18b+evxjJugWVFc5JZB4orXs8ZbqG5DbeECt110D/g18betk
         cwqOfC9X5FWmih7v2FhyokVZNsgNICWsg7+4i4KiQpUamK2YohjlAtLnyUZkbNdRLA7e
         KNpGuRWV/bFSBldG1hzkD17ufKI8MwHnrN+qdAad/BwpLLK+pQk9+AJXvDjAlWv1xsIW
         /lFQJ4NJXMq1EeZ6ciIkRVrDnzGTmgQiygkuBop5x+oGUg8A96fXlVLdixYjPfdv5Hkq
         /SFDdAU0ZzXKOsf/kSyVSb+YnJ/GCHDVUCecOi4Xv5ql4v6ukAhE8uhdXR3yUydSqYVy
         KAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=D5yuU0ddbEwmmHgGv/bwGq9OHWXPQWBDDcYZr9v1qLc=;
        b=nC9QdmYAkH/xB3zE9ImtURlAiEGiUQeoSt0PDTIDoidAfcYSVfkxmxjO5rksmSSh7X
         kvRR3PhBKymfSHHPDeDdQhaAadjS/9E9p3zBE1oES91n5hk1XmVuiblaHsv/MLKzsNWH
         IGuNWAkV7jz9QZjZbVNLmexV08p4SMER5/Wn+QTUVVK+dVsCfR2R6WDaBpAX3+8nKvP7
         zzJsotrD0cCKaYLy91wL5I/Hb6nj3PoV0T+mMG4x/gxLCGe/mewfdtU0b0ru1ZHeViH7
         PaFKZ+GKJqtYiaSpVDaVClXaSOCpSmhGLdA+VhofyvmOHiOZ1PSp88TuLb2OSi4saUUd
         EIjg==
X-Gm-Message-State: APjAAAWnQuiHJkMKUDCrVpjmCv+VjhAoEdhbcriJkAPherHEUef/13m9
        NYgv+Hz1FGPqsXhLZpzsaS4xpD6dc1P0rg==
X-Google-Smtp-Source: APXvYqx79ny8yZ2rZI9fD4Y2ZaQf8mUtTB5vczmc2TQT9D0bKetNWNevBZOQ5mAOfH3cGLLKBH1qVQ==
X-Received: by 2002:adf:f012:: with SMTP id j18mr11351198wro.378.1570761247623;
        Thu, 10 Oct 2019 19:34:07 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id m18sm11023783wrg.97.2019.10.10.19.34.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 19:34:07 -0700 (PDT)
Message-ID: <5d9fea1f.1c69fb81.593b0.6651@mx.google.com>
Date:   Thu, 10 Oct 2019 19:34:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.4-2-19-g4002d58d2f8d
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 13 warnings (gpio-v5.4-2-19-g4002d58d2f8d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 13 warnings (gpio-v5.4=
-2-19-g4002d58d2f8d)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.4-2-19-g4002d58d2f8d/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.4-2-19-g4002d58d2f8d
Git Commit: 4002d58d2f8d3667e0597693252a7e03e40613a5
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
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_adjust_quirks
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
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_adjust_quirks

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
