Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09ED3ED674
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 00:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfKCXhK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 18:37:10 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39918 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728100AbfKCXhK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 18:37:10 -0500
Received: by mail-wm1-f65.google.com with SMTP id t26so10135828wmi.4
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 15:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2H3ia01ThYRbEakqKtgnAIFUf6n0AnJ0mLz0tWf833A=;
        b=exeeI7rGQ0qP8G5mYDjdKrW9AYzvjfiphL77yQPvAI6QtkUyOPVaLw6nsZCojwYlhC
         0NBO9pHsT7h09Dks+2ZF78dgIrG3LgFegUbjAISMjUFetnY4xwRmJXzFgablI2/1S8Hk
         sNmWB3jtkAjf+gRzzjvGfidddqAr4bbqw3y3Hw51q3KurEdPD3D+EQcBHlRM0Uux8LBt
         ElrjnBtML3vB7ekk0WZ6pHxVDcGEFhLrTVB3h+lSBj+DM41hb8UsWYWCGQFRrrCXr53N
         Rv1A2ooThILZHC8AbdpmxglqA9H6AKOR2Nm06p+iNCPxW2ObecjNWnf8P2/2ypxyC8NL
         Myxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2H3ia01ThYRbEakqKtgnAIFUf6n0AnJ0mLz0tWf833A=;
        b=UXS4QM4im+KRRPPZjUvkksPlmtMFSvx76p+LxZZZfUAJrcEylIir1STATqlt+CbnlK
         mNR+rpNY4BA5r3Ywf7GrRjSB/RxOkGkp45ioR1ZIDORHeNRRxXdMioG2eVrijJ73P1WF
         zANfMoL1buWKrnON6XJtHTF3ex5x+JwuD3+qy8HpiOaXgZnRPhQxJwS0MY1FpVmrA7QJ
         ncLxBXhmcoPUyBYsu7M+73UEVzlB6wpMYlvjaLZYbj/nDg/eijfUn5CLlCbWE3wgfQD5
         JGSRjWWGZnQmPFTRiB77iZ+/PGTTiFupZJBdHA9jTYXoXWpNfJr6Be2NEe/4pW+MJNvC
         vXiA==
X-Gm-Message-State: APjAAAXSjf9jQPJUipeoogXRx1X5d+uE8rddYP+C3CZpJ5ad3TWoNhTq
        0Wv0hDAeCvaRXbFxr/5j4id00VstYCcCtg==
X-Google-Smtp-Source: APXvYqyaNW5o/Mg4/SMcO5LAesnKaPD+OIm+gDUU9/2zOItRuFw8pKOCiKLOSoNblg4M46fUGLkCFg==
X-Received: by 2002:a7b:c642:: with SMTP id q2mr12802051wmk.169.1572824226848;
        Sun, 03 Nov 2019 15:37:06 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x205sm20278956wmb.5.2019.11.03.15.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 15:37:06 -0800 (PST)
Message-ID: <5dbf64a2.1c69fb81.bca31.14f1@mx.google.com>
Date:   Sun, 03 Nov 2019 15:37:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc4-34-gb0983a8bbfb4
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 5 warnings (v5.4-rc4-34-gb0983a8bbfb4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 5 warnings (v5.4-rc4-3=
4-gb0983a8bbfb4)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc4-34-gb0983a8bbfb4/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc4-34-gb0983a8bbfb4
Git Commit: b0983a8bbfb45d16760b34c23436a3d9b5834dbf
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
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
/linux/build/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas=
.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
/linux/build/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas=
.ko needs unknown symbol usb_stor_adjust_quirks
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build/linu=
x/build/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko n=
eeds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build/linu=
x/build/_modules_/lib/modules/5.4.0-rc4/kernel/drivers/usb/storage/uas.ko n=
eeds unknown symbol usb_stor_adjust_quirks

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
