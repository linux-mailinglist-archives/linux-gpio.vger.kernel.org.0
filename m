Return-Path: <linux-gpio+bounces-7291-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B28901A80
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 07:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FD31F230E3
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 05:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A5A200AE;
	Mon, 10 Jun 2024 05:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oUp5sj6C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5583B18641
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 05:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998773; cv=none; b=XNoKcUzzfTTVon6PJMVsDmxgaMXSW+3Bx8XmW8UZkrWG5Nwlp8sQ5w8IhO617yhA3D7orqaWOleRkH7vpau5SUBPsGEQpSfrN2JrbKLWeEwPkr02dcfLMfC92hZ2rcdwjB5xQgltpd42ycVkLqsfxy8ujwzvQFeNlcA0kYtaqB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998773; c=relaxed/simple;
	bh=IWwRJDyBKcopwi5JPits5hj5IwzIj55FoTGLbI7+UII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JIpUD1cfy7DJvVv8ko6J+GdXStuW8dsc6kNCN0hwC6yvIvi27gY9D3hhBMjvKqJX8eeqx7KHzUz5bvjEdH+UEzLKg6U6aVFalMTFpBI+1CrTgeiCiiujXcr2wLUcSWDlV8SJ3IZlm4jUdPvlSWTJjHkfRakgUcvNaMaar7T3BGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oUp5sj6C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42172ed3597so13766805e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2024 22:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717998770; x=1718603570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4U/V2NsvQK2vkRAof/4D7dAEGgGacd/MyNINAB4xQ2s=;
        b=oUp5sj6CY5JJQqU3RlfFsouhqmRa7ca/m7hL4ua3cgW4K0YKGC8AVSt8C6pctBMrip
         zXdLUw8X8MF9s7wiHJVbvj4MA/r6h+0K99KTOHDvpAb74aY2Eav5badauzmyNRMuppKl
         gkuWbukMTpc/A9X2si3JQbPCTsKsky0ECnZmbm2re2x+CkCMHnWanmopO/KVN9eBmSyd
         70of3Kg0MB0ci6BD+hNrG/1pC6cKGx8DsMvIxhsUpReXb3+ysgmsfVI7EJLaUgameGpg
         YJbN47q9HGFcztwhLZe+wUxIXTwLgy3eLsZDkUATUZYt8DqICym0eRzyyB4+Aj4knNdP
         mbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998770; x=1718603570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4U/V2NsvQK2vkRAof/4D7dAEGgGacd/MyNINAB4xQ2s=;
        b=HSwFNo70nTkaMq2go6TTDVi+5kyHhuFfPJU3+B8qxb3Cje9nf1LR3kfqpH/RkrbI5g
         8Cls/y3bJqbE3DpbNgQvoaU/bZSMnELLDHn8NbHGuauCk8WdR6HnTPyUOXI6TBVvICza
         cWZPJmY/1eLkTAMbnoFdwOXKLl0Rkeju5zBqIuZNRR5ItgiRviLiXJgwQHCyJrryvful
         XlAogQJ2audpCdm5plVavJFMd4/8ebRwJtQTUUjVvkAV0vUEVo33pntn8wJpB0AAeiHF
         KJdvwUPqUdygSsuv4ifUdmEsHi5kVaIlvoahb54UQ+Ue+RZJ77BP5ADrJxRr2bpA/9ve
         oMKg==
X-Forwarded-Encrypted: i=1; AJvYcCVN1WvoKIOcLcWSFErB+LPSBw5S8RgQjyLNZ119SSoB4QGBoK5JD6UPG0FlpNaxYHkD0Xn91sYQ/2EqXe3ypkUHpqR3NHKAFmEC2Q==
X-Gm-Message-State: AOJu0YwsEuzRCFhod15/2JvxfShR5T8iidDGkeJvEXa+uj9vp8IFZHAh
	8qc9eFAtfVYXxx5+8B5ZrA//Yq7FgCWn7/76sUfweC+LcCP5eq58cfHh4rzqHS6hPTG48V88XsN
	V
X-Google-Smtp-Source: AGHT+IHmNM2o3pm+MoB+OhiBOGcSHaPUCsd+QMp8eFk0NcwvC/VObM7cmza7FrZLY1tf3ua1auL6YA==
X-Received: by 2002:a05:600c:1c16:b0:421:805f:ab3c with SMTP id 5b1f17b1804b1-421805faeecmr35450885e9.14.1717998769822;
        Sun, 09 Jun 2024 22:52:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421cc89e055sm25464975e9.13.2024.06.09.22.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:52:49 -0700 (PDT)
Message-ID: <82f2faa0-3a6d-42f3-bdb8-72b164b06492@tuxon.dev>
Date: Mon, 10 Jun 2024 08:52:47 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] pinctrl: renesas: pinctrl-rzg2l: Drop struct
 rzg2l_variable_pin_cfg
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Drop the rzg2l_variable_pin_cfg struct and instead use the
> RZG2L_VARIABLE_PIN_CFG_PACK() macro for the variable pin configuration.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - New patch
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 187 +++++++-----------------
>  1 file changed, 54 insertions(+), 133 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index fe810d8dfa58..84d5882099a0 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -114,6 +114,13 @@
>  						 FIELD_GET(RZG2L_SINGLE_PIN_INDEX_MASK, (cfg)) : \
>  						 FIELD_GET(PIN_CFG_PIN_REG_MASK, (cfg)))
>  
> +#define VARIABLE_PIN_CFG_PIN_MASK		GENMASK_ULL(54, 52)
> +#define VARIABLE_PIN_CFG_PORT_MASK		GENMASK_ULL(51, 47)
> +#define RZG2L_VARIABLE_PIN_CFG_PACK(port, pin, cfg) \
> +	(FIELD_PREP_CONST(VARIABLE_PIN_CFG_PIN_MASK, (pin)) | \
> +	 FIELD_PREP_CONST(VARIABLE_PIN_CFG_PORT_MASK, (port)) | \
> +	 FIELD_PREP_CONST(PIN_CFG_MASK, (cfg)))
> +
>  #define P(off)			(0x0000 + (off))
>  #define PM(off)			(0x0100 + (off) * 2)
>  #define PMC(off)		(0x0200 + (off))
> @@ -234,18 +241,6 @@ struct rzg2l_dedicated_configs {
>  	u64 config;
>  };
>  
> -/**
> - * struct rzg2l_variable_pin_cfg - pin data cfg
> - * @cfg: port pin configuration
> - * @port: port number
> - * @pin: port pin
> - */
> -struct rzg2l_variable_pin_cfg {
> -	u64 cfg:47;
> -	u64 port:5;
> -	u64 pin:3;
> -};
> -
>  struct rzg2l_pinctrl_data {
>  	const char * const *port_pins;
>  	const u64 *port_pin_configs;
> @@ -254,7 +249,7 @@ struct rzg2l_pinctrl_data {
>  	unsigned int n_port_pins;
>  	unsigned int n_dedicated_pins;
>  	const struct rzg2l_hwcfg *hwcfg;
> -	const struct rzg2l_variable_pin_cfg *variable_pin_cfg;
> +	const u64 *variable_pin_cfg;
>  	unsigned int n_variable_pin_cfg;
>  };
>  
> @@ -331,131 +326,57 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
>  	unsigned int i;
>  
>  	for (i = 0; i < pctrl->data->n_variable_pin_cfg; i++) {
> -		if (pctrl->data->variable_pin_cfg[i].port == port &&
> -		    pctrl->data->variable_pin_cfg[i].pin == pin)
> -			return (pincfg & ~PIN_CFG_VARIABLE) | pctrl->data->variable_pin_cfg[i].cfg;
> +		u64 cfg = pctrl->data->variable_pin_cfg[i];
> +
> +		if (FIELD_GET(VARIABLE_PIN_CFG_PORT_MASK, cfg) == port &&
> +		    FIELD_GET(VARIABLE_PIN_CFG_PIN_MASK, cfg) == pin)
> +			return (pincfg & ~PIN_CFG_VARIABLE) | FIELD_GET(PIN_CFG_MASK, cfg);
>  	}
>  
>  	return 0;
>  }
>  
> -static const struct rzg2l_variable_pin_cfg r9a07g043f_variable_pin_cfg[] = {
> -	{
> -		.port = 20,
> -		.pin = 0,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> -		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 20,
> -		.pin = 1,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> -		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 20,
> -		.pin = 2,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> -		       PIN_CFG_IEN  | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 20,
> -		.pin = 3,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 20,
> -		.pin = 4,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 20,
> -		.pin = 5,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 20,
> -		.pin = 6,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 20,
> -		.pin = 7,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_IEN | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 23,
> -		.pin = 1,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_NOGPIO_INT
> -	},
> -	{
> -		.port = 23,
> -		.pin = 2,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 23,
> -		.pin = 3,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 23,
> -		.pin = 4,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 23,
> -		.pin = 5,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 24,
> -		.pin = 0,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 24,
> -		.pin = 1,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 24,
> -		.pin = 2,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 24,
> -		.pin = 3,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 24,
> -		.pin = 4,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_NOGPIO_INT,
> -	},
> -	{
> -		.port = 24,
> -		.pin = 5,
> -		.cfg = PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> -		       PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> -		       PIN_CFG_NOGPIO_INT,
> -	},
> +static const u64 r9a07g043f_variable_pin_cfg[] = {
> +	RZG2L_VARIABLE_PIN_CFG_PACK(20, 0, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> +					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(20, 1, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> +					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(20, 2, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> +					   PIN_CFG_IEN  | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(20, 3, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(20, 4, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(20, 5, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(20, 6, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(20, 7, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_IEN | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(23, 1, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(23, 2, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(23, 3, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(23, 4, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(23, 5, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(24, 0, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(24, 1, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(24, 2, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(24, 3, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(24, 4, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_NOGPIO_INT),
> +	RZG2L_VARIABLE_PIN_CFG_PACK(24, 5, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
> +					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> +					   PIN_CFG_NOGPIO_INT),
>  };
>  #endif
>  

