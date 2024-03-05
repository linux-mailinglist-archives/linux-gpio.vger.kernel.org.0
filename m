Return-Path: <linux-gpio+bounces-4149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A750E8725E5
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 18:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B8428786C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 17:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8643517581;
	Tue,  5 Mar 2024 17:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jkKov7ee"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129AA17555
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 17:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709660825; cv=none; b=hjGc71MAZazeFO3/vxmE6dNrO28kvs/YFpvI+ZZGkRERnqNSQWkU0gsJL1jiKXqkvOufhS0Hc4CB3H0fysRis79qCFegPR1n+t74/hcs7fj6Q/9igcxBw6yoY1CZaLtLYGTSCmHppAEEhzhs63XUcE0kpBopPduvJYnqh/d2zdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709660825; c=relaxed/simple;
	bh=04F29AhQw0CjgB0l9kFU1sJ5Hn8Tghv1RAfhgF2DM8c=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=XXHgH1KI9a3ZHLNGfQ+3p9ePlZgDr5xg9J5USrhOhk/SYxbgVE+geRnFbzLaUJKGf1usIQQ+mf1jlTQxcbguwqM+a9xt25CNSSy8IZOryEG2veeRxo1IkxNwlcumAf3MZN+IaBodetaixCTGpiQKhJVZEFnQqGhwix630B43E+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jkKov7ee; arc=none smtp.client-ip=217.70.178.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id A6671C23AA
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 17:43:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73FED40002;
	Tue,  5 Mar 2024 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709660612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=khLDqNv9zyrjAOnkLM2FadzrfejYrOxiEj+klX7GIls=;
	b=jkKov7eeyOL7ROc7fiR5SiCdZWTcX4Ul3rrqcu9w2EzRw/QslCF61hDqIevAXo2GvXTryv
	UawA6IT0JezIMA5//zkW5N5mNfcvlgzThUGm4+tAv4lGcf4k3xk/LzjvThBSJuFPrch2SY
	n7jhMC/1W0YK5IIP0zWOBZ8csMSUb+TziLK8HQPd8GEhzBiq0BVhcu8ACDI+8611/7yXUM
	LfmsIKzf6keePyFqOiFcXowdc5XzSP9FTmY0/FlKzUaz/Et3jcXsz/UwEk1gaMv7uHaY0W
	Lm+40y5fdC/AcF3t4i56W5jKH6N02qxlEpJwISE7WH8gJuWfNoOuIrKndyMS8A==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 18:43:32 +0100
Message-Id: <CZM03ULBP9DK.3DYK068X1B4UU@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH] gpio: nomadik: Back out some managed resources
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, <linux-gpio@vger.kernel.org>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>, "Linus Walleij"
 <linus.walleij@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240305-fix-nomadik-gpio-v1-1-73162e3a388e@linaro.org>
 <CAHp75VdoRQvPhgcV1vP5FzhywqPhzzfFwmDQ9d2LtDYfQr-WQg@mail.gmail.com>
In-Reply-To: <CAHp75VdoRQvPhgcV1vP5FzhywqPhzzfFwmDQ9d2LtDYfQr-WQg@mail.gmail.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Tue Mar 5, 2024 at 6:05 PM CET, Andy Shevchenko wrote:
> On Tue, Mar 5, 2024 at 10:26=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > Several commits introduce managed resources (devm_*) into the
> > nmk_gpio_populate_chip() function.
> >
> > This isn't always working because when called from the Nomadik pin
> > control driver we just want to populate some states for the device as
> > the same states are used by the pin control driver.
> >
> > Some managed resources such as devm_kzalloc() etc will work, as the
> > passed in platform device will be used for lifecycle management,
> > but in some cases where we used the looked-up platform device
> > for the GPIO block, this will cause problems for the combined
> > pin control and GPIO driver, because it adds managed resources
> > to the GPIO device before it is probed, which is something that
> > the device core will not accept, and all of the GPIO blocks will
> > refuse to probe:
> >
> > platform 8012e000.gpio: Resources present before probing
> > platform 8012e080.gpio: Resources present before probing
> > (...)
> >
> > Fix this by not tying any managed resources to the looked-up
> > gpio_pdev/gpio_dev device, let's just live with the fact that
> > these need imperative resource management for now.
>
> ...
>
> > -       clk =3D devm_clk_get_optional(gpio_dev, NULL);
> > +       /* NOTE: do not use devm_ here! */
> > +       clk =3D clk_get_optional(gpio_dev, NULL);
> >         if (IS_ERR(clk)) {
> >                 platform_device_put(gpio_pdev);
> >                 return (void *)clk;
>
> > -       reset =3D devm_reset_control_get_optional_shared(gpio_dev, NULL=
);
> > +       /* NOTE: do not use devm_ here! */
> > +       reset =3D reset_control_get_optional_shared(gpio_dev, NULL);
> >         if (IS_ERR(reset)) {
> > -               dev_err(&pdev->dev, "failed getting reset control: %ld\=
n",
> > +               dev_err(dev, "failed getting reset control: %ld\n",
> >                         PTR_ERR(reset));
> >                 return ERR_CAST(reset);
> >         }
> > @@ -588,7 +594,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct=
 fwnode_handle *fwnode,
> >          */
> >         ret =3D reset_control_deassert(reset);
> >         if (ret) {
> > -               dev_err(&pdev->dev, "failed reset deassert: %d\n", ret)=
;
> > +               dev_err(dev, "failed reset deassert: %d\n", ret);
> >                 return ERR_PTR(ret);
> >         }
>
> Yeah, but you forgot to update the error path as it needs to unroll
> the changes, no?

About error cases: platform_device_put() calls are missing from the last
two error cases (reset-related).

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


