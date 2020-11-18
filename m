Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D712B747C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 04:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgKRDCj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 22:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgKRDCi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 22:02:38 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D94AC0613D4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 19:02:37 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id x15so220834pll.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 19:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6jQ0f3nWSr8IXn6idKQqB1VLxC8cORzbBlwWmF8r2k4=;
        b=BKkj71uondpDC9DHDEB5x4Vn8NAVeshP6DFSPYUe2lVqYe/AOh9akvyX4Q7kfgmIqo
         7J97+iLOHqiOuOtrxso+wH7PAJmQ/OIQ+p+1ygXnNAJ9z6DQziIkDn8dDSM11kMMk0gD
         X1nGQh1a+Jzr8m6QVru/0E07DlUjvY/bmQOQZpi6/EbawhDWUO0BKHkBISaAfooHn/GQ
         Lj8C00JQe5uXoiN8bnSq5N+HgxnKDQIqPYrj96OMeijSZirGAKLB6tpXUQKq+RsF0+Zo
         RPVUkSy59zDN0STgHRFYVBQprUfOB5MGZFAChlqlU3Et/jUIV6NkfGp5QlcHS6JFjGyX
         EsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6jQ0f3nWSr8IXn6idKQqB1VLxC8cORzbBlwWmF8r2k4=;
        b=YlpjrP/9RdDa0IEsUF1eCFdboDTGOq84d37hPfb3U6hJ5Alx68LuiE0JyfM6PKouYP
         sVATiqy/gEIHGQkLqt36dXMCXwGuOt9IaprrBpE4vAqlD6weyrxetuNM/UuTJ5J/7zzg
         XObmWIxK4Ho1h5oRzNJkRmDX89a7YowUbkJ6ESbujdOaKQKiFza3x4E+BVyxfcS1N2fX
         Xi6RySeG7Xlk09IwSLrl2QiUxp1NhaprA5OZtqAWA/d38OERcvOmCtn57f7Dr5bJdzW+
         Aebb6MwiIUIgelQUE/2QnBLxvfKbzvWnt53bcpnGzFKyXc0o0fJBYzrUk2iv4rtL6/4U
         N+Kg==
X-Gm-Message-State: AOAM530GFbJMCF5+FTFNaxHro925sVlSanxMWJPwv7o30XM/6ssAZVVY
        b9qnTJoFyw4tpNxZxk8xkVcjNBEwV3skfg==
X-Google-Smtp-Source: ABdhPJxPiHL6HwZWCOFwPtgkxqPMQDNIwdkH5ZDKaW7ISOaiCxBFo7fuMbETyFAuLLTSTskyDuqZTw==
X-Received: by 2002:a17:90a:5d0a:: with SMTP id s10mr444010pji.160.1605668556162;
        Tue, 17 Nov 2020 19:02:36 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h10sm516181pjm.47.2020.11.17.19.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 19:02:35 -0800 (PST)
Message-ID: <5fb48ecb.1c69fb81.d66a3.182a@mx.google.com>
Date:   Tue, 17 Nov 2020 19:02:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.10-rc4-34-gfec3b9548c97
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 7 builds: 2 failed, 5 passed, 2 errors,
 10 warnings (v5.10-rc4-34-gfec3b9548c97)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 2 failed, 5 passed, 2 errors, 10 warnings =
(v5.10-rc4-34-gfec3b9548c97)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.10-rc4-34-gfec3b9548c97/

Tree: linusw
Branch: for-next
Git Describe: v5.10-rc4-34-gfec3b9548c97
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
