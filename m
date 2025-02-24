Return-Path: <linux-gpio+bounces-16524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8295AA42F35
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 22:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235DF18922C0
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 21:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75C31DDC28;
	Mon, 24 Feb 2025 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SGQ1pCDO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9F1A072C
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740432776; cv=none; b=W/jeRTJ06a3m8MdYghwD1jsmaRgy8duaHnX4QhdayOelsY7k9iwtiIP+e68Kmw/aqO+IRTA6eFD1AzHz5Y0sYEQSmqxQ6ZEqVlzYmQXXnNoj/+R4nRO1oQR8XGbok0Spvng54w4yUWJSTDubSIHIVDWzYw5iyNHpU3tgVXYQSmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740432776; c=relaxed/simple;
	bh=WrjhDqPRM6T52db6Xf2kdzSRNUFVzL9x4gWZoTfv+Po=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SMrBCByCvoDMxfx3rDu4pHS1CivucVgWlGSHRqxDDXk17EIE+WtLBi8vI/OBPxfiE93q15enBCc9B7tRL7r5cvT8FqVPqDRqT6Wtf5zfCUNbXwgkMwCqdM7EiV/LrTaWvj2aOPI5hkeo+ILiz1YkDA29vtjvYEyHZ67DjJiySyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SGQ1pCDO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f3486062eso4185977f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 13:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740432772; x=1741037572; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6yYp/v8xOGfHjSjL9Fj0luMhn4Nf5/1efXVSCVDqfX0=;
        b=SGQ1pCDO2YqfphZV78IYnQDF7wh1BJM6831pXcDvNetMJz5KWLUbc1kswhRT3vBDzK
         Z/kjEI9TFwZWoI7U+EsKuTu++IYrBf1FWPHINNeuAgFWyqO7+MVzoi7ylF0TwlrPp2Zb
         uPX7GyDC9ZHFBQXQsHAqxIsoAxGZ80NeYQEqVAlEuCm3q2znKhKTpxtGstIv6k++gFV6
         g1vm0z82soemnuGwc1UIAfZcwFiNVI4B6EzpOX235XE/h3irOA2U27Cr4ju7ATyBdLbv
         8C0td6bcIYLFXhMG3jpVMzAwmpZ2NnWXnaJTboDo7uBV29U6TXmSTn99r83wbWHwZt3Z
         WDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740432772; x=1741037572;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6yYp/v8xOGfHjSjL9Fj0luMhn4Nf5/1efXVSCVDqfX0=;
        b=R/wUrfuPP0xsFSIS7WvYwhyBpzKDYu7Nz7EliyTMfcbQhSGYjM4DNs2rFJlInWFmbf
         5RhyS/xvt38jiZd98+fkha51txRSS2jBu+i6utl66emwQ55UxHPzufk+rGQ0sthAC4i/
         uunUn1qrKZIfLRYLE27wWnbG2kNzaVGqXIOcz6vtVIBkx+Tf5u5mZGgvMVG+yOscRFW4
         dlyX4+368RJu5+gkczfLp9ftkoQvt1DfoNiVFsjEU31njhnnkw771O9WI06rqTbmLCHJ
         lWaOFFqdy2GSztOcDRuMfSe0H+sYW1vMS3iynhwMX67RL7h0RP2dehrYWXovupbBjUOu
         RCzw==
X-Forwarded-Encrypted: i=1; AJvYcCVwijOBVrdeuK5Hw+o/Mt3ssgTxSmPv4KGzRIxYEVr+kMmZs7vFZU6ratWkryRYzn4pGMLFtKRq+xs6@vger.kernel.org
X-Gm-Message-State: AOJu0YylHCyZgJbgToJZwTLWDBNXNJfJ3Kw+IpBfdm0y9ZvbCG3QvDVj
	S0MwhfULDvRQnUeW/5JGDarNPZpR6T6BBiLdsoe1Xwt1obe6pMRrOfJJrY1U8JY=
X-Gm-Gg: ASbGncsPWPG0WCr4iFhXrGY+r2GARE+eX20TTnt5rrilstS9qZNnLZMlm2TX2oIDvhl
	Compk2o2bR9zqn4EDs4YLUgAX/UtBw0pqPFpP7Pvm5o9rA2XThrQdu6ICcSulL6dQLaBM7fb5dR
	lDDR3MpSWwXbGHr9vzTXCcHxChUss35cYGXMZ26QO2UlIZ1NLmbyjruZeI+wvwNc5P4Aa17/Fhy
	bJUvpf+G2bIrcMkbqDZEyQCF5XsAMlQzjgJvQ/VmUWvJiERy+A+kohxM8P8C2geL+BQz2P9qs5L
	zZUS5wCmv0kVhNVQMRAktJ4z10M8BQ==
X-Google-Smtp-Source: AGHT+IGnjNhw2ePHIwTVNQz38TDJrPHLJK4RmqiEpCJBvXZdLazsQGn257uV/OrJchF8HQ2Y7U4yhg==
X-Received: by 2002:a5d:648b:0:b0:38f:3139:f57f with SMTP id ffacd0b85a97d-38f6e95c31emr14555685f8f.16.1740432771879;
        Mon, 24 Feb 2025 13:32:51 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86ca9csm180054f8f.22.2025.02.24.13.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 13:32:51 -0800 (PST)
Message-ID: <e32ea1e0cc9445136907d9445b8036d1a1439d5d.camel@linaro.org>
Subject: Re: [PATCH 4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: brgl@bgdev.pl, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	gustavoars@kernel.org, kees@kernel.org, kernel-team@android.com, 
	krzk+dt@kernel.org, lee@kernel.org, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, peter.griffin@linaro.org, robh@kernel.org, 
	srinivas.kandagatla@linaro.org, tudor.ambarus@linaro.org, 
	willmcvicker@google.com
Date: Mon, 24 Feb 2025 21:32:50 +0000
In-Reply-To: <614644f9-71f7-41af-af90-7ae892581646@wanadoo.fr>
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
	 <20250224-max77759-mfd-v1-4-2bff36f9d055@linaro.org>
	 <614644f9-71f7-41af-af90-7ae892581646@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Christophe,

Thanks for your review!

On Mon, 2025-02-24 at 21:20 +0100, Christophe JAILLET wrote:
> Le 24/02/2025 =C3=A0 11:28, Andr=C3=A9 Draszik a =C3=A9crit=C2=A0:
> > The Maxim MAX77759 is a companion Power Management IC for USB Type-C
> > applications with Battery Charger, Fuel Gauge, temperature sensors, USB
> > Type-C Port Controller (TCPC), NVMEM, and additional GPIO interfaces.
> >=20
> > Fuel Gauge and TCPC have separate and independent I2C addresses,
> > register maps, and interrupt lines and are therefore excluded from the
> > MFD core device driver here.
> >=20
> > The GPIO and NVMEM interfaces are accessed via specific commands to the
> > built-in microprocessor. This driver implements an API that client
> > drivers can use for accessing those.
>=20
> Hi,
>=20
> ...
>=20
> > +int max77759_maxq_command(struct max77759_mfd *max77759_mfd,
> > +			=C2=A0 const struct max77759_maxq_command *cmd,
> > +			=C2=A0 struct max77759_maxq_response *rsp)
> > +{
> > +	DEFINE_FLEX(struct max77759_maxq_response, _rsp, rsp, length, 1);
> > +	int ret;
> > +	static const unsigned int timeout_ms =3D 200;
> > +
> > +	if (cmd->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > +		return -EINVAL;
> > +
> > +	/* rsp is allowed to be NULL. In that case we do need a temporary. */
> > +	if (!rsp)
> > +		rsp =3D _rsp;
> > +
> > +	BUILD_BUG_ON(MAX77759_MAXQ_OPCODE_MAXLENGTH
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 !=3D MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX);
> > +	if (!rsp->length || rsp->length > MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX)
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&max77759_mfd->maxq_lock);
> > +
> > +	reinit_completion(&max77759_mfd->cmd_done);
> > +
> > +	/* write the opcode and data */
> > +	ret =3D regmap_bulk_write(max77759_mfd->regmap_maxq,
> > +				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
> > +				cmd->length);
> > +	if (!ret && cmd->length < MAX77759_MAXQ_REG_AP_MESSAGESZ_MAX) {
> > +		/* writing the last byte triggers MaxQ */
> > +		ret =3D regmap_write(max77759_mfd->regmap_maxq,
> > +				=C2=A0=C2=A0 MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
> > +	}
> > +	if (ret)
> > +		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),
>=20
> Maybe regmap_get_device(max77759_mfd->regmap_maxq) could be assigned to=
=20
> a variable to simplify its usage?

Sure, can do.

>=20
> > +			 "write data failed: %d\n", ret);
> > +	if (ret)
> > +		return ret;
>=20
> Merge with the if (ret) just above? (as done a few lines below)

Definitely, that was an oversight somehow :-(

>=20
> > +
> > +	/* wait for response from MaxQ */
> > +	if (!wait_for_completion_timeout(&max77759_mfd->cmd_done,
> > +					 usecs_to_jiffies(timeout_ms))) {
> > +		dev_err(regmap_get_device(max77759_mfd->regmap_maxq),
> > +			"timed out waiting for data\n");
> > +		return -ETIMEDOUT;
> > +	}
> > +
> > +	ret =3D regmap_bulk_read(max77759_mfd->regmap_maxq,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX77759_MAXQ_REG_AP_DATAIN0,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rsp->rsp, rsp->length);
> > +	if (ret) {
> > +		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),
> > +			 "read data failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * As per the protocol, the first byte of the reply will match the
> > +	 * request.
> > +	 */
> > +	if (rsp->rsp[0] !=3D cmd->cmd[0]) {
> > +		dev_warn(regmap_get_device(max77759_mfd->regmap_maxq),
> > +			 "unexpected opcode response for %#.2x: %*ph\n",
> > +			 cmd->cmd[0], (int)rsp->length, rsp->rsp);
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
>=20
> ...
>=20
> > +static int max77759_probe(struct i2c_client *client)
> > +{
> > +	struct regmap *regmap_top;
> > +	unsigned int pmic_id;
> > +	int ret;
> > +	struct irq_data *irq_data;
> > +	struct max77759_mfd *max77759_mfd;
> > +	unsigned long irq_flags;
> > +	struct regmap_irq_chip_data *irq_chip_data_pmic;
> > +
> > +	regmap_top =3D devm_regmap_init_i2c(client, &max77759_regmap_config_t=
op);
> > +	if (IS_ERR(regmap_top))
> > +		return dev_err_probe(&client->dev, PTR_ERR(regmap_top),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init failed\n");
> > +
> > +	ret =3D regmap_read(regmap_top, MAX77759_PMIC_REG_PMIC_ID, &pmic_id);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Unable to read Device ID\n");
> > +
> > +	if (pmic_id !=3D MAX77759_PMIC_REG_PMIC_ID_MAX77759)
> > +		return dev_err_probe(&client->dev, -ENODEV,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Unsupported Device ID %#.2x (%d)\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 pmic_id, pmic_id);
> > +
> > +	irq_data =3D irq_get_irq_data(client->irq);
> > +	if (!irq_data)
> > +		return dev_err_probe(&client->dev, -EINVAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid IRQ: %d\n", client->irq);
> > +
> > +	max77759_mfd =3D devm_kzalloc(&client->dev, sizeof(*max77759_mfd),
> > +				=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> > +	if (!max77759_mfd)
> > +		return -ENOMEM;
> > +
> > +	max77759_mfd->regmap_top =3D regmap_top;
> > +	devm_mutex_init(&client->dev, &max77759_mfd->maxq_lock);
>=20
> Error handling?

Thanks! There's a similar one in the gpio driver which
also needs fixing.

>=20
> > +
> > +	i2c_set_clientdata(client, max77759_mfd);
>=20
> Harmless, but is it needed? (there is no i2c_get_clientdata() in the flil=
e)

Yes, this is needed. The leaf drivers need to access it, see
dev_get_drvdata(pdev->dev.parent) in those.

>=20
> > +
> > +	for (int i =3D 0; i < ARRAY_SIZE(max77759_i2c_subdevs); ++i) {
>=20
> Unusual. Maybe declare 'i' at the beginning of the function?

A naive grep returned > 1000 statements like this in the kernel
tree. It doesn't look like it's that unusual these days anymore.

>=20
> > +		ret =3D max77759_create_i2c_subdev(client,
> > +						 max77759_mfd,
> > +						 &max77759_i2c_subdevs[i]);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	irq_flags =3D IRQF_ONESHOT | IRQF_SHARED;
> > +	irq_flags |=3D irqd_get_trigger_type(irq_data);
> > +
> > +	ret =3D devm_regmap_add_irq_chip(&client->dev, max77759_mfd->regmap_t=
op,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 client->irq, irq_flags, 0,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &max77759_pmic_irq_chip,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &irq_chip_data_pmic);
> > +	if (ret)
> > +		return dev_err_probe(&client->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to add IRQ chip\n");
> > +
> > +	/* INTSRC - MaxQ & children */
> > +	ret =3D max77759_add_chained_maxq(client, max77759_mfd,
> > +					irq_chip_data_pmic);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* INTSRC - topsys & children */
> > +	ret =3D max77759_add_chained_topsys(client, max77759_mfd,
> > +					=C2=A0 irq_chip_data_pmic);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* INTSRC - charger & children */
> > +	ret =3D max77759_add_chained_charger(client, max77759_mfd,
> > +					=C2=A0=C2=A0 irq_chip_data_pmic);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_AUTO,
> > +				=C2=A0=C2=A0=C2=A0 max77759_cells, ARRAY_SIZE(max77759_cells),
> > +				=C2=A0=C2=A0=C2=A0 NULL, 0,
> > +				=C2=A0=C2=A0=C2=A0 regmap_irq_get_domain(irq_chip_data_pmic));
> > +}
> > +
> > +static const struct i2c_device_id max77759_i2c_id[] =3D {
> > +	{ "max77759", 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max77759_i2c_id);
> > +
> > +static const struct of_device_id max77759_of_id[] =3D {
> > +	{ .compatible =3D "maxim,max77759", },
> > +	{},
>=20
> Unneeded trailing comma after a terminator.
> Maybe { }=C2=A0 to match the style used in max77759_i2c_id?

OK. I'll also fix the similar leaf drivers.

Cheers,
Andre'


>=20
> > +};
> > +MODULE_DEVICE_TABLE(of, max77759_of_id);
>=20


