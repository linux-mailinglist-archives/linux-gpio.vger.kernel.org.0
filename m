Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 449B5FC8A0
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 15:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727002AbfKNORD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 09:17:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35917 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfKNORD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 09:17:03 -0500
Received: by mail-wr1-f65.google.com with SMTP id r10so6667293wrx.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2019 06:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eCuH//Rkq18bflzFhHO5I4A2f6Dj3K0XgZklGjGlrA8=;
        b=g+KgcCzu1A8gh0ymOmQBIRBzulH5ju8EnhzAM65rWjC3SbLY0o32l93ikA7bg/696I
         Sms2JuaGRjnOEtGns3IUR9PvfHxnEIg50Wn4tsLaMH79YK50ONArO2KkNEn578KyXf5i
         8w5dPQ32xFSVLWFBqJB9z/hhxr6J5/v2H0AuguUTGmPDnQ/rFSJhPKeQfF09eirUovbd
         9JzPs31me+dde6X1hOqAcSv9Kt/aUbo4EinVDf2l3Syelxzuld7PNmQoX24cdi99o4fo
         k99gdzZxBuvf+nQk+RmlFTGhcB6UY+Fixk+osDLNVzL7kM+eWQPNMj5qu8CtGwats2PI
         foqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eCuH//Rkq18bflzFhHO5I4A2f6Dj3K0XgZklGjGlrA8=;
        b=tPoau+5H1IPoPzxaEQs6i1OHL0KrwckI/P2AqbwZLRfmz/Rz0rXbkOUJIc0TYCCtf1
         tjw1grgAu3DUwz5dW7nlbD4gxFCmsXMJsFrhVBnzJeVKSjzAEVpkuTGv8SAxNYiJd9mt
         POBVIo1gmd4L5jrjEk+7YjpkP1cTCGALf4q2s8vfYEJqTcUil8FdcuPR9m1iJxf07htN
         yOFWC/tTdS6UnhRGzumhug+odAhBGQ/9aSgCaRBJBizB/yzZJJA9jUwIs17tDYzvvX3v
         ha+LIuPrEhSR2CzconZG+hi40JYlJ3zJ9Vp6u3PIPQzyunHRAtyR251HpXkfJLeQ8thf
         mTgA==
X-Gm-Message-State: APjAAAUvtIGg9FVU61BejKoTBlym8aj9rcSfdOwSEo+CeEtiDWFuT1wH
        4/UHl2GY41E6ZlEn1G7qBbkl0AjV7t6apA==
X-Google-Smtp-Source: APXvYqwmMSvSGvOMI/ljyGAlakbBf7wn21K1eYvnLa6tEayBD9JBu52yxFNxwreBCa6mcfOXghr3QQ==
X-Received: by 2002:adf:9d87:: with SMTP id p7mr8247081wre.11.1573741021486;
        Thu, 14 Nov 2019 06:17:01 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 17sm5541143wmg.19.2019.11.14.06.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 06:17:00 -0800 (PST)
Message-ID: <5dcd61dc.1c69fb81.a9178.af0f@mx.google.com>
Date:   Thu, 14 Nov 2019 06:17:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc7-124-gd0d9531e38a6
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc7-124-gd0d9531e38a6)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc7-1=
24-gd0d9531e38a6)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.4-rc7-124-gd0d9531e38a6/

Tree: linusw
Branch: for-next
Git Describe: v5.4-rc7-124-gd0d9531e38a6
Git Commit: d0d9531e38a6ccd0b4e32acec85d564b677dec41
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 6 unique architectures

Warnings Detected:

arc:
    nsim_hs_defconfig (gcc-8): 2 warnings

arm64:

arm:
    multi_v7_defconfig (gcc-8): 1 warning

mips:

riscv:

x86_64:


Warnings summary:

    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
