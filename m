Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99452DAE7E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 15:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729361AbgLOOCd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 09:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728830AbgLOOCY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 09:02:24 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C651C0617B0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 06:01:44 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id w5so14511001pgj.3
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2020 06:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=S8BmqvyshegdI5b2Px2Ka2KLXLO/ZGXESIYOpFCWBow=;
        b=a/3QOVsOSN5YIPZTDk5XCG8lK2Bpp1LQioGv5Aal2EdI6+TUOuuZBdCPhXxP8tE0BB
         N21xkA5otC7QtGpI8Wu4m+kgAPCsOJJGJgZgu84DdnMH0zWf0S9y7iF6auq9FmVrEzeo
         rTr0i309abaQNSHo16LwbOPHUKfQHEK3KrWX4oCtbtqp9JGLjVVRMGLSvaU7UffJnW9X
         k3a+t8hT4nX6ccTMm884Q7Z9hs7nq1BWfh8fS1ZO1rKz/Fud3X/YKqpeqGjqJugg6HyW
         MiWzC0iSMx/2Xx74g0lUPvB/I8dz1lkItMoJA5eHKw7oJ1E6sp2wurPzL+aQlSq61Mc5
         TMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=S8BmqvyshegdI5b2Px2Ka2KLXLO/ZGXESIYOpFCWBow=;
        b=e6tOwWePO45WRURIBhON0+jrCKaKXJG6Y1xKBk9AKdh5Otxynq5Uz81dTfgw/lBr67
         t4ixCq7ahufFc+Sdk0n3iIFE95rVe5hmk4RpRLhsJyTt6SroPIkjWXP8SE9TR+PuYaYV
         RkyKR4KMBp5dbZYdrJwFaW3dVTf9PdvPvOHryvm+5OOlXQAklPPRlWXm7ttcKvGXLq0U
         nDsYDaLFp135eEmd7Pn6o3sEGr0vTNZW156ZMrwlztfpCzcdma3M5mnGDRkm9BAgi9Oz
         hIy9TgzdKQ5EBd6OZ/5/T1HITT7hhiKovkgXmPrndDKYRJoPJZsF7XahF46tSVYl4q59
         zIgg==
X-Gm-Message-State: AOAM531BRFaHUpEOaPZ8C2+yhPf9FkMO4AbGTfMsYeuhRp1BINKhFEN1
        ToPUvuTXfeo5DPBnX99tNrMGwI2WIAXqiQ==
X-Google-Smtp-Source: ABdhPJzhGOxs5ubQPSrA259bXcgAafIrhBLdJPpJPEQ/C5s8hC8gsKD6ZyQMWRcv/RtbfZpuZ07vlA==
X-Received: by 2002:a63:4c12:: with SMTP id z18mr2627196pga.66.1608040902461;
        Tue, 15 Dec 2020 06:01:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s13sm24886402pfd.99.2020.12.15.06.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:01:41 -0800 (PST)
Message-ID: <5fd8c1c5.1c69fb81.3948e.3b56@mx.google.com>
Date:   Tue, 15 Dec 2020 06:01:41 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-94-g3048c5493cd2
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.10-rc4-94-g3048c5493cd2)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.10-rc4=
-94-g3048c5493cd2)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.10-rc4-94-g3048c5493cd2/

Tree: linusw
Branch: for-next
Git Describe: v5.10-rc4-94-g3048c5493cd2
Git Commit: 3048c5493cd208540252e6c78b2252fedf6f0ede
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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
