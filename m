Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCF52A980E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 16:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgKFPIw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 10:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgKFPIv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 10:08:51 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8F6C0613CF
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 07:08:50 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 62so1123952pgg.12
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 07:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=nnCXmu2oYugbKdQmuJZqtxIjayaNw9tVkSPGa6P7+LA=;
        b=fZJGxVzq1jNYy5TXbXk7sVrRRlwohSsMdVUPEqFsyzROl8xPhIbMSbDmxH6rJQlfoF
         MNo8wV27SyJmt8rQw8koY68mNoeeECMwEpi/db2ROnBo2A0SnyNOi3mNimqjJzwh8/iD
         AW/7dP7QQAJg38IIDlGU3hP3aFFbimcF/xi9xTZV/mHNhibPVxdou1UG93afGS46N2Fd
         a7d3NS29lJ/0nbKsfYwg93HpJDxYpO57PbnpmAUKvhjes7uDbY0I9B+SU8JQF8YQcc9t
         WWdIwHARgtlg1POhVe9Hmq1L9/9vQf6M2+WyGzfWq9k2hDfswJy3PUlLlTKkWEZbVt8E
         ifRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=nnCXmu2oYugbKdQmuJZqtxIjayaNw9tVkSPGa6P7+LA=;
        b=p4NQe6sbBIYRxB6Si1919eEhGnLcc2+0Zpakk7PzTwp4sQVM1M6wK/tULBDSY6BaHn
         AuYT0x6BzTmeJGStlrhnD4xIqFAkUoTSWpCYBD2NxldIgrrjjFUIhyN4l8nNCyKu587g
         qW2nZFepjTTS/VWMCsdxZpQQTn2oXSg2M8vZh5zJbGFhRx/5RUotPFfA07geoFJs9hhT
         RnZt+ADm9QZJ1fRohKX17tG/ODJoRUD7oN5jo+NjBbt9n14cxnv9mEX7mC1J2PqSi7Jf
         K2FtnPEKaICEvd0uJ7sME8hn+7aVlOpTpRL72gLtYLpr/U59BvgG3X+qyQxs4ip8ASUy
         Y4kw==
X-Gm-Message-State: AOAM530NI+GqRplAe00kA2fMQrkyksFAbMcEOriYIcyz5MuWRkVnGsNE
        P4CBa5eeaxEY7ng999UFzwLkWVyeRQWY3A==
X-Google-Smtp-Source: ABdhPJybJPgnpGQqMHYQAhfPs0prFjLD9d4Cm+k+TweASaL0c5z38xq3pCOGRZXKVlOXPk+TRnuvKw==
X-Received: by 2002:a62:e516:0:b029:156:3b35:9423 with SMTP id n22-20020a62e5160000b02901563b359423mr2355686pff.19.1604675329250;
        Fri, 06 Nov 2020 07:08:49 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i123sm2577864pfc.13.2020.11.06.07.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 07:08:44 -0800 (PST)
Message-ID: <5fa566fc.1c69fb81.dac51.4438@mx.google.com>
Date:   Fri, 06 Nov 2020 07:08:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.10-rc1-12-g9a6907e948a3
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.10-rc1-12-g9a6907e948a3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.10-rc1=
-12-g9a6907e948a3)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.10-rc1-12-g9a6907e948a3/

Tree: linusw
Branch: for-next
Git Describe: v5.10-rc1-12-g9a6907e948a3
Git Commit: 9a6907e948a36e55d45f53b5e82fdb73aa4397f7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 8 warnings

arm:
    multi_v7_defconfig (gcc-8): 3 warnings

i386:

mips:

riscv:

x86_64:


Warnings summary:

    3    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #size-cells (1) differs from / (2)
    3    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #address-cells (1) differs from / (2)
    1    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #size-cells (1) differs from / (2)
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #address-cells (1) differs from / (2)
    1    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for =
SPI bus
    1    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells f=
or SPI bus

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
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
