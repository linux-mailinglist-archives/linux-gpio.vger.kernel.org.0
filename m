Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA236249477
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 07:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgHSFdU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 01:33:20 -0400
Received: from mo-csw1514.securemx.jp ([210.130.202.153]:53550 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgHSFdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 01:33:20 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 07J5WqCT027200; Wed, 19 Aug 2020 14:32:52 +0900
X-Iguazu-Qid: 34tMd2lTgdkXD2SDSg
X-Iguazu-QSIG: v=2; s=0; t=1597815171; q=34tMd2lTgdkXD2SDSg; m=KKYvQVPwgvq/GrXVc7+5LqrEHpDRfzni5Zg2HZW44Nw=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1511) id 07J5Wnib002736;
        Wed, 19 Aug 2020 14:32:50 +0900
Received: from enc01.localdomain ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 07J5Wn9q027152;
        Wed, 19 Aug 2020 14:32:49 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.localdomain  with ESMTP id 07J5WnEK024923;
        Wed, 19 Aug 2020 14:32:49 +0900
Date:   Wed, 19 Aug 2020 14:32:47 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Marc Zyngier <maz@misterjones.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, linux-gpio@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] arm64: dts: visconti: Add device tree for TMPV7708
 RM main board
X-TSB-HOP: ON
Message-ID: <20200819053247.GB1256849@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817014632.595898-7-nobuhiro1.iwamatsu@toshiba.co.jp>
 <53f40628f3d05e3224978ddeb67613b0@misterjones.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53f40628f3d05e3224978ddeb67613b0@misterjones.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Thanks for your review.

On Mon, Aug 17, 2020 at 10:00:45AM +0100, Marc Zyngier wrote:
> On 2020-08-17 02:46, Nobuhiro Iwamatsu wrote:
> > Add basic support for the Visconti TMPV7708 SoC peripherals -
> >   - CPU
> >     - CA53 x 4 and 2 cluster.
> >     - not support PSCI, currently only spin-table is supported.
> 
> We have pushed back on other SoCs in the past when they didn't
> implement PSCI. There really is not good reason not to have
> even the most trivial PSCI implementation these days.

As I've responded to Sudeep Holla, I already understood about this
issue, so I am considering into PSCI support with firmware team.

> 
> >   - Interrupt controller (ARM Generic Interrupt Controller)
> >   - Timer (ARM architected timer)
> >   - UART (ARM PL011 UART controller)
> >   - SPI (ARM PL022 SPI controller)
> >   - I2C (Synopsys DesignWare APB I2C Controller)
> >   - Pin control (Visconti specific)
> > 
> > Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> > ---
> >  arch/arm64/boot/dts/Makefile                  |   1 +
> >  arch/arm64/boot/dts/toshiba/Makefile          |   2 +
> >  .../boot/dts/toshiba/tmpv7708-rm-mbrc.dts     |  44 ++
> >  arch/arm64/boot/dts/toshiba/tmpv7708.dtsi     | 390 ++++++++++++++++++
> >  .../arm64/boot/dts/toshiba/tmpv7708_pins.dtsi |  93 +++++
> >  5 files changed, 530 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/toshiba/Makefile
> >  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> >  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi
> >  create mode 100644 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi
> > 
> 
> [...]
> 
> > diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > new file mode 100644
> > index 000000000000..a883d3ab1858
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > @@ -0,0 +1,44 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Device Tree File for TMPV7708 RM main board
> > + *
> > + * (C) Copyright 2020, Toshiba Corporation.
> > + * (C) Copyright 2020, Nobuhiro Iwamatsu
> > <nobuhiro1.iwamatsu@toshiba.co.jp>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "tmpv7708.dtsi"
> > +
> > +/ {
> > +	model = "Toshiba TMPV7708 RM main board";
> > +	compatible = "toshiba,tmpv7708-rm-mbrc", "toshiba,tmpv7708";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		serial1 = &uart1;
> > +	};
> > +
> > +	chosen {
> > +		bootargs = "earlycon=pl011,0x28200000";
> > +		stdout-path = "serial0:115200n8";
> 
> These should be provided by the bootloader, and not hardcoded.
> 

OK, I will remove this line.

> > +	};
> > +
> > +	/* 768MB memory */
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		reg = <0x0 0x80000000 0x0 0x30000000>;
> > +	};
> > +};
> > +

<snip>

> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupt-parent = <&gic>;
> > +		always-on;
> 
> That's unlikely to be true. A53 does have low-power modes that
> will kill the comparator, and you will miss timer deadlines.
> This property really only applies to virtual machines, which isn't
> the case here.

I see.
Thank you for the explanation. I remove this parameter.

> 
> > +		interrupts =
> > +			<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +			<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +			<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> > +			<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> > +	};
> > +
> > +	uart_clk: uart-clk {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <150000000>;
> > +		#clock-cells = <0>;
> > +	};
> > +
> > +	soc {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		compatible = "simple-bus";
> > +		interrupt-parent = <&gic>;
> > +		ranges;
> > +
> > +		gic: interrupt-controller@24001000 {
> > +			compatible = "arm,gic-400";
> > +			interrupt-controller;
> > +			#interrupt-cells = <3>;
> > +			reg = <0 0x24001000 0 0x1000>,
> > +			      <0 0x24002000 0 0x2000>,
> > +			      <0 0x24004000 0 0x2000>,
> > +			      <0 0x24006000 0 0x2000>;
> 
> You are missing the maintenance interrupt.

Thanks! I will add interrupts parameter.
> 
> Thanks,
> 
>         M.

Best regards,
  Nobuhiro

> -- 
> Who you jivin' with that Cosmik Debris?
> 
