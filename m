Return-Path: <linux-gpio+bounces-8383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D2D93C479
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 16:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EE3DB24994
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jul 2024 14:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD67D19D07A;
	Thu, 25 Jul 2024 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XiE51TIG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737D519D095
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jul 2024 14:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721918400; cv=none; b=kNNaBaJLeJHAeAUhYUPGn+HarBUV1lhtAybQ2o21KqeQBVbExIfX8/SXkc8tg1Y3uUSjvR6TiUd/9dtO/4tZNSmZmeBF+VO5aNLw0ZMsN/fZGI++4nFvxYkPWWXBdnEN+t37oJDntiIcXJRQfsDWZnoYov02JyKGwc3K+g1MQSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721918400; c=relaxed/simple;
	bh=0jprevtwm97HPlvDbJ8iak+QX7zBxOzWXvkyqSqMkaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipj1HcK3jrAWIAscInzn5PnQT1KoYgu+umh2HiNZNaIvBCIjA/c679PLyJ4EsCFgdVZ5B8T3z59WKJMb1gAOYjWVgpyUd1t53j2cTYMEzPmMLXO/CKmt4OmyGj9D/wxjNu6MSNs8pfKQyQII+E4AN9NCzLk/mN8cbIfG6PNULjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XiE51TIG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3685a564bafso578335f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jul 2024 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721918396; x=1722523196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EmNcaMBYjNffFp8Y9eqYmsbKgIfRFa8ntga4/Bnlk8U=;
        b=XiE51TIG0QSwxM6R7gAJhuGIKhU8Wwv8LqrMssvrQkEr9uGbDiE2G6iX5nrP6LGlVR
         YjfWORVvdZzJJBiIMFOoW3I1dZdcBxoAm1XqJ/NQJ1ulUKmYi8UAkvhswnD6NQNryhDy
         Oa4/mk+XZxRMPm05/HOalEMueflQllHl1JTSXhKOgZt2auJez+pYDWLS8Gcfl/E8fN+L
         BZS1nZ+3Y+jCvbX26wUwkE6BsZcvAMuH25wjjebmIOeUV2l0Y4FAiI9gOrNLudTElrtv
         YbUAJxJznlKZidOwZFj4ctT7xQ4hr5EpWmdAJcB89SPA4gpmqwdhh69R7qHyJVQqnzJL
         outQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721918396; x=1722523196;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EmNcaMBYjNffFp8Y9eqYmsbKgIfRFa8ntga4/Bnlk8U=;
        b=qi6Q6JqgxxiSn4um4Y42nztjwxMwUcrpRy9iZ60TcpWVHOyq/MZ7aXl+EdZy27777A
         fG2NwkbKfpccvRpGEKtTc5mOhrPFqvQh+zH1QCrA/LOu3iQzOiFfsaxmotYdURi8rAtq
         nacYK6Xk1EsX06urXnuaJKXWq1rGbMe/tqa8r4g8Wo+S7H7M90ojoNJga9tKXfZN5BH5
         DwbweGrIAVW7dLP4y4GwRaxTilFWhpMquImnzQFWftuHMifdSfw4sV8z4wo4H2oqJ3yL
         iRxHzoIwUY/BJ3sTyujjNyHg+17GyL7cnUTlE9lzgtyENxb6unjrnjCiKnrCfswO0NUd
         Fzeg==
X-Forwarded-Encrypted: i=1; AJvYcCVjZpl8oNU7V+zu/Ts9nPUWrIrYTqg9x+EAQ2bisMej/6uA5NihTAaFx8rFtyqmp8H9oPH2yAbv9RYj4ap4qwEe5G0MsYxA4mvyZQ==
X-Gm-Message-State: AOJu0Yw6jyAdwnyxNoFb7VqyPPe5V09F2c/235X+V9W8ySR5M0pyNybt
	O0fKJwBt7cxp/XKEIq60GaS2BOyhc9sVnPEgejhxqtcosRchhNqXNpz/uCV83zU=
X-Google-Smtp-Source: AGHT+IGf7oywhAAEa3IVVaOAoTIXoWXB5zTQ9uLQU8Ixr/J7YCMLGoCiSQGBGBt7sL48QVY7/UM+8A==
X-Received: by 2002:adf:fe0c:0:b0:368:6596:c60c with SMTP id ffacd0b85a97d-36b3639dc76mr1767102f8f.30.1721918395512;
        Thu, 25 Jul 2024 07:39:55 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857dc2sm2403560f8f.77.2024.07.25.07.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 07:39:55 -0700 (PDT)
Message-ID: <97233c2e-78ff-40a0-b808-6929deff4427@tuxon.dev>
Date: Thu, 25 Jul 2024 17:39:53 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Return -EINVAL if the pin
 doesn't support PIN_CFG_OEN
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240723164744.505233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240723164744.505233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 23.07.2024 19:47, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the rzg2l_pinctrl_pinconf_get() function to return -EINVAL for
> PIN_CONFIG_OUTPUT_ENABLE config if the pin doesn't support the PIN_CFG_OEN
> configuration.
> 
> -EINVAL is a valid error when dumping the pin configurations. Returning
> -EOPNOTSUPP for a pin that does not support PIN_CFG_OEN resulted in the
> message 'ERROR READING CONFIG SETTING 16' being printed during dumping
> pinconf-pins.
> 
> For consistency do similar change in rzg2l_pinctrl_pinconf_set() for
> PIN_CONFIG_OUTPUT_ENABLE config.
> 
> Fixes: a9024a323af2 ("pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 632180570b70..3ef20f2fa88e 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1261,7 +1261,9 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>  		break;
>  
>  	case PIN_CONFIG_OUTPUT_ENABLE:
> -		if (!pctrl->data->oen_read || !(cfg & PIN_CFG_OEN))
> +		if (!(cfg & PIN_CFG_OEN))
> +			return -EINVAL;
> +		if (!pctrl->data->oen_read)
>  			return -EOPNOTSUPP;
>  		arg = pctrl->data->oen_read(pctrl, _pin);
>  		if (!arg)
> @@ -1402,7 +1404,9 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>  
>  		case PIN_CONFIG_OUTPUT_ENABLE:
>  			arg = pinconf_to_config_argument(_configs[i]);
> -			if (!pctrl->data->oen_write || !(cfg & PIN_CFG_OEN))
> +			if (!(cfg & PIN_CFG_OEN))
> +				return -EINVAL;
> +			if (!pctrl->data->oen_write)
>  				return -EOPNOTSUPP;
>  			ret = pctrl->data->oen_write(pctrl, _pin, !!arg);
>  			if (ret)

