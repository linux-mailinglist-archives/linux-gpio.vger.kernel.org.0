Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 253A9105153
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 12:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfKULXd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 06:23:33 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33558 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfKULXd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 06:23:33 -0500
Received: by mail-wm1-f65.google.com with SMTP id t26so3533746wmi.0
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 03:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=M2MKx2Bg9e69I7OwmC8opzTie6f/ZgDEMEEsW+v0qd4=;
        b=Zprtfp8QAT5Q+bqW3XrOI1Sx1wkWNoqyT/YsJbXRxs1WLlmyU1aP0l5NIGFjwXVRsQ
         +NYbRP1eazP+aQKHpKNdlQllcShlc3yc4rRJcwR3fVDReoTGS32vqbMae8PwqUqy+hVw
         ykfkYYyYt0XmwVR9eIBf3+IV+MiKyzvtXtQIWtCgv2IpJHt4xC+2EsYT0SEZEH7fk1zT
         Mr0K+S91gBaUMdAC55RAw4JYqcz/yX3Zj2r1zbfMSBiW4CEI3ZnzNBEcLGgMFXC5ri8J
         M2LxLrsou8vrCZRzig5n1qygJPYfh6J/wruZEjN1CrqOuyTU8PFfBxmkoK6YK9D//OCz
         orEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=M2MKx2Bg9e69I7OwmC8opzTie6f/ZgDEMEEsW+v0qd4=;
        b=dlp2cP81xlBH5YGfLZ9KSRAtWWUpEKfDyvaUZBNpLogjms6IKIrWkKBbQvMCZM+FAg
         gH8Gq3qEPpo+ja7Wi+ucbrl7MtYw2Q03jWLn9e19XSumGpmhjBluZ/o6fj6cjWDaRLkt
         32AAcq7DSOwsa8bHfQ9Lf/Hx9wIEKSKqtA4//yfdGDKKHoSmmQ7TW8CmU+mqnkKI+2vH
         1EDSKuflWndq70f3jR827zBkeD6WSI//CCBhwfRJheuWWUrukBKU71LxahQ1OcfN4rZI
         V7DvlRpb7Lih5T5O6P98lhastnU+5hUtVRXNcFUEjlcevOQ42V8Lm9sOvsWtVhieakzU
         hf/w==
X-Gm-Message-State: APjAAAXILqiE//NCoT2/u37wYcGHDpV5OVLtPzMpB+Ubtpn2gxAbQkdT
        DkvST4Rz960GO0xir66MC0Bb8Hfxbzw57A==
X-Google-Smtp-Source: APXvYqyHaN8PJ66ExQuRhnc4i6rJU3K7NXBp9N2Tw4K96RNGJu+oPaM9468aWTl0b6Wvv8rtSl9L5g==
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr9189530wml.102.1574335409069;
        Thu, 21 Nov 2019 03:23:29 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f140sm2685875wme.21.2019.11.21.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 03:23:28 -0800 (PST)
Message-ID: <5dd673b0.1c69fb81.8474d.c63b@mx.google.com>
Date:   Thu, 21 Nov 2019 03:23:28 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.4-5-120-gac72719b626f
Subject: linusw/for-next build: 6 builds: 0 failed, 6 passed,
 3 warnings (gpio-v5.4-5-120-gac72719b626f)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 6 builds: 0 failed, 6 passed, 3 warnings (gpio-v5.4-=
5-120-gac72719b626f)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.4-5-120-gac72719b626f/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.4-5-120-gac72719b626f
Git Commit: ac72719b626fa213950e2f2248d5256b4218af49
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
