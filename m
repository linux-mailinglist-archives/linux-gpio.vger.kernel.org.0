Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F7C22E57C
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 07:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgG0FlD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 01:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0FlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 01:41:02 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F5DC0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 22:41:02 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ha11so1256557pjb.1
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 22:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=t3WZ9yDQAcwNw5V47/RYKfKiGUJHqaNlegzuK1mcCSg=;
        b=Q60TFEplFHmiersUpMtLh4dV/RvQgAMpXpLewWgFKiZfZDtupDCVPd9WNZRj8NCJ6Y
         mEuSP0byVRYwtA/e2w5n3rkPOqVz86pWJH1ellFxDMgx7S9JXuAxlKkzmCEUSHUHeyar
         VrkdtygXOWlG/+qIsEK2dV+66HRugJkDAB6CQOJovwfsmxMrXWld7Om7MIm8LuOITNXX
         3CNRXoZP9iR+ZlFqsikMfVsYsrAcnAbHeDla7/7ho6RtzwB10fS4eNK2LyuudAoC/73M
         oF2m4x9Qxj6ztcJVx2o798PL7AZEMVOPandAHp6LOjBEiCAhreFlyzk1fNedQ+OLAWYL
         BaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=t3WZ9yDQAcwNw5V47/RYKfKiGUJHqaNlegzuK1mcCSg=;
        b=T05jLFBXZhY/4Ya2JuvPz0UkmWavFBpGsLanay4Iy3tb1YS0vlsgoBfsUvtkmCl4mq
         41/9iyDzOz3MFZNMoQQ1d5XUUCyp+n5RiFwITKX9WB1TmVMWC1zqMleZN+VcbvcwULg3
         juIN5duo5/ydjzFuHCg5z3EqS+we4s+4bHS7gSBjGgjLoN9IOrsinjo4G1FaIUtc1ExB
         i2hkrIDJYWcP+qPqPToYhAb5gDq5RINGyGhON7Gk8jdrugMKGqtCux0E2Z/M894mUnOK
         lBL3zWQd8OusSF49UF6WJ3lqJLwckJ+Bb4vWlyxCtt4GLxxqqRzPS2s9AmbBa9Oh4ogX
         OiLA==
X-Gm-Message-State: AOAM530B9ddi+QMFEMlIQkIrupNvSsrAeHyXEsixGWRgSj3HcqGne/EQ
        rnK/uq7u8bbJQt0P8jhm/yyoBSTxGKg=
X-Google-Smtp-Source: ABdhPJy/0CdZhUpdepx5xi9YXWXQ10ulFOUeJSTnFwxfrYpaPJjZN493Iz8I/zgxhN2VmiUd1vntoQ==
X-Received: by 2002:a17:90a:df11:: with SMTP id gp17mr15772562pjb.188.1595828461235;
        Sun, 26 Jul 2020 22:41:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b128sm13225536pfg.114.2020.07.26.22.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 22:41:00 -0700 (PDT)
Message-ID: <5f1e68ec.1c69fb81.25394.a457@mx.google.com>
Date:   Sun, 26 Jul 2020 22:41:00 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-96-ga070bdbbb06d
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: for-next
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 21 warnings (gpio-v5.8-2-96-ga070bdbbb06d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 21 warnings (gpio-v5.8=
-2-96-ga070bdbbb06d)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/gpio-v5.8-2-96-ga070bdbbb06d/

Tree: linusw
Branch: for-next
Git Describe: gpio-v5.8-2-96-ga070bdbbb06d
Git Commit: a070bdbbb06d7787ec7844a4f1e059cf8b55205d
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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    /scratch/linux/drivers/net/ethernet/intel/e1000e/netdev.c:137:13: warni=
ng: =E2=80=98e1000e_check_me=E2=80=99 defined but not used [-Wunused-functi=
on]

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
