Return-Path: <linux-gpio+bounces-1361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FC981131B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 870171C21001
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 13:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093482D600;
	Wed, 13 Dec 2023 13:40:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C471295;
	Wed, 13 Dec 2023 05:40:06 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="8323973"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="8323973"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 05:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="947187477"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="947187477"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 05:40:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rDPSy-00000005XLb-3sqy;
	Wed, 13 Dec 2023 15:40:00 +0200
Date: Wed, 13 Dec 2023 15:40:00 +0200
From: Andy Shevchenko <andy@kernel.org>
To: =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
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
Message-ID: <ZXm0MIub8X2q_lnp@smile.fi.intel.com>
References: <20231207100723.15015-1-tychang@realtek.com>
 <20231207100723.15015-3-tychang@realtek.com>
 <ZXHMbZRXLXGa_tq8@smile.fi.intel.com>
 <989146448858478b975c66899b8f3fed@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <989146448858478b975c66899b8f3fed@realtek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 12, 2023 at 09:55:59AM +0000, TY_Chang[張子逸] wrote:
> >On Thu, Dec 07, 2023 at 06:07:23PM +0800, TY Chang wrote:

...

> >> This driver enables configuration of GPIO direction, GPIO values, GPIO
> >> debounce settings and handles GPIO interrupts.
> >
> >Why gpio-regmap can't be used?
> 
> I will try to use gpio-remap in the next version.

If it appears that it makes code uglier / complicated, please add the note
somewhere to answer the above question.

...

> >> +     if (index > data->info->num_dir)
> >> +             return -EINVAL;
> >
> >When this conditional can be true?
> >Same Q to the similar checks over the code.
> 
> It is only to check if the offset value is missing in the rtd_gpio_info.
> I'm uncertain about the necessity of these checks. If they are not necessary,
> I will remove the num_* members in the rtd_gpio_info structure along with
> these checks.

My understanding that these checks are equivalent to the

	if (offset >= ngpio)

one, which is performed by GPIO library, i.o.w. you will never get an offset
outside the range of supported GPIO lines.

If my understanding is wrong, these checks need a comment why.

...

> >> +     if (irq == data->irqs[0])
> >> +             get_reg_offset = &rtd_gpio_gpa_offset;
> >> +     else if (irq == data->irqs[1])
> >> +             get_reg_offset = &rtd_gpio_gpda_offset;
> >
> >Can't it be done before entering into chained IRQ handler?
> 
> I will revise it.

Thinking about this more, perhaps you can register two IRQ chips with
different functions, so this won't be part of the very critical interrupt
handler (as we all want to reduce overhead in it as much as possible).
Anyway, think about this and try different options, choose the one you
think the best.

-- 
With Best Regards,
Andy Shevchenko



