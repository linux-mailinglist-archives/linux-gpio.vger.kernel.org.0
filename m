Return-Path: <linux-gpio+bounces-11461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AFC9A11D7
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 20:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE5591F25008
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 18:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF92D18CC11;
	Wed, 16 Oct 2024 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="hkxptrEy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8491DA26;
	Wed, 16 Oct 2024 18:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729104365; cv=none; b=gpxq0Q3nYMgBNxy6CsKWGsX+LkmBj3DUTYxlBuydJNsgcH4Ymtl7AJczkxMCcLeuY32cXF8E9ve74RTjmdZ9Ih8Cf4hIcgyMD1jLmQB4ew8dmpX80yI6YjEjBbAOFGocX7fGPD0HhYcuQOm6imVsPeLzvtgmDADQh1DDkPy7deM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729104365; c=relaxed/simple;
	bh=cMZwR6cryvoRu0vR9qjUJvRH0BAagieaFPpUnTvBpWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qsg9lr9VC/1a/IC9TRY4bxtCPjYQv/dKCGP+NOg3mLzY58QYaX2GWsrSf/uT7RtKSvCKy0TYgmL8R+KyAAfuQi6fOQGvbX09KPnoMXZNy5dwa9A5rVGDMxI1ONkLeC3XEEUX0ZcjPsbka3HCayTwdlePnsh9JR5EyVsUBzyGHc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=hkxptrEy; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729104352; bh=cMZwR6cryvoRu0vR9qjUJvRH0BAagieaFPpUnTvBpWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hkxptrEyzThow4MEK0ZySGjZtMqcKvxTLk/eOxgTdvqA+T4AQUNgBqLLX/50SmRH2
	 16C8vOE+Wh3H5eOe3afeYSxpRrMN5+04+Fcu+fd8rDQqffxmFha/Zz5d7mHf8ueddw
	 I5zfpRzWBcIcthMI0Guj2hIqgWN7TfIQ9EYM95YGPzyQihsFE5rJRzdRGK7YU5WqtK
	 Ov7Lmr2XlSXZVYNNMeDGrIx8OlHUipxwzAqI0Flm5rUD0HeYD2lBgAWXJ3joTwCVZL
	 FgVEwbZGHik9eBBeG32niY8sPn9yBnn3HH429uFXoVBjLnAPv7sxqTlrplHzBYYmvK
	 ds4r6Ak+ysD+k8JWKPazWD+rjrWNZkOFTWmHhM9wk4rDPos5rqgz7FDhgpCz0aanZb
	 jdbwUd96OkImZDpsx92B75T/n7MtDZOu5yYMPe5L09ObGGz4rrz8Y5RezznEdmwH9s
	 Md9YFwiUUtpO94m0MUYzxCYJKK7HHQliQbzZN6MsOW5IYvLcKegDl8MlUQgs1Rgbcp
	 B5d6SwlG+TFFbFCqbI4kt2LflA7Dk+0Sy7DzGHGdw5zSVYztyMRWnu0rzTOA0JvuEK
	 hDpCbfeIv6RMGH+2SOCJkKen0oJtDmlqVP7fNwv0QtNDzGxeKNsY7M6+tGwJ0ltGU2
	 BdB3BzxBjYJih1wwDqcoGAqs=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id CABFC167DD7;
	Wed, 16 Oct 2024 20:45:51 +0200 (CEST)
Message-ID: <3a875620-513c-498a-ada2-c515de75de3b@ijzerbout.nl>
Date: Wed, 16 Oct 2024 20:45:48 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] pinctrl: th1520: Factor out casts
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
 <20241011144826.381104-4-emil.renner.berthing@canonical.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241011144826.381104-4-emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 11-10-2024 om 16:48 schreef Emil Renner Berthing:
> Limit the casts to get the mux data and flags from the driver data
> pointer with each pin to two inline functions as requested by Andy
> during review.
>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---
>   drivers/pinctrl/pinctrl-th1520.c | 22 +++++++++++++++++-----
>   1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 8bd40cb2f013..7474d8da32f9 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -152,6 +152,16 @@ static enum th1520_muxtype th1520_muxtype_get(const char *str)
>   		(TH1520_MUX_##m0 <<  0) | (TH1520_MUX_##m1 <<  5) | (TH1520_MUX_##m2 << 10) | \
>   		(TH1520_MUX_##m3 << 15) | (TH1520_MUX_##m4 << 20) | (TH1520_MUX_##m5 << 25)) }
>   
> +static unsigned long th1520_pad_muxdata(void *drv_data)
> +{
> +	return (uintptr_t)drv_data & TH1520_PAD_MUXDATA;
> +}
> +
> +static bool th1520_pad_no_padcfg(void *drv_data)
> +{
> +	return (uintptr_t)drv_data & TH1520_PAD_NO_PADCFG;
> +}
> +
>   static const struct pinctrl_pin_desc th1520_group1_pins[] = {
>   	TH1520_PAD(0,  OSC_CLK_IN,    ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
>   	TH1520_PAD(1,  OSC_CLK_OUT,   ____, ____, ____, ____, ____, ____, TH1520_PAD_NO_PADCFG),
> @@ -590,7 +600,7 @@ static int th1520_pinconf_get(struct pinctrl_dev *pctldev,
>   	u32 value;
>   	u32 arg;
>   
> -	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> +	if (th1520_pad_no_padcfg(desc->drv_data))
>   		return -ENOTSUPP;
>   
>   	value = readl_relaxed(th1520_padcfg(thp, pin));
> @@ -660,7 +670,7 @@ static int th1520_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>   	unsigned int i;
>   	u16 mask, value;
>   
> -	if ((uintptr_t)desc->drv_data & TH1520_PAD_NO_PADCFG)
> +	if (th1520_pad_no_padcfg(desc->drv_data))
>   		return -ENOTSUPP;
>   
>   	mask = 0;
> @@ -793,12 +803,14 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   {
>   	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>   	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> +	enum th1520_muxtype muxtype = (uintptr_t)func->data;
You cannot use func before checking for NULL (see if statement below)
>   
>   	if (!func)
>   		return -EINVAL;
> +
>   	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
> -				 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
> -				 (uintptr_t)func->data);
> +				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
> +				 muxtype);
>   }
>   
>   static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
> @@ -809,7 +821,7 @@ static int th1520_gpio_request_enable(struct pinctrl_dev *pctldev,
>   	const struct pin_desc *desc = pin_desc_get(pctldev, offset);
>   
>   	return th1520_pinmux_set(thp, offset,
> -				 (uintptr_t)desc->drv_data & TH1520_PAD_MUXDATA,
> +				 th1520_pad_muxdata(desc->drv_data),
>   				 TH1520_MUX_GPIO);
>   }
>   


