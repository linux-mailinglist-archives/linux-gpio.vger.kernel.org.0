Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EFB232B37
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Jul 2020 07:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbgG3FQL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jul 2020 01:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgG3FQK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jul 2020 01:16:10 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976C5C061794
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2020 22:16:10 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id x6so692062pgx.12
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2020 22:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=TbzGbtoYtSri7pGVJ+0xOufEfqieYDVGTy2bHClpS1w=;
        b=oovEJRly1MI8ZNxZGX31W1cduGufWHbvnLq56JFqwEq1iol/ZhOkZz1HwHGyInF/gh
         UvzNuSk8rzjK1qHzYcP5PNMr4N7OBV+8unNeodKpIBNHXrQzUW7KqJzch3YuN4AFkVUs
         jgS5b4OtZyJ6aJkw0xFSAyyQGW2ALoGzKRqOUFHyod1SgrFSmOwBkNBQQYew9xD5tyjF
         qqZIdksRfooMUnMz8aQVlk4DN6PDR0IHOZBUBck4jp1/hJdtyvDGA52SNAgdUEwpGt0O
         2d3lWIxGDrEefMtHHFy4f8QOI14LGW7tNLMiOxJirCTbGGdmp6aCoH1lIamio8eBWaQe
         JL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=TbzGbtoYtSri7pGVJ+0xOufEfqieYDVGTy2bHClpS1w=;
        b=Z4vbOaUfI5erTlgmV3CPEUWgCjxmXGhkXESiXSy8XrDmQVS2i2+lrZIlG5iL7nwq6I
         f7UZYXYa0c+aEUT61OEZE6lHAPZ3cM8/+cX6snyO8yBHsvnKv3/JRtmTkTVq4FoO+zlJ
         3Rm2r37ocyTkBwBx9ZxVjr4funKLCF+lU3SpDeEk8x2WdxmMMn7M7acj5O7eq9l5nb+z
         VSkZ8Fs+l4I5Zrc7vBCp2DnppA+nKu5XNNPsbpWzr7Elp4f68V6/8nFraDZaviosN/gN
         iqXsTvTn5Qpt+FwjheDu5HJk+tfBfDk0NY41YTh4bEn4q+LTcNjAWjribKZj8ZAeor+o
         URbA==
X-Gm-Message-State: AOAM530Ux2ghFRFcYk37pV6UW/L+2Y76CkVVhqOPbnXLP31ucU5AzkeY
        KHCOCrds/k3A7zDuHg4Tijj2CNCcY9I=
X-Google-Smtp-Source: ABdhPJxsiwFkmbHI811UdRrWZqOWjQcek4ge8fcPfygXLI79WeOp9XXE4svEVHa61s5o9Dax8Bx0OA==
X-Received: by 2002:a65:63c8:: with SMTP id n8mr32681053pgv.232.1596086169105;
        Wed, 29 Jul 2020 22:16:09 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c2sm4341090pgb.52.2020.07.29.22.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 22:16:08 -0700 (PDT)
Message-ID: <5f225798.1c69fb81.9c256.cd46@mx.google.com>
Date:   Wed, 29 Jul 2020 22:16:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.8-2-97-gb470cef1ffac
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 7 builds: 0 failed, 7 passed,
 21 warnings (gpio-v5.8-2-97-gb470cef1ffac)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 0 failed, 7 passed, 21 warnings (gpio-v5.8-2-=
97-gb470cef1ffac)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/g=
pio-v5.8-2-97-gb470cef1ffac/

Tree: linusw
Branch: devel
Git Describe: gpio-v5.8-2-97-gb470cef1ffac
Git Commit: b470cef1ffac1acc327fe3343a2ce3ef3a526a21
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
