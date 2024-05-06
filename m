Return-Path: <linux-gpio+bounces-6172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE68BD642
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 22:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7589FB20A66
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 20:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0A0156657;
	Mon,  6 May 2024 20:31:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A877B15250A
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715027473; cv=none; b=KGleh6aSsMM65rgFpIY76x/+jMLR2gOArvA+Pr+e79b/ukWxDsJHYx9cuJn4mFzvBJiQe3/DkYYTgDiCE1CpatnIq8wgS2S9BvSRGfVpZ0XlV2khIEZIvD6qMHo3yPn38xCQbgnjXcgbZpZoQChxBZZYXE0qRlEWitAhqDUb+7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715027473; c=relaxed/simple;
	bh=zcnQhbQVwA8JxAlY3Baxa7htpzNVYXsQyYzsvW4vChw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mR2rT5z7Zz89i/N0y5c6DDl6lJttM6Mw+r3M/FHlX/Ixk2DUqgn1TBYvLbKYYrncHcT+rofGizVP34uXKFkskRP4/U3UYT2DgrS0TrZC7moAiBiSGp/GltTeEuF2zNFzL3lQ8HY7x6Wpr0aZtzdbfO/V+jKfb3xNMx50ILVMeUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 91d287b0-0be7-11ef-b972-005056bdfda7;
	Mon, 06 May 2024 23:31:09 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 23:31:07 +0300
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Phil Elwell <phil@raspberrypi.com>,
	Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH V2] pinctrl: bcm2835: Make pin freeing behavior
 configurable
Message-ID: <Zjk-C0nLmlynqLAE@surfacebook.localdomain>
References: <20240503062745.11298-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503062745.11298-1-wahrenst@gmx.net>

Fri, May 03, 2024 at 08:27:45AM +0200, Stefan Wahren kirjoitti:
> Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
> So in case it was configured as GPIO_OUT before the configured output
> level also get lost. As long as GPIO sysfs was used this wasn't
> actually a problem because the pins and their possible output level
> were kept by sysfs.
> 
> Since more and more Raspberry Pi users start using libgpiod they are
> confused about this behavior. So make the pin freeing behavior of
> GPIO_OUT configurable via module parameter. In case
> pinctrl-bcm2835.persist_gpio_outputs is set to 1, the output level is
> kept.
> 
> This patch based on the downstream work of Phil Elwell.

...

> +static bool persist_gpio_outputs;
> +module_param(persist_gpio_outputs, bool, 0644);

Do you need 'w' attribute?

...

> +	dev_info(dev, "GPIO_OUT persistence: %s\n",
> +		 persist_gpio_outputs ? "yes" : "no");

str_yes_no() and with it can be put on a single line.

-- 
With Best Regards,
Andy Shevchenko



