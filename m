Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B765F2DA485
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 01:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgLOAEd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 19:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgLOAEb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 19:04:31 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C54CC061793
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 16:03:51 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id i7so2301240pgc.8
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 16:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Y6HRdYbsoa5PySdybyBfhCapCUVZ7l6dBcE0w3MGMOI=;
        b=hADusF3oEMkUnar9izsTv/+VrYnGK90pnhxNBaMYk1VVpKeXgmHx7dpbi1+RdlbpjK
         /UvMPyzpmcEse/v3r+a/dCOp8sm/o1Z0fauqxaj1t0anecod3jpISu4eIfpNoXhrubk3
         +t7KGiUtOBj0TCxn1wpeibO0/eP3vbrwqxXcW/zN8awzDY4yNkcWr1FzOMgm74ML8Bw9
         Uz6YPs2EJkiLv7S2cy8j06TK+c6pArkSZxJUKk3O8MaRZbBKN7Hyv5i8IXAyKrgHF8hX
         olDI2mskRcIbX6+U6x4vkswbROASBcYUEgGgy/WB6SZcC0E/mNVLFsGeRwZ8uOQ3wJGf
         97Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Y6HRdYbsoa5PySdybyBfhCapCUVZ7l6dBcE0w3MGMOI=;
        b=DsBr1yJPE6BV1yRzkroD8RISQQHJvrXZwQSk4FI/rqbcdn2Hfkx7Aj5gvrCiah5wU9
         HpD1CvrBclQ6Ga4DNC/Xvit75WcgpLHoyjEvjh7+KStaxJQELDZbMmegUM7cHprhAySM
         TlBPkxjJb9X+6lfR2B0hfC1wErYbYUIIPgIM0V1LVnhBQLdrEcUMCkk7sIzqmHLNz3f7
         /49CPo1tkeg/tCVS+5Kdre3tCu0LMnZSrpOoEI51YrxD5utRrLuw3TQtFisxluPXskTg
         lG2T5J5XmgyR9ez2IQzPJU8V0ZNGa8CjpNWr3P2/8HjiqPbQ4t8mb1kEC3k/QJZfcCSl
         3VIg==
X-Gm-Message-State: AOAM530Fh/oBBMuy8VMIKD30gW/KsBxwbL1aMSjeoO70mr3qDQll9DFg
        jxR1RBC4H6FN8QeMgN+WCbEGz92Co5nghg==
X-Google-Smtp-Source: ABdhPJzWb4FAqf2LmTU56tflOBFEneKKlSL3ivT0LZFtUl4ZbXSYwEnwANMaEhbM00sC9Fnnx2BNwQ==
X-Received: by 2002:a63:7d47:: with SMTP id m7mr26272001pgn.405.1607990630352;
        Mon, 14 Dec 2020 16:03:50 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a17sm18917368pgw.80.2020.12.14.16.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 16:03:49 -0800 (PST)
Message-ID: <5fd7fd65.1c69fb81.7c867.8116@mx.google.com>
Date:   Mon, 14 Dec 2020 16:03:49 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-93-ga2e5f9277f66
X-Kernelci-Report-Type: build
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.10-rc4-93-ga2e5f9277f66)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.10-rc4=
-93-ga2e5f9277f66)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.10-rc4-93-ga2e5f9277f66/

Tree: linusw
Branch: for-next
Git Describe: v5.10-rc4-93-ga2e5f9277f66
Git Commit: a2e5f9277f66a89e2237d8d7cf0e99a819304f58
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
