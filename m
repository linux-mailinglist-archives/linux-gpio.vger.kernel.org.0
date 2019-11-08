Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A45BF4E4D
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 15:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfKHOkR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 09:40:17 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43402 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfKHOkR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 09:40:17 -0500
Received: by mail-wr1-f67.google.com with SMTP id n1so7282272wra.10
        for <linux-gpio@vger.kernel.org>; Fri, 08 Nov 2019 06:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8D7aKxuqal9N9LM9GQZ8F53s2v512UELa+2Smcl53sg=;
        b=Blxs+g7/r+zd8QtY1PQkmstXme+9W+M/j5odur233x2T9Zo1V/H2KoRYLuMhRegcNI
         GVu0D2mrjoHDW7TYD9XAFb9RJQ7zYyqNOp7IRJ2tUgIkf8BL+8F54NF2yuj+dEMHXNNE
         kNc5KVmQcMKJvMtHnDB8Tynj2bH3Y8Mih5xLkR6hzRRMly/hfpqiIWZNPLikCp0mW2Hk
         CuR2J2c6QhWGr5ZwLXGwPEfy4pehZUcx0VYIjK4HwTBu/K58JRbOugR+UjRgbLxIXkBi
         K1W+16DRowj0W5Kpbf9qJsLobplY/8wMxZwgqFBIR9W45rYVkgcNzZeY+nvcW4Ln3k+C
         OlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8D7aKxuqal9N9LM9GQZ8F53s2v512UELa+2Smcl53sg=;
        b=rNalubDrDYWWCReUHAFnENpoOMyVUt1gpHkTHo3F5pDwdgqDgSLhhJNJ5MNHjAEatC
         QY2R+REMmcMyo1KXaV8P8NAb67YWYPfPWaVg1+GOwaKejlzOjTuzV89acSH2XoPOMqbu
         8dFr55MJ8gALSh8VGI0xcy4o5OHsG7JQcqf+XBzEkllHgUmWhPcgpWA9ObQsIWVNQ9Ua
         1Sod8daXOD753zTcBkiO6qT21Z/A9gLhwaojS6Taz4VZOzXmamwvqB2dRlebQ/B79Uue
         /MsbQizBIJBj24TBFzjO5rKIUPj1JsXrVjiM8GbgcYwuRiAAyHKVypUvW5O7BwkXVjYs
         44YA==
X-Gm-Message-State: APjAAAXlcCoEJ+WNplpkyV7W1AqZl+RtCCi45qeg3FG7Mme7OSQpr4Pc
        /WYjK80lXcB9PfXEqibXC4amlaU1G+GhYQ==
X-Google-Smtp-Source: APXvYqzTcIgd3YEmFcBgr407ob9KOaI3r5tTcLXWCecfzgbIZcx98cTwGVj1bWbo3gc97O6X+9UnUA==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr8699891wru.30.1573224015111;
        Fri, 08 Nov 2019 06:40:15 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d11sm8321615wrf.80.2019.11.08.06.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 06:40:14 -0800 (PST)
Message-ID: <5dc57e4e.1c69fb81.659b5.cde2@mx.google.com>
Date:   Fri, 08 Nov 2019 06:40:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc6-38-g70d97e099bb4
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-38-g70d97e099bb4)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-38-g=
70d97e099bb4)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-38-g70d97e099bb4/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-38-g70d97e099bb4
Git Commit: 70d97e099bb426ecb3ad4bf31e88dbf2ef4b2e4c
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
