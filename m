Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F430D374F
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 03:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727588AbfJKBqR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 21:46:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34261 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbfJKBqR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Oct 2019 21:46:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id j11so10011383wrp.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2019 18:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0b418pZCpG009MG77qVbcfeVx9k0PGsxw6HVwf78RPk=;
        b=SUeb5BIwJkfYp+0pTMJEWSIpxbrIIiLlv5rf8Up6gmiQZHBB8s6ReY4LYxGLIxNG0T
         vSOYmgRO77PYFv5n9LPtz5Xav6LRXPDjnN3p873R18WLtGBC50YPcGARRJdBjV6vbrY9
         rysHU9rI5u6GvyxIidsf9AbYonJuZPIOb02bQEwLfvWV1xfjfjiE0/tv59QQusR7vdl+
         WB8RTrdDZljNXJLRp0Vg40Q/ZHoxX5RQfKZjp7oq+LSPcViazgnOPi/NwM7gM/VnpPI3
         L7EVw8zLwcE4rZkcuF/IzgT1r4iCDZoCLC4ERxDeiGph6lIoWtC+H8dEXXqjEuvCrZ1A
         +k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0b418pZCpG009MG77qVbcfeVx9k0PGsxw6HVwf78RPk=;
        b=Xt4Idut6XDbZkuwVjWyer/GBfCTKiMssumIYOK4T+kF7dhhcNy3uQ6Uy1lPzmr3rh9
         1OnwWajYKEB44/EHh5yMdp9vU502sB9rfB0KrBQ35E+Kk8TR/25soqbSUV/gaejezEnb
         Tv846/KLYW+setFcjtYsbzK+84kcywU48gJntMDdi5aYMGEo36/EemHVFez2EMAs7BMk
         dMgye6/0DJWIZuZEOpSmL8tTNF/Mmw7+C8NEq4/nyCqEY+O0J4blWFw5IpqTQHjE/kBE
         PsrEYkRbWk/8MPpEw+ArbItAk3+dkI11DboaRpD6ILmn5ueQS9kvcKHUJSDkkRR4+dM2
         2nSg==
X-Gm-Message-State: APjAAAXBW2q07IAtb4TkgAexhRY0daQ3fx+zLdw6/KMWvMAL9VIax81S
        B3UZhN76cBStz0/Gxcij7V5Gup+pnf0Xag==
X-Google-Smtp-Source: APXvYqwDMVsf6y7ccrtvPpO9CstABAosSnh7AxOTGxOWfHoBvr9VIGuGUo6cujeQIxJ235oSsBbWtA==
X-Received: by 2002:adf:b345:: with SMTP id k5mr11236243wrd.258.1570758372554;
        Thu, 10 Oct 2019 18:46:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y14sm10898378wrd.84.2019.10.10.18.46.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 18:46:11 -0700 (PDT)
Message-ID: <5d9fdee3.1c69fb81.e5fbb.5a3c@mx.google.com>
Date:   Thu, 10 Oct 2019 18:46:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.4-2-7-gb70471b8a438
X-Kernelci-Tree: linusw
X-Kernelci-Branch: fixes
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 13 warnings (gpio-v5.4-2-7-gb70471b8a438)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 13 warnings (gpio-v5.4-2-=
7-gb70471b8a438)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/g=
pio-v5.4-2-7-gb70471b8a438/

Tree: linusw
Branch: fixes
Git Describe: gpio-v5.4-2-7-gb70471b8a438
Git Commit: b70471b8a4382ced9424d39ff57db88c9e616707
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
