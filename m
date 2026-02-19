Return-Path: <linux-gpio+bounces-31854-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJwJBTTWlmmVowIAu9opvQ
	(envelope-from <linux-gpio+bounces-31854-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:21:56 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B8815D553
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA4063016279
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9EF334C08;
	Thu, 19 Feb 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdX5LyS0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621C133468F
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492898; cv=none; b=ON4ZfjOiWozUfxeQfS4ZGU/mUYqKpwkCz3z6bS+BdUF8rt2ZQ5V9qJE9V72h0QkUzOWC2DShuJAemf9gQZbgAWAcJbMNr8lZqL5UK2UsWAmkHCvzWum4hqMh90jGN8KnF+nV8YyGa7VeUtcRg12BOPGYKRqLawiacM866u2ui9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492898; c=relaxed/simple;
	bh=O40zWPwFjWDID+vSv1zF9DkJzCg6R9UEf7Hwzk5Azyo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XOtdY09x3RI5rhwgTNsdEmXUtBpsGab33zpedTeYlz0JngGnUWHB/tEO69l9lkEEcoiyA6poqBoxq7Ou0dnKe4vK1ISG6QbLYEOTCtTA6WSBKMhcqNSPnJvQ2oW7H3Oixrr24xep/PpWVMsBEJGuKN8xQ3abekIJa5KFPxwQrX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdX5LyS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0789FC19424
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771492898;
	bh=O40zWPwFjWDID+vSv1zF9DkJzCg6R9UEf7Hwzk5Azyo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=QdX5LyS0YiKWX7zQmOsmlNg0PMrv5lgQVuJd3NHA+7DSd9L9gPxHgTKMz0GcvaOug
	 SKnBbSDsEhS0c6vdu8Dxn2CmXH/j5x0swHN1/JR72AEY+AQMrajVvaYhvF0Sp+EnqM
	 UnK+iIKOOzdsQ3jOocMpEDWOX5f0EkofTSWBIV1op/c6RbvSxhmTkw9mMc7Sz4WWSr
	 oMDe1LXxUyETJwS9HM1TRYAmwE4s4s6OuVQp2zPg0vsJHTSFhbTQMqcU9+q8qzW/KP
	 4FpAIUZ028bTwp/pbExD7u/s8bgGELKUssKMf/znj7LphLSoTffaSNGlKk3/Z3DVJx
	 iYrvS2OPNxDxg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59e6b7b11ebso865072e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 01:21:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVgxtiWKRuwK5hu1ZqJur+xa9Tq6FTeBS7pJwF2V/ffQ+YIrxkyWlYP0YLEAFgRhXQuMgvKF5JIlBTq@vger.kernel.org
X-Gm-Message-State: AOJu0YxPXalkkDeVCX2ueKSlYT098bxIiCTnCTGAmhVfuewtiBlFU9LO
	wngHwehp10O0riVDCBAZAHh/59Tsug7BwOd/kPoURj0PUr0hc5jyJU9cXcjkTAJJRAky/0ON6oq
	u6/odikkC0tjHHbSpzOf4uSLjhss76x91uXG930xDEQ==
X-Received: by 2002:a05:6512:3c89:b0:59e:5fc6:f9f9 with SMTP id
 2adb3069b0e04-59f6d48496cmr5125875e87.53.1771492896583; Thu, 19 Feb 2026
 01:21:36 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 03:21:34 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 03:21:34 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218151925.1104098-1-claudiu.beznea.uj@bp.renesas.com>
Date: Thu, 19 Feb 2026 03:21:34 -0600
X-Gmail-Original-Message-ID: <CAMRc=MdQBy32a_EyEUro7GSEXGNuqqDM7XjD6YBxhLswnRkjkQ@mail.gmail.com>
X-Gm-Features: AaiRm52lN3Rygv_8TZ3sGJthN5v8F-g84zAs32BYGlN6wntMQUtOBmM7fPOD2N0
Message-ID: <CAMRc=MdQBy32a_EyEUro7GSEXGNuqqDM7XjD6YBxhLswnRkjkQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Add GPIO set_config
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, geert+renesas@glider.be, 
	linusw@kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31854-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:email,renesas.com:email,qualcomm.com:email,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 84B8815D553
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 16:19:25 +0100, Claudiu <claudiu.beznea@tuxon.dev> said:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add GPIO set_config to allow setting GPIO specific functionalities.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 863e779dda02..641ae1adfd4a 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -1848,6 +1848,25 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
>  	rzg2l_gpio_direction_input(chip, offset);
>  }
>
> +static int rzg2l_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> +				 unsigned long config)
> +{
> +	switch (pinconf_to_config_param(config)) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +	case PIN_CONFIG_DRIVE_PUSH_PULL:
> +	case PIN_CONFIG_SLEW_RATE:
> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +	case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +	case PIN_CONFIG_POWER_SOURCE:
> +		return pinctrl_gpio_set_config(chip, offset, config);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>  static const char * const rzg2l_gpio_names[] = {
>  	"P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
>  	"P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
> @@ -2819,6 +2838,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
>  	chip->direction_output = rzg2l_gpio_direction_output;
>  	chip->get = rzg2l_gpio_get;
>  	chip->set = rzg2l_gpio_set;
> +	chip->set_config = rzg2l_gpio_set_config;
>  	chip->label = name;
>  	chip->parent = pctrl->dev;
>  	chip->owner = THIS_MODULE;
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

