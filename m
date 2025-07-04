Return-Path: <linux-gpio+bounces-22806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966CAF94EA
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 16:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7A653AB8F7
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 14:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B221547EE;
	Fri,  4 Jul 2025 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="W4RmNA2s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09714273F9;
	Fri,  4 Jul 2025 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637802; cv=none; b=KBDul8koS+weuyu5xVW554RvvsiZ/cwcElRyJKsb0kJUAw/4xK8W6Os9eXSq8rmGlibT0Qgg53nl+vqO2BHgoppqSsmABpQ2sSf7be30Vjoyqu+TgRZR05ySIIs5mc1oNXIlG7Lbw6+Ut2NosdZdjPkAZE6AdyPeHpEncrX2sjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637802; c=relaxed/simple;
	bh=MIkKO3ROEAcvFmZbM08D9Naq8WPWPvTABFHJbqIruaI=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=qpz9wpFaautWRfQtYXY8qLgBtBAWBpkswNLhgSZYvNZy1BJUMf9kNsUspQzE3Yr0AbqeqmLQZo2PlnZf+UbKsP3e4FJoJ4OCoiKIuoEWW2ob+7wtREEzSklXxJKj8+Qr7U79OTr+w/D8elz2Q/EZSTJIMJehEKWjWfBiuBRkdvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=W4RmNA2s; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=ptAkVOvHyjTU5vzUWd4lQ7vWlCuqotN7mv/qbmEOs8s=; b=W4RmNA2smiG/nfQ7Vj3oPjaqAg
	8bEXTVD8+p6M3o9TiOnJkv5OSt4vIIK37GkX7D5kafwuigL9v0Y3zyOGBecedhm4n0HNNP/toeFpZ
	E0R2dGS5LXd5EZhPNe3kl0n5I0fq1BIPiIE6lhjRbP9BdTg5QwfsbIxAatxXOTqsXShg=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:33412 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uXh0Q-0002kj-QQ; Fri, 04 Jul 2025 10:03:11 -0400
Date: Fri, 4 Jul 2025 10:03:09 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, stable@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <20250704100309.efe7a82ac66fd43fedc09ef6@hugovil.com>
In-Reply-To: <CAMRc=MdP5BMVF0p5W9qSRZuPKBa0YCTxB-gLQWT_r0hBp+8ksA@mail.gmail.com>
References: <20250703191829.2952986-1-hugo@hugovil.com>
	<CAMRc=MdP5BMVF0p5W9qSRZuPKBa0YCTxB-gLQWT_r0hBp+8ksA@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.3 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] gpiolib: fix efficiency regression when using
 gpio_chip_get_multiple()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

Hi Bartosz,

On Fri, 4 Jul 2025 10:26:58 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Thu, Jul 3, 2025 at 9:18 PM Hugo Villeneuve <hugo@hugovil.com> wrote:
> >
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > commit 74abd086d2ee ("gpiolib: sanitize the return value of
> > gpio_chip::get_multiple()") altered the value returned by
> > gc->get_multiple() in case it is positive (> 0), but failed to
> > return for other cases (<= 0).
> >
> > This may result in the "if (gc->get)" block being executed and thus
> > negates the performance gain that is normally obtained by using
> > gc->get_multiple().
> >
> > Fix by returning the result of gc->get_multiple() if it is <= 0.
> >
> > Also move the "ret" variable to the scope where it is used, which as an
> > added bonus fixes an indentation error introduced by the aforementioned
> > commit.
> 
> Thanks, I queued it for fixes. I typically keep local variables at the
> top of the function (just a personal readability preference) but since
> this function already has scope-local variables, let's do it. What is
> the indentation error you're mentioning exactly?

Ok, I was under the assumption that having local-scope variables was the preferred approach in the kernel, as I sometimes see patches just for fixing variables scope. If it is something specific to the GPIO subsystem, no problem.

The ret variable was indented ok, but an empty line with spaces was introduced just after it.

Thanks for applying the patch.

Hugo.


> > Fixes: 74abd086d2ee ("gpiolib: sanitize the return value of gpio_chip::get_multiple()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  drivers/gpio/gpiolib.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index fdafa0df1b43..3a3eca5b4c40 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -3297,14 +3297,15 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
> >  static int gpio_chip_get_multiple(struct gpio_chip *gc,
> >                                   unsigned long *mask, unsigned long *bits)
> >  {
> > -       int ret;
> > -
> >         lockdep_assert_held(&gc->gpiodev->srcu);
> >
> >         if (gc->get_multiple) {
> > +               int ret;
> > +
> >                 ret = gc->get_multiple(gc, mask, bits);
> >                 if (ret > 0)
> >                         return -EBADE;
> > +               return ret;
> >         }
> >
> >         if (gc->get) {
> >
> > base-commit: b4911fb0b060899e4eebca0151eb56deb86921ec
> > --
> > 2.39.5
> >
> 


-- 
Hugo Villeneuve <hugo@hugovil.com>

