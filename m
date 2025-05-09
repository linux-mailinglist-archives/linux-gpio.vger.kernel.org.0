Return-Path: <linux-gpio+bounces-19819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDDCAB0AD2
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 08:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A62551C04AC6
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F5826E17D;
	Fri,  9 May 2025 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBKQArXb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF326E16F
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773117; cv=none; b=i4pckhFCl+9b5RZqBn2V5LSwVFEunebG0cK08r7o4rAgyh1WaURg/DM3imc1xhY9iIS3f0vI9UUtgH72N5uXqY5mxD/d3qs17F6JdTMkmE3fg/niyGuAFjHIbTuDWDYt0opgjRTbR+gATq7wOOeEtdQH/OXIm6IWA2mXVcO3ZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773117; c=relaxed/simple;
	bh=27kGMBB3C0h9ODtKKrLc1VupFSWATrFKfY3kj/JBugQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BtU+LFNYDaMsneIZRjeCOeqM/HecwiSKmZj7NsWInfT/jpq81jRVGwoMkNOwZLc1YKts2+1PKF50miephVDvWiPaVvhYc+ujzJYvD8Zjsms8CgrTp6Cj1psT/r8Do/rgpyyWV8DGajdWWJ5Fn7I8ek0fAQIZ9fo0wFi4qxigIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBKQArXb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0ac853894so1459836f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 May 2025 23:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773114; x=1747377914; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UVJ2TuNUBUpO94IHTiYXs30ZxdePvcvCPymvMj2I2OQ=;
        b=gBKQArXbZYzhy6ncASQWGKwcq4h7+Eags9bxpk5gVSOz2TXAV+OT1chirGqpK9XcNU
         jhBQ0zsiMDqEQc6yD8NBC0d5J+EHhWiJ+NtywTApGVCrzKmsptuBhuV4QfP5ueTTJv1s
         eCW8hYB/p3ADp5TeXFdXDVHf2ZjN4ktecvEF3bFXy2GztWSgVeARyMmeEkt6NhhTGKiJ
         uh80Ns+ZR7mWdwHWzGCQzrDi/UoA2xb8fhMDZrUbZjkxXiWqgdUsMJaoVa+YsWmcBQpr
         WBMfMG8z9Dj/cfU6Tc3468u9rRMx0FyWSdRniU8hgODh/k7IFaqtSLPtmssWWxylnpTX
         0ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773114; x=1747377914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVJ2TuNUBUpO94IHTiYXs30ZxdePvcvCPymvMj2I2OQ=;
        b=N5xUtpMwpRxeKwHjLk+9NKDO8AZ+VupirLDQCaNRc/OodPMoiD1KDU0vsLVPACiHuq
         1ByfQ321bOInrKtf39mWuJiVJsqIRUmGYndMmn/VKPPBMmrr8k+XBVVs4ChLDr62FcUY
         BzSgCOvxUhHLp13OF98z4dJ1Pdt4TpwS2xzffPIG/V/9tbHfItZv6bXKI7r5sO12s/vN
         mgYCpBuDUlIwalux1rg2alB1uhI6HckSI6G+1GYqRWMpnZSyKceFonMOuPglb7TJ1/HQ
         CBldKUr8r7TGezsReQEyo8uC8aeY9U50ilbnMWM6LftESJVomqcmQE1P82IiRjINyGQn
         lbWA==
X-Forwarded-Encrypted: i=1; AJvYcCV6yXTW2IaDbfISp2W5Y4IqmutJLAoJjR6YuzAN3nu/CAY6F97O7lQmQHPve1rEyK638FK2r2/Ol8pj@vger.kernel.org
X-Gm-Message-State: AOJu0YxrXOupnqUzThEj/y3+3W5zTmrQolP1qaLM0FgBxj62sMVDCS+w
	cr2EDbuDKRsA0QW3KiiRFlUBReUGfddvt5/tneOxjGNrFrrgeETz7PlhE0opF5c=
X-Gm-Gg: ASbGncs+5n7pLJK8aqHNixtr6jrz9fDotwxzxZPKkhuQBCFNJRGWilQYdW0lMgq1HsR
	9IiffB6f3B43uBmxn6KAv42aRHfaDKH3Nz5JT1WPeq7q1Nv/MDIwwU9vwceF5Gs8ByOzpxGm/8N
	/AAdRCswbzd4dh3vMbSbX4B70HMug0dZ5/A1DP+O5uFg0KFq/QTer22HzyAMAVeIuEvmEu/K85n
	b2Ts505SxR2i+DmhoMknxpXP2WAHSkIkDPbtlYVe+KVCNYgo/mY7GuiNTIrKJQMI2ObaNTIQBBy
	7g1X7MPvhZC7UTfwOwkTS8bJBrHgH8EIvCnErl4AEXKn
X-Google-Smtp-Source: AGHT+IH18FSd6kFBMFpH6Tgr5SOpt1kgXIcmqF5vBZmAhp4BLHkkT7JEQaYeI4Zj3eGt5omTIFhStw==
X-Received: by 2002:a5d:59a7:0:b0:3a0:8325:8090 with SMTP id ffacd0b85a97d-3a1f64374d6mr1856560f8f.18.1746773114003;
        Thu, 08 May 2025 23:45:14 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddde0sm2302928f8f.14.2025.05.08.23.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:45:12 -0700 (PDT)
Message-ID: <eb8c820c864717d6348cd11f16e6899c744a92ed.camel@linaro.org>
Subject: Re: [PATCH v9 4/6] mfd: max77759: add Maxim MAX77759 core mfd driver
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Srinivas
 Kandagatla <srini@kernel.org>, Kees Cook	 <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Peter Griffin	 <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	linux-hardening@vger.kernel.org
Date: Fri, 09 May 2025 07:45:11 +0100
In-Reply-To: <20250508140259.GN3865826@google.com>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
	 <20250430-max77759-mfd-v9-4-639763e23598@linaro.org>
	 <20250508140259.GN3865826@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Thu, 2025-05-08 at 15:02 +0100, Lee Jones wrote:
> On Wed, 30 Apr 2025, Andr=C3=A9 Draszik wrote:
>=20
> > The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> > includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> > Port Controller (TCPC), NVMEM, and a GPIO expander.
> >=20
> > Fuel Gauge and TCPC have separate and independent I2C addresses,
> > register maps, and interrupt lines and are therefore excluded from the
> > MFD core device driver here.
> >=20
> > The GPIO and NVMEM interfaces are accessed via specific commands to the
> > built-in microprocessor. This driver implements an API that client
> > drivers can use for accessing those.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > v6: really use postinc
> >=20
> > v5:
> > * update all (I hope) of Lee's comments:
> > * file header C comment (not C++)
> > * drop references to 'MFD'
> > * extra indent register bit definitions
> > * make 'struct max77759' public
> > * drop comments that were used for visual separation only
> > * drop MAX77759_*_REG_LAST_REGISTER defines
> > * add comments to regmap ranges
> > * use longer lines
> > * sort local variable in reverse christmas tree order
> > * update comments in max77759_maxq_command()
> > * drop BUILD_BUG_ON()
> > * use dev_err() in max77759_maxq_command()
> > * reflow max77759_create_i2c_subdev() slightly and update error message=
s
> > * drop useless comment in max77759_add_chained_maxq()
> > * reflow max77759_probe()
> > * consistent upper-/lower-case in messages
> >=20
> > v4:
> > * add missing build_bug.h include
> > * update an irq chip comment
> > * fix a whitespace in register definitions
> >=20
> > v2:
> > * add kernel doc for max77759_maxq_command() and related structs
> > * fix an msec / usec typo
> > * add missing error handling of devm_mutex_init() (Christophe)
> > * align sentinel in max77759_of_id[] with max77759_i2c_id[]
> > =C2=A0 (Christophe)
> > * some tidy-ups in max77759_maxq_command() (Christophe)
> >=20
> > max77759 Lee's updates
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/mfd/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 20 ++
> > =C2=A0drivers/mfd/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 690 =
+++++++++++++++++++++++++++++++++++++++++++
> > =C2=A0include/linux/mfd/max77759.h | 165 +++++++++++
> > =C2=A05 files changed, 878 insertions(+)
>=20
> This looks okay to me now.

Thanks :-)

> I assume the other patches depend on this one?

Yes, that is correct.
>=20
> [...]
>=20
> > diff --git a/drivers/mfd/max77759.c b/drivers/mfd/max77759.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..15723ac3ef49771eafd5c2e=
9984abc550eec7aa1
> > --- /dev/null
> > +++ b/drivers/mfd/max77759.c
> > @@ -0,0 +1,690 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright 2020 Google Inc
> > + * Copyright 2025 Linaro Ltd.
> > + *
> > + * Core driver for Maxim MAX77759 companion PMIC for USB Type-C
> > + */
>=20
> [...]
>=20
> > +int max77759_maxq_command(struct max77759 *max77759,
> > +			=C2=A0 const struct max77759_maxq_command *cmd,
> > +			=C2=A0 struct max77759_maxq_response *rsp)
> > +{
> > +	DEFINE_FLEX(struct max77759_maxq_response, _rsp, rsp, length, 1);
> > +	struct device *dev =3D regmap_get_device(max77759->regmap_maxq);
> > +	static const unsigned int timeout_ms =3D 200;
> > +	int ret;
> > +
> > +	if (cmd->length > MAX77759_MAXQ_OPCODE_MAXLENGTH)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * As a convenience for API users when issuing simple commands, rsp i=
s
> > +	 * allowed to be NULL. In that case we need a temporary here to write
> > +	 * the response to, as we need to verify that the command was indeed
> > +	 * completed correctly.
> > +	 */
> > +	if (!rsp)
> > +		rsp =3D _rsp;
> > +
> > +	if (!rsp->length || rsp->length > MAX77759_MAXQ_OPCODE_MAXLENGTH)
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&max77759->maxq_lock);
> > +
> > +	reinit_completion(&max77759->cmd_done);
> > +
> > +	/*
> > +	 * MaxQ latches the message when the DATAOUT32 register is written. I=
f
> > +	 * cmd->length is shorter we still need to write 0 to it.
> > +	 */
> > +	ret =3D regmap_bulk_write(max77759->regmap_maxq,
> > +				MAX77759_MAXQ_REG_AP_DATAOUT0, cmd->cmd,
> > +				cmd->length);
> > +	if (!ret && cmd->length < MAX77759_MAXQ_OPCODE_MAXLENGTH)
> > +		ret =3D regmap_write(max77759->regmap_maxq,
> > +				=C2=A0=C2=A0 MAX77759_MAXQ_REG_AP_DATAOUT32, 0);
> > +	if (ret) {
> > +		dev_err(dev, "writing command failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	/* wait for response from MaxQ */
>=20
> If you have to respin this patch, please s/wait/Wait/.
>=20
> If not, please send a subsequent patch.

I guess I might as well send another version, given this series is still
waiting for Srini's ACK.

Cheers,
Andre'


