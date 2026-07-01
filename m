Return-Path: <linux-gpio+bounces-39271-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id agz7JibCRGqg0QoAu9opvQ
	(envelope-from <linux-gpio+bounces-39271-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:30:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E943C6EAA6E
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 09:30:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=D5KgyCu5;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39271-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39271-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E080E3038A65
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 07:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B387B3B5318;
	Wed,  1 Jul 2026 07:26:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127902BF002
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:26:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890765; cv=none; b=NMnpoWBRr/BDR3Vjfs1SM83+Y1JsLAbmWdYQy/X9P3rKLLTH/vHkQlV+xhDDAn7nM9xu/Tfce2iwKlpEdkdfjAr8qV+GMxhQ80JVSOavEH0FOaQ0dlpunOZ1dcUlUWKKUXpRb2gFjO8gS+R9gJcCSSinLTHdRVGXhnib6dOdrIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890765; c=relaxed/simple;
	bh=bwrtRFjoK4UIez7xwJzXKm/8RtgqJanzk3LaK/QyMhY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHXy0cmhqqfkMlsm4V0FvXtBvJr06UnFtsyaOg3rwCFgLHkBEqEhutg/jrXUURLIgb1fFFDXWyOVnKBabshnuPoyj6sBacxMZHK/d9c8wUGC9XK06PJFvbqjZc2FfDlmrKcp33I6NKub7pEYerevdfostnlH+0bI016ouIQJRjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5KgyCu5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F0F1F00A3D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782890763;
	bh=d8Rvpk04BdjSa0tVlaireZJxfNxn48bfWqSWvAZYurU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=D5KgyCu5DgEa2hVO+10BQbV78125mitj5BN42yCw+omu3Wq7o42nHHeUDCdduI7x1
	 yqN2B1q+MHypP7eWGHb/+/N9/ut8TVi+34BaZa7WtXVnnZtCLrfOPeqJaOZ8wyTkga
	 jkJzzTPw8sgg9xUdtPolgCuLFxpsIXLtYmR4y2umAUjCLwNRlOU0TmdYcetgmOZYIg
	 nd0wBOs6Lk6YZmMX0zG18sUndr6bf9r/iyTFiNiH3IsJnv8P9NHIwbr0TEiGOnusvl
	 UKR+VX4WAsrGNQ+LynSNW8yJiHUJ5CaJ1/xBLdKcL7OuxEvF8CsHNmklqSI+AfFZN/
	 kBJ27Jf8ZVOrQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aebae2f310so293058e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:26:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YxIozZRLDqZ/42t5I7gUnPOoL2GVzO92S4+cRewbTR4PJsWJ/N6
	IRvjBd/XOEVoA50CePMeXpFs5fbsTTL1N+x+Nhar8d0KAYAOqbPLpl8m1HQicN7EXqg2UTO8m7U
	BUHqlC705HuHzuRwhhYzAAe1+4mlr+Pzr/OsE8nA01Q==
X-Received: by 2002:a05:6512:8388:b0:5ae:b861:ac27 with SMTP id
 2adb3069b0e04-5aec6793d72mr68315e87.18.1782890762547; Wed, 01 Jul 2026
 00:26:02 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:26:00 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:26:00 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260701010228.1605573-1-mark.tomlinson@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701010228.1605573-1-mark.tomlinson@alliedtelesis.co.nz>
Date: Wed, 1 Jul 2026 03:26:00 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md8c6MPUoGHixboAkYsHTU+C=nGT5ci+fDkfpC=3f6Xcg@mail.gmail.com>
X-Gm-Features: AVVi8CehTFeMlqnUcg2bmFqiLFNGH0P4hdTNMEaoayy_ga8T_WSiEbnob19tyfE
Message-ID: <CAMRc=Md8c6MPUoGHixboAkYsHTU+C=nGT5ci+fDkfpC=3f6Xcg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: fix pca953x_irq_bus_sync_unlock regmap lock
To: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org, ian.ray@gehealthcare.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39271-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mark.tomlinson@alliedtelesis.co.nz,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:ian.ray@gehealthcare.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,alliedtelesis.co.nz:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E943C6EAA6E

On Wed, 1 Jul 2026 03:02:28 +0200, Mark Tomlinson
<mark.tomlinson@alliedtelesis.co.nz> said:
> Locking is disabled in the regmap config as this driver uses its own
> lock. This means that all calls to regmap functions (read or write) must
> hold the i2c_lock. The function pca953x_irq_bus_sync_unlock() did not do
> this, and it was therefore possible that multiple threads could cause an
> incorrect register to be read/written.
>
> A previous patch partly fixed this, but only protected the write to the
> interrupt mask register, and not the read from the direction register.
>
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>

Plase add Fixes: and Cc: stable.

> ---
>  drivers/gpio/gpio-pca953x.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 2ee35e855e4d..9689e3f3c517 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -605,20 +605,27 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
>  	return 0;
>  }
>
> -static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
> +static int _pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)

Please prefer pca953x_gpio_direction_input_unlocked() as it's more verbose
about the purpose.

>  {
>  	struct pca953x_chip *chip = gpiochip_get_data(gc);
>  	u8 dirreg = chip->recalc_addr(chip, chip->regs->direction, off);
>  	u8 bit = pca953x_get_bit_mask(chip, off);
>
> -	guard(mutex)(&chip->i2c_lock);
> -
>  	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
>  		return regmap_update_bits(chip->regmap, dirreg, bit, 0);
>
>  	return regmap_update_bits(chip->regmap, dirreg, bit, bit);
>  }
>
> +static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
> +{
> +	struct pca953x_chip *chip = gpiochip_get_data(gc);
> +
> +	guard(mutex)(&chip->i2c_lock);
> +
> +	return _pca953x_gpio_direction_input(gc, off);
> +}
> +
>  static int pca953x_gpio_direction_output(struct gpio_chip *gc,
>  		unsigned off, int val)
>  {
> @@ -856,9 +863,10 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
>  	DECLARE_BITMAP(reg_direction, MAX_LINE);
>  	int level;
>
> +	guard(mutex)(&chip->i2c_lock);
> +
>  	if (chip->driver_data & PCA_PCAL) {
>  		DECLARE_BITMAP(latched_inputs, MAX_LINE);
> -		guard(mutex)(&chip->i2c_lock);
>
>  		/* Enable latch on edge-triggered interrupt-enabled inputs */
>  		bitmap_or(latched_inputs, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
> @@ -880,7 +888,7 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
>
>  	/* Look for any newly setup interrupt */
>  	for_each_andnot_bit(level, irq_mask, reg_direction, gc->ngpio)
> -		pca953x_gpio_direction_input(&chip->gpio_chip, level);
> +		_pca953x_gpio_direction_input(&chip->gpio_chip, level);
>
>  	mutex_unlock(&chip->irq_lock);
>  }
> --
> 2.54.0
>
>

Thanks,
Bartosz

