Return-Path: <linux-gpio+bounces-12807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ABD9C390C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 08:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E772811C9
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 07:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4137157A5A;
	Mon, 11 Nov 2024 07:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sr+Zs7Z/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BA7E545;
	Mon, 11 Nov 2024 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731310309; cv=none; b=fCF2yyE+yZHTxE3zuDBHZ0D2xxSPvRvJ8A5a6mux8StxfOIpsWM5tIESm15hfVZiobPjO/+w+1Of+Gg0HiCraaccySniwHdAIZ2BYexYeDcxno1USIZLiyyakCd85/77M08RLkivlgFxlTALmAz/Jni4WRT+OzJei9DGZgQ+hXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731310309; c=relaxed/simple;
	bh=SXzhXfPE+Qx72rA8T0X23owjGP3zy9X4bJ0lEmi/M3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcFE9y+rnw17Y6Bk4Zo9EVsQw8hnO1Dqu8Jn7ylGFPtXit47hKlZuHmBQXaXpmGK+qLEZKSdAdLlztVG8IDqgNYyTkHnnK1cHhjAOvFIrEqOx+ajSDV7L8o3JUPA5ClEdOSZsALWxD5vPcMozFVrfmeRS/5qH7LvHNIKTmZnbf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sr+Zs7Z/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731310308; x=1762846308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SXzhXfPE+Qx72rA8T0X23owjGP3zy9X4bJ0lEmi/M3Q=;
  b=Sr+Zs7Z/8vVlNWVgbqbSNKSB7kzX7gjYIgfTI6z8CXPXyGIPmy+gVNA/
   DAdNcxW6RqDTwRCkQ9fe/I2+ZohAi7SWdCQbnD8esMMTslqwzlQE3E443
   tNv2uDjv5CYI/U3/+ZRGXecAx9RTKRcoHBBLRUvlh62fH/+jOynaX0+AS
   zLQl5VQ+sba6Au8jHXAfMXms8jQqCv3ZO7m5gkRqmeCGtwBMnwEpAKtqG
   2uu4nB3DLx8r0mcTRWLhlzwIUoXVE69MkRPa7x9CA+JOJtIW4AMX6Is89
   S2Iq9689DB6Eumn5QdbhogBSDGXT0UBBlefwJ79oXAO1ly5v3H2QzuYIS
   Q==;
X-CSE-ConnectionGUID: c/4UcSNdRHKtYNlV9KRQFg==
X-CSE-MsgGUID: 0GIrVh7FQdWl8mhYWU5F3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="41719572"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="41719572"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:31:47 -0800
X-CSE-ConnectionGUID: 1wF9bTkqS6ep9vgbqng2bg==
X-CSE-MsgGUID: EoccRMIkS2OIbniMG4nl0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="86538133"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 23:31:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAOte-0000000DVuj-3MD3;
	Mon, 11 Nov 2024 09:31:38 +0200
Date: Mon, 11 Nov 2024 09:31:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 4/6] pcmcia: soc_common: Avoid using GPIOF_ACTIVE_LOW
Message-ID: <ZzGy2huB-l4PYNUV@smile.fi.intel.com>
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com>
 <20241104093609.156059-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdYF-_6vb3SsJ9EHh1mCbqeW5=qoYkLF7Re+XyGq36OJSg@mail.gmail.com>
 <Zy3NXXFFw4l-vfvr@smile.fi.intel.com>
 <Zy8Dz7v2cGdGOPLj@shine.dominikbrodowski.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zy8Dz7v2cGdGOPLj@shine.dominikbrodowski.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Nov 09, 2024 at 07:40:15AM +0100, Dominik Brodowski wrote:
> Am Fri, Nov 08, 2024 at 10:35:41AM +0200 schrieb Andy Shevchenko:
> > On Fri, Nov 08, 2024 at 09:28:19AM +0100, Linus Walleij wrote:
> > > On Mon, Nov 4, 2024 at 10:36 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > 
> > > > Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > Looks right to me, some testing would be even better
> > > because I never trust these flags to get right.
> > 
> > I also would like to have this, but seems the only odd fixer was active ca.
> > 2023 last time, I'm not sure we may hear from Dominik in time, otherwise the
> > series will be postponed for unknown period of time, which I do not prefer,
> > rather I will fix any regressions later (but I doubt there are here).
> 
> As I don't have such hardware, I cannot help with testing, but from the
> PCMCIA point of view:
> 
> 	Acked-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks for chiming in!

-- 
With Best Regards,
Andy Shevchenko



