Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F345287F79
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 02:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgJIAVv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 20:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgJIAVv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 20:21:51 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CBAC0613D2
        for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2020 17:21:50 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x13so2741220pfa.9
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2020 17:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=aS2UeeV2Kvh8Fl098HZypMBgZuVnOKrTSwnZw/JuR3s=;
        b=sdthSJIWOXMKMzBgBt7PooSFVgWm/tIFnX++nfBx4pZfYDKIV4VXawdggjkC6/Dccr
         rHJVZrhusOF9nBQapwLOOIm4mTH6vaq7xfAm2PRoe5Dn6zz+w/Z87iIBJZGc2UatNwhG
         Kn8Is6smVkHsE/suCJ5IHqf6TUM7U0BqUSBKuUHNlb5EgB3AQnVdiAJlCdmbN+4Jm2NF
         gK86OGS0M4iPfA91mOVZ3//GtQwSqqUN7IZfd/vaHOAMxMKviI8b1YQu/9vMup4A0IcN
         IXY/SHvVHAaA24xF6juwhmsDCQhwkxMwWbOHKO7dR6Jbeyy67c+YpLIL4kf9o6wUSqnQ
         4hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=aS2UeeV2Kvh8Fl098HZypMBgZuVnOKrTSwnZw/JuR3s=;
        b=A3TJ/IsgjdjEgaaD+OytcEte/B023lf/04zZYfKLND6hYjRj1Yln5CAg+lZMmYgQcz
         xd2uMH4zBDKZudSJ3KwznTDNpzHyLqem9DdzCX7traPe6uEmWIZUji7sJQ/yk31GU+xH
         zHm9qQF4m1CpnglVrltwifj/p/lhQLkVtY9WaR2B0qVHuWORjVoZ3OJyAi67ytD5qmj5
         K08guKLf3RqXA6wjWRGcjNc/HpxWcB6N1f5S4UK4k24r80/SzNt9zV4OxOz6KDtNRGYv
         nvhzMLBe6dR2i1q8VH0ApH71N6NDl8RA575YEUM5ndlvszf10hcR6UBH3t0z/P3kmoxO
         +TVA==
X-Gm-Message-State: AOAM531oY0cFgd3h2sCIpTSQl7X23KsRmDaG1d/H71SSAmBcJ1ICZrFF
        sXyp4zLOdU5kuLX8j3FOrnWmzY7s8B9BSg==
X-Google-Smtp-Source: ABdhPJyy7eVSexTr9FS0pM9xj8RMnacv+WXYc9nt7b2T8gGjrfBvv7owhTPXDo3heLocCqnXqGxkBg==
X-Received: by 2002:a17:90a:de90:: with SMTP id n16mr1487263pjv.215.1602202909978;
        Thu, 08 Oct 2020 17:21:49 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id k2sm8081060pfi.169.2020.10.08.17.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 17:21:49 -0700 (PDT)
Message-ID: <5f7fad1d.1c69fb81.537b7.f961@mx.google.com>
Date:   Thu, 08 Oct 2020 17:21:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.9-rc1-76-gfc709df553a3
X-Kernelci-Branch: devel
X-Kernelci-Tree: linusw
Subject: linusw/devel build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.9-rc1-76-gfc709df553a3)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/devel build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.9-rc1-76-=
gfc709df553a3)

Full Build Summary: https://kernelci.org/build/linusw/branch/devel/kernel/v=
5.9-rc1-76-gfc709df553a3/

Tree: linusw
Branch: devel
Git Describe: v5.9-rc1-76-gfc709df553a3
Git Commit: fc709df553a34fd18010f52e6b47652268d83e7d
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
