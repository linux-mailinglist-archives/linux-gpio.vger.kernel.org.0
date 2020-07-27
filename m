Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CECD22E49A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 06:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725787AbgG0EFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 00:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgG0EFN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 00:05:13 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB70C0619D2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 21:05:12 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d188so2270815pfd.2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2020 21:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ibJJIdAtbnaxZr2blKcDBX9C1izl7/2/tCQbasg7S1U=;
        b=LqbKtgR4Rys7f+FxQQ1kfBJJ1H2ungoKVRSovnfRrWgk8xShKFZltoal3OKyeVcgpw
         S9KhRFsSRTMRAftCHMIZCzTj2KzRDe8IYaL8DnTOuG5GgMOtxilAB3bCM7VSxj6AJG2g
         vmBwr7CubFa/OcRJHPCU0HPOD7grPvk/QzCnxAKYI4nSN2m0NfRzTct2ofYcQAdBvyjV
         Au0nQ0qZpXIa6VRnkDzDpwLB8t5KrrZ+zustkVfIGV+FCjye6uwhGoh5p9Y940QvGUxk
         FEiRHVTyaqcoJkLC0+LnyC3pRlQdJ1pqA+xd5S0Pxb/2roYM3Fsl6+o9moH8mZErz83I
         G6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ibJJIdAtbnaxZr2blKcDBX9C1izl7/2/tCQbasg7S1U=;
        b=i1PrB4ShGpsQvjZ0++hqJc6032fUPVsfbIizvM0yl/pBDXaplqHF43qEVQGSkgZnU5
         rTErYDcfQe/YJ8rxKql1K2mPW6ddkqTn8LXOaP6hgcQAGmOZthgX87ztbVEUW4WnAWdQ
         sBMCty+3hhVttY3DUHKUwgRUc5KrbRTseLjUoVEfyncaTGV7V5WvTgJb+cBPjOk4VQrF
         TL9pzqrs+YjYlnHSeH3e4ulEUOlf1NFl51VYERpk03R5h/lv5AxV+lMDmtOoXYN0YGnK
         0Y9craHsw5sQnwem4//PB99tVC4EmbZ4fz0ehHmxBti9hKwvPc5iER+fs+LQ5sm/LRjT
         8w8A==
X-Gm-Message-State: AOAM5327azZVDDBmqe5lPQPagygAOCXmugZp725MDxCRYfZT5ZW4eQPC
        udAt5tm48i60uvl5+fh7Giu+DG57ceY=
X-Google-Smtp-Source: ABdhPJxUuJInNcj3L5mJEyhX9tXa0TbQ/oGhg+mPf0SyoC1ai8nP2cHciP/IgbRGnukQfQ0eq1f3cw==
X-Received: by 2002:a65:6799:: with SMTP id e25mr19055950pgr.364.1595822710983;
        Sun, 26 Jul 2020 21:05:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c2sm7305861pgb.52.2020.07.26.21.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 21:05:10 -0700 (PDT)
Message-ID: <5f1e5276.1c69fb81.9d0f6.4df0@mx.google.com>
Date:   Sun, 26 Jul 2020 21:05:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: gpio-v5.8-2-96-ga070bdbbb06d
X-Kernelci-Report-Type: build
X-Kernelci-Tree: linusw
X-Kernelci-Branch: devel
Subject: linusw/devel build: 7 builds: 0 failed, 7 passed,
 21 warnings (gpio-v5.8-2-96-ga070bdbbb06d)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 0 failed, 7 passed, 21 warnings (gpio-v5.8-2-=
96-ga070bdbbb06d)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/g=
pio-v5.8-2-96-ga070bdbbb06d/

Tree: linusw
Branch: devel
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
