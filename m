Return-Path: <linux-gpio+bounces-5230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCBD89D88D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 13:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C269B281D2A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Apr 2024 11:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB763129A7B;
	Tue,  9 Apr 2024 11:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mX1cfYfE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028F612AADF
	for <linux-gpio@vger.kernel.org>; Tue,  9 Apr 2024 11:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712663587; cv=none; b=uBO0bYfKFamXX/gWPKQITcZMm9TFeXJDKsn/BaDd48D0xsksgFKftEK9VjD3nM3gNZoXhh90Q10A93lOJxJwSYOd5waoFwbbErCA1hQKznKZ3DSftT3iJOfWe3Ma54GON0KPTqY14tpM8F40nRiCcM2L0KLPmz1KSbI8DUSOSlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712663587; c=relaxed/simple;
	bh=ewn/5uPthLhb/zMjw/qMCDDEVnM4Cko7tvC5qsRH37E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsgZsR+1TcZqf66oNvLszdRsOm14Nxz15Fyk408Kd30i7OE0qi5HJMEL9w7NUgi7NQUSMcK2jHSfFBLp6RKWpA0s0pj7eMw7dExkxpFVg5UeUekQ7VMBn9HVd1+mudZgQmUraPrrGJgF8F/0JVo6Il1MJMZTM7QBFf/ihqiVrh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mX1cfYfE; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-416a8ec0239so2966175e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Apr 2024 04:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712663584; x=1713268384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mwibmhabQtaTTaSfxj4uJT6v1DFOIACmKb5/eqDC61c=;
        b=mX1cfYfEErCgpNJGJab9lICS8F022qp8Xo/zcdRUrnB/+hFtZYaMV7tluTTs3Svv3t
         yVRZtF2aGNp3W/WqQdxW23pv8DTpf4J6c7ZMh7bL8yhpgM70/jWxQx0V7R3SbQzpyeQQ
         nml75MWaWZFjwuR0gTUzZoLJEmzCaW0qH6yiaoyutwjONhTCA/QVrM56WfPhzDMA1E0t
         QlLZ5h0EeMnkxM83oqnbUKLgGbYqqZlu4NH+rbZKKyzdVfB6P/pi9+QVLp+y/FahU/Gg
         perp8WhT9+d5LZJBeURNkwkuE6BlhAQ6d9SKzAUo2jN4tcaRoYLCvgnByymEg0K6mrpU
         EvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712663584; x=1713268384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwibmhabQtaTTaSfxj4uJT6v1DFOIACmKb5/eqDC61c=;
        b=djYb8qHHMoytxhqyLNOOakVbshEgdmCZvSI3f9ZIw2GB+c6ghAf0GuaSsjgkNlmyz5
         n4yXvVBqYjcHJfCoFbZBn6boRwYaVPhEG35rnZVzkFz2CnH3Ze+XkjvxifFTIJkDpJlR
         rvLuP8zZwCxVRhRkbGsNnztOqFcYcgiRTptqNSq76xyOHEeeBLJOi4uwjx/RYtjdsZ54
         K+QxrCkwtVXvbwYWsoXcgx4KsPAKrmta13OcQ5Z1NDzbTVMKGmq1YqB0hDainSV2heiz
         Y8A6lXw0jo+ENKrJPdUjsAMDhrJ/nf5pjkxJ4lTp/XGa51+VW+BVeuPFDTPYEa9d6nxV
         ku0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsKVQydkLkjHDAHNERQOyhMB+DlAt8gnVGC/gNakiXYYDRZs8o0MPQyfS0Dp5VCgVcfgb9pxy8ern9v/URjNqRtXv+xRsI09fMng==
X-Gm-Message-State: AOJu0Yz9P4Lc7nmh4MJGCFpIaWU0Q9DJ1rIRsbf6nYa/eOBloSqDxIj7
	41hPqXCca2sqp4y67Mmk08oqzM+KvWVKxJzN3lC40HGkaSpPJE+I6NL/P08n5q2BfOEztsEWXnG
	S
X-Google-Smtp-Source: AGHT+IEgkg1A7QJGYiXWVjo1jkxMxNgyCzAUOODb4mSncViq3Jtmn5+85OBJ+tLFdyxxacft1HX9jw==
X-Received: by 2002:a05:600c:4f0f:b0:416:71ac:1bef with SMTP id l15-20020a05600c4f0f00b0041671ac1befmr1899348wmq.13.1712663584212;
        Tue, 09 Apr 2024 04:53:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c358e00b0041674bf7d4csm7001664wmq.48.2024.04.09.04.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 04:53:03 -0700 (PDT)
Message-ID: <30318fcc-5d6b-427b-855d-f69bcc165a54@linaro.org>
Date: Tue, 9 Apr 2024 13:53:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: apple-gpio: Fix null pointer dereference in
 apple_gpio_pinctrl_probe()
To: Ma Ke <make_ruc2021@163.com>, marcan@marcan.st, sven@svenpeter.dev,
 alyssa@rosenzweig.io, linus.walleij@linaro.org
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240409110254.2201457-1-make_ruc2021@163.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240409110254.2201457-1-make_ruc2021@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 13:02, Ma Ke wrote:
> devm_kasprintf() returns a pointer to dynamically allocated memory which
> can be NULL upon failure. We add a check to ensure that failure does not
> occur.
> 

Subject: I doubt that there is null pointer dereference... Don't just
copy existing commit msgs or subjects without adjusting to real case.

> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>  drivers/pinctrl/pinctrl-apple-gpio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
> index 3751c7de37aa..af2f90d1950f 100644
> --- a/drivers/pinctrl/pinctrl-apple-gpio.c
> +++ b/drivers/pinctrl/pinctrl-apple-gpio.c
> @@ -474,6 +474,8 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
>  	for (i = 0; i < npins; i++) {
>  		pins[i].number = i;
>  		pins[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i);
> +		if (!pins[i].name)
> +			return -ENOMEM;
>  		pins[i].drv_data = pctl;

The check is a bit later, so please be more precise how do you fix it
and how did you reproduced it.

Maybe checking earlier is reasonable, maybe is redundant. You did not
address it...

Best regards,
Krzysztof


