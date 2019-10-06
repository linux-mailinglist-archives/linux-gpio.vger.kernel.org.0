Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6860CD9A4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 01:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfJFXaa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 19:30:30 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37734 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfJFXaa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 19:30:30 -0400
Received: by mail-wm1-f68.google.com with SMTP id f22so10535064wmc.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2019 16:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mcQxV4bJ+1ec3bNWvHBW+5Ts++yVSQHlauU53rEBqKY=;
        b=outqF6/GX0ptTQ1tiKoeRR4mquL3/nFjInm40hnyOyKtqEcCPw2DKnVni3xHL179GH
         Mq52eokt6Y4ymnPA0uTXD59E6RhEhslUcw5o1nsJCO8hd8th3zbQsV5WPiGASCdZxo7C
         jGiNPicbITOh3021xbdICJZdSQfD5YfNtO/lZtgX9kCuT4iFCGdIKwKu9y50ABuG9UqJ
         uBO9Lu/1bvqPkER5/ATGWa3Jtk9xshUbZ4E2wH1SdmlVFEhoyNvTK1O9bRu4oZM3AqmF
         Ew/iyOgTkTkivqmXlw7alxUrsmkW/RnE8Bbw7ix/RerCQCm6CMnB7El6G8kqRZIpZrz4
         rMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mcQxV4bJ+1ec3bNWvHBW+5Ts++yVSQHlauU53rEBqKY=;
        b=CrDU8gSHNv+6fQ6SKShsLWRtm5gFwyZ0ykgUPRnFRys5toq/z/3tfPthYBCTtjwOv2
         WNUh15hdJrrzn2Su1ne40VCU9l5pS9ziw0JqgXbizev26fjAmuDl+mzgGBO0+xTnJtaH
         Wym54EyqEPvFEAKmQadJCUcNM/rqzXQvZ86nZ1aEG5zkqgmNjljkI2P+csWcGgjDvOCe
         iveUvNUpgkQfH6y3F8kiw084C1d4acobNitXpS7Lk6zsVUC+4cPSJjpi4Iqs1nBwmMI4
         mbYUn/ElijPyZVBnrO5g+FjdgicVjm4fP5z1xFx2WWG+lqhO5i9Ar5ktV0O1CXbOvtNi
         U9dA==
X-Gm-Message-State: APjAAAX95+3ZwScfjX6Q+5s8IaBMuJBa07I/18IQ5Ve58P14T5CduVlx
        RpigrxR+9zAkf9hP1uhnvb9JS+ilCqg=
X-Google-Smtp-Source: APXvYqzJapu8th02mn3Hy/ALg9sGAOTFzk8FsOQ7aDDfsJu7K75tN70urTzfOw38unrMYI+UWjSd4A==
X-Received: by 2002:a1c:1fd3:: with SMTP id f202mr17855219wmf.18.1570404627503;
        Sun, 06 Oct 2019 16:30:27 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b15sm15038421wmb.28.2019.10.06.16.30.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Oct 2019 16:30:27 -0700 (PDT)
Message-ID: <5d9a7913.1c69fb81.b1589.4123@mx.google.com>
Date:   Sun, 06 Oct 2019 16:30:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-14-g6dd9b912c9b4
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-14-g6dd9b912c9b4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-=
14-g6dd9b912c9b4)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc1-14-g6dd9b912c9b4/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc1-14-g6dd9b912c9b4
Git Commit: 6dd9b912c9b4d8e7b4877554fc9e412e1189e30a
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
