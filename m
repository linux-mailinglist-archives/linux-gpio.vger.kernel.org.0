Return-Path: <linux-gpio+bounces-1462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E72A813254
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 14:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFF2D1C21A90
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 13:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5CC584CA;
	Thu, 14 Dec 2023 13:58:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43EBCF;
	Thu, 14 Dec 2023 05:58:33 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2280724"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2280724"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 05:58:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="803292652"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="803292652"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 05:58:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDmEN-00000005rGw-2pFO;
	Thu, 14 Dec 2023 15:58:27 +0200
Date: Thu, 14 Dec 2023 15:58:27 +0200
From: Andy Shevchenko <andy@kernel.org>
To: =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
	Michael Walle <michael@walle.cc>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] Add GPIO support for Realtek DHC(Digital Home
 Center) RTD SoCs.
Message-ID: <ZXsKAyIlY3y3tgUi@smile.fi.intel.com>
References: <20231207100723.15015-1-tychang@realtek.com>
 <20231207100723.15015-3-tychang@realtek.com>
 <ZXHMbZRXLXGa_tq8@smile.fi.intel.com>
 <989146448858478b975c66899b8f3fed@realtek.com>
 <ZXm0MIub8X2q_lnp@smile.fi.intel.com>
 <23574204547646779d02f0109c20b3ff@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23574204547646779d02f0109c20b3ff@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Michael (GPIO regmap maintainer)

On Thu, Dec 14, 2023 at 07:57:55AM +0000, TY_Chang[張子逸] wrote:
> >On Tue, Dec 12, 2023 at 09:55:59AM +0000, TY_Chang[張子逸] wrote:
> >> >On Thu, Dec 07, 2023 at 06:07:23PM +0800, TY Chang wrote:

...

> >> >> This driver enables configuration of GPIO direction, GPIO values,
> >> >> GPIO debounce settings and handles GPIO interrupts.
> >> >
> >> >Why gpio-regmap can't be used?
> >>
> >> I will try to use gpio-remap in the next version.
> >
> >If it appears that it makes code uglier / complicated, please add the note
> >somewhere to answer the above question.
> 
> I've traced the gpio-regmap.c file. It appears that for the driver to register
> gpio_irq_chip, it must create the irq_domain and add it into gpio_regmap_config.
> Additionally, the driver needs to register the irq handler by itself.
> However, this process can be managed by the gpiolib if the driver fills in the struct
> gpio_irq_chip inside struct gpio_chip before invoking gpiochip_add_data.

Hmm... I thought this is solvable issue.
Michael, is there a limitation in GPIO regmap that this driver can't be converted?

> Moreover, apart from managing the registers for gpio direction and value, there
> are several other registers that require access(interrupt enable, debounce...).
> The GPIO IRQ status registers are located at different base addresses and are
> not contiguous. It may need to create an additional regmap and assign the access
> table to this regmap.

AFAIK this is not a problem as you can provide your own xlate function that
will take care about register mapping.

> With the above consideration, I tend to keep using the existing method.

I would like to hear from Michael if it's indeed a big obstacle.

...

> >> >> +     if (irq == data->irqs[0])
> >> >> +             get_reg_offset = &rtd_gpio_gpa_offset;
> >> >> +     else if (irq == data->irqs[1])
> >> >> +             get_reg_offset = &rtd_gpio_gpda_offset;
> >> >
> >> >Can't it be done before entering into chained IRQ handler?
> >>
> >> I will revise it.
> >
> >Thinking about this more, perhaps you can register two IRQ chips with
> >different functions, so this won't be part of the very critical interrupt
> >handler (as we all want to reduce overhead in it as much as possible).
> >Anyway, think about this and try different options, choose the one you think
> >the best.
> 
> In the previous patch (v1), I had registered two IRQ chips with different
> handlers. However, these two handlers appeared quite similar and the
> gpio_irq_chip only allows the registration of a single handler. Therefore,
> I ended up registering one handler for both IRQs and included conditional
> checks within the handler to differentiate between the two.

What is the performance impact that you have that condition in the interrupt
handler?

-- 
With Best Regards,
Andy Shevchenko



