Return-Path: <linux-gpio+bounces-11092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980F99617E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 09:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FBC0B27368
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 07:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72620187843;
	Wed,  9 Oct 2024 07:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FbPPFQvJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAC7187848
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460406; cv=none; b=jf1I7hSPt0twNS38N0Cml4qTPQK8UVs9Eyz51NIsePivomwFMQfq20zdWb3IEorTRMPrMCkd9FW9YNnIozajWATqNsohBTDI38G44CA7Q6xyO9wEdVKDNw3Rr0QaIIoECJw/HprWowQ/XFrICuRh/9zwpll4Zu2Uo2xiwMBt/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460406; c=relaxed/simple;
	bh=0nVeT7W5+Phhjja0nEmY6ftWXeXsW/gjY9Bp9By1aqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6Lj2XwmkzGCu8OACgU0ecAOq0sIUtpMssY/K7p1BpIyDc6LeOFyHd5MNWjzBTapGLbuPNaPQ8bFO7j3CwHmOn3gVooFdWdAPGxIx1Lz4+d5NVa5gHy5CC5HCOJCp6cMRYaiSgmogpeJ38K+cGVe0wMyHoUnEj6TOHg2qS1JW8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FbPPFQvJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a997736106fso163008166b.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 00:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728460402; x=1729065202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HCfwfKIq9ZbARroJ3ctAyi9/a5TyTRYtSwRyww5eKk=;
        b=FbPPFQvJ76u70lTZmv6PYQKszH/Sh80zhvXmGS44iJDYoO+r0Mpk8lKmZ05sbWiRxy
         LVRRWlW/mUEzpWhQSlH6Tm1zCt4V/9VlvQLvJomx84jC5pjvv7ff2JLwnok/kLPa7pxm
         KhL2KJ96mmrgTm6r9gZgrMzwvTBmA+VICjfXOd/oGrX9aHuVBveGVvNoShaaZQ3pEtr3
         eDH6MxdhFngDUBhk2yYcutDITf322TSMhNuz3cRwMB5qrmKAhKt5EVDf2KK4Q1jMIjF8
         4Tr9gu+mdABJZ7rbm5PNhQY5duyD9+csx17CNr/Wzvnkiqd09FeirnwLrWpLPju90o9m
         dbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728460402; x=1729065202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HCfwfKIq9ZbARroJ3ctAyi9/a5TyTRYtSwRyww5eKk=;
        b=ttVHbfwL3Ujp/13I3sQkwfrxZGxeFOEc980+rbA/e+ZzVKpf9tGFVQKJAl6qGyKUYU
         AFiDwrnlhbyb9M95LC/Ly+yt/zNi+bowPJVsz8uy/XPGYoRcwkX/57CQbkHbmWpbZbL0
         Zd++OMCZLSUTE5jeV1XM2xzFIZb0j2xdEM/g0MGwWPYytuz/LIFg558wuw9wqMhheFMl
         gR/DHQeVxRY8/NX5s/JYK1ywmOYKWppZJGtUP3iq/wBAxRWsMZAapA1Zbo7DNvepzGW7
         l5g6xGWS07qWFSSBta0ot5pl78Xfen9fJ61nmL02zhKQXraEFzPsITdhf5faBbaxvjkc
         HJCw==
X-Forwarded-Encrypted: i=1; AJvYcCVhZtl+s3goA3RemOryUaV/dY5yVZ7n4MIxU8e1G0aiegrqCTr2q6+PUrClJfptMQ8TAqE0u8xT7YRC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+GbhyUQWk0NHslVKL0PpMu9yDFvQd7+zF7ZfeT1Fi+Lp+Ul25
	bz/Cv7OHfEGiKarbAhBfYpbZAuTxOcpwiuuEjTpCuORW0gtxYmtWKkG9KGNEHV4=
X-Google-Smtp-Source: AGHT+IGQNbg3+XlDlAPHm+pG+j/DlGK4MmpO+b+YCiy639M+XJvMH8CAruvFmcbUVf8BjeF+BMsxiw==
X-Received: by 2002:a17:907:9485:b0:a8d:4631:83b0 with SMTP id a640c23a62f3a-a998d10bb80mr97448566b.5.1728460402185;
        Wed, 09 Oct 2024 00:53:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99309aa6afsm610392466b.112.2024.10.09.00.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 00:53:21 -0700 (PDT)
Message-ID: <bb4bf1af-ea62-433d-ab5e-982055a4cec9@tuxon.dev>
Date: Wed, 9 Oct 2024 10:53:19 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] pinctrl: renesas: rzg2l: Add support for
 enabling/disabling open-drain outputs
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241004123658.764557-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241004123658.764557-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04.10.2024 15:36, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for enabling and disabling open-drain outputs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

I gave it a simple try on RZ/G3S. All good. You can add:

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
> v1->v2
> - Implemented PIN_CONFIG_DRIVE_OPEN_DRAIN to disable open drain
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index b2d309f742af..8d576cc74003 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -139,6 +139,7 @@
>  #define IEN(off)		(0x1800 + (off) * 8)
>  #define PUPD(off)		(0x1C00 + (off) * 8)
>  #define ISEL(off)		(0x2C00 + (off) * 8)
> +#define NOD(off)		(0x3000 + (off) * 8)
>  #define SD_CH(off, ch)		((off) + (ch) * 4)
>  #define ETH_POC(off, ch)	((off) + (ch) * 4)
>  #define QSPI			(0x3008)
> @@ -160,6 +161,7 @@
>  #define IOLH_MASK		0x03
>  #define SR_MASK			0x01
>  #define PUPD_MASK		0x03
> +#define NOD_MASK		0x01
>  
>  #define PM_INPUT		0x1
>  #define PM_OUTPUT		0x2
> @@ -1337,6 +1339,18 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>  		break;
>  	}
>  
> +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> +		if (!(cfg & PIN_CFG_NOD))
> +			return -EINVAL;
> +
> +		arg = rzg2l_read_pin_config(pctrl, NOD(off), bit, NOD_MASK);
> +		if (!arg && param != PIN_CONFIG_DRIVE_PUSH_PULL)
> +			return -EINVAL;
> +		if (arg && param != PIN_CONFIG_DRIVE_OPEN_DRAIN)
> +			return -EINVAL;
> +		break;
> +
>  	case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
>  		if (!(cfg & PIN_CFG_IOLH_RZV2H))
>  			return -EINVAL;
> @@ -1466,6 +1480,15 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>  			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, index);
>  			break;
>  
> +		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +		case PIN_CONFIG_DRIVE_PUSH_PULL:
> +			if (!(cfg & PIN_CFG_NOD))
> +				return -EINVAL;
> +
> +			rzg2l_rmw_pin_config(pctrl, NOD(off), bit, NOD_MASK,
> +					     param == PIN_CONFIG_DRIVE_OPEN_DRAIN ? 1 : 0);
> +			break;
> +
>  		case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
>  			if (!(cfg & PIN_CFG_IOLH_RZV2H))
>  				return -EINVAL;

