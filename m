Return-Path: <linux-gpio+bounces-12571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E501B9BD1D7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 17:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA0982855DE
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 16:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B8917837F;
	Tue,  5 Nov 2024 16:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="P/tXaSv9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D415EFB9;
	Tue,  5 Nov 2024 16:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823081; cv=none; b=fWxfGBRYGS4U/BRedhTrG3Az0HXPH8pM2dh/73e9cWUZ1sUbeVg8z9CmCQ1XJ+POgDicdERqF8TcbdkoUmYdN9ZZytGce+1n5cciZQnfYZLT4k/45DeRtW9RULYb4PnYGS1CSb0DxefGZt79k3c72QTXfqTDV/D+28Zhta4WMBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823081; c=relaxed/simple;
	bh=eqfLL2rUrbBIr1kNrvJeMhwEExJR4u5NnJbj0jMKA/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CtDCmLzuhbJmt6ZzALTTD97NdsaLmzWXlF+0R6bkR035yGuroSG79NpqcRwYlExN/pNM9Nn18EDMfTjBfRO2HqMXLS05DamI9KHLoymv+20DoZjBrB2QDHUWYRTJqcGSzuRojcn+ylz6cr/fOZ37uDYYBGOevXQ2MrZbZlauMyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=P/tXaSv9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UUlPSBaOC9d+zd+83UAmHf4D5WXCkU2ZNOnKm544xr0=; b=P/tXaSv90nk6bdipbMTMj/vRGt
	IDM6BNLW6i0VuzErzDEVBN9hV9vpg1mk49x1B86HjXEMDYd2KbpWOJCbfKSBC+0MqwPhZ+Re1MFVl
	DLX3kutygIT+jIff8xJl1amvNNYrdugI58Avp4IfEuUjO5HHY7jTIFKMChmpCI8itX27ZSTxSS8JK
	dHIlxB3WJt5DNgkyGFnjqn8ZcprfNgqQ095Dn78bln92O8zW5Q1w3lf5Il+GKH1TkQ58iUgrDv1xw
	gFBTILN0O/GdxXUTjJ7uEYb0HlOdbVaaLnm3CRHpeNACeL0NUksu9xJ29unzDHxm2MSobs4bduzNi
	IvQLbzKg==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t8M92-0000mH-59; Tue, 05 Nov 2024 17:11:04 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] gpio: Use of_property_present() for non-boolean properties
Date: Tue, 05 Nov 2024 17:11:03 +0100
Message-ID: <7731755.EvYhyI6sBW@diego>
In-Reply-To: <20241104190628.274717-1-robh@kernel.org>
References: <20241104190628.274717-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 4. November 2024, 20:06:27 CET schrieb Rob Herring (Arm):
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

With of_property_present essentially just mapping to of_property_read_bool,
this change looks correct and should not introduce any functional differences

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpio/gpio-rockchip.c | 2 +-
>  drivers/gpio/gpiolib-of.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 365ab947983c..64924bc01591 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -602,7 +602,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
>  	 * files which don't set the "gpio-ranges" property or systems that
>  	 * utilize ACPI the driver has to call gpiochip_add_pin_range().
>  	 */
> -	if (!of_property_read_bool(bank->of_node, "gpio-ranges")) {
> +	if (!of_property_present(bank->of_node, "gpio-ranges")) {
>  		struct device_node *pctlnp = of_get_parent(bank->of_node);
>  		struct pinctrl_dev *pctldev = NULL;
>  
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 880f1efcaca5..2e537ee979f3 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -337,7 +337,7 @@ static void of_gpio_flags_quirks(const struct device_node *np,
>  	 * to determine if the flags should have inverted semantics.
>  	 */
>  	if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios") &&
> -	    of_property_read_bool(np, "cs-gpios")) {
> +	    of_property_present(np, "cs-gpios")) {
>  		u32 cs;
>  		int ret;
>  
> 





