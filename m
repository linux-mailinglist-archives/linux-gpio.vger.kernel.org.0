Return-Path: <linux-gpio+bounces-19133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5394A97095
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 17:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A3E1B600C3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 15:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F5A2900AC;
	Tue, 22 Apr 2025 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZiowtlV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53CF28F505;
	Tue, 22 Apr 2025 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745335469; cv=none; b=sO0p5FERVEHFMMzFSytg/lt98P5V69fdyNhAgSkTe/Ppks+3RaiFmGdq+rSW+0dcHu6qJOTJOGZ90yJzsrfB0DFZoC2jLC0NwVTsGsLO59NgUVvSj50sF1+nhClcigeUAfL7SwW5ASVARQniyx9sYRPSSPbuluwx/rbnSwFcVl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745335469; c=relaxed/simple;
	bh=aje9S4zFxEfBi20gKMYLFKcs8Nb4SwJkX+rv9aswd6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOpMMXWNBxVLDitPIM6uHdjV/7WnwTZ0loNVw74/0Ww3NWuWdiQz++enf9WWLUFAOyd0bc+KqYCISNDFkH/uiGDnGF1YRNAm7KbwwDy5S237x0D2fBaqWW5bna0afou/OeAML3PGxj9XvIdh6b9/Q0UnrxZKnT/lgi8PmAp9Dh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZiowtlV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745335468; x=1776871468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aje9S4zFxEfBi20gKMYLFKcs8Nb4SwJkX+rv9aswd6Y=;
  b=NZiowtlV7Zuc/tzCYQv8dhwjDiq3U1oWMSimNPRSfutXJ7IIDsWEeylC
   uSY3/JGWmu9cmIwthovLh/b94/vfDYeMFuDkiKCKO/urWJsxKvo4jroWd
   9/1S8U7zTrerhwGg0sIP+o0RTRXXaDmwoWA6GU+Z6ZUXFHevCTVmsfFk5
   bTZJSJeRDw5J6N23MVNETeKJdUiAzXde0w+fI4CW5KzLFLevzhY+e3v3P
   hsgh8OKEFqhoD/kKYUaysjPlQvMCWoo+47CiqNTN0L7RkFUokrbgFlDoQ
   zewVgeZD0tTovFEMYNbkUUQ6lHpFX7ZenI6eZ9yBQkbZMFV8/za8XhSk1
   g==;
X-CSE-ConnectionGUID: eypzoxidTzK5ojguU6dHgA==
X-CSE-MsgGUID: 9bunrFBGR4mRe5DMzGEepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69390400"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="69390400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:24:27 -0700
X-CSE-ConnectionGUID: 8g2oOdBpQAuGY7zCQq0x8w==
X-CSE-MsgGUID: 7xgAfr1yT7yG71jyTR9wiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="132365654"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:24:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7FTx-0000000ElR4-2hLi;
	Tue, 22 Apr 2025 18:24:21 +0300
Date: Tue, 22 Apr 2025 18:24:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH v3 10/10] pinctrl: Add pin controller driver for AAEON UP
 boards
Message-ID: <aAe0pWa1Fzxb86HM@smile.fi.intel.com>
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
 <aAFBwANy47y0DAhY@smile.fi.intel.com>
 <e1bb879a-55b3-43fc-8d2d-67401c21ef76@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1bb879a-55b3-43fc-8d2d-67401c21ef76@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 04:36:33PM +0200, Thomas Richard wrote:

...

> >> +static int upboard_gpio_request(struct gpio_chip *gc, unsigned int offset)
> >> +{
> >> +	struct gpiochip_fwd *fwd = container_of(gc, struct gpiochip_fwd, chip);
> >> +	struct upboard_pinctrl *pctrl = fwd->data;
> > 
> > Yeah, something like
> > 
> > 	struct upboard_pinctrl *pctrl = gpio_fwd_get_data(fwd);
> > 
> >> +	unsigned int pin = pctrl->pctrl_data->pin_header[offset];
> >> +	struct gpio_desc *desc;
> >> +	int ret;
> >> +
> >> +	ret = pinctrl_gpio_request(gc, offset);
> >> +	if (ret)
> >> +		return ret;
> > 
> >> +	/* GPIO desc is already registered */
> >> +	if (fwd->descs[offset])
> >> +		return 0;
> > 
> > As mentioned in another reply, why 0 and even though, why can't it be simply
> > filtered by EEXIST from the below?
> > 
> > In worst scenario, you can add an API gpio_fwd_is_registered(fwd, offset).
> 
> I cannot filter using EEXIST, because I have to get the GPIO desc first.
> And using the retcode of gpiod_get_index() I cannot detect that I
> already requested the GPIO.
> 
> As now gpiochip_fwd is an opaque pointer, I will add the
> gpio_fwd_is_registered() helper.
> 
> It is due to the fact that the forwarder never releases a GPIO desc. An
> other solution could be to add the possibility to remove a GPIO desc.
> In upboard_gpio_free() the GPIO desc is free, and we can remove the check.
> 
> upboard_gpio_free()
> {
> 	gpio_fwd_free_desc(fwd, offset);
> 	pinctrl_gpio_free(gc, offset);
> }

From given options I prefer to have the _gpio_free(), i.e. the latter one.

-- 
With Best Regards,
Andy Shevchenko



