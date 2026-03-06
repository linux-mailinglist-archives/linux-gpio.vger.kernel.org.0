Return-Path: <linux-gpio+bounces-32703-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C2rGoRkq2kWcwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32703-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 00:34:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DC228C00
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 00:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D763B30917A2
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 23:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75353803E9;
	Fri,  6 Mar 2026 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtqlJnxO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8590E37FF6D;
	Fri,  6 Mar 2026 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772840021; cv=none; b=rUHdHI44xvT8LmP+iorqHooiiyh605VgQAzvsXpr/gprR6JL9jA38VSWUb8fVufsxFz3pBwu4KKVwKNJCGma1ffIUkApK+9PW15NjTwKKr5ZelmzvcljDd4NxpzD9Y9z811rXSkk2SX4Jt7uL140iV9AJNrtqR+endk7OMRiGUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772840021; c=relaxed/simple;
	bh=7UOHp0koFKWsMOVPOsKMr6xxO6qySG5YPfuI/lloL+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxD/VFHQD5AWWDO92W92UC/Re2/DPyeNn3l2r78r1eWqIWui95XKuMprnqUzN637gQ88EJ3gjTIfwlFE9mdSDJVVuBAHNTfxMiEcDvRHI+UUARNjAIly8tT9sllJrBir7J04Mv5xAMg5ZyCU9mNwKoi4kCKwCSozOtaBlK75ko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtqlJnxO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861ADC2BCB6;
	Fri,  6 Mar 2026 23:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772840021;
	bh=7UOHp0koFKWsMOVPOsKMr6xxO6qySG5YPfuI/lloL+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PtqlJnxOsVXUMnVHMJLwFlzx0PDjDXhZdKLSjSDvvhaIOiOa4Y174vbJqw60jRXGZ
	 ZjENzdautpl2cE5Aj8qdQl1LDidR62CjxAaaGC7AbG6SvuOGxq2pW33UdXXtoJJWWH
	 13r/Ahn3RnSw0OD2yuON50UkxpRTy+C+H7HlcxVPcCfopTSDgIPGEqEdbzYEqkfQsl
	 R4d1+YS2lgNh1YKRw3SGrgzyluylh124eTIH09lRQtd4QOCWfNXFG10WKPmqiqbbdr
	 xHz0cnB+Qv23cH6Vy8saoXQGfZRAWF6TfKbLqfS981g0e3WjKJOAYop4glfhve2G0u
	 eOEk1szZJrCNw==
From: Jakub Kicinski <kuba@kernel.org>
To: xujialu@vimux.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	brgl@kernel.org
Subject: Re: [v3,2/3] nfc: nfcmrvl: convert to gpio descriptors
Date: Fri,  6 Mar 2026 15:33:35 -0800
Message-ID: <20260306233335.1056182-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <A3CB5E4EB1A5B1D5+20260306035909.2447844-5-xujialu@vimux.org>
References: <A3CB5E4EB1A5B1D5+20260306035909.2447844-5-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C40DC228C00
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32703-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.983];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
nfc: nfcmrvl: convert to gpio descriptors

This commit replaces the legacy GPIO API (of_get_named_gpio() /
gpio_request_one() / gpio_set_value()) with the descriptor-based API
(devm_gpiod_get_optional() / gpiod_set_value()) from
<linux/gpio/consumer.h>, removing the dependency on <linux/of_gpio.h>.

> diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
> index c51d22e4579c..46cc1386ad3b 100644
> --- a/drivers/nfc/nfcmrvl/main.c
> +++ b/drivers/nfc/nfcmrvl/main.c

[ ... ]

> @@ -112,13 +112,12 @@ struct nfcmrvl_private *nfcmrvl_nci_register_dev(enum nfcmrvl_phy phy,
>
>  	memcpy(&priv->config, pdata, sizeof(*pdata));
>
> -	if (gpio_is_valid(priv->config.reset_n_io)) {
> -		rc = gpio_request_one(priv->config.reset_n_io,
> -				      GPIOF_OUT_INIT_LOW,
> -				      "nfcmrvl_reset_n");
> -		if (rc < 0) {
> -			priv->config.reset_n_io = -EINVAL;
> -			nfc_err(dev, "failed to request reset_n io\n");
> +	if (!priv->config.reset_gpio) {
> +		priv->config.reset_gpio =
> +			devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +		if (IS_ERR(priv->config.reset_gpio)) {
> +			priv->config.reset_gpio = NULL;
> +			nfc_err(dev, "failed to get reset gpio\n");
>  		}
>  	}

Does the I2C and SPI paths properly initialize reset_gpio? Looking at the
I2C path (nfcmrvl_i2c_probe -> nfcmrvl_i2c_parse_dt), the function declares
'struct nfcmrvl_platform_data config' on the stack without zeroing and calls
nfcmrvl_parse_dt() which now only sets hci_muxed:

drivers/nfc/nfcmrvl/main.c:nfcmrvl_parse_dt() {
	pdata->hci_muxed = of_property_read_bool(node, "hci-muxed");
	return 0;
}

The reset_gpio field is left uninitialized with stack garbage. The same
issue affects SPI (nfcmrvl_spi_probe -> nfcmrvl_spi_parse_dt).

When the uninitialized config is passed to nfcmrvl_nci_register_dev(), the
check 'if (!priv->config.reset_gpio)' may evaluate to false (garbage
non-NULL pointer), causing the code to skip devm_gpiod_get_optional() and
later use the garbage pointer in gpiod_set_value():

nfcmrvl_chip_halt() {
	if (priv->config.reset_gpio)
		gpiod_set_value(priv->config.reset_gpio, 0);
}

Can this cause a kernel crash? The UART path was updated in this patch to
initialize the field properly, and the USB path already uses memset to zero
the config, so only I2C and SPI are affected.

[ ... ]

> @@ -233,34 +227,24 @@ void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
>  	/* Reset possible fault of previous session */
>  	clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
>
> -	if (gpio_is_valid(priv->config.reset_n_io)) {
> +	if (priv->config.reset_gpio) {
>  		nfc_info(priv->dev, "reset the chip\n");
> -		gpio_set_value(priv->config.reset_n_io, 0);
> +		gpiod_set_value(priv->config.reset_gpio, 0);
>  		usleep_range(5000, 10000);
> -		gpio_set_value(priv->config.reset_n_io, 1);
> +		gpiod_set_value(priv->config.reset_gpio, 1);
>  	} else
>  		nfc_info(priv->dev, "no reset available on this interface\n");
>  }
>
>  void nfcmrvl_chip_halt(struct nfcmrvl_private *priv)
>  {
> -	if (gpio_is_valid(priv->config.reset_n_io))
> -		gpio_set_value(priv->config.reset_n_io, 0);
> +	if (priv->config.reset_gpio)
> +		gpiod_set_value(priv->config.reset_gpio, 0);
>  }

Are the GPIO polarity values inverted here? The DT binding documentation
(Documentation/devicetree/bindings/net/nfc/marvell,nci.yaml) specifies
GPIO_ACTIVE_LOW for the reset-n-io property:

reset-n-io = <&gpio3 19 GPIO_ACTIVE_LOW>;

With the gpiod API, gpiod_set_value() respects the active-low flag:
  - gpiod_set_value(desc, 1) = assert (physically LOW for active-low)
  - gpiod_set_value(desc, 0) = deassert (physically HIGH for active-low)

The old gpio_set_value() ignored polarity flags and drove raw physical
levels directly.

The patch keeps the same raw values (0 then 1) but with gpiod_set_value()
this inverts the actual behavior:

nfcmrvl_chip_reset() now does:
  - gpiod_set_value(gpio, 0) = deassert reset (chip running)
  - usleep_range(5000, 10000)
  - gpiod_set_value(gpio, 1) = assert reset (chip in reset)

This is backwards - it leaves the chip stuck in reset after a "reset"
operation.

Similarly, nfcmrvl_chip_halt() calls gpiod_set_value(gpio, 0) which
deasserts reset (chip runs) instead of asserting it (chip halted).

Also, the GPIOD_OUT_LOW initial state in devm_gpiod_get_optional() means
"deasserted" (physically HIGH) rather than the old GPIOF_OUT_INIT_LOW
(physically LOW).

Should the values be inverted to work correctly with the descriptor API?

  - chip_reset: gpiod_set_value(gpio, 1) then gpiod_set_value(gpio, 0)
  - chip_halt: gpiod_set_value(gpio, 1)
  - initial state: GPIOD_OUT_HIGH
-- 
pw-bot: cr

