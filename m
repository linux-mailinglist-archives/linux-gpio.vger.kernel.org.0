Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68414C8D0C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2019 17:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfJBPkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Oct 2019 11:40:01 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]:36245 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbfJBPkB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Oct 2019 11:40:01 -0400
Received: by mail-wm1-f51.google.com with SMTP id m18so7497316wmc.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2019 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lYj/rKLh6ndHoC1wOVPNm8BrVYYEnX1a2LLh6i2dO+Q=;
        b=1vlo4i2nV3m9KTcYBRrcgnMFt2X5X2XJ7EokJiyg3RnVNl09JOZVV5Gf47sFoW0riu
         jWzNQXQ4ujJhE4hi6J+lVGKgT1yN8cziEfCL+nBuZ3hQAENusDH4iHNUMkOHm6k73JVf
         VQgisQAD6sH3XrmUBJGw3oTxXn5zmp62OOwWFW0krHYzd/5EetS/zozlO/+iHopJrxCY
         JNar6JKSVQlkMB7y+fiKyZuA9EaWp2lTchGsvcGH6uk8nIv3/dk1Ilb6cV5KuHgmQkmH
         IWkXQbL374ExwWdWkfpIzjIwYJSY4lDs4fkbpEzR77SZ0BQ+EgMduVxTM1had7zhMzaw
         HrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lYj/rKLh6ndHoC1wOVPNm8BrVYYEnX1a2LLh6i2dO+Q=;
        b=acqjKdKKpvynMKr67/JIOQbFcFm6EGXvPnwzhhhFLkKXbrnVYX2KrDPtt1o8W+gzWP
         z/j/Ofa0+U4BM/B0+SMs/1dC6QAx8Vbg1Zl9U6BJW/mD000IFWs7Rz56FMiisLJIcV0B
         GSoKKWHUIzLc3eEgKm0CgZaJHNKLsPx2AS9d6uJXrNBp3hXw+kfTcAimVcZo2wNfZNmX
         sN66XhrHwk8fV4yI4Ynt1rYau0zp+5ZdO+Y4YgaWieZGjaoCs/6qYqNC+ztAfqXq+wEa
         ls+fsqP8EdXAHt3YYCaPdfKeXxBhJgeQFi3MhgWhTcM5HsDDp/8pFapDmT/Lgw65qzvE
         oCpg==
X-Gm-Message-State: APjAAAWooGtXY5/YQVTLJPEqURf88Hi10kUwhO48g11wQmJ+srfW46hX
        aCKSFZyTuH1ZlxpbMllfXvzJZqPJcLMpug==
X-Google-Smtp-Source: APXvYqyKGxC3yAH6C5qNkFkKWXG9YXLxeY5fjtTBeJPwC1nnIsEEzAtJq0VgI9IgN9xVxMndlPehHg==
X-Received: by 2002:a1c:9a46:: with SMTP id c67mr3402191wme.115.1570030798389;
        Wed, 02 Oct 2019 08:39:58 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w9sm3283235wrt.62.2019.10.02.08.39.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 08:39:57 -0700 (PDT)
Message-ID: <5d94c4cd.1c69fb81.5bff.04f8@mx.google.com>
Date:   Wed, 02 Oct 2019 08:39:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-1-gf8b410e3695a
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 13 warnings (v5.4-rc1-1-gf8b410e3695a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 13 warnings (v5.4-rc1-1-g=
f8b410e3695a)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc1-1-gf8b410e3695a/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc1-1-gf8b410e3695a
Git Commit: f8b410e3695a86686f4075b997bc53c8a178e4e2
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
@4/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@4/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@4/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@4/li=
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
