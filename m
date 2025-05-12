Return-Path: <linux-gpio+bounces-19957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A731AB3A1F
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 16:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1E013AD631
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 14:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31ED1E3769;
	Mon, 12 May 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PU7/IvFB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD529475;
	Mon, 12 May 2025 14:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059113; cv=none; b=nmQpRnDSmocvq9aUgVzIts6SvROpYGRpnhnLWX0yoU5S7opOlzb5ZS0VGCimt1djIgieCcomBt+QF7NhY/Aq7d1PBHlLPHLbTbbr0HieMkEgcIJzTg3cwxi34AvSSsw6ArmaZCBLBtpTmvW46MExyIgNDbb/1/a2vgSfk/BXFVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059113; c=relaxed/simple;
	bh=UEjYN2lHg9SIUb5F193bgueHoD7APqo/HwVQqWus7+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1QB5g/Ze1lfHjS6K/4W+xTcWOenJlUV8p2DGCvfkmpwtxWsI076kuuNIysxBGCDjIRYSnl7Se4fzd0J2cqC9EiyE6ooAWHVAtUiAHJ7TzK/ZHIqrFy/9IOIPWgn9NPIbgYE/LDMMR1kqBVOzY6vbi/9Vu0M9FAlN6lEUcsxQ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PU7/IvFB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747059112; x=1778595112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UEjYN2lHg9SIUb5F193bgueHoD7APqo/HwVQqWus7+A=;
  b=PU7/IvFBHqpXUPFexQTniHr0dTI4K9dwY9wJm08K8r64xML0jINNAcHj
   0rJ/cvfRv/LDGBpmKA0rxYShhzuksXm2g3juEQMZMgIMTsltxXhB5ckGq
   1/G25rzTYazKQ3w/HEbNyjh7a2dR0K4rHU8/8WAL8yxUY7qALXME71lBt
   3Bs7Obewn8r7PY0Vj0UTKeNQ776lkGWSnedJw+V6TjkdIPmjmkMDpoN5u
   eIJoKlmejwEw9vbdGaK3v3HAQdqeZJ9tpqTiWqscYTsg4d5x3utHPdU+O
   IShL6Hob7yA//URHHCiomOLehrLrgAQf++pM1SvVg9FMe6WBpaVZHH79M
   g==;
X-CSE-ConnectionGUID: zoItyobdQEmzonUlC0pvHw==
X-CSE-MsgGUID: pGRAefCQR4W3gWkDajsueQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59490774"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="59490774"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:11:51 -0700
X-CSE-ConnectionGUID: 9IxtU5XxS0uqVpgod+GerA==
X-CSE-MsgGUID: 8TjpSW12T5uAGi1wHLcpXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="160646554"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:11:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uETsf-00000000vvN-3Fh5;
	Mon, 12 May 2025 17:11:45 +0300
Date: Mon, 12 May 2025 17:11:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu,
	GaryWang@aaeon.com.tw, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 08/12] gpio: aggregator: export symbols of the GPIO
 forwarder library
Message-ID: <aCIBoSi84NnwEA2s@smile.fi.intel.com>
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
 <20250506-aaeon-up-board-pinctrl-support-v5-8-3906529757d2@bootlin.com>
 <CAMuHMdXzU1k_JZ0UhUh33XCq_zpq6MBJgAjo9F9Cw4gckA12EQ@mail.gmail.com>
 <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c10b7752-cec5-483c-90a9-ada16aa0904a@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 12, 2025 at 04:08:35PM +0200, Thomas Richard wrote:
> On 5/9/25 11:07, Geert Uytterhoeven wrote:
> > On Tue, 6 May 2025 at 17:21, Thomas Richard <thomas.richard@bootlin.com> wrote:

...

> >> +int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
> >> +                       unsigned long config);
> >> +
> >> +int gpio_fwd_to_irq(struct gpio_chip *chip, unsigned int offset);
> > 
> > I would expect all of these to take gpiochip_fwd pointers instead of
> > gpio_chip pointers.  What prevents you from passing a gpio_chip pointer
> > that does not correspond to a gpiochip_fwd object, causing a crash?
> 
> Indeed nothing prevents from passing gpio_chip pointer which does not
> correspond to a gpiochip_fwd object.
> And it is also a bit weird to pass a gpiochip_fwd pointer in some cases
> (for example gpio_fwd_gpio_add()) and a gpio_chip in other cases.
> 
> I can keep GPIO operations as is, and create exported wrappers which
> take a gpiochip_fwd pointer as parameter, for example:
> 
> int gpiochip_fwd_get_multiple(struct gpiochip_fwd *fwd,
> 			      unsigned long *mask,
> 			      unsigned long *bits)
> {
> 	struct gpio_chip *gc = gpiochip_fwd_get_gpiochip(fwd);
> 
> 	return gpio_fwd_get_multiple_locked(chip, mask, bits);
> }
> EXPORT_SYMBOL_NS_GPL(gpiochip_fwd_get_multiple, "GPIO_FORWARDER");
> 
> So exported functions are gpiochip_fwd_*().

Sounds good for me. Let's wait for Geert's opinoin on this.

-- 
With Best Regards,
Andy Shevchenko



