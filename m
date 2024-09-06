Return-Path: <linux-gpio+bounces-9880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1496F023
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 11:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E7871F25D88
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2024 09:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FAA156F57;
	Fri,  6 Sep 2024 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkxXZKcm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9C81BC20;
	Fri,  6 Sep 2024 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616198; cv=none; b=a/3ePZ+rTOKHHP0gbKAVs72LfL93Fv9tU/GVxfr2enb2lCCQ5aauOPIHAtFf6Hz8VOPJxchUNYoSla+2ZPLX1ccpIkXcTgAAIIeI2O5Ihd2th2w8qGm0Cg5wkIUcAfgAjVNa2fTBHIl/FSyyfDV04p68sTEDs6FFEIYSe15ep7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616198; c=relaxed/simple;
	bh=iLqIpAmLjdgv0/2DRaGgcWoVehWAQ8kCzM9Z1YdF3uE=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=g1mrF+uEvDQVqmb8C0ymJsxJzDwjG7ORoDUkyVoFKzYt5K+Hi4WOvX+xgVp/U+y+rKOZ6Os0qFLk7HkH/7f622gNWgc7NKEjuEwfEZtWVYyxQ/MdHge4Rd/RlaUz7SYdC6fRpUbcpD8EBfE8oAm05ilbKieNLp3yRdmispaYcyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkxXZKcm; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso3108255e87.0;
        Fri, 06 Sep 2024 02:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725616195; x=1726220995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgMl6X+aCYow9KmkMAtlwqiug4zLRNRZBDBHxZLDaOo=;
        b=TkxXZKcmIQa9050VIirzweCxDVJJVrJ3i5q33+0qwAnpVCfN2VKooNwYrYYVCeBR8X
         DhddSSBqcB3EDYykSRZUhQPtO6xA2z3lNTQakmPfMAjocF33EGI+51WJboUYqhMSKNpY
         SyTo9T+JWHOxxoOH6kF+Bi9QEgU+98ntYSYiF66gA21PbosahBrYaYoHxoUhdRY44fih
         tmIHON2c/h5nKEmlgaMXvBRecxc7CLJDN+yNW2iBFSx/7JhrLTwAFZJ0dX11IAMQQLqT
         wInpPla0RKRXYbpNdcM6H0POH8kTITWH9QEjTgT7Cx57FVHTJCt249j+NwRvpb5d3He9
         x7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616195; x=1726220995;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgMl6X+aCYow9KmkMAtlwqiug4zLRNRZBDBHxZLDaOo=;
        b=E5TmMga1MYsaZMf8pAJy/xJFD1e6Vc7jAmpWhOkr8wYc4IkbQQKI4aKKOpaxQ1Etxb
         PfmQx6kU+ErwWHlwli8uXNiUy2SXGiKur4C+LN5BDv0/VRV8KfCVvwlmO14tN5GuzisY
         r44LCEll6efIIKiIBQLIgWXvEcCYu5T+2Pr/7mniw2VOTbI/ZNFsbCOjr1O60a5fhp6M
         IOUTMnSxl5f4jCDvcqSPAWfqduoW72stFh9lt+8OmHgt20I7Zl3dOeVbFnFvUKqXzBFn
         d2/IIysV4Yiddm1nLPetIghLtB5GxpIg3Iop2rzsL9NepYdtcn6fw6DWv9hEw7C77j8I
         dp6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVazn+e8yGpdiEEmt/hfM/zlHby7QQNcti/u/1OZss7xSu7IH2h2xizZXPUhVq1PCT+MzDHDZ9KB+znwXo=@vger.kernel.org, AJvYcCWfDjfuPo9mvarJcefW80snm9Gba6CV3WQaHMNLS0dUKDJUZhlIYHJZ4y6PmqXwyky6OAYSZTAK@vger.kernel.org
X-Gm-Message-State: AOJu0Yze2uUoajmQaSDD2mHzYqfLLsUMzosbp50kiasYGZT8QVvTEFoK
	t38nrnJSraF3LPsAFJAp73cVrPb3HcXbd8NvNB21Jt8ByL9v+OZhAsGmUw==
X-Google-Smtp-Source: AGHT+IFwUu3jBR7TONcrgd2dayhBiQjxS1uLs60iMAAm26ahWb/uKb2/mM5Y7+OHP7adG+c24a89BA==
X-Received: by 2002:a05:6512:282a:b0:52c:df51:20bc with SMTP id 2adb3069b0e04-536587abf24mr1170940e87.16.1725616194662;
        Fri, 06 Sep 2024 02:49:54 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.86.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408518f5sm2837072e87.288.2024.09.06.02.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 02:49:54 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: stm32: check devm_kasprintf() returned value
To: Ma Ke <make24@iscas.ac.cn>, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 bartosz.golaszewski@linaro.org, antonio.borneo@foss.st.com,
 valentin.caron@foss.st.com, peng.fan@nxp.com, akpm@linux-foundation.org
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240906020323.556593-1-make24@iscas.ac.cn>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <22a622cd-5f10-58cf-92e8-be3da31e127c@gmail.com>
Date: Fri, 6 Sep 2024 12:49:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240906020323.556593-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/6/24 5:03 AM, Ma Ke wrote:

> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 32c170ff15b0 ("pinctrl: stm32: set default gpio line names using pin names")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
[...]

> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index a8673739871d..f23b081f31b3 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1374,10 +1374,16 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>  
>  	for (i = 0; i < npins; i++) {
>  		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
> -		if (stm32_pin && stm32_pin->pin.name)
> +		if (stm32_pin && stm32_pin->pin.name) {
>  			names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
> -		else
> +			if (!names[i]) {
> +				err = -ENOMEM;
> +				goto err_clk;
> +			}
> +		}
> +
> +		else {

   No, that should be:

		} else {

   See Documentation/process/coding-style.rst, section 3.

>  			names[i] = NULL;
> +		}
>  	}
[...]

MBR, Sergey

