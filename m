Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5BBBDA731
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 10:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392923AbfJQIZC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 04:25:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34188 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387581AbfJQIZC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 04:25:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id y135so6457476wmc.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2c13upbpkFVKfNUuBhZy/k3BLG9wjeaeGU5fj5L0mWw=;
        b=npNvMwZUeJLBax6oYl69uLMaETG8v2kP2AEq+ktJhaUJMulax7rR00dh2EwXwMNGvH
         8F4XYDJqzje7eEowpSNjVpd4ueYapmWPtb4PC9z4x4QCz/6QROVGcMQOq+NytrymhcNo
         WBh8quBy7GLVbltiTFzlL51BFo33YPDO3DwEztGNppLE85EiyHUDEWlJ2I72c7E0hz8e
         0v/Vg47O91mbgEBPXk1PiG5F/txJ2CvDCezt/cawOiUhcjli8N5LQ38qWPutPB6xzSol
         yaeYdaHZA5WYw7BbG54Y3FBKQE1Fl/T0DeQ0mjCyRVP1HQ0UMuvjGmYtulXQvridH53V
         SYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2c13upbpkFVKfNUuBhZy/k3BLG9wjeaeGU5fj5L0mWw=;
        b=MiiIHIpKd6HTCY51HvFE6GdoP8KMXCx9LWtOhwvI71HegFbQ6xaQPjF+lEvd/y4wd3
         mR70XjHw+mWBJor2B1fxn4nY1nqikDa3jVfBP0dg7VnCgFT5eUN5s3ay0yJf8L5irFNa
         fUd6fUy9ZX/KL/oMofrU3CugzWnl50c3h4L+oy/aNdwB/5pX+5uBqBAe1weTcL/FpHCR
         R4m1VLbvJKsGZD4SshTJEAX03rvQ7laXKkBnEHoHqKX6+L9yHKHLC7Ll/dKaJRz28khb
         gy5mGUytGUgxINUA+SKhU5XqvMYgM7VJFFG4/vf3h7sol8OIZvUE3nN06QCK58T45zH+
         VE8w==
X-Gm-Message-State: APjAAAUjq31pwGg3pQyHwMztA2OoxvLRCV+8botiIrOuPCqZLDERtJFV
        dxx+4FaFLybUfnx3LGBjnsH33oRRtAo=
X-Google-Smtp-Source: APXvYqxNaRHbwNEJqrEd/UB0KAj4yEgiGMBfrO6EsunIevm7UEI6GfdGDS8ZSaexgxlNZBll194+iw==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr1705108wmc.33.1571300699729;
        Thu, 17 Oct 2019 01:24:59 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c6sm1356017wrm.71.2019.10.17.01.24.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 01:24:59 -0700 (PDT)
Message-ID: <5da8255b.1c69fb81.408bf.61ce@mx.google.com>
Date:   Thu, 17 Oct 2019 01:24:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.4-3-13-g7c547cb52849
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 5 warnings (gpio-v5.4-3-13-g7c547cb52849)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 5 warnings (gpio-v5.4-=
3-13-g7c547cb52849)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.4-3-13-g7c547cb52849/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.4-3-13-g7c547cb52849
Git Commit: 7c547cb52849e0806a407dccb9b471ef261ba20a
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
ld/_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_adjust_quirks
    1    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3/kernel/drivers/usb/storage/uas.ko needs unkno=
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
