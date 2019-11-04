Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA0DEDB95
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 10:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbfKDJWl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 04:22:41 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36582 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727327AbfKDJWl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 04:22:41 -0500
Received: by mail-wm1-f68.google.com with SMTP id c22so15197698wmd.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 01:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=bpyB4G4lE5I41Qr+yNJx8hCcyrV02dA2aZDoPsEvi2I=;
        b=ZllNsP3p3qFCb9617gZZ2YueiS9M+hAlaYve4pFJJ+DLMVBiRaqBrrVTQrpFYMKgIt
         Pdr8GIcIZEirbqh6dxqXUOIjs8vTyUcRUgiJZZXKg9/Ex7ytcqZVPW5Z1CaJcSibhR7H
         3NRjrAB/aaZWijUlIRD9iYnZsBbpoglt+ey3yIY9jKLEijKiBR75maa7o371OUl1Q+0e
         j6Lr8b7Dj0X2afAkei3gIYen8qXZGCRnsX9dZZ96guXLDnnHOg359znEUy3pRwXWlfr9
         BHQ8P+TTQmUWvK751MHT3idVgCgFCrmiprF2Fl4T7/jcvEB+Am4WYoy78r1REYLLAjYl
         PjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=bpyB4G4lE5I41Qr+yNJx8hCcyrV02dA2aZDoPsEvi2I=;
        b=sxmbM2gIxd1tt+dJaMA56c2Z4nK2Zg9DQFpWDfZpO1sH7HaFEVoz3nGMn1CCtrrISd
         POWxuq7z4skL/M5jablnUgbPqkFQcL7yVueELp3Dl2DvaDyXJrfYix8AcKTneDjyqavs
         c++vhnL++VtowLvdJOiduAoLPLjz9lbleT1Jc730xeFBPEwGDmHKRhqn5+FKPfa9I37o
         B9GIubuM9b4qph7VKU4pLFa9EE6tbWhVJ4jdL/DXp7bgaGXQx5ZKCS7pHKVvxxwODHH9
         a0v2Gvfx1ZRSeOn6RCghuGA7zZt2A48MhM+91OpSBM+OB7A8tIl2BRLv2vEtYzCu7RFj
         rhJg==
X-Gm-Message-State: APjAAAVSDdIMubRX/WXHO94jFSxtwgaNDoNc/1qSRlFadB2kvFRyQjv3
        QYUZyWNFzEgmu5mv8NMWBo7bzdZMfdheCQ==
X-Google-Smtp-Source: APXvYqyEG1oJRfWh0Gxox+zW/1XWtiT22DKTLERhR3eOvud9MkvqxMBIER/D1H93NyhUT392kO4qmg==
X-Received: by 2002:a1c:3cc4:: with SMTP id j187mr22466626wma.95.1572859359013;
        Mon, 04 Nov 2019 01:22:39 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k125sm7939370wmf.2.2019.11.04.01.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 01:22:38 -0800 (PST)
Message-ID: <5dbfedde.1c69fb81.72656.dbf0@mx.google.com>
Date:   Mon, 04 Nov 2019 01:22:38 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc4-37-g1723e834a4aa
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 5 warnings (v5.4-rc4-37-g1723e834a4aa)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 5 warnings (v5.4-rc4-3=
7-g1723e834a4aa)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc4-37-g1723e834a4aa/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc4-37-g1723e834a4aa
Git Commit: 1723e834a4aafd9a73ba6eb61aed6b092acfde73
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:

arm:
    multi_v7_defconfig (gcc-8): 3 warnings

mips:

riscv:

x86_64:


Warnings summary:

    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_adjust_quirks
    1    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches summary:

    1    WARNING: vmlinux.o(.data+0xbe400): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0x829f0): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x829f0): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_adjust_quirks

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe400): Section mismatch in reference from t=
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
