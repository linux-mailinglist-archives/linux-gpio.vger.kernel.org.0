Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF51105155
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 12:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfKULYN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 06:24:13 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40972 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfKULYN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 06:24:13 -0500
Received: by mail-wr1-f67.google.com with SMTP id b18so3898846wrj.8
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 03:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=w0heEbc4zhxSXYpD7XDylm+dPSMxWNrGNqhAV03Zn/s=;
        b=c8zTO9qLyUXyDQMAQz60b3VShhlQTINtysi3gNODIw1/Bd+zU5ipApW3oBidrmP8GZ
         hqr84JA4Mo5CcSm/0bbRVss0kkhkigYznKCCXdxbI2e5Vqku6ElJkgfS6ziZ6i4/kOct
         SMqMkKWylEtaplcbc5RR3+zeeJmID5s0CFZqaaMkJN8tqkKa0fKY99EH6i+Wn7Dy5fGp
         8aW6Cs2+bW0hQncwGtJzv0zFzrH7ibW2yom5qXXv9Jjxz0FCatQK4JGpd8FST6Ns3Wqz
         E9cqaNnh0QRUSL2378T6oCNhC97lD2QjmSQNv0RSAscQ1tmzaaLsnU03PMKhYo03zUxM
         BdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=w0heEbc4zhxSXYpD7XDylm+dPSMxWNrGNqhAV03Zn/s=;
        b=WPRwX0NAU8l1enkjsTgduMKtubssxKyhTs2GFgV9Og7Jo9UBSOPx0NUD7rQyDPcZFv
         3TaiCTopJsz/ZZ5nYJ7UtfHIMw4s3eNRWvUolUv4pvQpp4HK9IfCiB0vhsVF6BwlqDzZ
         H0foYEs3A1CIbcHC0hRSOcEE6bugPBx0R3C52L2V9yfsaeVERubkVwLMKQWaIe0m1Laj
         ykJ2MU6V2UMQIuK2iRMf3g7Mfn5QaUcPgZmg58R1pQOdXrwC8Qq5rG2DSMZw1lEEZikS
         dV6gkheaxaKb7JcwIErnZNaMhYH4T7oXZihnXHtgKAzNi4RORF2P7hE1497+OTr6HGjD
         tjtA==
X-Gm-Message-State: APjAAAWwfk5yd4Z8DYMu8j2oPz8YLe5TSG0Sgqfz5g2Z0C8xsTwpGWLl
        Fh3IC44jfa+63Q1WD9i3SHnT2yh7aRxOvQ==
X-Google-Smtp-Source: APXvYqzPOcqK4dmfZnpBcp7E7/D/BxMfmrDo2m3i3PWq18DE5VmZI8cxbzFemMy2PvB55ssShcH8eA==
X-Received: by 2002:a5d:570f:: with SMTP id a15mr9735006wrv.316.1574335451416;
        Thu, 21 Nov 2019 03:24:11 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y11sm993125wrq.12.2019.11.21.03.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 03:24:10 -0800 (PST)
Message-ID: <5dd673da.1c69fb81.55581.5418@mx.google.com>
Date:   Thu, 21 Nov 2019 03:24:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc6-124-g3f86a7e090d1
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-124-g3f86a7e090d1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-124-=
g3f86a7e090d1)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-124-g3f86a7e090d1/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-124-g3f86a7e090d1
Git Commit: 3f86a7e090d1dfb974a9dc9d44049f9bff01e6a5
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
