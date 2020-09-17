Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C8B26D9B7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 12:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgIQK45 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 06:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgIQK4n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 06:56:43 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D63C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 03:56:43 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id u13so1160001pgh.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=T9lNcKq60OFkyCh6/6qJlh6i3GcBk/ga/wgKezraXNw=;
        b=x1NaY0ndN32UPLbGKWVbi7/r4/h21yUY7ENA4IbNG3RX9hculQerxzHQ97dZw66gc/
         IHQh0FBmjRyAMRVz7JR5YCbr4ywNwo9vWZVGIsYUCEBZzIn1jkSjfmLn2jWMn01l5CDH
         EjTavw6n8ODAz5/mV9D1zd017xoMYrFNpWK4vModvwHmYSlojabXKdt6pmwVkB9HiK3I
         ItIqtAAKCaK0ZFrzzM9hGA8gIg885iwTNBPt1+bgAVerl2YibjTyzIlaTzwcctvKH6J3
         TbwTzyLKH1Sr5+MgWm0++esl06IVZEXFBJzvy1/dTWs9zIOVELdA6874J8c6N4adROH8
         gCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=T9lNcKq60OFkyCh6/6qJlh6i3GcBk/ga/wgKezraXNw=;
        b=OYwPNgirJRZtenNwevws4OacOwABQzbOoCbJwdSdkX3SsRwhBzahQ5IdjZVSznhHfn
         atMd7m8ZFWtp3aoCcOAxvzqLpMHilKCSTvD1aGLGE40eW5aGOAoKxzLkMrXTXQHDUfSt
         5+JjbnsiO14r8nFMt3vi63oDQSPVJESuyiTx2d1I/wLFO2etg3VWL9RWI60h5mngKm+y
         60jRKaQmKCWIomgyZXtZoSK7jGM1vdkjx/YkGD0kLDfJZK660zoEcGhI9kZt29G9da36
         NFKEMPPYBWhkC527nLhD3fQH65/s1LyvFeK8iEf80752vnB2F/kz/SCSU7eIny0PFu3k
         joog==
X-Gm-Message-State: AOAM530XpYL+Rzw7O/EpgynWN/upP+npfj4AJQ4UdIoZHlP6OtnVTey+
        h/r/7hloRoamA4Y33ueVM6Nyf+N38uY5SQ==
X-Google-Smtp-Source: ABdhPJyQPqQH/HOMArAAYimsSTh5n9TATMuKl4wcCBPqJEvYnatN/iYhbgd0kdd3fcfbo9SUPtlWIQ==
X-Received: by 2002:a63:63c7:: with SMTP id x190mr21807262pgb.90.1600340202584;
        Thu, 17 Sep 2020 03:56:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 141sm20250959pfb.50.2020.09.17.03.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 03:56:41 -0700 (PDT)
Message-ID: <5f6340e9.1c69fb81.ba976.2324@mx.google.com>
Date:   Thu, 17 Sep 2020 03:56:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
X-Kernelci-Kernel: v5.9-rc2-19-ga5d0fe9ff2af
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.9-rc2-19-ga5d0fe9ff2af)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.9-rc2-=
19-ga5d0fe9ff2af)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.9-rc2-19-ga5d0fe9ff2af/

Tree: linusw
Branch: for-next
Git Describe: v5.9-rc2-19-ga5d0fe9ff2af
Git Commit: a5d0fe9ff2af9feb82d37782be5beb2976a4afdd
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
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #size-cells (1) differs from / (2)
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: War=
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
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
(dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #=
address-cells (1) differs from / (2)
    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: Warning =
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
