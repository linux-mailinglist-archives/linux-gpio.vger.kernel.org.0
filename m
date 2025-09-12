Return-Path: <linux-gpio+bounces-26035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6BB5480E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 11:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E149A0484C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E812853F3;
	Fri, 12 Sep 2025 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hracEXOe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF5283FC2
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669744; cv=none; b=gMqdg5yg5XnZ0a78WEN9w3gafIVmBA9ruTnjTatgIfcs+HJwyD+XOlDVbpy0JUSJPJFGfCAFxtPYs4eyH/1oM2EdgakOTBV5Pxbz1RsUyxZ2QhkFHlAny+MEQ6+yC2z9ZMiduNyAHADxpRetYAjfEIv2RbfTlRykKQTJs8s9DD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669744; c=relaxed/simple;
	bh=fBJUAtSVJTf9xKHJ7WZE6lGY8WZRYaNlxiKpYOGOZ4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=irnf8YAk4f+ttLClTnFy0CFQzt5dLS0qYtuaJO8F6JOjBmfpXKsRj1mLHyDEpY21U2/Gh03+8QmHIPhZUnZLeVZ7gFseDial5SGAiV/eDn7z8USEm+hAvWFnPK2EPt4WkGLMazZuQ829Gil2fs+mZzbF5B2KTIuK+7zUYrmA8mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hracEXOe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dec4289f0so824245e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669741; x=1758274541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/8sg3oTjjByo6jSqWHz7u1fLnDYEMsvaY/zg7UesBc=;
        b=hracEXOeyc6yxsmwNuNyajO985IxXAimO8kxosgakfWPUcslue5aXFZVV4tl9yD23u
         wORdtzz2B0SpRkuvzMmjuSFlYu1+XjED8acxuUs8e92Sh1kSQyQarlp9farVFg0XB6Lk
         5YQDFK8MvHb6QwmnWPyezGGRqMi8sRPNFv7/Cuc3L4mNoWw9UAmYHe6kKPg/BFF69JHg
         TH3m6A66bjFoUQ3GPZK/84FVVIAqMVfhSNnUf9DyHbf8+p7JtDsfeiRuO6yS+dcDx5vX
         gwm8hhxESetI3IbDcJSSfRbCN/OKieHKUwpvY+GRMG2+WKdO8KjEzUJO+h/7+d/tnt27
         Kw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669741; x=1758274541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/8sg3oTjjByo6jSqWHz7u1fLnDYEMsvaY/zg7UesBc=;
        b=KE41pscCPYTYfXs5tDg3zQi0P3MSeu41sIXFZtFUL4IpD4mSt6mvD3ikj6dDqIjTcD
         CQieI46FXxZLwOVCE2PFia8MUTg3bjDFmcK5cG/Xk0XNe2NJpFinNovh7svT1+duWJ3V
         7ghW2C0/MkFxt2CYy5S//DNLAJz6FsDjpSuDza84Bp5Mc7rRzQYhB1yoXkhp3gU7GLDJ
         HRL3IowHWJbXBzwNSjSgezhI9GVi6ue2QaytBQwFYRWgau7HCDj1eSPpz9fVBnXiGmW4
         jDX1EZqjg0/etPjs6zG3xyWZ9FvXFRq2RM6AgSCCGQJuUXmZ4e8AcBhhFS3X86QwQKjp
         jXVA==
X-Forwarded-Encrypted: i=1; AJvYcCXU73Z9JM+Xsv8XaaviMWSG7ufaw6fuiJNsAoLGPAQoipTG7nTytf0WfVlGjgJsahostOZy8CuuwTlJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9VQ2jCnNrj9qs2qbvOzpxp+y7ZgkRBpojdSehlL6E6p+4BaD/
	HBn+sqpODecacFzUGCa016rQVvIHixNCCxy6+f9/Fr3/7URhjxb/PQY3uuxMe72Y7kc=
X-Gm-Gg: ASbGncs7ePFIXHqTZm0umgV75dsO2HIuWmXGz+Eyo1Xx7FTJc//NmvI/bRq3W0NH9wi
	GdC3y/hNG0tAdsHeR8drp+YIrd4Y+ruFGf2yPzMTTSdcEx25tKnaLMTipQArDYsfuvhifAagRke
	Mqw5T24MOxefnefsTiOmasHzIyyJjEtMAwGWnCIbR8TFqU4PP4mlaawUSiiLZ3K3UD3OUFXws4J
	vy0oPgK0OaPb2pmrZSDzTo8sNDy6QXGYkbIuLTw/fxl7jnFTdRcfjXYpUrQ9F3OLYoQcb/xxMOD
	QlpfSKlP8V4dTwqzsnfr3UOrjaoWqOPt12xjheDAz6JmcA7NP3o0hwNqbAD9FVoIOZo6FDfoZ3V
	jX1mVlSIRf8+TLyaCssNaOK7StNMR8TYlTJBXTrduqSw=
X-Google-Smtp-Source: AGHT+IE7sXlYc/Smmvii7lYZkcyaq2IL61WBYrzqSCNo5cELa1UR1fmrkAnVX9MoKt3Hk7T/SMVa7Q==
X-Received: by 2002:a05:600c:620a:b0:45b:84e6:129a with SMTP id 5b1f17b1804b1-45f211f6f37mr11120225e9.4.1757669740979;
        Fri, 12 Sep 2025 02:35:40 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7bb1sm5879045f8f.50.2025.09.12.02.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 02:35:40 -0700 (PDT)
Message-ID: <998aae0b-ef64-49b6-9948-c4171cdeac70@linaro.org>
Date: Fri, 12 Sep 2025 11:35:39 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: of: Simplify printks with pOF format
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250912092409.162426-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250912092409.162426-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2025 11:24, Krzysztof Kozlowski wrote:
> Print full device node name with %pOF format, so the code will be a bit
> simpler.  Code already uses pOF in other places, so this also unifies
> with the rest.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpio/gpiolib-of.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 37ab78243fab..bf17658623b9 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -160,14 +160,12 @@ static void of_gpio_quirk_polarity(const struct device_node *np,
>  {
>  	if (active_high) {
>  		if (*flags & OF_GPIO_ACTIVE_LOW) {
> -			pr_warn("%s GPIO handle specifies active low - ignored\n",
> -				of_node_full_name(np));
> +			pr_warn("%pOF GPIO handle specifies active low - ignored\n", np);
>  			*flags &= ~OF_GPIO_ACTIVE_LOW;

Heh, I misread the docs and see now in the testing that my patch changes
the behavior. of_node_full_name() is just node name. pOF is full path.

This might be desired (more accurate warning in case many nodes share
similar name) or not...

Best regards,
Krzysztof

