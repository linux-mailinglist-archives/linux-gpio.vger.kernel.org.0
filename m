Return-Path: <linux-gpio+bounces-16522-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC560A42DCB
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 21:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC0747A7C17
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 20:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0117224169D;
	Mon, 24 Feb 2025 20:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="r1LWAxau"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E0926AFB;
	Mon, 24 Feb 2025 20:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740428976; cv=none; b=GSDZxMYFUcZIVUSAGkNXW+jeFPSAIaJgdRgCgCJeqrtmaG+utyqXIvrh9k/efNtQDNEOcSaDqu/ZQUb1POJeP+YiOAqA9hPJW6anD+2ypNmYoF5evGtoKkTYiC6E4lv1UrLNbIhMB47UTLosBMLeyPx1tJlp8MCAN06jMxUhm78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740428976; c=relaxed/simple;
	bh=0+5ylH1RpEMxad2fU57+zr3KWtLmylDPnzNe+ClA5vo=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:Cc:
	 In-Reply-To:Content-Type; b=nm7TNtxBmO8mX18YfDNEJMJNEPjNRPmt0q/FxtMvQ29z6wpFL+kh4UhDb5k+6uNHdPalIPGrVmYr+VR4Jc2NgKY3nSbJ639jnaIh0f4UmwYOmSzD/2qTf+SmQFhLD4JHLkv3Snj4JUTCaTvkaMwsRi6po3nL8uy5qQaYRZhWHOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=r1LWAxau; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id mevztE6C3KGvrmew2tsEVG; Mon, 24 Feb 2025 21:20:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740428416;
	bh=zXvGjak3HqVlV81qtbZ7PYjHL81uIlDbJz0ggojYpY8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=r1LWAxauFhYfUxEL9mkYC5X/vQmAnYURZZy2xWKN49VQZxmw42GDRGUkn5aD8Khot
	 BF/3RfdCIurvlhZGfoX4qZhMQiUyyGAB3zDWXaK3bFQR3WYQeQgnMyo2PwYk+Hw5zf
	 sAdUm8CcFVNDPGPetowSfkypjllAD3/BZco9yblhm7j82m3yrDj4iMDtbfePj0ezy1
	 EoCGzg2geQKtcBZuyXXXqzO6c2LtWjzdj5twfKbo5GGLWP7xJArGEpjywtyWwDlGTF
	 GVGTd9QTJDdvgMHegqpgrbXw07rhegTDNJ2AQLmXPgq8RGIB2ILVlYLAyzXg+HjxO8
	 ferPrBGilLmMw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 24 Feb 2025 21:20:16 +0100
X-ME-IP: 90.11.132.44
Message-ID: <614644f9-71f7-41af-af90-7ae892581646@wanadoo.fr>
Date: Mon, 24 Feb 2025 21:20:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
 <20250224-max77759-mfd-v1-4-2bff36f9d055@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: brgl@bgdev.pl, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gustavoars@kernel.org, kees@kernel.org, kernel-team@android.com,
 krzk+dt@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, peter.griffin@linaro.org, robh@kernel.org,
 srinivas.kandagatla@linaro.org, tudor.ambarus@linaro.org,
 willmcvicker@google.com
In-Reply-To: <20250224-max77759-mfd-v1-4-2bff36f9d055@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 24/02/2025 à 11:28, André Draszik a écrit :
> The Maxim MAX77759 is a companion Power Management IC for USB Type-C
> applications with Battery Charger, Fuel Gauge, temperature sensors, USB
> Type-C Port Controller (TCPC), NVMEM, and additional GPIO interfaces.
> 
> Fuel Gauge and TCPC have separate and independent I2C addresses,
> register maps, and interrupt lines and are therefore excluded from the
> MFD core device driver here.
> 
> The GPIO and NVMEM interfaces are accessed via specific commands to the
> built-in microprocessor. This driver implements an API that client
> drivers can use for accessing those.

Hi,

...

> +int max77759_maxq_command(struct max77759_mfd *max77759_mfd,
> +			  const struct max77759_maxq_command *cmd,
> +			  struct max77759_maxq_response *rsp)
> +{
> +	DEFINE_FLEX(struct max77759_maxq_response, _rsp, rsp, length, 1);
> +	int ret;
> +	static const unsigned int timeout_ms = 200;
> +
> +	if (cmd->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> +		return -EINVAL;
> +
> +	/* rsp is allowed to be NULL. In that case we do need a temporary. */
> +	if (!rsp)
> +		rsp = _rsp;
> +
> +	BUILD_BUG_ON(MAX77759_MAXQ_OPCODE_MAXLENGTH
> +		     != MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX);
> +	if (!rsp->length || rsp->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> +		return -EINVAL;
> +
> +	guard(mutex)(&max77759_mfd->maxq_lock);
> +
> +	reinit_completion(&max77759_mfd->cmd_done);
> +
> +	/* write the opcode and data */
> +	ret = regmap_bulk_write(max77759_mfd->regmap_maxq,
> +				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
> +				cmd->length);
> +	if (!ret && cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX) {
> +		/* writing the last byte triggers MaxQ */
> +		ret = regmap_write(max77759_mfd->regmap_maxq,
> +				   MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
> +	}
> +	if (ret)
> +		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),

Maybe regmap_get_device(max77759_mfd->regmap_maxq) could be assigned to 
a variable to simplify its usage?

> +			 "write data failed: %d\n", ret);
> +	if (ret)
> +		return ret;

Merge with the if (ret) just above? (as done a few lines below)

> +
> +	/* wait for response from MaxQ */
> +	if (!wait_for_completion_timeout(&max77759_mfd->cmd_done,
> +					 usecs_to_jiffies(timeout_ms))) {
> +		dev_err(regmap_get_device(max77759_mfd->regmap_maxq),
> +			"timed out waiting for data\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	ret = regmap_bulk_read(max77759_mfd->regmap_maxq,
> +			       MAX77759_MAXQ_REG_AP_DATAIN0,
> +			       rsp->rsp, rsp->length);
> +	if (ret) {
> +		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),
> +			 "read data failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * As per the protocol, the first byte of the reply will match the
> +	 * request.
> +	 */
> +	if (rsp->rsp[0] != cmd->cmd[0]) {
> +		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),
> +			 "unexpected opcode response for %#.2x: %*ph\n",
> +			 cmd->cmd[0], (int)rsp->length, rsp->rsp);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}

...

> +static int max77759_probe(struct i2c_client *client)
> +{
> +	struct regmap *regmap_top;
> +	unsigned int pmic_id;
> +	int ret;
> +	struct irq_data *irq_data;
> +	struct max77759_mfd *max77759_mfd;
> +	unsigned long irq_flags;
> +	struct regmap_irq_chip_data *irq_chip_data_pmic;
> +
> +	regmap_top = devm_regmap_init_i2c(client, &max77759_regmap_config_top);
> +	if (IS_ERR(regmap_top))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap_top),
> +				     "regmap init failed\n");
> +
> +	ret = regmap_read(regmap_top, MAX77759_PMIC_REG_PMIC_ID, &pmic_id);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Unable to read Device ID\n");
> +
> +	if (pmic_id != MAX77759_PMIC_REG_PMIC_ID_MAX77759)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Unsupported Device ID %#.2x (%d)\n",
> +				     pmic_id, pmic_id);
> +
> +	irq_data = irq_get_irq_data(client->irq);
> +	if (!irq_data)
> +		return dev_err_probe(&client->dev, -EINVAL,
> +				     "Invalid IRQ: %d\n", client->irq);
> +
> +	max77759_mfd = devm_kzalloc(&client->dev, sizeof(*max77759_mfd),
> +				    GFP_KERNEL);
> +	if (!max77759_mfd)
> +		return -ENOMEM;
> +
> +	max77759_mfd->regmap_top = regmap_top;
> +	devm_mutex_init(&client->dev, &max77759_mfd->maxq_lock);

Error handling?

> +
> +	i2c_set_clientdata(client, max77759_mfd);

Harmless, but is it needed? (there is no i2c_get_clientdata() in the flile)

> +
> +	for (int i = 0; i < ARRAY_SIZE(max77759_i2c_subdevs); ++i) {

Unusual. Maybe declare 'i' at the beginning of the function?

> +		ret = max77759_create_i2c_subdev(client,
> +						 max77759_mfd,
> +						 &max77759_i2c_subdevs[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
> +	irq_flags |= irqd_get_trigger_type(irq_data);
> +
> +	ret = devm_regmap_add_irq_chip(&client->dev, max77759_mfd->regmap_top,
> +				       client->irq, irq_flags, 0,
> +				       &max77759_pmic_irq_chip,
> +				       &irq_chip_data_pmic);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to add IRQ chip\n");
> +
> +	/* INTSRC - MaxQ & children */
> +	ret = max77759_add_chained_maxq(client, max77759_mfd,
> +					irq_chip_data_pmic);
> +	if (ret)
> +		return ret;
> +
> +	/* INTSRC - topsys & children */
> +	ret = max77759_add_chained_topsys(client, max77759_mfd,
> +					  irq_chip_data_pmic);
> +	if (ret)
> +		return ret;
> +
> +	/* INTSRC - charger & children */
> +	ret = max77759_add_chained_charger(client, max77759_mfd,
> +					   irq_chip_data_pmic);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> +				    max77759_cells, ARRAY_SIZE(max77759_cells),
> +				    NULL, 0,
> +				    regmap_irq_get_domain(irq_chip_data_pmic));
> +}
> +
> +static const struct i2c_device_id max77759_i2c_id[] = {
> +	{ "max77759", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max77759_i2c_id);
> +
> +static const struct of_device_id max77759_of_id[] = {
> +	{ .compatible = "maxim,max77759", },
> +	{},

Unneeded trailing comma after a terminator.
Maybe { }  to match the style used in max77759_i2c_id?

> +};
> +MODULE_DEVICE_TABLE(of, max77759_of_id);


