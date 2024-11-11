Return-Path: <linux-gpio+bounces-12818-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AAA9C3B70
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 10:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 768611C22430
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 09:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F5E16F265;
	Mon, 11 Nov 2024 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbnWku3I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E7514600D;
	Mon, 11 Nov 2024 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731319019; cv=none; b=DgNauHqiHg4nxNzaHMX6WESgCbtlJ5nLKhsVnSC0pabTsiOGLFAwIteqYs1cXXsWF3Roma4JUewyEu6mXnt7+JyzelHl7dxk8Ymz6jMglQfCMIk+Lqll4S4GvROuRNcG7cisHqw6S5UMZ1TtOtPeZ21hadY6OYpXCOrgmLyPQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731319019; c=relaxed/simple;
	bh=2GK5P7SlkHJ5glis3DlufjM73mrDrFvZT6cGKqNJrkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xegx0Fvf/47YtYWJxCRVN28XuohIQhfnBb3zXmWOIh89bkZnv9Up64Ax4b8LcJddApW0AiwQ5Ynb3MLtxrBN31pHGnnBPjJPhCaXLosoIflVU1ef2OBppzhlg7mVGZDB+Ch9PM04htpOh5UTMjrJLlR8swOwjSMybA/K2HXhKoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbnWku3I; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731319018; x=1762855018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2GK5P7SlkHJ5glis3DlufjM73mrDrFvZT6cGKqNJrkA=;
  b=NbnWku3IzQBxhHuK7WxAcNIeW0DK0VkknwDUsi/ro6Qfgvuf1pLzXdFV
   IRpt1rup3QuVwZ2oSmAwSN44K2BaA8d8CsN28hdCvN+oiyW4y69Ba3BEe
   CyaKGIT9dx0fT1DdwxWo0lYaPUrkgj9lwbUrh343BsjRe5Xj9ng99JJot
   B6kspaRB6Kz24Q/p1yszV8VZCmHuzRJQixZQtvjYkFhsomOjgmnGpaHoW
   eDq3ktyry0+5P3yxgWFS8oYbQ5FEDP0POxlXCqjBA7Mz8F7QAJ8zUnBbk
   azUHg726sSCugD2mAAc6axLHD4NL9+K7ob884w4t8yxlSVUvy8LOLC6mg
   A==;
X-CSE-ConnectionGUID: rsi94sKJRMKeBKzuAV0gLw==
X-CSE-MsgGUID: helcDn+jSVmYo99bRbOYvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30532388"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="30532388"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:56:57 -0800
X-CSE-ConnectionGUID: WMCZLN+uRM6Tq56sdPrgOA==
X-CSE-MsgGUID: duWXw3rnTBmNKkmytjfRPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86787521"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 01:56:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tARA9-0000000DYBD-2fgv;
	Mon, 11 Nov 2024 11:56:49 +0200
Date: Mon, 11 Nov 2024 11:56:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 3/6] leds: gpio: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <ZzHU4absCxcA1FBG@smile.fi.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-4-andriy.shevchenko@linux.intel.com>
 <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXx6hYsdKo-5sw+-vH7GOJYWn_de=wSvhj1QVVpbwCN7Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 11, 2024 at 10:45:13AM +0100, Geert Uytterhoeven wrote:
> On Mon, Nov 4, 2024 at 10:37 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > -       if (template->active_low)
> > -               flags |= GPIOF_ACTIVE_LOW;
> > -
> > -       ret = devm_gpio_request_one(dev, template->gpio, flags,
> > +       ret = devm_gpio_request_one(dev, template->gpio, GPIOF_OUT_INIT_LOW,
> >                                     template->name);
> 
> Just wondering, as I am not 100% sure: can this change change the
> initial state of the GPIO?

You probably wonder how ACTIVE_LOW affects the OUT_INIT_LOW given above.
I have an answer to you, however I might be mistaken as well, but I spent some
time to investigate.

The above mentioned call ends up in the gpiod_direction_output_raw_commit() which
uses the value (low in this case) as an absolute value. It does not include the
ACTIVE_LOW in the value calculations. Hence, setting ACTIVE_LOW before or afterwards
has no effect on the existing flow.

If you notice a mistake, please elaborate this, so I can fix the approach!

> >         if (ret < 0)
> >                 return ERR_PTR(ret);

...

> > +       if (template->active_low ^ gpiod_is_active_low(gpiod))
> > +               gpiod_toggle_active_low(gpiod);
> > +

-- 
With Best Regards,
Andy Shevchenko



