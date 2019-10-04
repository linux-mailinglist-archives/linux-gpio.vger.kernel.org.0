Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25634CC5A3
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 00:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731570AbfJDWKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 18:10:41 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52800 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731201AbfJDWKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 18:10:40 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so7217674wmh.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nGzjYhV/Z7nJ/be1gq/g2eJ8yQwjKC+6laE+uFDg/Yw=;
        b=fa76+2Az4TX7fks+SfSmho55HM4sW1eP7dgmU/jullQVxYhLxWlioRfOZmdnucU2CL
         iLkcSmBONeIt7EIGB+DDW1NlXu6KCZK7a68Hty8iCewtd7p3dSdzNl8XKgd7FolNdELR
         eYRAyFZ+YpVAbsGEQoMqIRwtnKEDhWbbddJVNCKU9QFhkZ1/lExmkreZ4pqexQo3ZP5u
         W6secYATIBGpEVbgjkTa7fQnsZdDK7VphiBXboxnwXZUCuSlMPkqMIX29xueYJz7GouX
         L65390zQSjUoadrt/8XDL+mhO/vHCgCsyha27brIAe2CcFxWArWxI2i/fcWY2hM0Dk2A
         Pazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nGzjYhV/Z7nJ/be1gq/g2eJ8yQwjKC+6laE+uFDg/Yw=;
        b=GLPdG+h5CscJMC0bHHYF4c1kJcWIdTSWDMOzaH7hIU+W1c0wPxyvM3TwZdrcO3vCGE
         mSAkWgluuBwbcxd5XgYliFSoFRqctciHkhBBGD0AafnJJ2gfg/GNJEHH6QtGkPnzn+43
         w6rf3ptoy+A1DVeh0qneSx7K3d4CO2s4mEdYhg5u2d4LfDmh5KCcAh7xZXCF1Zoj6fqH
         n5evoTnZv/PSHrxcWgphybS5CJn5ZQCOgw3HjotBatEa074jSpKBLJ6NPknJkbGrYzSV
         PdkHuoMvrc5zetcsctjgUVLdPcasKLJjyP0v/F5MRQBijS/K4XRrMdn4vV4QgnKmll8v
         wHVg==
X-Gm-Message-State: APjAAAXnx2emeTlElrhoBm9WQ3axSYGv+0gA1yoL3/UESruSrUBB5u8k
        KXnRWmzgFsubwM29ENnvvPSSjcJi0DqT5w==
X-Google-Smtp-Source: APXvYqygG74KgP0bHa9veuqJ9JdZAZUE2z3XN+71S9pc4+bEcMR1z1aP0Oi1BMnGX1iBc35yN040/A==
X-Received: by 2002:a1c:a8d8:: with SMTP id r207mr11966446wme.135.1570227036576;
        Fri, 04 Oct 2019 15:10:36 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h14sm9698030wro.44.2019.10.04.15.10.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 15:10:35 -0700 (PDT)
Message-ID: <5d97c35b.1c69fb81.fceb0.e680@mx.google.com>
Date:   Fri, 04 Oct 2019 15:10:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-9-gff8baf289f37
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-9-gff8baf289f37)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-=
9-gff8baf289f37)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc1-9-gff8baf289f37/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc1-9-gff8baf289f37
Git Commit: ff8baf289f37efb0c90ce2de1ea9a9f6feea30d5
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
