Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E04C8D16
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 17:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbfJBPlb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 11:41:31 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36650 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbfJBPlb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 11:41:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id m18so7501970wmc.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8fV+3XPZXX4ovkjK4XOP29D1LoKME7MlnCBMwsjmB84=;
        b=hblyUWBvcd1/d6KXUMLD79P0MkBw8bDGSibmIX/PQ2GzPzPzxxB+6tJY1Dl12NaZrC
         PcLO2FBTWwiUafdqBWPI94XJnzk1x9nVsZvtF1u6W/aPdX6NoKeB81smmgK5OW6PFUkH
         dSPcL0qC1l7kqYc0hzXMtaQGj+ZRM9tjXYme537xD7kz6oyD0k8jTb4EPCDxQ88NlkNV
         CTciM47X8r3mXU+QQjkh9JGJlkgUDQR25a598P7wzLLVEMdgT273CR5//IsKP1YMZb6T
         chaUPS4zYjbBI1LHDO58+IR3KM00O6OKHDOnw0WpGbWQzqEXpvSZttLGt2+U7U6+wV6l
         SA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8fV+3XPZXX4ovkjK4XOP29D1LoKME7MlnCBMwsjmB84=;
        b=tgKMzfeKiX87AQiaq2IFKT8ulI/txK9rxxtdq4HfpTQq67CUrA4Qa6KZgs9cMC/rqb
         rAii9rU+LhFkq9/RgxAMk766Yfa2OM5UKtwp2cgR3ePHrrjSQfv4d+tUuDQ1n9Zn5LFE
         f5yeMVT1G0s+3oeRcaFrQbqoViAOv3EHCJvBcQ3cEu6JigmLC+SWcTFUswFkWDo9Izr7
         8QqtjdVvqiTLstObta17SGHqZ/2NafISTw3Liz1AlVg6rf1PV9Y45CN89NtrlzSoF/Bb
         eNEEc9P2QFrwvKebkLuP+CxUEtMF4CLCIR952DhGDC5CGMiWl2CFBsBTbH0TPtKrDkVF
         opWA==
X-Gm-Message-State: APjAAAXyFyM0qo3Z9OqzQoFvRgDAZto2xuzNYGi/U4Wd/Lpv+o/k9Gg9
        H45AMAbhEBbsmCMHbsgFiXnoW/KMQCWBPQ==
X-Google-Smtp-Source: APXvYqwpo7dmO4/7z33T6jg5wY37ENgf99/qKqhI+/llm7MOCvliUHQpOLLRQHO9ta7jafrZsYvmnA==
X-Received: by 2002:a05:600c:1009:: with SMTP id c9mr3313146wmc.64.1570030888038;
        Wed, 02 Oct 2019 08:41:28 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x5sm19591779wrt.75.2019.10.02.08.41.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 08:41:27 -0700 (PDT)
Message-ID: <5d94c527.1c69fb81.a143d.b805@mx.google.com>
Date:   Wed, 02 Oct 2019 08:41:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-4-gb8cd253a06dc
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-4-gb8cd253a06dc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-4-g=
b8cd253a06dc)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc1-4-gb8cd253a06dc/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc1-4-gb8cd253a06dc
Git Commit: b8cd253a06dc1d06dfed5c0ed1ec886e1706d3fe
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
@7/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@7/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@7/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@7/li=
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
