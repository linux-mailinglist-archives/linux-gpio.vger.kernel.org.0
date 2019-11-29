Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37FB210D831
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2019 17:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfK2QFQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Nov 2019 11:05:16 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46438 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfK2QFQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2019 11:05:16 -0500
Received: by mail-wr1-f66.google.com with SMTP id z7so32349978wrl.13
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2019 08:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ZmrX8vBahuDLBt4IuMl1r2SQHecMcKP+N5uGuPXwIRE=;
        b=QpDb56sEUy1HtIrHBhjE45kOONwRDkEPL/kc6YyLp9Ek6U0XXqQcz2VWCASsEUvDqm
         A1yauYrmomzn0tDZ2z2Nw4jjidFFmwMYrrcYSksu1FcJyz5g7t4QG5uRnk6Rz5AgXi0/
         fF7PPCWsYazV5xu/1RcJUdSg2j8ZdTfZzOhB1CU5e5iQLQTwVnLCJfl3NnVcd0bkIiCT
         jEawxE5OfS31Na/6cATb+cBdYe9fBdhJJSVnNo/JBa//sc6ywaY9YFmT9zZ7rsqp5VlZ
         n07mTM2ia3oAeAiVCxWZQJMSd8hfmKjFml++TZx/hhArr6UKFCgXIrvdG/NtkS/kH+v8
         lFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ZmrX8vBahuDLBt4IuMl1r2SQHecMcKP+N5uGuPXwIRE=;
        b=EB+xowtWV3p3vG60j4yTkUiXMzgGaq+KHwkQYq8dLaDf4IJxY0Mgh/ZjrLfPyyD68D
         XHaAA5RZbMjP6hg6gC3rak7O/ov2puiDF9YfHo1uHX8e0Hh1PceR5Qn7aDnDL82zzIQc
         HqbdwRbqV36yPKwt8dio6y0QdtNpLBNoIh2+myRQQRoy6XsIezG4ObhH3UXWTbELFcHy
         E+AdOzZbKs5tzDF6dz3/q5nub/Pb00BCIKoQEStecPlo7MeT4UCPgyHRskWs9fhlrmGP
         D8EcWCyKa7JYACKOr5SJWgFvXxaknbW99T3UyCdBe3DNiq7GU0N50jrJr+desgFh4LVW
         Bhug==
X-Gm-Message-State: APjAAAX2NWB6vJT/uaUWyM175OJt031EIkG6b0zBlVumVk2+bYe+uLqI
        qXDJ8WpJkYtBHJ0Wld322bbLLUtTaDs6bw==
X-Google-Smtp-Source: APXvYqzzK88gH0LfEziukl9CCH31hU9/glsVrUOVG7/G85rQR8G2FDNWuoM+p+gt+Vdt8s1DZaz/ww==
X-Received: by 2002:adf:e312:: with SMTP id b18mr58465909wrj.203.1575043514173;
        Fri, 29 Nov 2019 08:05:14 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id q5sm13994913wmc.27.2019.11.29.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 08:05:13 -0800 (PST)
Message-ID: <5de141b9.1c69fb81.ccb73.8b73@mx.google.com>
Date:   Fri, 29 Nov 2019 08:05:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: gpio-v5.5-1-2-gd196292990fc
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 6 builds: 0 failed, 6 passed,
 3 warnings (gpio-v5.5-1-2-gd196292990fc)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 6 builds: 0 failed, 6 passed, 3 warnings (gpio-v5.5-1-2=
-gd196292990fc)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/g=
pio-v5.5-1-2-gd196292990fc/

Tree: linusw
Branch: fixes
Git Describe: gpio-v5.5-1-2-gd196292990fc
Git Commit: d196292990fce11fd7bb7585a782b3f4b34429e1
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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
