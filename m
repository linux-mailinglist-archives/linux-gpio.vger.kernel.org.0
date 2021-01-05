Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11CDC2EA748
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 10:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbhAEJ2M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 04:28:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbhAEJ2L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 04:28:11 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 886F9C061574
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 01:27:31 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id z21so20904782pgj.4
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 01:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Lv2Hrxl3LwDxTEsmz+QcMAuuteEiuFPDvjHpBRCpE4g=;
        b=A0cuzO65oNW+aXMto24poswWiHCwFYFSPpIzTHjrDzyJjv3w7n7XIV41D52Uy0MGQY
         7aObXGmqmVjsMbuuBcMWCmnhmsRIVervifgvZeD8NkQArGHdQAwNmspi61QrCgwpVlNs
         WZ6GM109hC13jh0BlZ9/R7xeh6qPX2CAVdJKtwU8Gb1VYcA4MyysyGvl/1idMyYK7pr9
         qMloLPyPmjKGNjehJC8DViM6T3MqJBB+1xUc8u8PyLuogrO6kktNb1ogcv31jXeClA5l
         gVoxHFmcjWGQUYr3xNF0KgquphYwohfeB6KY5R4cY8zbJ70dzuPxN3z/2Dtxemnl5VpT
         DLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Lv2Hrxl3LwDxTEsmz+QcMAuuteEiuFPDvjHpBRCpE4g=;
        b=Q0yqWK43CY4v12djLPW203Ts/zJf68RoVvGAgzc5aBVbvj6Me2dskr54Jb26WyGQq5
         TSVccy+mBhoTcZozWlt/JpBY/FIRaKqKIlYovS3q3clSWuJWl1L3oHpGDTn8TYJ92AhO
         fXLZiVIM2UnntzZ7ypw1o7MriKZt9XwpfHvA7CVQDoCxsQAfKbaYXi3vI1vuT4veR3q6
         JMW+5hTeG7zxs5h7oFqNm3a4NFq+MCCFbqIli1fL35ib4vscvQ0QfiCIx4czVNqO2QDr
         m1LVsipxqY9WjyItZsUUPcb/3oT7Vl68GUWHeH60RzzCXLuIp8ZKfbB1q+7qRS9x+h3a
         lNSw==
X-Gm-Message-State: AOAM533fmUh4I3cc87MnyXa0Q4JnalAXzZw1isuZx3fALvVIDBaCiLZ0
        Q4jZnpiZUYuZ41P3DbQEJomBYPmw3ie+ag==
X-Google-Smtp-Source: ABdhPJzS0QRuqT734uqlwIUWwsRzuPaXBgm6aRHTWbwkKn9dFxnbOzJz6A+LaJ44XW1VgLVIucQvDQ==
X-Received: by 2002:a63:c702:: with SMTP id n2mr28011041pgg.382.1609838850758;
        Tue, 05 Jan 2021 01:27:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m26sm58289101pfo.123.2021.01.05.01.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:27:30 -0800 (PST)
Message-ID: <5ff43102.1c69fb81.af7e0.4dab@mx.google.com>
Date:   Tue, 05 Jan 2021 01:27:30 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.11-rc1
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 7 builds: 0 failed, 7 passed,
 2 warnings (v5.11-rc1)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 0 failed, 7 passed, 2 warnings (v5.11-rc1)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.11-rc1/

Tree: linusw
Branch: devel
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
