Return-Path: <linux-gpio+bounces-34955-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIKBJ0e212lURwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34955-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 16:23:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BEC3CBF46
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 16:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD05230297BD
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 14:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3AB3DA7CA;
	Thu,  9 Apr 2026 14:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMdJV3k+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0464B3DA5D0;
	Thu,  9 Apr 2026 14:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775744478; cv=none; b=rd53EIWwQY+ozRWimKkKL6N33eVmsh7eyWv/qegEa1fFdgJo6zib8eRMlqMGoNxil1DSvyV29QhCymN6/lNxnWZ91jPoZRp+2tu2BquHVU3+GQCQ888qtMNS6FF9OdYAoppZBLBwtQQ9XcSrUV2NwdINfhDJQlWLgOEw93CHqjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775744478; c=relaxed/simple;
	bh=dpsEPXiwZwGBz/472JmJ/+FsWBKQt0J9ni7Su0dthqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nF/kTH97Iqfaea5fS4kjmEkzKxKkHoYWVPqSWRndArQiFcOEhu7jjEnkDlG6CGIOOYSPFFkxPv7MKCGIfV2oRySiD65aeMYj1PJPzIMYjv6wifAVWve3JWAKaaq4JFjZQXR5suntgVIZ40IZDaHJ4owrWDVKG6TX4mCIGEyPsE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMdJV3k+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21734C4CEF7;
	Thu,  9 Apr 2026 14:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775744477;
	bh=dpsEPXiwZwGBz/472JmJ/+FsWBKQt0J9ni7Su0dthqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMdJV3k+Zo2SF12Jsut6nnGN3Mio0ybEttHnZqnrjtqEK5n8Jdy/fJZB3bspXmU2p
	 +BgvW7Rc+8tQUezyrrr3R+jNf4dGZTSfvFryyj5sQ1JyMBkaFKtki8MnYppo3RtBHH
	 6yuIKjvP0gJYkfY/Lj0bSSoGRy8eq1rCCTEvkw9l7UPu2SEdqkqWMfyqesj1thbJZx
	 IF6wzZbS7xXDM3jK3UybHxn+qvr6hEpWqaKfcyVWD4aKyMVWVzBigLlLr/EMnElgXg
	 Fodth+8hhsSGZzjFL0xqT0L676XOXpGDbVHySLpl5kSPQlgmyMJMlimQ7oJlLvLbWn
	 K2NyAkxxbXnqQ==
Date: Thu, 9 Apr 2026 15:21:12 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] mfd: arizona: Convert GPIO IRQ handling to
 descriptors
Message-ID: <20260409142112.GF3290953@google.com>
References: <20260326-mfd-arizona-irq-v4-0-50c47ed0a18e@kernel.org>
 <20260326-mfd-arizona-irq-v4-2-50c47ed0a18e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326-mfd-arizona-irq-v4-2-50c47ed0a18e@kernel.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34955-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 61BEC3CBF46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026, Linus Walleij wrote:

> Convert the arizona polling GPIO handling to use a GPIO descriptor
> instead of passing a global GPIO number as platform data.
> 
> This mechanism is not used in the kernel, but let's preserve
> the mechanism to be nice.
> 
> Users can define "irq-gpios" in the devicetree or software node
> for the Arizona chip to provide the GPIO line corresponding to
> the IRQ.
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/mfd/arizona-irq.c         | 46 +++++++++++++++++++--------------------
>  include/linux/mfd/arizona/core.h  |  2 ++
>  include/linux/mfd/arizona/pdata.h |  5 -----
>  3 files changed, 24 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
> index 544016d420fe..8b752a1257b1 100644
> --- a/drivers/mfd/arizona-irq.c
> +++ b/drivers/mfd/arizona-irq.c
> @@ -136,21 +136,19 @@ static irqreturn_t arizona_irq_thread(int irq, void *data)
>  			dev_err(arizona->dev,
>  				"Failed to read main IRQ status: %d\n", ret);
>  		}
> -#ifdef CONFIG_GPIOLIB_LEGACY
>  		/*
>  		 * Poll the IRQ pin status to see if we're really done
>  		 * if the interrupt controller can't do it for us.
>  		 */
> -		if (!arizona->pdata.irq_gpio) {
> +		if (!arizona->irq_gpiod) {
>  			break;
>  		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_RISING &&
> -			   gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
> +			   gpiod_get_value_cansleep(arizona->irq_gpiod)) {
>  			poll = true;
>  		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_FALLING &&
> -			   !gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
> +			   !gpiod_get_value_cansleep(arizona->irq_gpiod)) {
>  			poll = true;
>  		}
> -#endif
>  	} while (poll);
>  
>  	pm_runtime_put_autosuspend(arizona->dev);
> @@ -350,27 +348,26 @@ int arizona_irq_init(struct arizona *arizona)
>  		goto err_map_main_irq;
>  	}
>  
> -#ifdef CONFIG_GPIOLIB_LEGACY
> -	/* Used to emulate edge trigger and to work around broken pinmux */
> -	if (arizona->pdata.irq_gpio) {
> -		if (gpio_to_irq(arizona->pdata.irq_gpio) != arizona->irq) {
> -			dev_warn(arizona->dev, "IRQ %d is not GPIO %d (%d)\n",
> -				 arizona->irq, arizona->pdata.irq_gpio,
> -				 gpio_to_irq(arizona->pdata.irq_gpio));
> -			arizona->irq = gpio_to_irq(arizona->pdata.irq_gpio);
> -		}
> -
> -		ret = devm_gpio_request_one(arizona->dev,
> -					    arizona->pdata.irq_gpio,
> -					    GPIOF_IN, "arizona IRQ");
> -		if (ret != 0) {
> -			dev_err(arizona->dev,
> -				"Failed to request IRQ GPIO %d:: %d\n",
> -				arizona->pdata.irq_gpio, ret);
> -			arizona->pdata.irq_gpio = 0;
> +	/*
> +	 * Used to emulate edge trigger and to work around broken pinmux
> +	 * define "irq-gpios" in device tree or software node.
> +	 */

Nit: Device Tree (not sure about software node).

> +	arizona->irq_gpiod = devm_gpiod_get_optional(arizona->dev, "irq",
> +						     GPIOD_IN);
> +	if (IS_ERR(arizona->irq_gpiod)) {
> +		ret = dev_err_probe(arizona->dev,
> +				    PTR_ERR(arizona->irq_gpiod),
> +				    "error getting IRQ GPIO\n");

Nit:  All other prints in this file are capitalised.

> +		goto err_irq_gpiod;
> +	}
> +	if (arizona->irq_gpiod) {
> +		if (gpiod_to_irq(arizona->irq_gpiod) != arizona->irq) {
> +			dev_warn(arizona->dev, "IRQ %d does not match GPIO's IRQ %d\n",
> +				 arizona->irq, gpiod_to_irq(arizona->irq_gpiod));
> +			arizona->irq = gpiod_to_irq(arizona->irq_gpiod);

Could we cache the result of 'gpiod_to_irq()' into a local variable rather than
calling it multiple times?

Does it make sense to check the value's for errors?

>  		}
> +		gpiod_set_consumer_name(arizona->irq_gpiod, "arizona IRQ");
>  	}
> -#endif
>  
>  	ret = request_threaded_irq(arizona->irq, NULL, arizona_irq_thread,
>  				   flags, "arizona", arizona);
> @@ -409,6 +406,7 @@ int arizona_irq_init(struct arizona *arizona)
>  	arizona_free_irq(arizona, ARIZONA_IRQ_BOOT_DONE, arizona);
>  err_boot_done:
>  	free_irq(arizona->irq, arizona);
> +err_irq_gpiod:
>  err_main_irq:

Do we really need another goto label that jumps to the same place?

>  	regmap_del_irq_chip(irq_find_mapping(arizona->virq,
>  					     ARIZONA_MAIN_IRQ_INDEX),
> diff --git a/include/linux/mfd/arizona/core.h b/include/linux/mfd/arizona/core.h
> index 6d6f96b2b29f..7129651c9af6 100644
> --- a/include/linux/mfd/arizona/core.h
> +++ b/include/linux/mfd/arizona/core.h
> @@ -11,6 +11,7 @@
>  #define _WM_ARIZONA_CORE_H
>  
>  #include <linux/clk.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/notifier.h>
>  #include <linux/regmap.h>
> @@ -136,6 +137,7 @@ struct arizona {
>  	struct irq_domain *virq;
>  	struct regmap_irq_chip_data *aod_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
> +	struct gpio_desc *irq_gpiod;
>  
>  	bool hpdet_clamp;
>  	unsigned int hp_ena;
> diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
> index f72e6d4b14a7..20118bad869a 100644
> --- a/include/linux/mfd/arizona/pdata.h
> +++ b/include/linux/mfd/arizona/pdata.h
> @@ -188,11 +188,6 @@ struct arizona_pdata {
>  	/** Haptic actuator type */
>  	unsigned int hap_act;
>  
> -#ifdef CONFIG_GPIOLIB_LEGACY
> -	/** GPIO for primary IRQ (used for edge triggered emulation) */
> -	int irq_gpio;
> -#endif
> -
>  	/** General purpose switch control */
>  	unsigned int gpsw;
>  };
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones [李琼斯]

