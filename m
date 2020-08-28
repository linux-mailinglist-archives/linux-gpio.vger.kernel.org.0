Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44639255E5B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 18:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgH1QAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 12:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728392AbgH1QAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 12:00:49 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9498FC06121B
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 09:00:49 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id o68so862512pfg.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jaut998HWzRM9BQZq2LZ14GRYOte+xWjruW3SFAGk54=;
        b=qnKuFVvIK2HVIz0PTSaufmGfPhblJaFZINmpY+mRYIAB8fXn9ulJ7h2MymAy3yD5Kt
         Cw7TQS6YCWW+hNUU9UxXCNVkQ/MQm3NeWZtt0HZQvGhRTuaCZtiqvdYN2QpC2n1TV5FL
         8V+n5XDaddH+BXdbk/2PYcLAXXcPhjLdnnzY+f9Qgcx/MSCIwS/+jcAnUoyOLXi509tO
         K9lJQ++CfT/Ckv3XsMYgEgFARara6e15FU99HozoaOrOPTb8GfsZzAreXPI5R+8nuriu
         BrBF6znsS6ZhDpX4do6KxGjNVUl6zQJMXXtE2/Yp9109h+qUyjfa1JQpilYTR7gI5YMB
         W87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jaut998HWzRM9BQZq2LZ14GRYOte+xWjruW3SFAGk54=;
        b=OHvirtRinBqKW9WOXazW6e+dCd4hxT1I1JKNT9M8vtuG+qr3yLdbf6qW1drphSvhY/
         fejPteH/zFiVPN49e0+t3hMxRSkpqZq7dJbzOv3WHI4Nv+DL5Vi0AZivRu7m7QUHcGqc
         ojnhgzIvg80TPLj7RWaCuKJF0611dBqZQnfLmXj6/7MH2H8GXiSxtj1rLB4wuJL8t6pd
         U0KU8PoFBclm0JSlnibqcszLAeYdYe+foqXLjR91UtBZBVdRMmiWWLhWQEWvA6TQWhms
         gCLiK1SsXkQruht1F1U+r8SZKvNMd81Y9U3jr4Hkj+Ir757JIw+3XggirP5nscPW7YTb
         PhrA==
X-Gm-Message-State: AOAM533/zv6t4smoT+p3rLIZyPODIcZEq89pcQmtT6rW3qmdX5fGm1Lx
        oEQQzisktZI8kD5AFwN7+cbGA2+QP42veg==
X-Google-Smtp-Source: ABdhPJy3SPD6weA+UbiWwQ5SW6lvddKbDW6wu5OhxUNiaVYahpgk1/IQQSdtiketgtPYZykqGHcpsg==
X-Received: by 2002:aa7:8657:: with SMTP id a23mr1886321pfo.169.1598630448590;
        Fri, 28 Aug 2020 09:00:48 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id np4sm1508905pjb.4.2020.08.28.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 09:00:47 -0700 (PDT)
Message-ID: <5f492a2f.1c69fb81.cdc8d.2eec@mx.google.com>
Date:   Fri, 28 Aug 2020 09:00:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.8-11991-gfc80c51fd4b2
X-Kernelci-Branch: for-next
X-Kernelci-Tree: linusw
Subject: linusw/for-next build: 7 builds: 0 failed, 7 passed,
 11 warnings (v5.8-11991-gfc80c51fd4b2)
To:     linux-gpio@vger.kernel.org, fellows@kernelci.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

linusw/for-next build: 7 builds: 0 failed, 7 passed, 11 warnings (v5.8-1199=
1-gfc80c51fd4b2)

Full Build Summary: https://kernelci.org/build/linusw/branch/for-next/kerne=
l/v5.8-11991-gfc80c51fd4b2/

Tree: linusw
Branch: for-next
Git Describe: v5.8-11991-gfc80c51fd4b2
Git Commit: fc80c51fd4b23ec007e88d4c688f2cac1b8648e7
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
