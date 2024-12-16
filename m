Return-Path: <linux-gpio+bounces-13909-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A289F2EE5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 12:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A97317A1A67
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 11:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF99120409A;
	Mon, 16 Dec 2024 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFh0ay5H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC0203D56;
	Mon, 16 Dec 2024 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734347478; cv=none; b=l8f7ahRmE3JiyzaCPd6KG3c1UpoDqyotSEWUaQHdkeNMwFNF6458Bz0rWe1jTm6Mn6sfWDZO6tgsAuZYZAhKRZ1OK5v57nP0vSYYnXiwKfuO6304OJED2g9en6N303XVGtHw9jNua7Kdljd0V6EB7v1dSQZie6LZahnltfyTsvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734347478; c=relaxed/simple;
	bh=rXSPzipnpWLHTdwQjAIfTI/vQ4r5Kh8o7ABpK1YQXz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jagL+Ba4P4m9cP3q9J8f8nU/GK9Xmvy2hfpJyDJL+KSQy3NwV8vO2cTg7nHsU5MrRnBp84mHC7JkGhkwcBnV8zElzuKPejnVFrSxyxChQziZ//u9iCNpGAiz9j8EaPDoTfXmD4DPc5XF3xYezD5K1hjruV9xeDHcMbp9aZrOFns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFh0ay5H; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53df80eeeedso3977049e87.2;
        Mon, 16 Dec 2024 03:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734347474; x=1734952274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8Iat1m0eMKAJHA7MWbIIpsL98SljZSn7Pr7L3ufHKw=;
        b=kFh0ay5HFgs3ZpSBddQWrvyWwuQ1G3MGPQsLJpl3ztpSzq5MX0mwIcQZu72yGgXrI8
         whYjc0AzpKEM5hQ8KA4d1I3jPPZfl9Fma4p0jkEuzkjV9tkvYkTt7rnzBQdGnxumyGDN
         pzE437NhFAzHUvn5pg89C3P7deMIX9GJRK6RQojGgrkVheA0vwD6MgtYwcWadzFxiBQl
         BTMAKPiGb1P9ONEcPtzmaDwJvyp8999arLCjGpoxafIRitF4ixZbQN8N49c1xa7BGpwm
         mvDyILjTS/gNGvm6ay/i9if0LCVLz7ZFzcHG+OrEzY8lOXZyFZST27OFFp7OrdSpCz4d
         EwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734347474; x=1734952274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8Iat1m0eMKAJHA7MWbIIpsL98SljZSn7Pr7L3ufHKw=;
        b=ZCItG3KKP7VbTeVSjP55imz4qxgd+vjCw/G1GPk2H1xyGtuxXFlkVrKCpKCxB2Ty8I
         lM0LV7KmYU5UUQPE6SXBxNBQaQj72DlXZo0vKTVwf/JGObUmq7aLHWdW74t2OZaHBgMn
         7pMXDXklzwC+pEFVJBUehCxvmEng66qc7SLYTOWBsUKyECvcnGTs6C/vly8bemHjmPlL
         wT0PvLXHtR9Bm3+WbDq5g+j/OPCdk3PzAzZ7K3Kvph3sRoYJxfBJtS/b/j021U0G9z/d
         tB77aEkl2jdc82vO7qcWZ4hLEnBXWI1yq/nFhvtQcYc7e7bOhVbKlguGBaeyaLBy/9Xd
         q8Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUgM5vToXYJOncPbQd6mdOVNBhhheptyCQedVaGqNp3dvEfxmf4orPFMyv+A8ft98kEHP62M/unAbW7@vger.kernel.org, AJvYcCVvKVYKHNenO9GxxBi+GkKYRZDwJbLmECyiwzkQQdeDXmAFUDZMgw1TA/qfkMhvEBXM4qUYYuW0dQai7g==@vger.kernel.org, AJvYcCXs029Nc22xu9gc2dpSp1SVIFpwYeezM6ksSsrACh082q7P7V2xf1/RManQb/JZDGdvQxtvdjOrPK81hKo+@vger.kernel.org
X-Gm-Message-State: AOJu0YzljK+6v+Q4NLFgYxo8f/gSAViDRlV5U2on8RgG1KHNZkjBT9cH
	Wl/kBBFsGpnq6kczwSk2gLVQtsbj5+Tnw+MCLeigBbUUGpXsuFbz
X-Gm-Gg: ASbGnct0MWozGQHTMM5I8VvZrTr5DKGJkLsvedm3BPrCu5Gyzji9B0q3PhHU1jKrJLK
	9Ldu9Tw8Xdq95VIBevrvfOECjQVLyzcZ4voE0ry+brWb1ULIkNCkquuznFSgdKD/f4oFZi33m41
	SQGd9NmGRqGZzAmuEloHg4P8Acj8ScqnVofviZbktX2ERFDziXZbIDGNLuVRZJqHWhy4/P9K7vI
	uSI4IXkgqO5Zi5bmUuO7gAjjAK/J6is5E1rIetLnrgV5Mz99GlVV1UrmOV/oCh+1nG1tQ==
X-Google-Smtp-Source: AGHT+IHow2iOWpsZkDnpvRh6J6Xw0lp6ZZOtyi7ONoepjbIEpI/ztZCYIYk8pzfs9FfzuCnBCKCDxg==
X-Received: by 2002:a05:6512:3d8f:b0:540:2223:9b20 with SMTP id 2adb3069b0e04-54099b72ba3mr3597077e87.53.1734347473583;
        Mon, 16 Dec 2024 03:11:13 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c13a03sm821550e87.188.2024.12.16.03.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 03:11:12 -0800 (PST)
Message-ID: <72c52d8a-b0f2-4767-9e8c-ce869d203d0b@gmail.com>
Date: Mon, 16 Dec 2024 13:11:09 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: omap: save two lines by using
 devm_clk_get_prepared()
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>
Cc: "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <20241203164143.29852-1-brgl@bgdev.pl>
 <20241203164143.29852-2-brgl@bgdev.pl>
 <a21531a7-13ae-45f5-a60d-dd80b3ef9834@gmail.com>
 <0bf97a477f1c547b960c63607395b82d92986ef3.camel@siemens.com>
 <a175fd56-c21b-46f5-bd0a-ccaa7c0f3efa@gmail.com>
 <828da89cff6dd2c49df9af6131aa3b43675abc87.camel@siemens.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <828da89cff6dd2c49df9af6131aa3b43675abc87.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/12/2024 10:57, Sverdlin, Alexander wrote:
> Hi Matti!
> 
> On Fri, 2024-12-13 at 15:55 +0200, Matti Vaittinen wrote:
> 
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> We can drop the else branch if we get the clock already prepared using
>>>>> the relevant helper.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---
>>>>
>>>> Booting a beaglebone black with the linux-next from Today fails
>>>> (next-20241213). Enabling earlycon + debug yields below splat to be
>>>> printed to the console:
>>>>
> 
> No problem! Thanks for the logs! I think I know what happened: I suppose
> it's "prepared" counter underflow on probe deferral of GPIO driver
> (there are "probe of 44e07000.gpio returned 517" visible).

Ah. Indeed. The deferral is visible in the logs.

> 
> If you'd still have a chance to test 6.13.0-rc2-next-20241213,
> I believe this was missing in the
> "gpio: omap: save two lines by using devm_clk_get_prepared()":
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index 76d5d87e9681..0c30013d2b48 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -1473,8 +1473,6 @@ static int omap_gpio_probe(struct platform_device *pdev)
>   	if (ret) {
>   		pm_runtime_put_sync(dev);
>   		pm_runtime_disable(dev);
> -		if (bank->dbck_flag)
> -			clk_unprepare(bank->dbck);
>   		return ret;
>   	}
>   
> @@ -1495,8 +1493,6 @@ static void omap_gpio_remove(struct platform_device *pdev)
>   	cpu_pm_unregister_notifier(&bank->nb);
>   	gpiochip_remove(&bank->chip);
>   	pm_runtime_disable(&pdev->dev);
> -	if (bank->dbck_flag)
> -		clk_unprepare(bank->dbck);
>   }
>   
>   static int __maybe_unused omap_gpio_runtime_suspend(struct device *dev)
> 

This fixes the boot as you assumed.
I suppose this should be baked in the Bartosz's original patch assumed 
it was dropped from the GPIO tree.

Furthermore, this seems to be a fix to a hidden problem on original 
code. If the original code failed in the clk_prepare() and then deferred 
probe(), this same problem should have appeared, right?

Maybe consider using Fixes - tag even if this and the original change 
got squashed. Feel free to add a:

Tested-By: Matti Vaittinen <mazziesaccount@gmail.com>

if this fix goes to the tree "as is".

Thanks for the fix!

Yours,
	-- Matti.

