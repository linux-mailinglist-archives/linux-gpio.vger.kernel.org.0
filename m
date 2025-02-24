Return-Path: <linux-gpio+bounces-16521-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0CBA42DB0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 21:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49573173FF7
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 20:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D98B241698;
	Mon, 24 Feb 2025 20:25:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF321DE4D3
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 20:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428752; cv=none; b=i5IRg2ZJc7JVnG5QwoBkFk/5VTEicmAF4WBBH54JXKJ61M7BK/hsEWjJ7dGlXu4gHDMSoPfi1IrBPsFo7jAMKgNNiIDwuXOPg63YRT31NsO0cbrnAUfV1WjHrjb3ShQGBjgki9L8NoYl1BQXOsV6Cs7kHC25vamU6YNa1GcDWCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428752; c=relaxed/simple;
	bh=lSOhfgM9aqjP7uFmcecoJ5HzRf8wsz0vaLN16X+Vsy8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYZj4L6rOiopaa5fJoTjnb41blLVgHrJ6g7yl9YF3OhcNtnpFT8lkuOcI54dCWeN27sYK2ku1ASXJBwQXe1jYy5BpfvryQIqpgli9HtCMCsX5a1303+WBREBbPdGLAhqSnDwLuM32ZGTjF71f3uj/QaNIbYYZH+nkOy29P5VKjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 80914f8f-f2ed-11ef-9d7a-005056bd6ce9;
	Mon, 24 Feb 2025 22:25:35 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 24 Feb 2025 22:25:34 +0200
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 8/8] gpiolib: sanitize the return value of
 gpio_chip::get_direction()
Message-ID: <Z7zVvgcEeWnYr9vZ@surfacebook.localdomain>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <20250210-gpio-sanitize-retvals-v1-8-12ea88506cb2@linaro.org>
 <Z7yfTggRrk3K6srs@black.fi.intel.com>
 <CAMRc=Md-bMUEKgF7srLFqwdetDcTDB-0YzrisccQmReDs-Ndvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md-bMUEKgF7srLFqwdetDcTDB-0YzrisccQmReDs-Ndvg@mail.gmail.com>

Mon, Feb 24, 2025 at 08:55:26PM +0100, Bartosz Golaszewski kirjoitti:
> On Mon, Feb 24, 2025 at 5:33 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
> > On Mon, Feb 10, 2025 at 11:52:02AM +0100, Bartosz Golaszewski wrote:

...

> > > +static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
> > > +{
> > > +     int ret;
> > > +
> > > +     lockdep_assert_held(&gc->gpiodev->srcu);
> > > +
> > > +     if (WARN_ON(!gc->get_direction))
> > > +             return -EOPNOTSUPP;
> > > +
> > > +     ret = gc->get_direction(gc, offset);
> > > +     if (ret > 1)
> >
> > Would it be better to use the respective GPIO*... macro instead of 1?
> >
> 
> I did consider it but I don't like comparing against enums, it doesn't
> feel right as the value behind the name can change. I think I prefer
> it like this even if it's not the best solution either. Maybe we could
> be more explicit and say:
> 
>     if (!(ret == IN || ret == OUT || ret < 0)
> 
> ?

Yep, I like this.

-- 
With Best Regards,
Andy Shevchenko



