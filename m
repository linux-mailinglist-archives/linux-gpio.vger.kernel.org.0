Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCFCEFBD17
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 01:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfKNAe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 19:34:26 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37206 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfKNAeZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 19:34:25 -0500
Received: by mail-wr1-f65.google.com with SMTP id t1so4474271wrv.4
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 16:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MRm2Zfjy2YdLfvvoPsnkOtbIiCcrAHUiI+mmUOp2h7Q=;
        b=kNIEDMbD83JEBotvQKrF7QwzWMqyLwrFJNqx3WRGD+EidAlBYBoai8fXvdyPv6UNBT
         dhkWQ1Zgohex1QgTmhXIEUQutKisKvmdHfOyUxVq2KoYDOq5Z0oDhhVJ062MJyd2Quua
         sUIjtZIABdhrkHz5RgmHaqOUjNnCr7a0LV2sDe4UIYTjMh/LZ81ZfbaFRpGX0HDVcS22
         RiXNmwGF+ISlbv6EnUYuQw/YMkdy3GXcJxXROdLRyep+Bq/PT3LbtEjJ7jJsaUj7PqTk
         Tg2oGqmHhkYuFWDsBvzsERmyQXJLd3bp8V3jEZSKrcOHFXHyahc9HSXdYHIl89aN8gQ9
         B3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MRm2Zfjy2YdLfvvoPsnkOtbIiCcrAHUiI+mmUOp2h7Q=;
        b=Wbh60CJwQje/NAf7lsg27+D5EiGWmKeH29SCSQiTNvxpUZEVFAWw1b/OBDbCZX0wBJ
         IDbLEKRObPBngT5vhrPpIZXXS/Wh4W7yC/pLLTenq5B3/L4Vc7YudVT+VCFxMnCfII+c
         A/D0JIMG91+om0vhOoIOKDzMEN8CLXvX215FUNzD4RW6tc/mHBjlVjnCnjalYiGfe1e7
         2VScf+IIrOXmguh2q2+UZgZu6awVAg9tsdyVT5dkZ/aCVMKD00fuODpOYfByLreZinhl
         vaorGgX/X6SCM0IplWGQEviHaZyxnWYwCVehQjoQRaFMcqHFq3f68BfjFw6hkFAnkT3h
         27Fw==
X-Gm-Message-State: APjAAAVuVC5VOchL0b1z0JXsKwtLWdCntQVQ1lF01tv/CHYDOPoGfpQT
        rLhrj7uq6iB3EWx3gDlFs0UGXXJaOfVeuA==
X-Google-Smtp-Source: APXvYqztusFh1plz22PrQCqomGohktIE/Qkc4sCE1RDd7meo8DvQQWUwSwLwjsEyyqmqM2+JSFPitw==
X-Received: by 2002:a05:6000:49:: with SMTP id k9mr5440657wrx.43.1573691663780;
        Wed, 13 Nov 2019 16:34:23 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b196sm4440149wmd.24.2019.11.13.16.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 16:34:23 -0800 (PST)
Message-ID: <5dcca10f.1c69fb81.2ed58.5849@mx.google.com>
Date:   Wed, 13 Nov 2019 16:34:23 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc6-123-gb27f300f8cbd
Subject: linusw/devel build: 6 builds: 0 failed, 6 passed,
 3 warnings (v5.4-rc6-123-gb27f300f8cbd)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 6 builds: 0 failed, 6 passed, 3 warnings (v5.4-rc6-123-=
gb27f300f8cbd)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.4-rc6-123-gb27f300f8cbd/

Tree: linusw
Branch: devel
Git Describe: v5.4-rc6-123-gb27f300f8cbd
Git Commit: b27f300f8cbd11b9298820910df9a7258af2f726
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
