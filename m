Return-Path: <linux-gpio+bounces-20113-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D8AB638F
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 09:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EBBF17F545
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 07:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAEA1F1921;
	Wed, 14 May 2025 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pnjb7qIP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BA7156C69;
	Wed, 14 May 2025 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206048; cv=none; b=NtVvsm9ZqoNTVuHKEZ/chaVsMSHGPzMscyXcV7O2BwKID3j9bcKFp8Jd4LvKc+vGrQj0yKEycalKy2KJjFhiXnc7fwKAtqtmiQRVjpq1LypO0uQwUVwYPtk1H3is6Ef5SogBDPdZwkxZT35lil/hezj49VPu9fj3PnuWYClERh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206048; c=relaxed/simple;
	bh=A5+riu0L8i/4nGzwO76NfQZhXIv/IQiW+JIVnjQZv7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHupqDNutKQvdUNUcIJghzcM0pjrCureSd2TwBDTRHDJEmL7pz9BPANAsT2MSF5eiqIEb/GUPl0IW82Vz/Tptzjnvtrhdj0Iry2WV/g8TU73XK5ctXAeiBf2hJkk1B3iXXTUmNKwOjws6QxTygtALt97eJLmsrCYJQHLvFO8rQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pnjb7qIP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54fcd7186dfso5004450e87.0;
        Wed, 14 May 2025 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747206044; x=1747810844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D6JW6D/024ZtieC3fNMlVsgGDeNwGuZZPl2Kjm5QYvQ=;
        b=Pnjb7qIPA9ZXRqgBgW3dTOhUR6nXGEkQQh4qBhgnFDaW1VQuraEDVfDUOE1f4eWWua
         8xddqeBA7hUaWPeY9ueZMp8iVMlTd5UqzGDrYgCVIQzYZcuL9poK58843lJum24lYFtR
         w1oO8sNf4bpWCNZ74AJqdhmeGXdDCj6GA7cIekRnioOSrP9ZtP37HuKpffZ2mQ2aL+DJ
         8ZmQHQbShoE5K7FB8lfFnpXXPPLA4EctAgVJ12Rvu1HffiEhmHvB6JlIXs/Yn8z1Qzsl
         +8q23DTWGps5GkQRbXnvkW3mH+qjwAjyBdDiqsH4Tv0FXiHGxZ2W5Xev8F8fmxGV+2ow
         dhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206044; x=1747810844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6JW6D/024ZtieC3fNMlVsgGDeNwGuZZPl2Kjm5QYvQ=;
        b=rZRsOc5GIWemnt9RItrkZjNAeBh5C0gdt6hW8jf9AUpuV8kDD1pxIoMPtPttHOHXEo
         rsIIRhn+gJmcOHmOvowD0O3oXYo8SWPPqLBVUtm+tK0+p9Rkt16btWcRYCCUazw3wkIH
         fweM1WPmLUcz8GF8z1fWc57Whs2Cy4GFXphmk3iHDLr9XJsOs+/Fvxdh9YizvptQBwBJ
         B90aBBY0mcXn6qgN3BbfKapM2KaK+qRyyyGxjgw0NJSjv1sYiWS4DTfkV4HfNkwrvzwi
         khLc7PRI7lyCJg3t8mHS1YvoT9aaAUDXYESSlFEcGpKw3uWPtfUjyBHDNu95J4QNepYI
         pQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCU7jPNZONPvzz0A522i/60/QnoIECoz8YOqy0m9ZC0AfhSMDR+DH3fxnrHOQ39ZxPlNxw179OArXzEI@vger.kernel.org, AJvYcCXsc2J0sFC2vDHQYkdmDZO9hPbju1lwIzsDLxiCODFmq9LGKjx8Gw/MgmfjK9BjXF9mua8nyUXZ2pGgG9pr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1VEHXbkySvV2ktdzMwvXiX3KGP5oASMy3arqMfVLtFrLeEelt
	omixhjizEN873TqJsP0sl7wrqdUQdIAdI2Gq3T/exn4NL8d1wRXZ
X-Gm-Gg: ASbGncsZidU1lW+A4Ou9Y0IN5DHcC0dNBOJwgmwN5TwMnl4W2BtdyND77Irw1Hy+i63
	RceOPYSh0ojoS3EnJASXCDp0lIR6/32PQvWDz+uAg//8EvT9hYGfIHCQZawzvKU2kvoz+yW2sZJ
	OmPJPNxtDcbGLYOa7mVdCBPEU88vXz7klz8DUAkOHTXy6zT8Dd6VzJWfmiL4leosx2HFnFOSuS/
	QcI50X2F9s2g5gWn4rcOrnnoatUrkEAcn1OyY2Q5i9CKotTwm1wLnogxveLoBO5dPhYss/8Yee/
	nFjxikpYGfB51sDoiWKzFgp2ZpbHpe69Wz5cwFBwuFCmtSPIIMeP+ZxL1HW4J2I1sDmA4ULlCmx
	jmcSeD/wg3IkAlZvBId+AApCijNdn/q0m
X-Google-Smtp-Source: AGHT+IEFXPYjTQVFc9xBZMWwabkH4J7NL0P5X4yGgWCWobEmL+swbbwu4HTmLk4kn0yDU6COl2Tj/Q==
X-Received: by 2002:a05:6512:450d:b0:550:d534:2b20 with SMTP id 2adb3069b0e04-550d61dddc1mr728818e87.35.1747206042530;
        Wed, 14 May 2025 00:00:42 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64d0c46sm2151851e87.258.2025.05.14.00.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 00:00:40 -0700 (PDT)
Message-ID: <df3788e9-f4ea-4c4b-bb77-20393e914df4@gmail.com>
Date: Wed, 14 May 2025 10:00:39 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Guenter Roeck
 <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Doug Anderson <dianders@chromium.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
 <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 21:38, Dmitry Baryshkov wrote:
> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
> valid_mask from direct assignments") gpiochip_line_is_valid() uses
> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
> Thus after this commit using GPIO hogs causes the following crash. In
> order to fix this, verify that gc->gpiodev is not NULL.
> 
> Note: it is not possible to reorder calls (e.g. by calling
> msm_gpio_init() before pinctrl registration or by splitting
> pinctrl_register() into _and_init() and pinctrl_enable() and calling the
> latter function after msm_gpio_init()) because GPIO chip registration
> would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
> registration.
> 
> pc : gpiochip_line_is_valid+0x4/0x28
> lr : msm_pinmux_request+0x24/0x40
> sp : ffff8000808eb870
> x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
> x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
> x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
> x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
> x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
> x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
> x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
> x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
> x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
> Call trace:
>   gpiochip_line_is_valid+0x4/0x28 (P)
>   pin_request+0x208/0x2c0
>   pinmux_enable_setting+0xa0/0x2e0
>   pinctrl_commit_state+0x150/0x26c
>   pinctrl_enable+0x6c/0x2a4
>   pinctrl_register+0x3c/0xb0
>   devm_pinctrl_register+0x58/0xa0
>   msm_pinctrl_probe+0x2a8/0x584
>   sdm845_pinctrl_probe+0x20/0x88
>   platform_probe+0x68/0xc0
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0x3c/0x160
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x84/0xe0
>   __device_attach+0x9c/0x188
>   device_initial_probe+0x14/0x20
>   bus_probe_device+0xac/0xb0
>   deferred_probe_work_func+0x8c/0xc8
>   process_one_work+0x208/0x5e8
>   worker_thread+0x1b4/0x35c
>   kthread+0x144/0x220
>   ret_from_fork+0x10/0x20
> Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)
> 
> Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
> Reported-by: Doug Anderson <dianders@chromium.org>
> Closes: https://lore.kernel.org/r/CAD=FV=Vg8_ZOLgLoC4WhFPzhVsxXFC19NrF38W6cW_W_3nFjbw@mail.gmail.com
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/gpio/gpiolib.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index c787c9310e85af4c22ffc9bb8e791931fd056c89..250d47f77e2bc678b83f51958ca1bcc4db42928f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -784,6 +784,12 @@ EXPORT_SYMBOL_GPL(gpiochip_query_valid_mask);
>   bool gpiochip_line_is_valid(const struct gpio_chip *gc,
>   				unsigned int offset)
>   {
> +	/*
> +	 * hog pins are requested before registering GPIO chip
> +	 */
> +	if (!gc->gpiodev)
> +		return true;
> +
>   	/* No mask means all valid */
>   	if (likely(!gc->gpiodev->valid_mask))
>   		return true;
> 


