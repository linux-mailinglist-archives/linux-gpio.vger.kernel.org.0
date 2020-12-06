Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C03D2D05F7
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Dec 2020 17:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbgLFQcI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Dec 2020 11:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgLFQcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Dec 2020 11:32:07 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D9D8C0613D2
        for <linux-gpio@vger.kernel.org>; Sun,  6 Dec 2020 08:31:27 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id t6so308312plq.1
        for <linux-gpio@vger.kernel.org>; Sun, 06 Dec 2020 08:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=s//nd3qFAWooDHSyV+YLdcL8q9i5W83mr1FA+bvyOmM=;
        b=nCrPVlTL72DiyPEuzIyV5797tO86QsFi825UXi8V30/AwB2NmaWWsW7sfuKN/r1iVN
         B+EAIzz3pRtqjh4LX+K6Q273KJ7pDB2jd1N4Q0BJt+cUHpPrxiVPGXMB0hgujmVOKt8g
         QLLvVBUFb9SN4TJT8TG4mnHNOZovLjQKRl3j3NwDpwQNYHZaFN3YegdfM5OjsXNkonw8
         BSZcUuqZGiQOgLKKnI1FFiJVRBJ9fm+cE8yGjBczKmVfxQ1v8v6IRzaHf31mL1U0ST2A
         CzAImfy7uzCPTHHtQ31PU8FKjeUierXWw4OcIV3EcXzKz6iRupxSGB+3LEDnMSyvBGMc
         CmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=s//nd3qFAWooDHSyV+YLdcL8q9i5W83mr1FA+bvyOmM=;
        b=iaGrt6ERfe3MgBAIYNxMd+HSoU8mUlFNgcQ6yRRG1f8cH7uzK6HER2hAybPUtEn43J
         oP5Om5/eka1sejlgrtuGAHd5qmMLkuHsdiuPJI3jNYpUv+a72QxzvpU/UE76VVrDYaWq
         35nIPrvR1YEImUDKo83AU5FR0E7gVW16xMAqh2PPB2SE8gTt2gMLMwshSFxKrqbrAcPr
         7Ak2D/S3APUeHHn39GsRXs0VvDlgAx07oN5cYtQY7n6U23NXqIV3M0ANy7yZywxbloU/
         lJ88FOYdzPIHaezRqDBk+wkuFLMx1phgA3li+Bg/VXj0E5t6tAZbJx4IOxyMZieAdJHG
         2f5Q==
X-Gm-Message-State: AOAM533eh5TvWiXuZXJC4WisAsZ8Pqi1vKV90D58pdyRif27F+P2UviQ
        LM1XDZ2U1SenEVZMbREcni4pJqYgiLoLhA==
X-Google-Smtp-Source: ABdhPJzNFVHyMbqSN3jp9wF45tRQcAEIX3+rUF2/OQavVj2ghb1FMDfc7Spm84QVB1BzcMAw5DT2pw==
X-Received: by 2002:a17:90a:3e05:: with SMTP id j5mr12899784pjc.91.1607272286760;
        Sun, 06 Dec 2020 08:31:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a18sm1711423pfg.107.2020.12.06.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 08:31:26 -0800 (PST)
Message-ID: <5fcd075e.1c69fb81.f7933.3866@mx.google.com>
Date:   Sun, 06 Dec 2020 08:31:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
X-Kernelci-Kernel: v5.10-rc4-48-gdd0fa81143f6
X-Kernelci-Report-Type: build
Subject: linusw/devel build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.10-rc4-48-gdd0fa81143f6)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.10-rc4-48=
-gdd0fa81143f6)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.10-rc4-48-gdd0fa81143f6/

Tree: linusw
Branch: devel
Git Describe: v5.10-rc4-48-gdd0fa81143f6
Git Commit: dd0fa81143f60cbc90cd6ce1c9a2c51a7b40046e
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
