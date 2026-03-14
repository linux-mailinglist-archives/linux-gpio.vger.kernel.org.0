Return-Path: <linux-gpio+bounces-33429-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOYbMWI2tWntxgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33429-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:20:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C6D28CA47
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B0A430300DA
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 10:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EAF35295C;
	Sat, 14 Mar 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbxMGtpw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A80B2F6192;
	Sat, 14 Mar 2026 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773483615; cv=none; b=HpJfP5XRzsGQkQa6p196pjeCPesntElvhibKz8pGG4W/3HWTDUOlI0YyAi1CyjI+3pON/H070T7d0vykzJNDwrFVNoqy7PhsC7RwfNqPLeUbyViPSa2BDTgo3GWCSpmRwkyUlV+RQVdRPXdg84PnYy2Tetg2EjGEwPz+dkbFEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773483615; c=relaxed/simple;
	bh=oUwNkIC1/kbn4mfaBppJpNmZjHbD2/xerndHL/JRmwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RN/amOCLhBwCLyHR/Se0TmtrX3fLwMWB3nlmqN0o7D5ya6tnR596jd2yz4fvEXKCpiqh5VxUZuw3rLNd8ZO+HdFghsolZklTD+bdfdnDhAlqUDQNypg5ZnmIYXhFSvvU79Xj5zruKFvDBQyX4+LTpImOIqjITFz70XzACw8SaZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbxMGtpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24107C116C6;
	Sat, 14 Mar 2026 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773483615;
	bh=oUwNkIC1/kbn4mfaBppJpNmZjHbD2/xerndHL/JRmwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bbxMGtpwutQ/r/YDdmDcQoIQUCSKFOldziZXxXf0ofxKU8lu67pidtBCveFBDcK7W
	 th4ftWRnbHfho/OPgXx0i0T91H3J+qGIXY3QYxLbDCUiJS1CUCSLcb3kjsCOy547ak
	 XzF1PJ/HnsTMTnr0FrfP7aY9HT3uK2igdnxGnXHaxxURXhZBMuYNrBWLX+5vE8SitW
	 g+BOTjaf1Erng3JGTg9rUVvsYdydm4ScAsD7WLaFKMAxFC0o76gPB7Asev2WLx02Is
	 puiwj5w8AorjMBhz/vy+jw2tiXrGRUEa+KjI29u1FwyF+qvyQfhay0Y8mTermvKw9U
	 Pc7LdwXwO3gQg==
Message-ID: <e072b8ba-f14d-45b9-a331-5bd343fff093@kernel.org>
Date: Sat, 14 Mar 2026 11:20:09 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] mfd: tac5x1x: Add TI TAC5x1x MFD core driver
To: Niranjan H Y <niranjan.hy@ti.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: lee@kernel.org, linusw@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nb@tipi-net.de, navada@ti.com,
 v-hampiholi@ti.com, sandeepk@ti.com, baojun.xu@ti.com, shenghao-ding@ti.com
References: <20260312184833.263-1-niranjan.hy@ti.com>
 <20260312184833.263-6-niranjan.hy@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260312184833.263-6-niranjan.hy@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33429-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,tipi-net.de,ti.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:email]
X-Rspamd-Queue-Id: 42C6D28CA47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 12/03/2026 19:48, Niranjan H Y wrote:
> This patch adds the core Multi-Function Device (MFD) driver for the Texas

This patchset has multiple basic mistakes, including but not limited to:
1. Not following current kernel style. What does the submitting patches
say about such commit msg?

2. Repeating known old issues which we already fixed. Start from scratch
from recent drivers.


> Instruments TAC5x1x family of audio codecs. The MFD core handles device
> initialization, power management, and common resources for child devices.
> 


> +
> +static int tac5x1x_setup_regulators(struct device *dev,
> +				    struct tac5x1x *tac5x1x)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < TAC5X1X_NUM_SUPPLIES; i++)
> +		tac5x1x->supplies[i].supply = tac5x1x_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, TAC5X1X_NUM_SUPPLIES,
> +				      tac5x1x->supplies);
> +	if (ret) {
> +		dev_err(dev, "Failed to get regulators: %d\n", ret);

Look how all drivers are doing this - dev_err_probe

> +		return ret;
> +	}
> +
> +	/* Regulators managed by PM runtime during probe */
> +	tac5x1x->regulators_enabled = false;
> +
> +	return 0;
> +}
> +
> +static int tac5x1x_probe(struct device *dev, struct tac5x1x *tac5x1x)
> +{
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	ret = tac5x1x_setup_regulators(dev, tac5x1x);
> +	if (ret)
> +		return ret;
> +
> +	/* Initialize PM runtime before adding child devices */
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Enable regulators for device initialization */
> +	ret = regulator_bulk_enable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +	tac5x1x->regulators_enabled = true;
> +
> +	ret = tac5x1x_reset(tac5x1x);
> +	if (ret) {
> +		dev_err(dev, "Failed to reset device\n");
> +		goto err_disable_regulators;
> +	}
> +	tac5x1x_init(tac5x1x);
> +
> +	ret = tac5x1x_parse_dt(tac5x1x, np);
> +	if (ret) {
> +		dev_err(dev, "Failed to parse DT node: %d\n", ret);
> +		goto err_disable_regulators;
> +	}
> +
> +	/* update if vcom property is found */
> +	if (tac5x1x->out2x_vcom_cfg != -1) {
> +		regmap_update_bits(tac5x1x->regmap, TAC5X1X_OUT2CFG0,
> +				   TAC5X1X_OUT2CFG0_VCOM_MASK,
> +				   tac5x1x->out2x_vcom_cfg);
> +	}
> +
> +	dev_dbg(dev, "%s adding mfds\n", __func__);

Drop, useless debug.

> +
> +	/* Add child devices now PM runtime is initialized */
> +	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, tac5x1x_mfd_devs,
> +			      ARRAY_SIZE(tac5x1x_mfd_devs), NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(dev, "Failed to add mfd devices\n");
> +		goto err_remove_mfd;
> +	}
> +
> +	return 0;
> +
> +err_remove_mfd:
> +	mfd_remove_devices(dev);
> +err_disable_regulators:
> +	if (tac5x1x->regulators_enabled) {
> +		regulator_bulk_disable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
> +		tac5x1x->regulators_enabled = false;
> +	}
> +	return ret;
> +}
> +
> +static void tac5x1x_remove(struct tac5x1x *tac5x1x)
> +{
> +	mfd_remove_devices(tac5x1x->dev);
> +	/* Only disable regulators if they are still enabled */
> +	if (tac5x1x->regulators_enabled) {
> +		regulator_bulk_disable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
> +		tac5x1x->regulators_enabled = false;

Nope, you are not refcounting in parallel to regulator core. Drop.

> +	}

Why aren't you using devm interfaces?

> +}
> +
> +const struct of_device_id tac5x1x_of_match[] = {
> +	{ .compatible = "ti,taa5212", .data = (void *)TAA5212 },
> +	{ .compatible = "ti,taa5412", .data = (void *)TAA5412 },
> +	{ .compatible = "ti,tac5111", .data = (void *)TAC5111 },
> +	{ .compatible = "ti,tac5112", .data = (void *)TAC5112 },
> +	{ .compatible = "ti,tac5211", .data = (void *)TAC5211 },
> +	{ .compatible = "ti,tac5212", .data = (void *)TAC5212 },
> +	{ .compatible = "ti,tac5301", .data = (void *)TAC5301 },
> +	{ .compatible = "ti,tac5311", .data = (void *)TAC5311 },
> +	{ .compatible = "ti,tac5312", .data = (void *)TAC5312 },
> +	{ .compatible = "ti,tac5411", .data = (void *)TAC5411 },
> +	{ .compatible = "ti,tac5412", .data = (void *)TAC5412 },
> +	{ .compatible = "ti,tad5112", .data = (void *)TAD5112 },
> +	{ .compatible = "ti,tad5212", .data = (void *)TAD5212 },

What is all this? Your bindings said 5x1x?

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, tac5x1x_of_match);
> +
> +static int tac5x1x_i2c_probe(struct i2c_client *i2c)
> +{
> +	enum tac5x1x_type type;
> +	struct tac5x1x *tac5x1x;
> +	struct regmap *regmap;
> +	const struct regmap_config *config = &tac5x1x_regmap;
> +
> +	tac5x1x = devm_kzalloc(&i2c->dev, sizeof(struct tac5x1x),
> +			       GFP_KERNEL);
> +	if (!tac5x1x)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, tac5x1x);
> +	regmap = devm_regmap_init_i2c(i2c, config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +	type = (uintptr_t)i2c_get_match_data(i2c);

No, don't use uintptr_t

> +
> +	tac5x1x->dev = &i2c->dev;
> +	tac5x1x->codec_type = type;
> +	tac5x1x->regmap = regmap;
> +
> +	return tac5x1x_probe(&i2c->dev, tac5x1x);
> +}
> +
> +static void tac5x1x_i2c_remove(struct i2c_client *client)
> +{
> +	tac5x1x_remove(i2c_get_clientdata(client));
> +}
> +
> +static const struct i2c_device_id tac5x1x_id[] = {
> +	{"taa5212", TAA5212},
> +	{"taa5412", TAA5412},
> +	{"tac5111", TAC5111},
> +	{"tac5112", TAC5112},
> +	{"tac5211", TAC5211},
> +	{"tac5212", TAC5212},
> +	{"tac5301", TAC5301},
> +	{"tac5311", TAC5311},
> +	{"tac5312", TAC5312},
> +	{"tac5411", TAC5411},
> +	{"tac5412", TAC5412},
> +	{"tad5112", TAD5112},
> +	{"tad5212", TAD5212},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tac5x1x_id);
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(tac5x1x_pm_ops, tac5x1x_suspend,
> +				 tac5x1x_resume, NULL);
> +
> +static struct i2c_driver tac5x1x_i2c_driver = {
> +	.driver = {
> +		.name = "tac5x1x-core",
> +		.pm = pm_ptr(&tac5x1x_pm_ops),
> +		.of_match_table = of_match_ptr(tac5x1x_of_match),

You have warnings here, drop of_match_ptr and compile test your code

> +	},
> +	.probe = tac5x1x_i2c_probe,
> +	.remove = tac5x1x_i2c_remove,
> +	.id_table = tac5x1x_id,
> +};
> +module_i2c_driver(tac5x1x_i2c_driver);
> +
> +MODULE_DESCRIPTION("Core support for the ASoC tac5x1x codec driver");
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Niranjan H Y <niranjan.hy@ti.com>");
> +MODULE_SOFTDEP("pre: tac5x1x_pinctrl");

Drop



Best regards,
Krzysztof

