Return-Path: <linux-gpio+bounces-351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEF7F451F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 12:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F5628143E
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Nov 2023 11:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9FB1DA38;
	Wed, 22 Nov 2023 11:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3TkXZZf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0004C197;
	Wed, 22 Nov 2023 03:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700653853; x=1732189853;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HAyPIxfg+25g5/kp77ONNwQjeAGccrIrrozWv9OSMvQ=;
  b=G3TkXZZf3p2ROgCyExNT2dbUrNgs3r8bboHsoaTgZSwYhCLBHKwhe1G6
   FRQkZNOS0gz7UT5eAzZG0ONCj6igUVpbYytWVr5Nv4WWUId9DklPc4XIn
   BNe5e5gKn6cy6WeIB4/lyoWNEbhmqx4fTogyK9+Yr1Q37pitvgX6wacjn
   dH0GhRiITAT4LJGWT4h7r3mctpbDtYW9m3abf9E6ezHS3khFYQPc6SSNR
   QcLAkIfFPOJG7N2TRQMqpOIlIT/0bGJ9fNb0Ai3sI9YoE5n4MSxvYTzzK
   cNY1xcJc34oqggzzskQTiscqQ5rnod13JCOSqBuF7KpwEPn5cBdyKxPx4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458534447"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="458534447"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 03:50:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="910765166"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="910765166"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 03:50:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1r5lkl-0000000G4yO-3HIu;
	Wed, 22 Nov 2023 13:50:47 +0200
Date: Wed, 22 Nov 2023 13:50:47 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v5 04/39] pinctrl: add a Cirrus ep93xx SoC pin controller
Message-ID: <ZV3rF2QKLVClp1jh@smile.fi.intel.com>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
 <20231122-ep93xx-v5-4-d59a76d5df29@maquefel.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122-ep93xx-v5-4-d59a76d5df29@maquefel.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Nov 22, 2023 at 11:59:42AM +0300, Nikita Shubin wrote:
> Add a pin control (only multiplexing) driver for ep93xx SoC so
> we can fully convert ep93xx to device tree.
> 
> This driver is capable of muxing ep9301/ep9302/ep9307/ep9312/ep9315
> variants, this is chosen based on "compatible" in device tree.

...

> +config PINCTRL_EP93XX
> +	bool
> +	depends on OF && (ARCH_EP93XX || COMPILE_TEST)

How OF is here?

...

> +#include <linux/of.h>

Ditto.

...

> +#include <linux/slab.h>

+ blank line?

> +#include <linux/soc/cirrus/ep93xx.h>

...

> +/* ep9301, ep9302*/

Missing space.

...

> +static const unsigned int ssp_ep9301_pins[] = {
> +	93, 94, 95, 96

In multi-line definitions like this it makes sense to leave trailing comma.

> +};
> +
> +static const unsigned int ac97_ep9301_pins[] = {
> +	89, 92, 107, 154, 156

Ditto.

And in some other places.

> +};

...

> +	/* Row C*/

Missing space. I noticed in more comments like this, please grep and fix
all of them.

...

> +static const char *ep93xx_get_group_name(struct pinctrl_dev *pctldev,
> +					 unsigned int selector)
> +{
> +	struct ep93xx_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	switch (pmx->model) {
> +	case EP93XX_9301_PINCTRL:
> +		return ep9301_pin_groups[selector].grp.name;
> +	case EP93XX_9307_PINCTRL:
> +		return ep9307_pin_groups[selector].grp.name;
> +	case EP93XX_9312_PINCTRL:
> +		return ep9312_pin_groups[selector].grp.name;
> +	}
> +
> +	return NULL;

Make it default case.

> +}

...

> +	dev_dbg(pmx->dev,
> +		"before=0x%x, after=0x%x, mask=0x%lx\n",
> +		before, after, PADS_MASK);

At least two first can be on a single line.

...

> +	/* Which bits changed */
> +	before &= PADS_MASK;
> +	after &= PADS_MASK;

> +	expected = before & ~grp->mask;
> +	expected |= grp->value;

Usually we use this pattern:

	expected = (before & ~grp->mask) | (grp->value & grp->mask);

but I don't know the full spectre of the meanings of these pieces, so just
consider it once more.

> +	expected &= PADS_MASK;

...

> +	pmx->model = (int)(id->driver_data);

Wouldn't it warn? Maybe not (it's 32-bit code, right?), but better to use

	pmx->model = (int)(uintptr_t)id->driver_data;

...

> +	/* using parent of_node to match in get_pinctrl_dev_from_of_node() */
> +	dev->of_node = adev->dev.parent->of_node;

device_set_node()

...

> +	pmx->pctl = devm_pinctrl_register(dev, &ep93xx_pmx_desc, pmx);
> +	if (IS_ERR(pmx->pctl)) {

> +		dev_err(dev, "could not register pinmux driver\n");
> +		return PTR_ERR(pmx->pctl);

Why not dev_err_probe() here?

> +	}

-- 
With Best Regards,
Andy Shevchenko



