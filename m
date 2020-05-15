Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B6E1D537B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2020 17:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgEOPKH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 May 2020 11:10:07 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:6441 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727981AbgEOPKG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 May 2020 11:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589555405; x=1621091405;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=6M6Ktxf55vDOY+AZOvVcaLKoeXXn6vfpaC+WWilKPpA=;
  b=zqu1+aXngR0NAn9IxJ/S1mDAttpm5jPRvjKrQl5TomaAmwSesYQX3LiR
   RQPlRMymgtPwIPONFUyrQ6iL1qw7xSckJgM2HcP5jk4f1MJyJsuApnBs+
   606uXjm21eGm0PaEIuB/0DKmI663CWT7CxAmGw53jdb9ggimefp5WbIO3
   4Z5vSJOz+BA0DJ0cQYsEmK2lMJ4gLNwwCGpL5BcUKYFPwu9X85jRHflfB
   beeKNsWEC7pESxdR9VEr5vzTuqlGsIIzlYJTlFr8lzagZnAFQPm21VKUb
   soR0g2GgOR6Ed7bQLgf+i79hLSkBzWYkeTT8pKmaOTFUlYNghZdJTqIQ0
   Q==;
IronPort-SDR: gA2L1UhxbjxMW44p4zUGxBAMEX3vOlULc4Miz+PuSKTHyhq6CeDguzehn3PeRK3HeFve65YjIO
 03Rhh4YkFKUGJo2esxHnjPjGfOmk4g1xvhEJRRqpyKVoYDnoCAO6skiAIrqYksjClymjI8O4Pv
 Qi4TQk6rz6xhiE+eWJ2xmXI3S7lKgDb/Cr/NGTngqVoMsNPa8Y/zRqHMqATKhqapcaoGmdkYqP
 xKGlN4oK+VUeTXacJ3b13mXOIXxu+0s3YGTu5nVOdtBXLNdofwCVKzf+N9/KSh96VPY8VvNAM7
 Htc=
X-IronPort-AV: E=Sophos;i="5.73,395,1583218800"; 
   d="scan'208";a="12515588"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 08:09:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 08:09:59 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 15 May 2020 08:09:56 -0700
References: <20200513125532.24585-1-lars.povlsen@microchip.com> <20200513125532.24585-7-lars.povlsen@microchip.com> <2d230dab95ee96727a42f9c242c93c18@misterjones.org>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Marc Zyngier <maz@misterjones.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        SoC Team <soc@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <devicetree@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Olof Johansson <olof@lixom.net>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 06/14] arm64: dts: sparx5: Add basic cpu support
In-Reply-To: <2d230dab95ee96727a42f9c242c93c18@misterjones.org>
Date:   Fri, 15 May 2020 17:09:51 +0200
Message-ID: <871rnlp740.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Marc Zyngier writes:

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On 2020-05-13 13:55, Lars Povlsen wrote:
>> This adds the basic DT structure for the Microchip Sparx5 SoC, and the
>> reference boards, pcb125, pcb134 and pcb135. The two latter have a
>> NAND vs a eMMC centric variant (as a mount option),
>>
>> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>> ---
>>  MAINTAINERS                                   |   1 +
>>  arch/arm64/boot/dts/Makefile                  |   1 +
>>  arch/arm64/boot/dts/microchip/Makefile        |   4 +
>>  arch/arm64/boot/dts/microchip/sparx5.dtsi     | 135 ++++++++++++++++++
>>  .../boot/dts/microchip/sparx5_pcb125.dts      |  17 +++
>>  .../boot/dts/microchip/sparx5_pcb134.dts      |  17 +++
>>  .../dts/microchip/sparx5_pcb134_board.dtsi    |  15 ++
>>  .../boot/dts/microchip/sparx5_pcb134_emmc.dts |  17 +++
>>  .../boot/dts/microchip/sparx5_pcb135.dts      |  17 +++
>>  .../dts/microchip/sparx5_pcb135_board.dtsi    |  15 ++
>>  .../boot/dts/microchip/sparx5_pcb135_emmc.dts |  17 +++
>>  .../boot/dts/microchip/sparx5_pcb_common.dtsi |  15 ++
>>  12 files changed, 271 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/microchip/Makefile
>>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5.dtsi
>>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts
>>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb134.dts
>>  create mode 100644
>> arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi
>>  create mode 100644
>> arch/arm64/boot/dts/microchip/sparx5_pcb134_emmc.dts
>>  create mode 100644 arch/arm64/boot/dts/microchip/sparx5_pcb135.dts
>>  create mode 100644
>> arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi
>>  create mode 100644
>> arch/arm64/boot/dts/microchip/sparx5_pcb135_emmc.dts
>>  create mode 100644
>> arch/arm64/boot/dts/microchip/sparx5_pcb_common.dtsi
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1b5a18d3dbb9f..5aa28d6e39d4f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2084,6 +2084,7 @@ M:      Lars Povlsen <lars.povlsen@microchip.com>
>>  M:   Steen Hegelund <Steen.Hegelund@microchip.com>
>>  M:   Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
>>  L:   linux-arm-kernel@lists.infradead.org (moderated for
>> non-subscribers)
>> +F:   arch/arm64/boot/dts/microchip/
>>  N:   sparx5
>>  S:   Supported
>>
>> diff --git a/arch/arm64/boot/dts/Makefile
>> b/arch/arm64/boot/dts/Makefile
>> index f19b762c008d8..9680a7f20c307 100644
>> --- a/arch/arm64/boot/dts/Makefile
>> +++ b/arch/arm64/boot/dts/Makefile
>> @@ -17,6 +17,7 @@ subdir-y += intel
>>  subdir-y += lg
>>  subdir-y += marvell
>>  subdir-y += mediatek
>> +subdir-y += microchip
>>  subdir-y += nvidia
>>  subdir-y += qcom
>>  subdir-y += realtek
>> diff --git a/arch/arm64/boot/dts/microchip/Makefile
>> b/arch/arm64/boot/dts/microchip/Makefile
>> new file mode 100644
>> index 0000000000000..c6e0313eea0f9
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/microchip/Makefile
>> @@ -0,0 +1,4 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb125.dtb
>> +dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
>> +dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
>> diff --git a/arch/arm64/boot/dts/microchip/sparx5.dtsi
>> b/arch/arm64/boot/dts/microchip/sparx5.dtsi
>> new file mode 100644
>> index 0000000000000..3136b4369f507
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/microchip/sparx5.dtsi
>> @@ -0,0 +1,135 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2020 Microchip Technology Inc. and its subsidiaries.
>> + */
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +     compatible = "microchip,sparx5";
>> +     interrupt-parent = <&gic>;
>> +     #address-cells = <2>;
>> +     #size-cells = <1>;
>> +
>> +     aliases {
>> +             serial0 = &uart0;
>> +             serial1 = &uart1;
>> +     };
>> +
>> +     chosen {
>> +             stdout-path = "serial0:115200n8";
>> +     };
>> +
>> +     cpus {
>> +             #address-cells = <2>;
>> +             #size-cells = <0>;
>> +             cpu-map {
>> +                     cluster0 {
>> +                             core0 {
>> +                                     cpu = <&cpu0>;
>> +                             };
>> +                             core1 {
>> +                                     cpu = <&cpu1>;
>> +                             };
>> +                     };
>> +             };
>> +             cpu0: cpu@0 {
>> +                     compatible = "arm,cortex-a53", "arm,armv8";
>> +                     device_type = "cpu";
>> +                     reg = <0x0 0x0>;
>> +                     enable-method = "spin-table";
>
> Really? This is 2020, not 2012 any more. Surely a new platform
> boots using PSCI, and not *this*.
>

We don't currently support PSCI. The platform does not have TrustZone,
hence we don't use ATF.

We use U-Boot as the (only) bootloader, providing the spintable. I looked
at adding PSCI (in U-Boot) initially, but as most other platforms were
using ATF the PSCI support was buggy and caused me to go for spintable.

Is spintable being deprecated?

>> +                     cpu-release-addr = <0x0 0x0000fff8>;
>> +                     next-level-cache = <&L2_0>;
>> +             };
>> +             cpu1: cpu@1 {
>> +                     compatible = "arm,cortex-a53", "arm,armv8";
>> +                     device_type = "cpu";
>> +                     reg = <0x0 0x1>;
>> +                     enable-method = "spin-table";
>> +                     cpu-release-addr = <0x0 0x0000fff8>;
>> +                     next-level-cache = <&L2_0>;
>> +             };
>> +             L2_0: l2-cache0 {
>> +                     compatible = "cache";
>> +             };
>> +     };
>> +
>> +     timer {
>> +             compatible = "arm,armv8-timer";
>> +             interrupts =
>> +                     <GIC_PPI 13
>> +                             (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +                     <GIC_PPI 14
>> +                             (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +                     <GIC_PPI 11
>> +                             (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>> +                     <GIC_PPI 10
>> +                             (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>
> You have a GICv3. These interrupt specifiers are not the ones GICv3
> expects.

I'll go back and look at this.

>
>> +     };
>> +
>> +     clocks: clocks {
>> +             #address-cells = <2>;
>> +             #size-cells = <1>;
>> +             ranges;
>> +             ahb_clk: ahb-clk {
>> +                     compatible = "fixed-clock";
>> +                     #clock-cells = <0>;
>> +                     clock-frequency = <250000000>;
>> +             };
>> +             sys_clk: sys-clk {
>> +                     compatible = "fixed-clock";
>> +                     #clock-cells = <0>;
>> +                     clock-frequency = <625000000>;
>> +             };
>> +     };
>> +
>> +     axi: axi@600000000 {
>> +             compatible = "simple-bus";
>> +             #address-cells = <2>;
>> +             #size-cells = <1>;
>> +             ranges;
>> +
>> +             gic: interrupt-controller@600300000 {
>> +                     compatible = "arm,gic-v3";
>> +                     #interrupt-cells = <3>;
>> +                     #address-cells = <2>;
>> +                     #size-cells = <2>;
>> +                     interrupt-controller;
>> +                     reg = <0x6 0x00300000 0x20000>, /* GICD */
>> +                           <0x6 0x00340000 0x1000000>;       /* GICR */
>
> You are missing the GICv3 compatibility interfaces (GICV/GICH), which
> are implemented by the CPUs.

I'll get these sorted out.

>
>> +                     interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +             };
>> +
>> +             uart0: serial@600100000 {
>> +                     compatible = "ns16550a";
>> +                     reg = <0x6 0x00100000 0x20>;
>> +                     clocks = <&ahb_clk>;
>> +                     reg-io-width = <4>;
>> +                     reg-shift = <2>;
>> +                     interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                     status = "disabled";
>> +             };
>> +
>> +             uart1: serial@600102000 {
>> +                     compatible = "ns16550a";
>> +                     reg = <0x6 0x00102000 0x20>;
>> +                     clocks = <&ahb_clk>;
>> +                     reg-io-width = <4>;
>> +                     reg-shift = <2>;
>> +                     interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +                     status = "disabled";
>> +             };
>> +
>> +             timer1: timer@600105000 {
>> +                     compatible = "snps,dw-apb-timer";
>> +                     reg = <0x6 0x00105000 0x1000>;
>> +                     clocks = <&ahb_clk>;
>> +                     clock-names = "timer";
>> +                     interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
>> +             };
>> +
>> +     };
>> +};
>
> Where is the PMU node?
>

I'll add the PMU node.

Thank you for your comments!

> Thanks,
>
>          M.

-- 
Lars Povlsen,
Microchip
