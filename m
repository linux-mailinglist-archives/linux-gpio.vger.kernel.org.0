Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C82FA2D44F0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 15:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387428AbgLIO6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 09:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387427AbgLIO6Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 09:58:24 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD968C0613D6
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 06:57:43 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id t6so1070076plq.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 06:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=x5sRMkk66lJuJNl3B7TXvcHEGPQWm0ijuA+k2UZWpuY=;
        b=2Fcdfggp5oE5a4wfmX1wbIhLeYT211bdZttlPW7jM1soQts4+MkB5N513jMeSitjFE
         GVY0H77B0saJ+VlUrsbNKNTgIqbzTCECCgzCC39x7P3MoMcrrvx2A2a8V2X9vWQqFF7W
         rKwv2s+Lz67HMC/uei74R79vZCezMYVAXdS+B4yWeMHQSu+COEwWiRXwQxFZdt8iXcHW
         oOe0qoCJQIFibwZ+dZglXR1j9OcBK7rlwUhoDjn34cl027N7rKKqFzsHBlwMCZ7zT5L7
         1yf17ZEr+1xh87Unq6MyUSdbJKZfH31ZLIKOqxRaooE/9eDvGC7y6jE0Kvu8LUoCodgJ
         9P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=x5sRMkk66lJuJNl3B7TXvcHEGPQWm0ijuA+k2UZWpuY=;
        b=ET42c37MhZnOel/gbt7z+qzpkh3FGs1LDmuwxHHDGFfqfrrfdMicnwhDBA3yjzaBkP
         9bZtqmQSsDWT0hKCBNsGr+noyBdaSOFgB2sf9xDskfzuhJ9vgTfasgUvWbTIKrnHugtR
         iRVgAds9wX8/C6CeluHbDSPy02vT4z1fkmAKO/Z9Jkt2+yot6m2sXrbqZGkjVewJ45mb
         p/qgj8AcuT337rl5a/Si55Ky7STt7HPQrOmZDznwEtHUGqGNQ3SF+tkTMRMO32KolfQv
         q5F366mDdQiHxZlaiecXrQjmfe1ExFvO2zk3femt+ML7NaHY+As2YurSaRNBBdmV1Oqb
         Y1sA==
X-Gm-Message-State: AOAM530WDavEaP3jVVGXF5kmQ/kGcILhMMjZ78nh1d8t90soea40wZVh
        eRw8aqixE3/LDaxDOCVyDwC7ByFzZdO3TQ==
X-Google-Smtp-Source: ABdhPJxizw7tMkF97drfeM4wuMYsuXJeK4vtbrMvh6StFC50+NCRzgYzDoL9jabTcumQK8AB55hA+w==
X-Received: by 2002:a17:902:7b84:b029:da:60e0:9d38 with SMTP id w4-20020a1709027b84b02900da60e09d38mr2565163pll.55.1607525863097;
        Wed, 09 Dec 2020 06:57:43 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id m3sm2951296pfa.134.2020.12.09.06.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 06:57:42 -0800 (PST)
Message-ID: <5fd0e5e6.1c69fb81.aee8b.57c4@mx.google.com>
Date:   Wed, 09 Dec 2020 06:57:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-85-g40b37008eb5a
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.10-rc4-85-g40b37008eb5a)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.10-rc4-85=
-g40b37008eb5a)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.10-rc4-85-g40b37008eb5a/

Tree: linusw
Branch: devel
Git Describe: v5.10-rc4-85-g40b37008eb5a
Git Commit: 40b37008eb5a300ea35aa83432c213b6028313d5
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

    3    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #size-cells (1) differs from / (2)
    3    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Wa=
rning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but=
 its #address-cells (1) differs from / (2)
    1    arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_range=
s_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells=
 (1) differs from / (2)
    1    arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_range=
s_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-ce=
lls (1) differs from / (2)
    1    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    1    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    1    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#address-cells (1) differs from / (2)
    arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning=
 (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its =
#size-cells (1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (=
1) differs from / (2)
    arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_for=
mat): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) =
differs from / (2)

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
