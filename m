Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F43129E20C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 03:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbgJ2CFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 22:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgJ1ViV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:38:21 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02E7C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:38:21 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id x1so1065478oic.13
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Wt+s6BlJ4D0pWj4799MnptGBNN3QDWrSO2jwSkSrrsU=;
        b=hCh3HCwWp+z8Ck3xe7usGn56v/YM7VoMPZnSaVNWceto4fL12RWZ4aw84Qt1EpB820
         QWJzcWflXAPDTP1SZHp3XuaURJ7F0xMcWxkzZaqYGpzfzx/ak3o1SwkEGZkvl4kScbM2
         UkZ5PR390uI1l2cJUW5Of9SjN7I2CumezztRB5FelP2gGWvQ2nVp7C46rl6/y/fp4i2t
         zTEbxe7BjsoMlgAYTlPScQ3Lij5+XhBX8lZdOjOm6JeerIJhr1RH4ByfaOqsHbKAfxbq
         U4K6twAy3W3rYXuCQwZGf8Kpkdb0R/HahmWXwIO8EMRQaXNpreNzaVJ7RGKhZ2vWYEqq
         jydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Wt+s6BlJ4D0pWj4799MnptGBNN3QDWrSO2jwSkSrrsU=;
        b=LCJXOcnjIvwC4bTmTVGiE/OD6ljN+WfdZfX0yvch5A9Kj2VeGPM56YNv0cC1Z7n+gY
         AXZBdrw8Q0xQXfACRvcpxoCq+2qAV7mun4agvO8EGHrexQiBk088s81wx+OqDD75cVWk
         bGVf2YwFA7hLN1rgW9qs/QvknM5nJ+Vyr7WqxVPMtwehUN48Q+YzSeasW4FNeIJGh+N5
         Dau9jTfcZwmafdOhDLsH+tMzjXN3mMx4VDC2buEpy5TtQeOKyIBRQ9OWpUYHV0tQX9Ew
         sW2HFxqdI3+GSmRVlA4ANqjR+LpjtjxGtevFZduFx0SENKh8WgU1iUSHj4+40Z0Ctwb9
         xYgQ==
X-Gm-Message-State: AOAM533aBKalHvINkCD5o+/A12f18Wlcw/Alhuurmr8dbd2a9P8HgyL4
        kPjJufMzcEhHHbLEJQkY7B1hek1jEJgOIQ==
X-Google-Smtp-Source: ABdhPJw+ahrLt2oQgbDmT+r/MaUDO4QgE5KbxjrYa6s5oE/h38mvti22hLaODf0QE12Sue5lB0anHQ==
X-Received: by 2002:a17:90a:3d0f:: with SMTP id h15mr128651pjc.234.1603907930036;
        Wed, 28 Oct 2020 10:58:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y13sm229281pfl.166.2020.10.28.10.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 10:58:49 -0700 (PDT)
Message-ID: <5f99b159.1c69fb81.2f16e.0d8b@mx.google.com>
Date:   Wed, 28 Oct 2020 10:58:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.10-rc1-4-g8aa163350506
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.10-rc1-4-g8aa163350506)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.10-rc1-4-=
g8aa163350506)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.10-rc1-4-g8aa163350506/

Tree: linusw
Branch: devel
Git Describe: v5.10-rc1-4-g8aa163350506
Git Commit: 8aa16335050663357281fb1f1b0483ab91b4d8de
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
