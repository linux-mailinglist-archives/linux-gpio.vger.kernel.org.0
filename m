Return-Path: <linux-gpio+bounces-9691-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAD396A4F2
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 19:01:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DEF8284B35
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BAD18BBBE;
	Tue,  3 Sep 2024 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="DzpI6K34"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2221C14;
	Tue,  3 Sep 2024 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725382890; cv=none; b=HbEvoEsa7fDq1OzMdwADj5BCI3alFvItDEVroBCiX8xDmAfwd63fq77LOjifDMdhTULVMPW4l0OYAKXOhpdPxzYGClgtM2Ft74TrMQC+TKRoaxR0n4h4nw+ysaregFjgnh4opbVD84aZIa8lfNJppNJZOmuNOMg2gwCmht06a5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725382890; c=relaxed/simple;
	bh=CH7xX3WmupAgXf7ywAmQtoAEt/RMfdbpPzlnG5d6wWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0UA8H7/cu3+THams4LmH4ERq23ey6EyMiVSjgPWrQBceIX0y7CePerSVFosKAG5f6PDOg/cVmWwr7JfMZ7r7msVwIoLZpsrbMdQY8VYXj8GLok/BdTJI+2TyijoyIKHRPMkIUlAXITMvVkJvn6BVokFOKQp0nka6l89sRjslTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=DzpI6K34; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id lWlNsbmsJ730VlWlNsh1V8; Tue, 03 Sep 2024 18:52:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1725382342;
	bh=cwVfF8H0QS64J1x+SwhsjVu91hAQp1BfUEaNeMwuXkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=DzpI6K34IIH3dAKxh6ht8AxRWIBNZgB028OPqyyPNBOBy9GNPDdEL9+5Dv/iO83mf
	 aC/KrAwrz5GNC03ZU8fjINnM+OtXO73Z4X4LFSrItdrfCXxj9xYW0cmA6qR9CamcDS
	 cQLu4JTrJwwnIvWU35+vQ9V/XeEOKDaOAIBbBAPbIE3EBKclKa0EuK7oB16S6cvTgv
	 R9uSqM/sT0yCWATony4HnQsByJdUXAkw1IMmN2r428HN+HOa6vPMjPPTl6iS9y3WM6
	 /U/G3pEaHMdJxJFgCu4vX+ZCvh6T6Gs5u1itnBvgfzculN4uv/2WNuc9mZACq6VPAm
	 cApbiIQnP9d6A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 03 Sep 2024 18:52:22 +0200
X-ME-IP: 90.11.132.44
Message-ID: <6555c378-f230-480e-9dd4-625ea550074f@wanadoo.fr>
Date: Tue, 3 Sep 2024 18:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] gpio: rockchip: replace mutex_lock() with
 guard()
To: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
 tao.huang@rock-chips.com, finley.xiao@rock-chips.com,
 tim.chen@rock-chips.com, elaine.zhang@rock-chips.com
Newsgroups: gmane.linux.kernel.gpio,gmane.linux.ports.arm.kernel,gmane.linux.ports.arm.rockchip,gmane.linux.kernel
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
 <20240903073649.237362-13-ye.zhang@rock-chips.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240903073649.237362-13-ye.zhang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/09/2024 à 09:36, Ye Zhang a écrit :
> Replacing mutex_lock with guard() simplifies the code and helps avoid
> deadlocks.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>   drivers/gpio/gpio-rockchip.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 73e57efb46fc..d5c57617fc86 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -765,20 +765,19 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	ret = rockchip_get_bank_data(bank);
> -	if (ret)
> -		goto err_disabled_clk;
> -
>   	/*
>   	 * Prevent clashes with a deferred output setting
>   	 * being added right at this moment.
>   	 */
> -	mutex_lock(&bank->deferred_lock);
> +	guard(mutex)(&bank->deferred_lock);
> +	ret = rockchip_get_bank_data(bank);

rockchip_get_bank_data() was out of the lock before, now it is inside.

It looks ok, but is it on purpose? If so, maybe it could be mentioned or 
explained why in the changelog ?

CJ

> +	if (ret)
> +		goto err_disabled_clk;
>   
>   	ret = rockchip_gpiolib_register(bank);
>   	if (ret) {
>   		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
> -		goto err_unlock;
> +		goto err_disabled_clk;
>   	}
>   
>   	while (!list_empty(&bank->deferred_pins)) {
> @@ -805,14 +804,11 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
>   		kfree(cfg);
>   	}
>   
> -	mutex_unlock(&bank->deferred_lock);
>   
>   	platform_set_drvdata(pdev, bank);
>   	dev_info(dev, "probed %pOF\n", np);
>   
>   	return 0;
> -err_unlock:
> -	mutex_unlock(&bank->deferred_lock);
>   err_disabled_clk:
>   	if (bank->manual_clk_release)
>   		clk_disable_unprepare(bank->clk);


