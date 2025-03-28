Return-Path: <linux-gpio+bounces-18093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C5CA74B87
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 14:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E2117D8AE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Mar 2025 13:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365751BC073;
	Fri, 28 Mar 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lW2VJaEb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6521B4259;
	Fri, 28 Mar 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168802; cv=none; b=IbdUBRiAlXh03uk66w5TUtBG4Lh5BmwwZhuioMGjAcH8/TldiV+b5G9TCOcIL6c/KflN9TQcsLEW4RIvhTxcDrF9RWsUnUzXK5esJSFhpAYPSJUH1NZaQYF9mHf1d5UljFz0SJ28/Sj/oc6s6KJUF71BUcT5vLxZGoZYDDVMXbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168802; c=relaxed/simple;
	bh=aFJGxokIFQiJirc5Ih44aJ1LCQOnJo62gVnAi8cuxWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrtmBW+tJBarv+SJgZ0oozLJrD0dawxwqluHY6T62Dpw484XEcEbdjwll6OmvD3LcpgM3U0vpZoI9zFs8tOl4sBn3W3gPcKipC+EMH9D8Hgxuqh1QJU8n7VUD7TQ2GYGvRKQLg8lxvnmgpc1epHqIs6bpo3ifCod332Eaa/k/Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lW2VJaEb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743168800; x=1774704800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aFJGxokIFQiJirc5Ih44aJ1LCQOnJo62gVnAi8cuxWY=;
  b=lW2VJaEbghi3rY3WXXNWRpizkRFGNcdEjDL31A6ADiI3r1wBYVr5Hw0n
   ZZiEQukvs6u1fqA3LFOMtJ/WrBG6pjkYUCUckcetZeeSlx/ejwo1vn6t0
   JD7y7IuTPahtEevJGSmjIr1BrWjY9T7DrKNCaNt/xwxQGVX9DsxBqn5MQ
   pqowcYrFI93cTv+YQvcW/Hh0a2JmbohZbwPIouchtYdaAy/AM+aVL/Ph3
   weA3anW6H8Ov0tmb87+u65XTIDvt1Rhc+R/857E9zZfg1BtFPrgBwFLG0
   lQdGvoDxcbHwLMySMsWsH3aoHDJFX8uCVpCZR6oddkC+DsJ0fZj+XlqhE
   A==;
X-CSE-ConnectionGUID: A8zE25e3SLWCZhwc+VQljQ==
X-CSE-MsgGUID: +OWhUEJ1TIuurE6/d+1vWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44711634"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44711634"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 06:33:18 -0700
X-CSE-ConnectionGUID: oyV6hxvlSA65Dz4ctN9lpA==
X-CSE-MsgGUID: Zvs5QWTZRGmO512f13gvbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="130658264"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 06:33:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ty9pf-00000006kqW-23Ew;
	Fri, 28 Mar 2025 15:33:11 +0200
Date: Fri, 28 Mar 2025 15:33:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	krzk@kernel.org
Subject: Re: [PATCH]  ASoC: codec: ak5386: Convert to GPIO descriptors
Message-ID: <Z-alF-gK5TpGliCj@smile.fi.intel.com>
References: <20250328113918.1981069-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328113918.1981069-1-peng.fan@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Mar 28, 2025 at 07:39:17PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
>  of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get_optional to get GPIO descriptor.

devm

>  - Use gpiod_set_value to configure output value.
> 
> With legacy of_gpio API, the driver set gpio value 1 to power up

sets GPIO

> AK5386, and set value 0 to power down.
> Per datasheet for PDN(reset_gpio in the driver):
>  Power Down & Reset Mode Pin
>  “H”: Power up, “L”: Power down & Reset
>  The AK5386 must be reset once upon power-up.
> 
> There is no in-tree DTS using this codec, and the dt-bindings not

bindings does not

> specify polarity. Per driver and datasheet, the gpio polarity should be

GPIO

> active-high which is to power up the codec. So using GPIOD_OUT_LOW
> when get the GPIO descriptor matches GPIOF_OUT_INIT_LOW when using
> of_gpio API.

...

>  The Documentation/devicetree/bindings/sound/ak5386.txt not specify
>  polarity(this seems bug), so per code and datasheet, I think it
>  should be active-high. I could add a quirk in gpiolib-of to force
>  active-high or acitive-low if you think needed.

I don't think we need a quirk as long as the default is the same,
I mean if the DTS is written without setting polarity, would it be
active-high or active-low?

...

> +	if (priv->reset_gpio)

Redundant as it duplicates the one in the below call.

> +		gpiod_set_value(priv->reset_gpio, 1);

...

> +	if (priv->reset_gpio)

Ditto.

> +		gpiod_set_value(priv->reset_gpio, 0);

...

> +	priv->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),

+ dev_printk.h // or even device.h, depending on the current code base
+ err.h

> +				     "Failed to get AK5386 reset GPIO\n");

> +	gpiod_set_consumer_name(priv->reset_gpio, "AK5386 Reset");

-- 
With Best Regards,
Andy Shevchenko



