Return-Path: <linux-gpio+bounces-4134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0A48719CA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 10:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B8131C20C5B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 09:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C130E52F81;
	Tue,  5 Mar 2024 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hOhBwc0h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA3310A1B
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631783; cv=none; b=fT+kbPsle/HjhiSMrQ1GTATFsgqihTnTaOIZaq6VHWeDY4B+FiFHPgieWJn4TTN/v1wFjM+S1YaPrMRLmKI7xYoYgDD77Hntemh03TIYm82rzTFvNfUdpSdnlicRAIblUViB7IyLemKIE7+A6Kwd5iiKIhCRdLE8GYgcxyOoikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631783; c=relaxed/simple;
	bh=JRpiVC5KjE2ezI5QWGnhRymRE+3VHT5n2GMyzUrsfrk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UkGgsQVSr7zJPhXgqakENuHYo9auTD6ObXA/yOtpI1385oLKwjgQH8eqJwjyuoUPBbUwGmor0LsuIqIZd8OmT9bSdRBTnQQgQTy45ly1ev+FOPn10Jns7DLcu4lDvxMHwKI8nb8qg11X2fo7yL33mk+h2sXGi35KrYYCiwl1W6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hOhBwc0h; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 889691BF20F;
	Tue,  5 Mar 2024 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709631778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRpiVC5KjE2ezI5QWGnhRymRE+3VHT5n2GMyzUrsfrk=;
	b=hOhBwc0h49qMmYVc4d2C/tKIrRRZtGkou4U2fROgy+hms19g9tphFxMyF5pmwfUQw4/Fry
	YEfOjSrJqssrO1kGv5zBGgfn1FKj7W/gv2cR/ju7nJWgs93XL1ssARGJLZjaDgTbvxleEO
	jHmn8IzNZLErYn4kc5H08c0fge1X87QQJrjEJO3kY5nU5ZvIqVGzraT8K6OUvMne6q8+bG
	HgYPZnOqLjzmGQ8TtcUiYr2RdiC4KHDtIEDb8ivwMaRQa0RaqwF3DAdfR6pN2kihhE6yWK
	B7knKRprvhrTCorYki/3xuVqVM4xMipFk5W15oNwAusLBCGO8wnjeWPM2JEGjg==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 10:42:58 +0100
Message-Id: <CZLPVWGIVG99.2DX2ZTGMOSVS5@bootlin.com>
Subject: Re: [PATCH] gpio: nomadik: Back out some managed resources
Cc: <linux-gpio@vger.kernel.org>
To: "Linus Walleij" <linus.walleij@linaro.org>, "Bartosz Golaszewski"
 <brgl@bgdev.pl>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Andy
 Shevchenko" <andy.shevchenko@gmail.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.15.2
References: <20240305-fix-nomadik-gpio-v1-1-73162e3a388e@linaro.org>
In-Reply-To: <20240305-fix-nomadik-gpio-v1-1-73162e3a388e@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Tue Mar 5, 2024 at 9:26 AM CET, Linus Walleij wrote:
> Several commits introduce managed resources (devm_*) into the
> nmk_gpio_populate_chip() function.
>
> This isn't always working because when called from the Nomadik pin
> control driver we just want to populate some states for the device as
> the same states are used by the pin control driver.
>
> Some managed resources such as devm_kzalloc() etc will work, as the
> passed in platform device will be used for lifecycle management,
> but in some cases where we used the looked-up platform device
> for the GPIO block, this will cause problems for the combined
> pin control and GPIO driver, because it adds managed resources
> to the GPIO device before it is probed, which is something that
> the device core will not accept, and all of the GPIO blocks will
> refuse to probe:
>
> platform 8012e000.gpio: Resources present before probing
> platform 8012e080.gpio: Resources present before probing
> (...)
>
> Fix this by not tying any managed resources to the looked-up
> gpio_pdev/gpio_dev device, let's just live with the fact that
> these need imperative resource management for now.
>
> Drop in some notes and use a local *dev variable to clarify the
> code.
>
> Cc: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> Fixes: 12410e95903c ("gpio: nomadik: use devm_platform_ioremap_resource()=
 helper")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks Linus for this follow-up. Makes complete sense. Tested on
Mobileye hardware.

This nmk_gpio_populate_chip() function being called by two different
platform drivers makes for a complex setup. I should have been more
wary when modifying it.

Tested-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Regards,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


