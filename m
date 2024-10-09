Return-Path: <linux-gpio+bounces-11093-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 874AC996182
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 09:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33D621F21422
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 07:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D035186E26;
	Wed,  9 Oct 2024 07:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QGzIcRmk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0B21865F3
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460444; cv=none; b=ntrYQzLFj73Z4NSa/pvRCxBYm+34dqC6LY9PX+/eJyXpUGVXtC3d6Tk5KFQ3phmLc3q/zev9mLKGGlWvcSMZ0v4AauOVuQ940aPXuItA1d6YtjIKqH6Y/5pcj3XcU37vqB9IjJUDFrE75UnKoh9BNG31LavjhjjduA2d0Ko6JLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460444; c=relaxed/simple;
	bh=efQX1PzXQcu3futeaCHmIAMB+YfEwxKWyFD13EVZx6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4qxkum+wrEWclPE+YfSyZtBTCiXbCmdH6+QoGB6LDb5ENLSTAxitpOlx3pyK2Ihq6bfYDGS9X1VXGs9C1SQtdIBcjpKVFLwXy8lvc0jJraDslXC0l3Sfkt2ox9hUh6dbp7nwZynbVoia9zc0NtNKKnlySBWt7P563KQu+WCkFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QGzIcRmk; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c896b9b3e1so8976971a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728460441; x=1729065241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1perKIzrCtxj4QEbrelDOAMpb+YoICxxvus9omfDMG8=;
        b=QGzIcRmkvgMMapgz/ni49WUtJ8N6eVB/14mVRXPGFW1Dc802j16OMZdIBUfjdy5zvB
         7mLVUnng0Ofz4VUi7G9JT59NAb7cfGd2bZShVtaVjAun6yLfoHUJD4QIfFiHptib8ONI
         szwLStw4AZPMXrr6UH/Ara47Y1ZrYa4Upyo8tiLxmwj5KUtUjmLrKW3euu70areWGkIu
         wsp99xnqheX5dS7I2B0TiETUHJoaseGvMPgxOylRG+oNBfFGxuz8bPXqrODgg3wfPPsJ
         2meTOduexyH800EauPrF6wS61Sg9hrCYPbqn08Y5BONFHEe6JPDZ+i1ULtWXBnaJdUJb
         sBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728460441; x=1729065241;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1perKIzrCtxj4QEbrelDOAMpb+YoICxxvus9omfDMG8=;
        b=Fn+Y9IYtz+Yufx4Li+jjbXJjcK9tzb5WUkZy+zhghIWyIyj55uoWRAMISgirMJz5E0
         a+eK/hd6OFMNl0nOi16sAGoqx74lrRjN++5KEfhdI5ZyJ2tOLNOer1uJOhmXvmb5DJVx
         FlDc6wRMYmElGyoCqkIKgK5xANVdI1h+l+k1tESgmzptbo+q5LcIMEmmu06XZa6/DeAt
         zzVM8jUNSoBRiqzWuBWVg57lk/XxUdK/YJmLE9yN3zBiSd3kjJB7tcpIcREcW0xVgToz
         N4Oq/ElLAdgIADRtOond7dqAODqfvfgywYntO5Ug3+TC3WkMoPlkc6oHGQSVyGwSUb0d
         8byw==
X-Forwarded-Encrypted: i=1; AJvYcCUS7mU+pvqP90tF6d8o46aV5IMMMz7dY0DpsyZCzr67tWBvntWZG9dJfGLB3f7khR++taQ+dGJCWvf0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh8eYmzUoFmGbjDdoLvKxkpZQrwiKSvwrlTF5orJ9Vr049c/st
	tegZuhWFLyUy0wBVkcpbQCG7o6REB5PQcxXxHQ6qHR4enHOjWsgvA1rZxDOztyA=
X-Google-Smtp-Source: AGHT+IHCF4myi5HtyfnTlaYGGkktHdwJJjSkFO2+9Jhfz7+HdvkvNwuuOcLmwUig1V/EpN8O4vDaIA==
X-Received: by 2002:a17:907:e69a:b0:a99:4eac:bba9 with SMTP id a640c23a62f3a-a998d2408admr137648166b.38.1728460441463;
        Wed, 09 Oct 2024 00:54:01 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99309aa6afsm610392466b.112.2024.10.09.00.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 00:54:00 -0700 (PDT)
Message-ID: <519e6de9-7ad2-4c6e-aad4-f7cec6ddaf0a@tuxon.dev>
Date: Wed, 9 Oct 2024 10:53:59 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] pinctrl: renesas: rzg2l: Add support for
 configuring schmitt-trigger
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
 <20241004123658.764557-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241004123658.764557-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04.10.2024 15:36, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add support for configuring the multiplexed pins as schmitt-trigger
> inputs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Same here:
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
 v1->v2

> - Included RB tag
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 8d576cc74003..13708c71f938 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -140,6 +140,7 @@
>  #define PUPD(off)		(0x1C00 + (off) * 8)
>  #define ISEL(off)		(0x2C00 + (off) * 8)
>  #define NOD(off)		(0x3000 + (off) * 8)
> +#define SMT(off)		(0x3400 + (off) * 8)
>  #define SD_CH(off, ch)		((off) + (ch) * 4)
>  #define ETH_POC(off, ch)	((off) + (ch) * 4)
>  #define QSPI			(0x3008)
> @@ -162,6 +163,7 @@
>  #define SR_MASK			0x01
>  #define PUPD_MASK		0x03
>  #define NOD_MASK		0x01
> +#define SMT_MASK		0x01
>  
>  #define PM_INPUT		0x1
>  #define PM_OUTPUT		0x2
> @@ -1351,6 +1353,15 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>  			return -EINVAL;
>  		break;
>  
> +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +		if (!(cfg & PIN_CFG_SMT))
> +			return -EINVAL;
> +
> +		arg = rzg2l_read_pin_config(pctrl, SMT(off), bit, SMT_MASK);
> +		if (!arg)
> +			return -EINVAL;
> +		break;
> +
>  	case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
>  		if (!(cfg & PIN_CFG_IOLH_RZV2H))
>  			return -EINVAL;
> @@ -1489,6 +1500,13 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>  					     param == PIN_CONFIG_DRIVE_OPEN_DRAIN ? 1 : 0);
>  			break;
>  
> +		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +			if (!(cfg & PIN_CFG_SMT))
> +				return -EINVAL;
> +
> +			rzg2l_rmw_pin_config(pctrl, SMT(off), bit, SMT_MASK, arg);
> +			break;
> +
>  		case RENESAS_RZV2H_PIN_CONFIG_OUTPUT_IMPEDANCE:
>  			if (!(cfg & PIN_CFG_IOLH_RZV2H))
>  				return -EINVAL;

