Return-Path: <linux-gpio+bounces-7841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2C691D7E6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 08:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50151F22A21
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 06:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E067241C85;
	Mon,  1 Jul 2024 06:12:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D0333FE;
	Mon,  1 Jul 2024 06:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.37.255.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719814355; cv=none; b=sIDzSBmLCFkFfJSP0+/L309u5CbA1M6PdO253aMl2pPhU8E0UuzSwMqgWGV4OJ3/CTeNwS0F/Pd+YWAFbBDrzqypHaS8SEhnJcfzuGKAxCQEdaEiYbLYgUzzpm1q/oD+UE4SjrKN0KGUsk8JBJDPk8I7dR1rph4Ux7lcxvpUTf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719814355; c=relaxed/simple;
	bh=leRdL9TIL27DeazUKkscwZ4eVccvWI29q1x4++5ggTU=;
	h=MIME-Version:Content-Type:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID; b=FWgusiSQOQ1rCV0S00x2ReY2kjhDgLdtKQEALaMlxLIxeRmpITKW92J7i/oJhsSl4cYe0vgJraFkNo6BwCbVQAKNzjgF1g9vMhA7kpbSqWDFQT75BYqhAnyToN9HtlWP+DrBM41Ld4iBUNjjNwqmfoMzLrrikT+9aZ9Gp1LCUOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de; spf=pass smtp.mailfrom=dev.tdt.de; arc=none smtp.client-ip=194.37.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=0926ff46b5=ms@dev.tdt.de>)
	id 1sOAGx-002Ih1-QJ; Mon, 01 Jul 2024 08:12:19 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1sOAGx-0081tm-0F; Mon, 01 Jul 2024 08:12:19 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id B005B240053;
	Mon,  1 Jul 2024 08:12:18 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 2FFDB240050;
	Mon,  1 Jul 2024 08:12:18 +0200 (CEST)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id 9AF8538201;
	Mon,  1 Jul 2024 08:12:17 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 01 Jul 2024 08:12:17 +0200
From: Martin Schiller <ms@dev.tdt.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Hauke Mehrtens <hauke@hauke-m.de>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: of: fix lookup quirk for MIPS Lantiq
Organization: TDT AG
In-Reply-To: <Zn8CZ47e3LFncrDP@google.com>
References: <Zn8CZ47e3LFncrDP@google.com>
Message-ID: <6e07aee09188e241b79e141c532b632b@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate-ID: 151534::1719814339-81CB1642-F0BC8056/0/0
X-purgate: clean
X-purgate-type: clean

On 2024-06-28 20:35, Dmitry Torokhov wrote:
> As it turns out, there is a large number of out-of-tree DTSes (in
> OpenWrt project) that used to specify incorrect (active high) polarity
> for the Lantiq reset GPIO, so to keep compatibility while they are
> being updated a quirk for force the polarity low is needed. Luckily
> these old DTSes used nonstandard name for the property ("gpio-reset" vs
> "reset-gpios") so the quirk will not hurt if there are any new devices
> that need inverted polarity as they can specify the right polarity in
> their DTS when using the standard "reset-gpios" property.
> 
> Additionally the condition to enable the translation from standard to
> non-standard reset GPIO property name was inverted and the replacement
> name for the property was not correct. Fix this as well.
> 
> Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines
> with legacy bindings")
> Fixes: 90c2d2eb7ab5 ("MIPS: pci: lantiq: switch to using gpiod API")
> Reported-by: Martin Schiller <ms@dev.tdt.de>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 59c7f8a2431a..d21085830632 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -203,6 +203,16 @@ static void of_gpio_try_fixup_polarity(const
> struct device_node *np,
>  		 */
>  		{ "qi,lb60",		"rb-gpios",	true },
>  #endif
> +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
> +		/*
> +		 * According to the PCI specification, the RST# pin is an
> +		 * active-low signal. However, most of the device trees that
> +		 * have been widely used for a long time incorrectly describe
> +		 * reset GPIO as active-high, and were also using wrong name
> +		 * for the property.
> +		 */
> +		{ "lantiq,pci-xway",	"gpio-reset",	false },
> +#endif
>  #if IS_ENABLED(CONFIG_TOUCHSCREEN_TSC2005)
>  		/*
>  		 * DTS for Nokia N900 incorrectly specified "active high"
> @@ -512,9 +522,9 @@ static struct gpio_desc
> *of_find_gpio_rename(struct device_node *np,
>  		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
>  		{ "reset",	"reset-n-io",	"mrvl,nfc-uart" },
>  #endif
> -#if !IS_ENABLED(CONFIG_PCI_LANTIQ)
> +#if IS_ENABLED(CONFIG_PCI_LANTIQ)
>  		/* MIPS Lantiq PCI */
> -		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },
> +		{ "reset",	"gpio-reset",	"lantiq,pci-xway" },
>  #endif
> 
>  		/*
> --
> 2.45.2.803.g4e1b14247a-goog

Acked-by: Martin Schiller <ms@dev.tdt.de>

