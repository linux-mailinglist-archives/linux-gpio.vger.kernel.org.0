Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993B423B56E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 09:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgHDHLv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 03:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgHDHLv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 03:11:51 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5B9C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  4 Aug 2020 00:11:51 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id z20so1594033plo.6
        for <linux-gpio@vger.kernel.org>; Tue, 04 Aug 2020 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jhmbfMm3kkPZYll7Q4LBzAoQ3weNtOwT4UuloLPZiBs=;
        b=XaLVBOzA+p+gtmpEP8yu6bkVK73rmiArwH5UzUxoRQSleJ5T9g44Em+8TW5I3NShMs
         g9PB4kHA8gU8HRyvBMrI7lePEkO9xUWEiCGw0RjAsX+kkoFzWaUieq5HPnVx3/1ZHg32
         Aihb+or+V4J7HPVmiEiK06dkprvg7tPXNbtAWZELb1CJr9FNYgtyjBcpzP1d751JwOKE
         iZPlIGe18d1ke5r1fYa63lLFkBpGram0ZN98aXCRmLWoJ9Xj2woGhq4M/pDTD56YN2D2
         yC19e+SCs6SQsFJ5POGU7UmvL1FGU2pp+ielOIRsf9CiweXmz8otiehPJ+1tCdjekCBn
         JKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jhmbfMm3kkPZYll7Q4LBzAoQ3weNtOwT4UuloLPZiBs=;
        b=DJJlE2tIMY1MyOGQFfAM77v30fnkE1CzAFb/+YwaWANC9Ek19asDqRxHG3Ai18SoAY
         Y7yi80gl6vlR93QRhsl92kj7lx2t+6iZrW6JCyyJH0QLc3/00yip2jTMtfd2RYT8L8N4
         4Q8kM9aEP6oNgmDsQrFVWivFi9RsN26vkkuTojElsSdiCXWA7rJpFYBZlhP1GaN9mblN
         CdtUqfgRsH5n9tJp5cPPZZ3Nnb74F2GHy4kxQu7f4ZryEtZIO333cHWZot2Sf1KyzyoS
         fPljaGPNcSBdt5qCjHZ9lqRgxVLxjIS3qYuvk/ZgDSEM2NC7+GwBVTuI+2lsua/7DGi6
         oMFg==
X-Gm-Message-State: AOAM532/GN7xxFNpWRRW5NBOfqvsqdhwGB4cw7uP5dgBpekzJlokaaEg
        PhVUzg87tjt5DOcJujLsRfKNN9l4bok=
X-Google-Smtp-Source: ABdhPJz+Cg2v/bzxCbflS6mfy47eTVl6oq6eualYkOcVi0L8yItnKLOBzCKupWb8CKxVHtp5yqXt1Q==
X-Received: by 2002:a17:90a:ce0c:: with SMTP id f12mr2937028pju.44.1596525110299;
        Tue, 04 Aug 2020 00:11:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g129sm5292675pfb.33.2020.08.04.00.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 00:11:49 -0700 (PDT)
Message-ID: <5f290a35.1c69fb81.30daa.01c3@mx.google.com>
Date:   Tue, 04 Aug 2020 00:11:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.8-2-103-g22cc422070d9
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 21 warnings (gpio-v5.8-2-103-g22cc422070d9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 21 warnings (gpio-v5.8=
-2-103-g22cc422070d9)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.8-2-103-g22cc422070d9/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.8-2-103-g22cc422070d9
Git Commit: 22cc422070d9a9a399f8a70b89f1b852945444cb
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.=
git/
Built: 7 unique architectures

Warnings Detected:

arc:

arm64:
    defconfig (gcc-8): 8 warnings

arm:
    multi_v7_defconfig (gcc-8): 12 warnings

i386:

mips:

riscv:
    defconfig (gcc-8): 1 warning

x86_64:


Warnings summary:

    3    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #size-cells (1) differs from / (2)
    3    /scratch/linux/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.=
dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-range=
s" property but its #address-cells (1) differs from / (2)
    1    /scratch/linux/drivers/net/ethernet/intel/e1000e/netdev.c:137:13: =
warning: =E2=80=98e1000e_check_me=E2=80=99 defined but not used [-Wunused-f=
unction]
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #size-cells (1) differs from / (2)
    1    /scratch/linux/arch/arm64/boot/dts/qcom/ipq6018.dtsi:127.3-14: War=
ning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but =
its #address-cells (1) differs from / (2)
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt=
s:161.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@=
10:reg: I2C address must be less than 10-bits, got "0x40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt=
s:159.11-163.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ip=
mb7@10: I2C bus unit address format error, expected "40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt=
s:150.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@=
10:reg: I2C address must be less than 10-bits, got "0x40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt=
s:148.11-152.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ip=
mb5@10: I2C bus unit address format error, expected "40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt=
s:139.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@=
10:reg: I2C address must be less than 10-bits, got "0x40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt=
s:137.11-141.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ip=
mb3@10: I2C bus unit address format error, expected "40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt=
s:128.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@1=
0:reg: I2C address must be less than 10-bits, got "0x40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dt=
s:126.11-130.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipm=
b1@10: I2C bus unit address format error, expected "40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts=
:523.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@1=
0:reg: I2C address must be less than 10-bits, got "0x40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts=
:521.11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipm=
b0@10: I2C bus unit address format error, expected "40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts=
:437.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@1=
0:reg: I2C address must be less than 10-bits, got "0x40000010"
    1    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts=
:435.11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipm=
b0@10: I2C bus unit address format error, expected "40000010"

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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    /scratch/linux/drivers/net/ethernet/intel/e1000e/netdev.c:137:13: warni=
ng: =E2=80=98e1000e_check_me=E2=80=99 defined but not used [-Wunused-functi=
on]

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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 12 warnings, 0 se=
ction mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.=
11-439.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10=
: I2C bus unit address format error, expected "40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.=
3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg=
: I2C address must be less than 10-bits, got "0x40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.=
11-525.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10=
: I2C bus unit address format error, expected "40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.=
3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg=
: I2C address must be less than 10-bits, got "0x40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:126=
.11-130.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10=
: I2C bus unit address format error, expected "40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:128=
.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@80/ipmb1@10:reg=
: I2C address must be less than 10-bits, got "0x40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:137=
.11-141.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@1=
0: I2C bus unit address format error, expected "40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:139=
.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@100/ipmb3@10:re=
g: I2C address must be less than 10-bits, got "0x40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:148=
.11-152.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@1=
0: I2C bus unit address format error, expected "40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:150=
.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@180/ipmb5@10:re=
g: I2C address must be less than 10-bits, got "0x40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:159=
.11-163.4: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@1=
0: I2C bus unit address format error, expected "40000010"
    /scratch/linux/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts:161=
.3-30: Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@300/ipmb7@10:re=
g: I2C address must be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---
For more info write to <info@kernelci.org>
