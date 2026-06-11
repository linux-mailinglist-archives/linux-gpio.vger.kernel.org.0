Return-Path: <linux-gpio+bounces-38320-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nPbDJG2CKmq2rQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38320-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:39:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 422176707C3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:39:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gO2+HB+d;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38320-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38320-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E8F830309E7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11973BED6A;
	Thu, 11 Jun 2026 09:39:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F7E3451D6;
	Thu, 11 Jun 2026 09:39:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170794; cv=none; b=RPR3HExQGLp5KtjvLkLpfsk6HONWR15JJq4XT/tliY4B5+RkneD2LsqOU/qrmAX3iT0zmRw3tUCeEf03GcARI0+80Ch8yTVhQpPItUFkPs+rEkeBV2l5TzGZE/VLlOmm81nlABTTcm5NXmjO8llUSIh1feDwEmXa8WpVRj/qw68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170794; c=relaxed/simple;
	bh=Kp1l3i82/bTOksbc51tcQ4Gvr9B1S3ou4MHzLSUTFtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8Eat02OKnLY2aOv5yjm1qjGB+t/LTpPDa60m7r/la9r7uDbqBsFE6yRLSwP9mL84LoXqluTauN5PocktnOk1YqRP99XjFE2HvQmfdUJWwglVgntmuAPW8OwYRDQArY02mjrphI6un8h7B/AD0PAKEPivrv0yT6nBjKy8+InxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gO2+HB+d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF741F00893;
	Thu, 11 Jun 2026 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781170793;
	bh=R5yiotapJVMX0NE8j/ye5/VtU3Y1gWhYPhxIoCxJbW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gO2+HB+dSMqvPSMzDGoem5nbamut+f22nTmegbMqmhUlvUSbJ5XpYl3jggfkNWw1L
	 fJK4uKqnjUpoX6GONzuai8pHkOv2Eibbgrjbb0IL3lFhH6BXG1VUc9SAQ521067PFk
	 kYaYljI44FeHCBzXjxV8HiCZbyvdcbchvaKGB6gJWe63+wPNzr55mgYSC8wcjz4FuZ
	 ksA/vevapSRQksd8/aid512J9QKxv/DjyKmVhNO940cGm0Eh36+3wbvZT4vfrx2ZMt
	 HoSyJav6z5ts/HA2ukvNz6o/St9MUgtqBm6IJjmPKLEp/BhnlXr+JD5BaXgoEHgLm8
	 sXhnPbXNDMKeQ==
Date: Thu, 11 Jun 2026 11:39:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add Qualcomm WSA885X I2C codec
 driver
Message-ID: <20260611-straight-refined-beetle-e2c934@quoll>
References: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610155708.151067-3-prasad.kumpatla@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38320-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 422176707C3

On Wed, Jun 10, 2026 at 09:27:08PM +0530, Prasad Kumpatla wrote:
> +};
> +
> +static void wsa885x_gpio_set(struct wsa885x_i2c_priv *wsa885x, bool val)
> +{
> +	if (!wsa885x || !wsa885x->sd_n)

How wsa885x can be NULL?

This wrapper is pointless. Avoid creating abstraction layers over single
call to standard kernel interfaces.

> +		return;
> +
> +	gpiod_set_value_cansleep(wsa885x->sd_n, val);
> +}
> +

...

> +
> +static void wsa885x_gpio_powerdown(void *data)
> +{
> +	struct wsa885x_i2c_priv *wsa885x = data;
> +
> +	if (!wsa885x)
> +		return;

How is this possible?

> +
> +	wsa885x_gpio_set(wsa885x, true);
> +}
> +

...

> +	if (count > 0) {
> +		if (count % 2) {
> +			dev_err(dev, "%s: Invalid number of elements in %s (%d)\n",
> +				__func__, init_table_prop, count);
> +			return -EINVAL;
> +		}
> +		if (count > WSA885X_INIT_TABLE_MAX_ITEMS) {
> +			dev_err(dev, "%s: %s has too many elements (%d > %u)\n",
> +				__func__, init_table_prop, count,
> +				WSA885X_INIT_TABLE_MAX_ITEMS);
> +			return -EINVAL;
> +		}
> +		wsa885x->init_table_size = count;
> +
> +		wsa885x->init_table = devm_kcalloc(dev, wsa885x->init_table_size,
> +						   sizeof(*wsa885x->init_table), GFP_KERNEL);
> +		if (!wsa885x->init_table)
> +			return -ENOMEM;
> +
> +		if (device_property_read_u32_array(dev, init_table_prop,
> +						   wsa885x->init_table,
> +						   wsa885x->init_table_size)) {
> +			dev_err(dev, "%s: Failed to read %s\n",
> +				__func__, init_table_prop);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	ret = device_property_read_u32(dev, "qcom,battery-config",
> +				       &wsa885x->batt_conf);
> +	if (ret) {
> +		wsa885x->batt_conf = WSA885X_BATT_1S;
> +	} else if (wsa885x->batt_conf != WSA885X_BATT_1S &&
> +		   wsa885x->batt_conf != WSA885X_BATT_2S) {
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid battery config %u (expected 1S or 2S)\n",
> +				     wsa885x->batt_conf);
> +	}
> +
> +	for (i = 0; i < WSA885X_SUPPLIES_NUM; i++)
> +		wsa885x->supplies[i].supply = wsa885x_supply_name[i];
> +
> +	ret = devm_regulator_bulk_get(dev, WSA885X_SUPPLIES_NUM, wsa885x->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get regulators\n");
> +
> +	ret = regulator_bulk_enable(WSA885X_SUPPLIES_NUM, wsa885x->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
> +
> +	ret = devm_add_action_or_reset(dev, wsa885x_regulator_disable, wsa885x);

Why you cannot simply use devm_regulator_get_enable?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
> +
> +	wsa885x->sd_n = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (IS_ERR(wsa885x->sd_n))
> +		return dev_err_probe(dev, PTR_ERR(wsa885x->sd_n),
> +							 "Shutdown Control GPIO not found\n");

Messed/misaligned indentation.

> +
> +	wsa885x_gpio_set(wsa885x, false);
> +
> +	ret = devm_add_action_or_reset(dev, wsa885x_gpio_powerdown, wsa885x);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "devm_add_action_or_reset failed\n");
> +
> +	i2c_set_clientdata(client, wsa885x);
> +
> +	wsa885x->intr_pin = devm_gpiod_get(dev, "interrupt", GPIOD_IN);
> +	if (IS_ERR(wsa885x->intr_pin))
> +		return dev_err_probe(dev, PTR_ERR(wsa885x->intr_pin),
> +							 "Interrupt GPIO not found\n");
> +
> +	ret = wsa885x_register_irq(wsa885x);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "wsa885x irq registration failed\n");
> +
> +	ret = devm_snd_soc_register_component(dev, component_driver,
> +					      wsa885x_i2c_dai,
> +					      ARRAY_SIZE(wsa885x_i2c_dai));
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Codec component registration failed\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id wsa885x_i2c_dt_match[] = {
> +	{
> +		.compatible = "qcom,wsa885x-i2c",
> +	},
> +	{}
> +};
> +
> +static const struct i2c_device_id wsa885x_id_i2c[] = {
> +	{"wsa885x_i2c", 0},

Used named initializers.

> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, wsa885x_id_i2c);
> +MODULE_DEVICE_TABLE(of, wsa885x_i2c_dt_match);

Don't come with own coding style. Each above goes IMMEDIATELY after the table.

Best regards,
Krzysztof


