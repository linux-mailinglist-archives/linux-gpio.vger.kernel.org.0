Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07AF24943C
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Aug 2020 06:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgHSE7T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 00:59:19 -0400
Received: from mo-csw1114.securemx.jp ([210.130.202.156]:52558 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgHSE7T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Aug 2020 00:59:19 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 07J4wtHw019223; Wed, 19 Aug 2020 13:58:55 +0900
X-Iguazu-Qid: 2wGqzHwiyNEtleF4bL
X-Iguazu-QSIG: v=2; s=0; t=1597813135; q=2wGqzHwiyNEtleF4bL; m=8+9FPYphTGg6tj4oc6AushWGgqt+wl5h3E50PUtGk7w=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1113) id 07J4wrja017883;
        Wed, 19 Aug 2020 13:58:54 +0900
Received: from enc01.localdomain ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 07J4wrBB004514;
        Wed, 19 Aug 2020 13:58:53 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.localdomain  with ESMTP id 07J4wr1B022665;
        Wed, 19 Aug 2020 13:58:53 +0900
Date:   Wed, 19 Aug 2020 13:58:51 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, linux-gpio@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/8] arm64: dts: visconti: Add device tree for TMPV7708
 RM main board
X-TSB-HOP: ON
Message-ID: <20200819045851.GA1256849@toshiba.co.jp>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817014632.595898-7-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817082325.GA7057@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817082325.GA7057@bogus>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, 

Thanks for your review.

On Mon, Aug 17, 2020 at 09:23:25AM +0100, Sudeep Holla wrote:
> On Mon, Aug 17, 2020 at 10:46:30AM +0900, Nobuhiro Iwamatsu wrote:
> > Add basic support for the Visconti TMPV7708 SoC peripherals -
> >   - CPU
> >     - CA53 x 4 and 2 cluster.
> >     - not support PSCI, currently only spin-table is supported.
> 
> Do you have plans to support PSCI in future ?
> It is now almost more than 5 year old specification. So they should be
> strong reason for not supporting that.

I understand that the problem exists and I am considering with our firmware
development team. Currently spin-table is set, but if the firmware supports it,
I plan to switch to PSCI.

If the firmware doesn't support PSCI now, would it be difficult to apply the patch?

> 
> 
> [..]
> 
> > diff --git a/arch/arm64/boot/dts/toshiba/Makefile b/arch/arm64/boot/dts/toshiba/Makefile
> > new file mode 100644
> > index 000000000000..8cd460d5b68e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/toshiba/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_VISCONTI) += tmpv7708-rm-mbrc.dtb
> > diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > new file mode 100644
> > index 000000000000..a883d3ab1858
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > @@ -0,0 +1,44 @@
> 
> [..]
> 
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupt-parent = <&gic>;
> > +		always-on;
> 
> Will this be true when CPU is in low power modes ?
> 

Although it is related to the above PSCI, Visconti5 does not have a low
power mode etc., so it is set like this.

> -- 
> Regards,
> Sudeep
> 

Best regards,
  Nobuhiro
