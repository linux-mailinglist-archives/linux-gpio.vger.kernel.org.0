Return-Path: <linux-gpio+bounces-16794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F84A496C9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 11:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91EC316C767
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9076225D8FD;
	Fri, 28 Feb 2025 10:11:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4EE25BAC9;
	Fri, 28 Feb 2025 10:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740737464; cv=none; b=WlmXRO1MOML3xKeJiNGEVDvGJDsuYyRyGrUQozTa9yzPWF1dxkpq5V6INvn7ksvKA/nkdeH3PBVZ6V8R/xl87jIiHZ5j0Fx29Wdgi7r01GJXrmr7cKj9yqIE5s3kbp62C6tB9uHJVM1kgxry0i3GxYwZHESRA0bsvSVtkPJiaZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740737464; c=relaxed/simple;
	bh=bZincy8IQtpp48xIeSYrIpThQT8WWHr6JB5Sd1KtJbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ae+aVowtA+tIZaPZ4tqnrvrncPFJK8MF5UmfI2kncNIglYIjLOWm2qxu0S9JcWbwtZdxpE+cyivwsvVv6a1UdzQV1r9wOGFJgKTQNYg0lh9g4sNG0M8BEnvWv9qeVJXuTrf/1oXEDl7npfy62fBO5OwvHNE/iFRmT/23Qxd0oHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EEAAD343132;
	Fri, 28 Feb 2025 10:10:54 +0000 (UTC)
Date: Fri, 28 Feb 2025 10:10:50 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] gpiolib: support parsing gpio three-cell interrupts
 scheme
Message-ID: <20250228101050-GYA52883@gentoo>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-2-4ae4d91baadc@gentoo.org>
 <CACRpkdZ1X5kF-AyRBg9BYMiJscv0v-SGzcdetS0XDK3oPSu9QQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ1X5kF-AyRBg9BYMiJscv0v-SGzcdetS0XDK3oPSu9QQ@mail.gmail.com>

Hi Linus Walleij:

On 10:11 Fri 28 Feb     , Linus Walleij wrote:
> Hi Yixun,
> 
> thanks for working so hard on this!
> 
> I'm really happy to see the threecell support integrated into gpiolib.
> 
> On Thu, Feb 27, 2025 at 12:25 PM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > kernel/irq/irqdomain.c:556: if (h->ops->select && bus_token != DOMAIN_BUS_ANY)
> >
> > so vendor gpio driver need to explicitly set bus_token, something like:
> >
> > drivers/gpio/gpio-spacemit-k1.c
> >   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > I hope this is a feasible way..
> 
> Yes this looks fair, I think you can put the description into the
> commit message.
> 
ok, will do
> >         /* We support standard DT translation */
> > -       if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> > +       if (is_of_node(fwspec->fwnode) && fwspec->param_count <= 3)
> >                 return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> > -       }
> 
> This looks good.
> 
> > +static int gpiochip_irq_select(struct irq_domain *d, struct irq_fwspec *fwspec,
> > +                       enum irq_domain_bus_token bus_token)
> > +{
> > +       struct fwnode_handle *fwnode = fwspec->fwnode;
> > +       struct gpio_chip *gc = d->host_data;
> > +       unsigned int index = fwspec->param[0];
> > +
> > +       if ((gc->of_gpio_n_cells == 3) && gc->of_node_instance_match)
> > +               return gc->of_node_instance_match(gc, index);
> 
> We need to hide the OF-specific things into gpiolib-of.c|h so systems
> not using OF does not need to see it.
> 
> Something like:
> 
> if (fwspec->param_count == 3) {
>      if (is_of_node(fwnode))
>          return of_gpiochip_instance_match(gc, index);
>     /* Add other threeparam handlers here */
not sure if non OF-specific driver will also support threecells mode?
we probably can adjust when it really does, so now I would simply make it

if (fwspec->param_count == 3 && is_of_node(fwnode))
	return of_gpiochip_instance_match(gc, index);

> }
> 
> Then add of_gpiochip_instance_match() into gpiolib-of.h as a
> static inline (no need to an entire extern function...)
> 
> static inline bool of_gpiochip_instance_match(struct gpio_chip *gc, int index)
> {
>     if ((gc->of_gpio_n_cells == 3) && gc->of_node_instance_match)
>               return gc->of_node_instance_match(gc, index);
> }
> 
> And also an empty stub for !CONFIG_OF_GPIO so we get this compiled
> out if OF is not configured in.
> 
ok, I got your idea, thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

