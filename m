Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035E723B4C5
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Aug 2020 08:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbgHDGEY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Aug 2020 02:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbgHDGEX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Aug 2020 02:04:23 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCA1C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2020 23:04:23 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id mt12so1388652pjb.4
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2020 23:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4cEpj/t+yOAdoFcUFYcPdl9T79gAz5RKAydAWzT8Po4=;
        b=aTVic4BMcMFNwDdsq/8oQ8Wdf7WycDaI6Q7yHhN3JJvibbi9je6NsAMX89HcTJYQFJ
         qbF/dW9vjVd5NUxnUZwuQNT18KNgQW44L0ImCn0MF0sevYDM9NU924jLg3o5+NjcW6eZ
         2BEAm7ydfsHEncKvbPyPypJeOKCdOBvtrKOczYz6FfCR1jqIEyTecgVykUCbR7szejhL
         dQW0uyxXaLMBYmsrlSAW164Fs1ekhPLmCKLw+MDEhIcZLXFt1+gvx07Ndv7ysDbutxPN
         PsRyABZsfPaOD+ibRjvfyvy7F386hV+0J/3Da9Lpb8/np5nzUc5CAy8oD8Q2PpxPEOaR
         /tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4cEpj/t+yOAdoFcUFYcPdl9T79gAz5RKAydAWzT8Po4=;
        b=J9wK+QBJ7EMDnG5H/OejQVIFZ6FnuxvXNyw6yRXPt1A53ok60A+K+INxUGd1OblEpe
         sXHzpZ19DnAwbNVlAd4os3njtVfWx+tQooWoGDCzLmoQ7rrrXFq+2rAGmbe9OVR5ae1R
         NgscP2MY08Ez/+Gij6bFSspTIYUw+mTP8GA8ttP72VUmMoWB+IKN9s/lkzKvT/xu/9kw
         Rc+Xr84eQw4XeYFiUq4SZTIb4gH2tXIMuYYBJzxtqd6O2zxSfgNLEGPimtO7yZ9GkC9K
         yqucyPvM/83aUa+TJCSQjrAwDUwqJNiERn7KVWO/DsFB/9hH9tvFEQwqgWOe8pEfJoO1
         DgFg==
X-Gm-Message-State: AOAM530Ckohuot3jkcSeCbK4R+do/kp+O5nXp0er68VrEFJrYdGc41w2
        l4zcsdxyDL4KT+Ldgt9wlqWSiSfY558=
X-Google-Smtp-Source: ABdhPJyINXyMeT4QW8jjWGKK6b79s69PGVsSS0ucprzVVMQH00B5n6UbUxMXtbzy9T7bFceWiwOXKg==
X-Received: by 2002:a17:90a:18c:: with SMTP id 12mr2932129pjc.74.1596521062464;
        Mon, 03 Aug 2020 23:04:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o2sm21262058pfh.160.2020.08.03.23.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 23:04:21 -0700 (PDT)
Message-ID: <5f28fa65.1c69fb81.c9177.7564@mx.google.com>
Date:   Mon, 03 Aug 2020 23:04:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: gpio-v5.8-2-103-g22cc422070d9
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 7 builds: 0 failed, 7 passed,
 21 warnings (gpio-v5.8-2-103-g22cc422070d9)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 0 failed, 7 passed, 21 warnings (gpio-v5.8-2-=
103-g22cc422070d9)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/g=
pio-v5.8-2-103-g22cc422070d9/

Tree: linusw
Branch: devel
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
