Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDC6EFBD04
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 01:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfKNA2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 19:28:54 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42867 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfKNA2x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 19:28:53 -0500
Received: by mail-wr1-f67.google.com with SMTP id a15so4445846wrf.9
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 16:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ASSAuLnTBeMQFzPTzReTcL3IJD7OYb7+jFS+NCbXsDA=;
        b=fjTZmaKJfvkjAtM4M4ltPndX3s5WhVqD2841YAhr3EatOxpwx61K0GEtmj7C/6iTj8
         Zwtf9W3gyLNKCS+pwjHjOKS75rupiRXzasgR9ZxUYzFUkzNvSGseCBfRmmxjbz+SFYKl
         /nBE97f/+U/V7ZLs+e/Sgla7oGx4AKU6jGUG/rdratVmoEfea1FOXEDX2Xmnx3kZrIDN
         vJHdG8k4ZEAqpIhdhBKhAxwDXE1bXgUE1egBGkh2ezJfEE0CDG7RfWF7GTUwRE53Vv8j
         Dt0HA+OfA5Vl8HlqL4vC4r9NrbUwnGiFDjhcYVwO0anVf4OI+AIE6gDa2+ljf4M1BIAX
         KHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ASSAuLnTBeMQFzPTzReTcL3IJD7OYb7+jFS+NCbXsDA=;
        b=QSEMspCEmvGhaAyU8QtS1s6XJi3AfuO/QH9zABaiRSqFTJdMvys/Ch+GxQazkmCdEE
         KbqH6xgNDYWgGt5YoiTWtQhozkMMnTm6poNe5EIrttW+g5KDHX+Xm+Neuu4bb82UtJHC
         YE3ZjUVVfZ0wQQ825RWbtPsK44e/b2nVjgy4Ipru9AFJxX086Bn5oLjUESlXZ3P/9RVA
         QS4BCVcrvMe1LDSrPBtUv8R51Md9/9LiD+4QM4syzQc4ueG1esA/1NyaiBH7ADfXvCih
         SS9pBV7HbCgu2ptNXvegg0Fy2ojfoR7Q1Jczh/hiYzHunJTAzVh8M0avnvH3h4D/Gtll
         6sRA==
X-Gm-Message-State: APjAAAXuKCbM54xyFo9UFYCoxagxsMnC2g83JJ5sKZDaCm34w5Z9qKeb
        /beDU7gWvhp+gYuYZyWcAz8sEq7KbdJHmw==
X-Google-Smtp-Source: APXvYqxK83HVoSqratV2Ydy2Fa6azLwvQsgCpxlNVOOdh1mJeZ7t8RuvxhoBrOiIiZNEZDLBi96Q9w==
X-Received: by 2002:adf:e70d:: with SMTP id c13mr5503510wrm.78.1573691330034;
        Wed, 13 Nov 2019 16:28:50 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a186sm3648841wmc.48.2019.11.13.16.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 16:28:49 -0800 (PST)
Message-ID: <5dcc9fc1.1c69fb81.806cd.29a1@mx.google.com>
Date:   Wed, 13 Nov 2019 16:28:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc7-5-gcbdaa5e7bd90
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc7-5-gcbdaa5e7bd90)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc7-5-gc=
bdaa5e7bd90)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.4-rc7-5-gcbdaa5e7bd90/

Tree: linusw
Branch: fixes
Git Describe: v5.4-rc7-5-gcbdaa5e7bd90
Git Commit: cbdaa5e7bd90db9980ff6187baea9d49fc4de960
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
