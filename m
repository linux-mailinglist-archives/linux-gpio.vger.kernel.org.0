Return-Path: <linux-gpio+bounces-38312-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +cePBNVvKmpJpQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38312-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:20:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB6F66FCC1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 10:20:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=kWlxg8LF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38312-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38312-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A7AE3004D18
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 08:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157C0377EA1;
	Thu, 11 Jun 2026 08:20:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB9D375F80;
	Thu, 11 Jun 2026 08:20:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166006; cv=none; b=ixhswIch2iwLwQYuLszCUJIA7HwC2aT18illtw8FQBqRWYTIvHVa87eUb//e0fUcPz3A3e4V0anjfdyIxuRhPY5g3PqWgQ5zYad7bbFnQQBx1AE7H/ttJd5fiWEFt4NfXKygvNrohMU1LnrGZuUayQN26nge/ykFXzN8mRMQdpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166006; c=relaxed/simple;
	bh=jHOP6IhQ37hetV0uorj1mEiX8MFbmjK/VF+clQ/ci64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnbmaGWrLhbGKMKiIqhXD2OYeRdu9V8VPdUPGqtdBhihveOqc1nvlX1qjA6hMgHiQCutV7WVLRrfmNLr9bkX9UGCDpwJyvaVlxPY2X7H6A/riyAHntzZEyBM2xi5LjFc3dD9CeQ1tP7Ew7ReJBusfm/4XfagNBxZ3IQqkoe3K9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWlxg8LF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234A21F00893;
	Thu, 11 Jun 2026 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166005;
	bh=fr+DMHV7C/ONH1wbSjwWQxeSkxkzZtV3gH63+z7VYZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kWlxg8LFLCAeQTFADVA9UsmL3cBo4vuLEta8ks3k/wLAFPzCLSS+3re9JM4+LcpS4
	 YC2Zl2fRTK4N/76LIk8JgxaUswuj9lgxBFVzcKauEV6v3E4BvZ+oW2Y50sArj+vgKE
	 sq1GDO7iZ10+PbMUmda/rz6XcgsO09627Ozm7QpJId3hdrOnGzbt9/Uj57tq1hP6Ti
	 G8PHa81vRpgOkDr0hq64S2tktMrFtJQw84m/Dw8ektnBIwIDu8EhgCd2LX62z+yBAe
	 Ddnon1tfqm/lJL86YggAekIubSRYedpLks0yh0ucOYfnSff7xzPkwPTODEbN4UgU5J
	 G8JBHg7C0AXOQ==
Date: Thu, 11 Jun 2026 09:20:00 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/2] mfd: arizona: Convert GPIO IRQ handling to
 descriptors
Message-ID: <20260611082000.GL4151951@google.com>
References: <20260527-mfd-arizona-irq-v5-0-ebeda2e925da@kernel.org>
 <20260527-mfd-arizona-irq-v5-2-ebeda2e925da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527-mfd-arizona-irq-v5-2-ebeda2e925da@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38312-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ckeepax@opensource.cirrus.com,m:patches@opensource.cirrus.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,cirrus.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AB6F66FCC1

Couple of Sashiko issues I'd like you to comment on please buddy.

On Wed, 27 May 2026, Linus Walleij wrote:

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
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  drivers/mfd/arizona-irq.c         | 50 +++++++++++++++++++++------------------
>  include/linux/mfd/arizona/core.h  |  2 ++
>  include/linux/mfd/arizona/pdata.h |  5 ----
>  3 files changed, 29 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/mfd/arizona-irq.c b/drivers/mfd/arizona-irq.c
> index 544016d420fe..cf8e42662585 100644
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

[Severity: High]
Does this incorrectly check the logical value of the GPIO instead of the raw
physical state?

The legacy gpio_get_value_cansleep() returned the raw physical state of the
pin. The new gpiod_get_value_cansleep() returns the logical state, which
incorporates the ACTIVE_LOW flag from the devicetree or software node.

Because the IRQ trigger flags describe physical voltage transitions, comparing
these physical flags against a logical value might be incorrect. For example,
if a user defines irq-gpios with GPIO_ACTIVE_LOW for a falling edge interrupt,
a physically low line becomes logically 1, causing the polling condition
!gpiod_get_value_cansleep() to evaluate to 0, which fails to poll when the
interrupt is active.

Conversely, when the line is idle, it evaluates to 1, causing the IRQ handler
to poll infinitely.

Should this use gpiod_get_raw_value_cansleep() to preserve the original
physical semantics?



[Severity: High]
This is a pre-existing issue, but can this loop forever if the GPIO read
returns a negative error code?

gpiod_get_value_cansleep() (and its legacy predecessor) can return a negative
error code (e.g., -EIO) if reading the GPIO state fails over the bus. Since
negative values are non-zero, this evaluates to true for IRQF_TRIGGER_RISING,
setting poll = true and causing an infinite loop in the IRQ handler thread if
the read continues to fail.

Conversely, for IRQF_TRIGGER_FALLING, !(-EIO) evaluates to false, which
immediately aborts the poll.

Could the return value be stored in an integer and explicitly checked for
negative errors before evaluating it as a boolean?


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
> @@ -210,6 +208,7 @@ int arizona_irq_init(struct arizona *arizona)
>  	const struct regmap_irq_chip *aod, *irq;
>  	struct irq_data *irq_data;
>  	unsigned int virq;
> +	int gpio_irq;
>  
>  	arizona->ctrlif_error = true;
>  
> @@ -350,27 +349,32 @@ int arizona_irq_init(struct arizona *arizona)
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
> +	/*
> +	 * Used to emulate edge trigger and to work around broken pinmux
> +	 * define "irq-gpios" in device tree or software node.
> +	 */
> +	arizona->irq_gpiod = devm_gpiod_get_optional(arizona->dev, "irq",
> +						     GPIOD_IN);
> +	if (IS_ERR(arizona->irq_gpiod)) {
> +		ret = dev_err_probe(arizona->dev,
> +				    PTR_ERR(arizona->irq_gpiod),
> +				    "Error getting IRQ GPIO\n");
> +		goto err_main_irq;
> +	}
> +	if (arizona->irq_gpiod) {
> +		gpio_irq = gpiod_to_irq(arizona->irq_gpiod);
> +		if (gpio_irq < 0) {
> +			ret = dev_err_probe(arizona->dev, gpio_irq,
> +					    "GPIO IRQ line is invalid\n");
> +			goto err_main_irq;
>  		}
> -
> -		ret = devm_gpio_request_one(arizona->dev,
> -					    arizona->pdata.irq_gpio,
> -					    GPIOF_IN, "arizona IRQ");
> -		if (ret != 0) {
> -			dev_err(arizona->dev,
> -				"Failed to request IRQ GPIO %d:: %d\n",
> -				arizona->pdata.irq_gpio, ret);
> -			arizona->pdata.irq_gpio = 0;
> +		if (gpio_irq != arizona->irq) {
> +			dev_warn(arizona->dev, "IRQ %d does not match GPIO's IRQ %d\n",
> +				 arizona->irq, gpio_irq);
> +			arizona->irq = gpio_irq;
>  		}
> +		gpiod_set_consumer_name(arizona->irq_gpiod, "arizona IRQ");
>  	}
> -#endif
>  
>  	ret = request_threaded_irq(arizona->irq, NULL, arizona_irq_thread,
>  				   flags, "arizona", arizona);
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
> index d465dcd8c90a..2f980d51cdfa 100644
> --- a/include/linux/mfd/arizona/pdata.h
> +++ b/include/linux/mfd/arizona/pdata.h
> @@ -178,11 +178,6 @@ struct arizona_pdata {
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
> 2.54.0
> 

-- 
Lee Jones

