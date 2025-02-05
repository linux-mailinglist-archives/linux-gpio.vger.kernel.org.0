Return-Path: <linux-gpio+bounces-15389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 278FEA2899B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 12:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23461889395
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 11:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A1D22D4D9;
	Wed,  5 Feb 2025 11:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZtwYYmg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9520422ACF3;
	Wed,  5 Feb 2025 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738755718; cv=none; b=Jo/1tTVyCl4NYgeXrWODtNLpoN5EEVwjT0KL49FNedb1lqgCh9/ogQ9xYPvm2w0usTcX4QPx0MNn8qQc3OIGhQlPWntnZ+lssucFTuetd654Rw0Ls/dRhN9HTCXLRQjOGxCdIzgEXFYTQ643qtH9Ik/tK07GxstgiC2r0hD7EZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738755718; c=relaxed/simple;
	bh=/aMDY+QOiW9fKjnqoyQRHkRS3uxDra16pv5hBIvIjjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEFoglnO19iAvf8F+LALkS4rd+Z7Ko38hjgwf16RhZUGVxdyPWUtIP8gJFp84U7nlgg2q/h1hYevrUGXSGZpzxO3QQb+17G4Y7hkoKe5RXwIl/Unr7txO4PrSTrN2ZhN5SWyx+hCsnsGQ1QocsHeF8QV2QbjQDTovl3H6FvlzoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZtwYYmg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738755717; x=1770291717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/aMDY+QOiW9fKjnqoyQRHkRS3uxDra16pv5hBIvIjjs=;
  b=cZtwYYmgH877xO8I3hhfpp/J82XNmKCYOrATQbxkGOZ21DXOzgd54OMZ
   C/Ki/0/r8MaG1HkBLpmfBvZR79iZCkpVfZCbk0zOKhJCiIq9nI1wbVNmd
   tRJkmeRxHoh1p10bfkTmdcrqmpWxgtX2SV3ANq/5R/2HOiKwp/z/qD8pr
   1H+bo0ajD508rq1XiItnJD6DAyyw5fC7paLofaGHEByWVerAl26oH/HCC
   X21f/c3nZktGx1fP7oZ4+mzXuG1ESlFwG+SDNRQL1SRKCP1nR8ZXfp2E7
   +gVGhMiZUNBNLzzYsWMM06upcA/to1lHIbiqVs02vLPER14RFw/l2JR35
   w==;
X-CSE-ConnectionGUID: 4UgNIw5DTlW6FdEsEmWAZQ==
X-CSE-MsgGUID: gHVGgPKpTRec78a2+IwHDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49933306"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="49933306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:41:56 -0800
X-CSE-ConnectionGUID: ApLJff81QgKK1pPh8uOGxg==
X-CSE-MsgGUID: 3vqrb4AYRvOuCfVXUZs+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="141737375"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:41:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tfdmv-00000008TLJ-2ivc;
	Wed, 05 Feb 2025 13:41:49 +0200
Date: Wed, 5 Feb 2025 13:41:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw
Subject: Re: [PATCH 4/5] pinctrl: Add pin controller driver for AAEON UP
 boards
Message-ID: <Z6NOfUG3QZyYW0rw@smile.fi.intel.com>
References: <CACRpkdZ6kmPn9TfO40drJ+vwM2GNKfNaP21R_gEvugg+GJiF1w@mail.gmail.com>
 <7e96dd60-8f72-48f9-a393-5a8a7e5c6b18@bootlin.com>
 <Z4Tg-uTVcOiYK2Dr@smile.fi.intel.com>
 <b50444f7-4dd1-4440-af36-783b1b4f8625@bootlin.com>
 <Z4jNZPcDd89-HfAd@smile.fi.intel.com>
 <e273428e-3ebd-4116-b317-9aae0c8c603b@bootlin.com>
 <Z4j8NmKMEL7PALmw@smile.fi.intel.com>
 <8b9dd766-ae7e-4817-a093-536ae9646cd3@bootlin.com>
 <Z4kUWxR9VWkzQ9aW@smile.fi.intel.com>
 <5e5f7635-86ed-4814-b26f-b1c45fa4f29a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e5f7635-86ed-4814-b26f-b1c45fa4f29a@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 05, 2025 at 12:17:29PM +0100, Thomas Richard wrote:
> On 1/16/25 15:14, Andy Shevchenko wrote:

...

> So I'm not really convinced by all this complexity for only one driver.

I am not sure if I asked you to show the excerpt from DSDT for this device.
Is there any link I can browse the ASL code (for that particular device,
most likely I wouldn't need the full DSDT)?

...

> In the same time I had an other idea and I would like your advises.
> 
> The FPGA pinctrl is a consumer of SoC pins, so I can add some
> pinctrl_map to request the SoC pins and mark them as used by the FPGA:
> 
> PIN_MAP_MUX_GROUP("upboard-pinctrl", "soc_pins", "INT3452:00",
> 		"pwm0_grp", "pwm0"),
> PIN_MAP_MUX_GROUP("upboard-pinctrl", "soc_pins", "INT3452:00",
> 		"uart1_grp", "uart1"),
> 
> And in the probe() I call devm_pinctrl_get_select() to request and
> configure SoC pins.
> 
> Pros:
> - the SoC pins are marked as used by the FPGA.
> - less complex solution, no change in the core.
> 
> Cons:
> - probably one mapping for each board as Intel pinctrl device, groups
> and functions may change depending the board. So the right mapping
> should be selected based on DMI table.

Yes, this solution is what we can do for now, I don't see the Cons part is
really cons as we do that in many drivers, but ideally, of course, this
information should come from DSDT. Saying this reminds me that we still have
a gap that should link the ACPICA resources for pin control and muxing to
the pin control layer in the Linux kernel. That's what we probably should
focus on instead of creating a pin control proxy driver which indeed sounds
like a complex and over engineered solution for a niche.

> This solution also implies to make some changes in Intel pinctrl driver
> to create missing groups. Or maybe the pins which are not in a group are
> not writeable (so no need to request them) ?

This is not a problem, it's an improvement in my opinion. Again, this,
of course, should come from DSDT (see the respective Pin*() resource
descriptions in the ACPI specification).

> For the GPIO part, no changes, the SoC GPIO are requested at runtime
> using gpiod (Linus I did not forget you mentioned to use/rework
> gpio-aggregator).

-- 
With Best Regards,
Andy Shevchenko



