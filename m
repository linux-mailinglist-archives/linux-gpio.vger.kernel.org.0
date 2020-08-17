Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C04E245F9C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 10:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgHQIXg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 04:23:36 -0400
Received: from foss.arm.com ([217.140.110.172]:49848 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727890AbgHQIXf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Aug 2020 04:23:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23B3830E;
        Mon, 17 Aug 2020 01:23:34 -0700 (PDT)
Received: from bogus (unknown [10.37.12.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBBE03F6CF;
        Mon, 17 Aug 2020 01:23:31 -0700 (PDT)
Date:   Mon, 17 Aug 2020 09:23:25 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
        punit1.agrawal@toshiba.co.jp, linux-gpio@vger.kernel.org,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 6/8] arm64: dts: visconti: Add device tree for TMPV7708
 RM main board
Message-ID: <20200817082325.GA7057@bogus>
References: <20200817014632.595898-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20200817014632.595898-7-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817014632.595898-7-nobuhiro1.iwamatsu@toshiba.co.jp>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 10:46:30AM +0900, Nobuhiro Iwamatsu wrote:
> Add basic support for the Visconti TMPV7708 SoC peripherals -
>   - CPU
>     - CA53 x 4 and 2 cluster.
>     - not support PSCI, currently only spin-table is supported.

Do you have plans to support PSCI in future ?
It is now almost more than 5 year old specification. So they should be
strong reason for not supporting that.


[..]

> diff --git a/arch/arm64/boot/dts/toshiba/Makefile b/arch/arm64/boot/dts/toshiba/Makefile
> new file mode 100644
> index 000000000000..8cd460d5b68e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/toshiba/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_VISCONTI) += tmpv7708-rm-mbrc.dtb
> diff --git a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> new file mode 100644
> index 000000000000..a883d3ab1858
> --- /dev/null
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> @@ -0,0 +1,44 @@

[..]

> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		always-on;

Will this be true when CPU is in low power modes ?

-- 
Regards,
Sudeep
