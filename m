Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9CD2EA861
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 11:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbhAEKPt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 05:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728205AbhAEKPs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 05:15:48 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E1AC061574
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 02:15:08 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y8so16102084plp.8
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 02:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aLtDYw897hWToPhNMmSe8v0st1ph2EuoBGKd1K7/pgE=;
        b=Ovj5D7WjhsrXV4KBqDKd7WusU2BxIOtqXZTaWvy/OJrCBQT5pH1zO4XzQuLs0zMa+T
         09osANKpSCn06SZYGe6Hm+D8nSK/wW4nUaJzPti3n7XYFcRGHTGH8RKBAUQ8xlUmofzC
         d2lHT50c5PAShynQSrdLPr+Zmz0yp+6bAaJWBCJNyNVPGoTFu9LVzKFbcJA3Z+HLnTL/
         XbxDWlb/B61Dth1Z2BXRcoiz9BnlEarWZjqtB4J3IqBN17DIXFnlaITz6Qpqcjz2wfC6
         dShReF6Iqbk1jv3sl0LvkRIaUOJf5rVFwlCLjlqQM0WkwAryETlr4vwNCixJtaDyStPp
         B7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aLtDYw897hWToPhNMmSe8v0st1ph2EuoBGKd1K7/pgE=;
        b=f/C3/PNl0n2nS1AFHCUI9CsA1DnVhWW/PR/z9T/stCYCvg7DCVKBl0TAsSpQwT9z+Z
         tANgxFPtatuggdmPsVskK/STqC5ZWAcLdcseto4raqfzg+3laUAqqnMq7BwMfbItm/id
         i/6OETv1z2srlwuzf/eV4510lZvOgz1B7JIKQyJfWE8ms3ryFdfm+nFBJHW/Wj0la0Yx
         AbfY2+Tj8QUYo8ReJqOJpdw6b0Kvsot7MqQnOTEIC8kPSGVJCMFGiZTu0fXDdJCcSpil
         z9pk3SOqdghKJCjfqK8ysSjTmKj47FIKv79sCIrfZPogdvZ08TfklFMDzU6tHLD0RReW
         7raw==
X-Gm-Message-State: AOAM531KPAcGlcCZy9tujMDbvEe5rLV7Z8x9sXNFru63uFlBQxIftutF
        lXHBCUx6JCdRCGZQy/TQ8SrdfqDa4Mguxg==
X-Google-Smtp-Source: ABdhPJynJvAEEMLzMKbC2qme+bP42oXFhgF/yBxZN8Av4LlOUKef/SOuh9CCtIZkxNvNzLoPfYeVfw==
X-Received: by 2002:a17:90a:3989:: with SMTP id z9mr3431450pjb.198.1609841707955;
        Tue, 05 Jan 2021 02:15:07 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id cq15sm2108576pjb.27.2021.01.05.02.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 02:15:07 -0800 (PST)
Message-ID: <5ff43c2b.1c69fb81.55747.5826@mx.google.com>
Date:   Tue, 05 Jan 2021 02:15:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: fixes
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.11-rc1
X-Kernelci-Report-Type: build
Subject: linusw/fixes build: 7 builds: 0 failed, 7 passed,
 2 warnings (v5.11-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/fixes build: 7 builds: 0 failed, 7 passed, 2 warnings (v5.11-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/fixes/kernel/v=
5.11-rc1/

Tree: linusw
Branch: fixes
Git Describe: v5.11-rc1
Git Commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 1 warning

arm:
    multi_v7_defconfig (gcc-8): 1 warning

i386:

mips:

riscv:

x86_64:


Warnings summary:

    1    drivers/pinctrl/nomadik/pinctrl-nomadik.c:952:8: warning: unused v=
ariable =E2=80=98wake=E2=80=99 [-Wunused-variable]
    1    arch/arm64/kernel/smp.c:810:16: warning: unused variable =E2=80=98=
irq=E2=80=99 [-Wunused-variable]

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arm64/kernel/smp.c:810:16: warning: unused variable =E2=80=98irq=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/pinctrl/nomadik/pinctrl-nomadik.c:952:8: warning: unused variab=
le =E2=80=98wake=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
