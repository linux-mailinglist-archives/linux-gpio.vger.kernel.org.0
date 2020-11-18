Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71D12B73DE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 02:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgKRBqD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 20:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKRBqC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 20:46:02 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9143BC061A4D
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 17:46:02 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id h12so205491pjv.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 17:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jFyzA13naR+YmcAfO4T+mlZol+MzM4a4hvQPqCv7FOw=;
        b=OLQmI56MPnkxZiyAjxSIHozXS5jjAYdbrncuaIgwWKDlmDcUQuL52NJIjLlS7m2OdE
         htHFF2TDumo4O98J2T6a/9DOcReynUMm3y0LQrAGGNgEp2577CW1oNPstid3+rxCZIcX
         jMEPnBwuBMArLZoWUHGcAlhosg/3tGf5Wu/baLzaHOFXC/z9+QM05Ujm/OtecKUHP7Sj
         /IsUbY4lFKaQPjyWxWNd+gZpIDjscBkQz9zkb1GsWMI63ResA9YIxM9RWbWY9Ri5CyVC
         bqkGKPFRSvUvgT8vaLBI1BkReFyrZ9poyRLmfx/3H7MpIpXQiyPfbsAcguRXbsaOFJNt
         UOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jFyzA13naR+YmcAfO4T+mlZol+MzM4a4hvQPqCv7FOw=;
        b=lWc20vlT2ajgK93I0wcDlT62uIedC4+C1QVJunOWI9H6SUEKiUk4caHlQnR0icYUVU
         OVL1XblxB+TGpRWJsT4wBFYqgzl3oILpugzjR3y5+4ZYqxxdUhDfMO4IOzPBcVy2qI3v
         5awnATEEGKPmrveMgDCssTM3yg37/fBcQyAwguwHsi3PTV7tcsqMIoELOjD3X96VwhlC
         d+aLkOXcuHV0w6ZcGYj1L6LkfKpU2Su5tF1K4cfO0fICOYVD4ahD39DrsDFMjG4of2gg
         ZoKCbgwafpmQxE0MMUoJxDXb8Vks7Ysa13a7qMkwXO3wbpql5h+DgnvB7McGOrE0RnMD
         iW2g==
X-Gm-Message-State: AOAM532oK4rxKwZpadZpEB0sT2L+NhKWmngB3bf/0pMvJZmmuZkuaxLh
        u0W1aSnX7Nz2GebVeDxK/4xr/RJP12WM0w==
X-Google-Smtp-Source: ABdhPJwsGI/OC7RrQ9nHxMzC+z+k3Mq6a1IZNkO2tPWXONoATTepRyM+e50jHxto4Cw9Zf0rRzgJfg==
X-Received: by 2002:a17:90b:30d0:: with SMTP id hi16mr1754703pjb.144.1605663961658;
        Tue, 17 Nov 2020 17:46:01 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a3sm23339040pfd.58.2020.11.17.17.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 17:46:00 -0800 (PST)
Message-ID: <5fb47cd8.1c69fb81.de91d.444e@mx.google.com>
Date:   Tue, 17 Nov 2020 17:46:00 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.10-rc4-34-gfec3b9548c97c
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 7 builds: 2 failed, 5 passed, 2 errors,
 10 warnings (v5.10-rc4-34-gfec3b9548c97c)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 2 failed, 5 passed, 2 errors, 10 warnings (v5=
.10-rc4-34-gfec3b9548c97c)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.10-rc4-34-gfec3b9548c97c/

Tree: linusw
Branch: devel
Git Describe: v5.10-rc4-34-gfec3b9548c97c
Git Commit: fec3b9548c97c2d8e96d1b402a1b376ffcdbf8d5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 7 unique architectures

Build Failures Detected:

arm:
    multi_v7_defconfig: (gcc-8) FAIL

mips:
    32r2el_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 8 warnings

arm:
    multi_v7_defconfig (gcc-8): 1 error, 1 warning

i386:

mips:
    32r2el_defconfig (gcc-8): 1 error, 1 warning

riscv:

x86_64:

Errors summary:

    2    /scratch/linux/drivers/gpio/gpio-xilinx.c:275:2: error: implicit d=
eclaration of function =E2=80=98pm_runtime_disable=E2=80=99; did you mean =
=E2=80=98migrate_disable=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings summary:

    3    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #size-cells (1) differs from / (2)
    3    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #address-cells (1) differs from / (2)
    2    cc1: some warnings being treated as errors
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #size-cells (1) differs from / (2)
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #address-cells (1) differs from / (2)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    /scratch/linux/drivers/gpio/gpio-xilinx.c:275:2: error: implicit declar=
ation of function =E2=80=98pm_runtime_disable=E2=80=99; did you mean =E2=80=
=98migrate_disable=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section mi=
smatches

Warnings:
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:=
7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" pr=
operty but its #size-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
size-cells (1) differs from / (2)

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    /scratch/linux/drivers/gpio/gpio-xilinx.c:275:2: error: implicit declar=
ation of function =E2=80=98pm_runtime_disable=E2=80=99; did you mean =E2=80=
=98migrate_disable=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
