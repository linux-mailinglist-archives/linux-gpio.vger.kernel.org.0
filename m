Return-Path: <linux-gpio+bounces-12552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD89BC54C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 07:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02BF0282E86
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2024 06:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EED31FDF80;
	Tue,  5 Nov 2024 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="K2K18R4p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70231DC074;
	Tue,  5 Nov 2024 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730787437; cv=none; b=iZvm3YZhIFhFlog/HYEA6lNUTjygb50RZ8SEVGUFn8CBTG7USYYEbOsIHC7l4bqIpdVNAeCRuAVrtzTHjM62pBLREY/IdRU1iIlgvORHB3fDks5f+1FYhmTgL4mtntjCQr9628keB1Vl9BaOXtctW2HG9spz6vpNFNb1jZ4rakA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730787437; c=relaxed/simple;
	bh=UV9VG0k1Hxvx1DZUGLqAneCRsO8ykPZWz/XfeCWmqhE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=n9jGpMl9GQfsjJhXQqpvDcYwy6H1/IWyJS/BM3GeaZ+D3g9+hQetdnvu3AuQz6WPV7bl4nQba4HQVzh5l26Qk1DDa5R+2pHHWRcS1/RQshzrtbD1T69Kq9zbBy4ngZiQXAO7iyEwVMZIy/ziYj/3iVGvMhGDjIJsG6Oj/8PSE3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=K2K18R4p; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1730787427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pzT1yWuSYo32MDvy838pA2Z2cGHks6slx4by0MlbsfU=;
	b=K2K18R4p2w+mZKetYwZwYk+c++g/4wEGft+2ah3sEArgW3vNySgUUef6qkjhl1Ci0GvGSA
	8J7cTyUb24+u6qfBvP2f0/e4o28XLUf7O5WwO60h8NokGnwWHijC0Kj04Fzc8KLaexwxn0
	lRLnf3nJ3pA/LUnN3SMz612LhVwnanlYRJf0MB0m0bkXkzVGlEurzUQ7FEFve6useZKNr4
	1CvTSeNPHJhm5gKthRtojQoUgTFWAmXezntrjYdLqK56tUxrMbCAvBqh8OrMeD8HI28rTG
	hAb1vrJkSq9joeA+FWcyzwWYZqXDt757gNPq5iHj7qqcVLg98eWVACSHJaKaqw==
Date: Tue, 05 Nov 2024 07:17:05 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Heiko Stuebner <heiko@sntech.de>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Use of_property_present() for non-boolean
 properties
In-Reply-To: <20241104190628.274717-1-robh@kernel.org>
References: <20241104190628.274717-1-robh@kernel.org>
Message-ID: <61eb3f25ac1ab3d63e375350e0852b75@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Rob,

On 2024-11-04 20:06, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Looking good to me, thanks for the patch!

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> ---
>  drivers/gpio/gpio-rockchip.c | 2 +-
>  drivers/gpio/gpiolib-of.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c 
> b/drivers/gpio/gpio-rockchip.c
> index 365ab947983c..64924bc01591 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -602,7 +602,7 @@ static int rockchip_gpiolib_register(struct
> rockchip_pin_bank *bank)
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
> @@ -337,7 +337,7 @@ static void of_gpio_flags_quirks(const struct
> device_node *np,
>  	 * to determine if the flags should have inverted semantics.
>  	 */
>  	if (IS_ENABLED(CONFIG_SPI_MASTER) && !strcmp(propname, "cs-gpios") &&
> -	    of_property_read_bool(np, "cs-gpios")) {
> +	    of_property_present(np, "cs-gpios")) {
>  		u32 cs;
>  		int ret;

