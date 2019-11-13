Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9FA0FAF02
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 11:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfKMKw4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 05:52:56 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34144 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbfKMKw4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 05:52:56 -0500
Received: by mail-wr1-f66.google.com with SMTP id e6so1823735wrw.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 02:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Ya9ihrWeuQydr5lnlHCptQukDHl0xya8s9e4+4Gg43E=;
        b=kp+9huHqAY23yD0eHRt4MWmnPFW/N7DeJJQP5OBsSwXpMbYfcrv3AQ4rTdOvIxNAGV
         /89Ysa+w3+n+9PBgwv8N8Mwb303iEixp4bfNrHhABXXrE7LH66BZVDt5CCKDr8KAFQhO
         nTDtAKJGS7fmIHOOHiCfh15VdMo4UrM7T7kZCIfw3Ze4npWEWnScg+wyx2bv6Ro+VIyp
         gADuHX5TBpdJccfrK5vln5paE6Y+dtFarXCHm8QEYdGN7rtKgDuy1i6N87RgGWXdMTzq
         16uE/hMg65Lj4Xzm1NDi01agVFhuyJAqlETwNG6s1LX7XmuX4OZtY5fpLoz3Dh3BLgBr
         0yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Ya9ihrWeuQydr5lnlHCptQukDHl0xya8s9e4+4Gg43E=;
        b=N9FshiJBicwCrhKVnBoiwrg4ROByiMYwhfT+m1yVeiFbRd8D8VWGZDnkdgZr3Y/QKE
         RhlX93l0nfUW7CRYAOUj2bBDLuqBafU9QCZUGt2BBY3CRq337z24lSpdzF2VP3zLEDwM
         +E6NtgvCpdWgr2uzEx3RgkqlbsxvI9EknnLHFuxqobFn1HsoTNJzhdFepAL9z3Ogl55J
         Zr2ckp1c2630raw48qGfEH5IZwaRGOy7Boa+EJeE/LDg2xL2WPtkE2jZcf1e6witj2NR
         rv1ZtxD5uWrcENlaJgSqmBHQ1bMqj1vh13eNgCWIvz3pKC7lTVJqPsz8Lvyq/YNtRhyW
         tsDw==
X-Gm-Message-State: APjAAAX7G59BdgQe8kG80IV4UcLyMXn7hIY07FhGE2QRvPbZ+6QNARuM
        0H3mjs+BZ6jds2aWoFNR5a1osGy17z4HCg==
X-Google-Smtp-Source: APXvYqwxZN17AualtbYIJtqSmQsl7tBOptgtVFDmIi9LqkVAiID6w/44ppOTRDPIoizNOjLIWx68qA==
X-Received: by 2002:adf:8b09:: with SMTP id n9mr2022897wra.95.1573642374097;
        Wed, 13 Nov 2019 02:52:54 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j3sm2157930wrs.70.2019.11.13.02.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 02:52:53 -0800 (PST)
Message-ID: <5dcbe085.1c69fb81.eded8.9942@mx.google.com>
Date:   Wed, 13 Nov 2019 02:52:53 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc6-39-g61b7805a9b25
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-39-g61b7805a9b25)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-39-g=
61b7805a9b25)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-39-g61b7805a9b25/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-39-g61b7805a9b25
Git Commit: 61b7805a9b25bc1a31386c904fb5b03512c801c7
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
