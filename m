Return-Path: <linux-gpio+bounces-28456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF80C5A30B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 22:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D5C43B656A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 21:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EAF324B3E;
	Thu, 13 Nov 2025 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bSIy4QnX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689F7324B2B
	for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763070218; cv=none; b=Ehq2VixbqU9nEcwwJR0anss3l6JKQJbagQhERCIny4g7FprBH8FBaXVf12jhKL/0kXktQOAhY+0H7S0jP7Ah7/eEWricgQ9DCeZMoS6GQ/4ip5xbnmDYI+sDnkHauqH2f4AEtszl1gb250531/R7NWANRTjmsYGuZcRdf5YttB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763070218; c=relaxed/simple;
	bh=P1Wd3VULu3BSq8lMRkW1AkoBzPjVxBdGrOtW7xmDHp0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f9/XN6WhBAW4HGHX4ZrOWv6PtJz5AupziMhwL0uFtuAwqR4qpFFgXdz6NCNACoZYzmknSz2LYSNy7ncd8zVjf1jv3QiQbGWtBwCsNqq23ewAooiL/AAAAhSBUwRmjtwEisQ0W2vGqoTnmvFqhBC6wy/YLeRWe7uuk6bBuO+3j8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bSIy4QnX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b38de7940so793288f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 13 Nov 2025 13:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763070214; x=1763675014; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=46QZHU7uIDXHoQavB1V0yHR2sr2uuHTixpocAbyVIRU=;
        b=bSIy4QnXxUF8kCOeX56SM6qVTQksAsOmtAugN1+7KlTaz8oCtpjG/e4cvV6vlH4hLZ
         KlLqoODE6bNAcNaoiijRdL7PTv8WhuRXpBX2waJ+ni9RLf6IPBjPYzqbYiex4pJ2e/sC
         952rUN8LQ16Cs7MySUTlU1XpAk7RJoLch+R4DhqSkte2905WQycfRCv57vGvihLd1C3U
         zZlB6PpBa60Lng1oqf8XHxiOKDCAvmE/yqeGyJHHuhO1wh3wvehz1xKQnbVFzYuRLXhX
         fJLEoeNrOX2PT8lBfoxhggBLlBJtcPDK5zBE/8UrgPG0/1Fnq0GZluhfqvNQDUdQEhOA
         STTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070214; x=1763675014;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46QZHU7uIDXHoQavB1V0yHR2sr2uuHTixpocAbyVIRU=;
        b=dmW9xlhlx5/ifaRWotGlgZEXV+1LyxT1VJPGusXP8rHJ0lSTav7ArvxCjGhtl+kz7M
         jO0Ny6B+kLZ7IblxEyztNGtayxAQmTqSFpIx+2g7vaV1Be2rT9Duibowz8+DMMLypdNu
         hrbZ2UyOG49os1Nrt02rDHF4OmGlnRbg0VaFpXJmtyCyYqtgEopo/6YtiDM6wAQeKmpU
         dGFFMcRkfaLctVi92WacHLLrMdA+XIcqEQYW1jJG/c+o+dLTPYW+c4Fg3zXncQSbg6Rx
         JayOwnuGuCllbPkBRvgWh8QgkKiBiHd5fD1CHTG0eqTHxieuZPtPDZe+OkMWM2iv5bNe
         e1cA==
X-Forwarded-Encrypted: i=1; AJvYcCUGroXF8T9VuMcBmvd0ZlS20zwEtM+wp5Rq5JJqoGJJt+TtE/169Vg9rtuUwEhFPrn56N1jTq4aQBJ4@vger.kernel.org
X-Gm-Message-State: AOJu0YyCghm6XdH45yos8E62GUy/0LUT1/YALvdj5BJAB+mxsfLToJWP
	GriQAreTxhswWeTz8yq0EaYLSxfttHFSOzhKHNo7bI6OyiX0JG0ONXkcBMbra+m9mOM=
X-Gm-Gg: ASbGncuzzzmo0eGmbuEol1Pgv5CKerlY5XVMD4FibS7mamwn/lp+HNaX/Thl6KPkCd9
	cfE/hcqFfKG369HPajJDXerPGqCwXfSqbEa/xX0mDFCOXGNpz0l6eH+vDR+gGU24eUq6A8Vj5lB
	eh88shDH6uglANQDX/Aev/W1qGYe/BUpkzyxQnDApjlqEJFkguFtPpDa32yHWwXIYObspKbYdG+
	cZNo6xnU/qcOs8Pb9P0MHsrlJfiLLb1S3MzopeLrJxBqajV0v+POPzoE30VAeTUBgtvVxrzpB1i
	ozv4hMpcQsAu9d7B+MomscYN0UbhLBE3ttVGOmClZNp7ZsI3hqqfcQarSEGbI034Ja/wmuYFyYt
	24rFqVuTai0FOMKMtTldm37glGlXz2an6V6bx241CztcLXT/oatMlimt2uYHn8OkyDqhUCxg3+h
	6Tb6urx8OYSblWGxJ/GYIDurOd9w==
X-Google-Smtp-Source: AGHT+IFj3zfhqqmtiS2xdrrokk/vyX88M2L7g3CTJDyBUhIpz/25qDfe4s9wRsguKQ7LBVD7mX7rXA==
X-Received: by 2002:a05:6000:420a:b0:429:d725:410c with SMTP id ffacd0b85a97d-42b59373658mr724486f8f.44.1763070213679;
        Thu, 13 Nov 2025 13:43:33 -0800 (PST)
Received: from draszik.lan ([212.129.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e97a87sm6573448f8f.20.2025.11.13.13.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:43:33 -0800 (PST)
Message-ID: <45ce203c03ec34631a0170baa7e4cf26c98b9cd3.camel@linaro.org>
Subject: Re: [PATCH v3 09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski	
 <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Thu, 13 Nov 2025 21:43:29 +0000
In-Reply-To: <20251113162534.GO1949330@google.com>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
	 <20251103-s2mpg1x-regulators-v3-9-b8b96b79e058@linaro.org>
	 <20251113162534.GO1949330@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

Thanks for your review.

On Thu, 2025-11-13 at 16:25 +0000, Lee Jones wrote:
> Mark, something for you below.
>=20
> > Add support for Samsung's S2MPG11 PMIC, which is a Power Management IC
> > for mobile applications with buck converters, various LDOs, power
> > meters, NTC thermistor inputs, and additional GPIO interfaces. It
> > typically complements an S2MPG10 PMIC in a main/sub configuration as
> > the sub-PMIC.
> >=20
> > Like S2MPG10, communication is not via I2C, but via the Samsung ACPM
> > firmware.
> >=20
> > Also like S2MPG10, the regulator rails will need to be instantiated
> > individually to allow probe to succeed due to rails being used as
> > supplies for S2MPG10, and to avoid supply rails from being disabled
> > unexpectedly due to probe deferral.
> >=20
> > Note: The firmware uses the ACPM channel ID and the Speedy channel ID
> > to select the PMIC address. Since these are firmware properties, they
> > can not be retrieved from DT, but instead are deducted from the
> > compatible for now.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> >=20
> > ---
> > Note: checkpatch suggests to update MAINTAINERS, but the new file is
> > covered already due to using a wildcard.
> >=20
> > v3:
> > - mention NTC thermistor inputs in commit message
> > - one instance per actual rail, not per rail type (LDO or buck)
> >=20
> > v2:
> > - mention GPIOs in commit message
> > ---
> > =C2=A0drivers/mfd/sec-acpm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 213 +++++++++++++++++-
> > =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 45 +++-
> > =C2=A0drivers/mfd/sec-irq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 67 +++++-
> > =C2=A0include/linux/mfd/samsung/core.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
1 +
> > =C2=A0include/linux/mfd/samsung/irq.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9=
9 ++++++++
> > =C2=A0include/linux/mfd/samsung/s2mpg11.h | 434 +++++++++++++++++++++++=
+++++++++++++
> > =C2=A06 files changed, 848 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
> > index 8b31c816d65b86c54a108fa994384abfac0e7da4..b44af6f8b1cdfcb75cf9d4c=
55c9d973a88fd510c 100644
> > --- a/drivers/mfd/sec-acpm.c
> > +++ b/drivers/mfd/sec-acpm.c
> > @@ -13,6 +13,7 @@
> > =C2=A0#include <linux/mfd/samsung/core.h>
> > =C2=A0#include <linux/mfd/samsung/rtc.h>
> > =C2=A0#include <linux/mfd/samsung/s2mpg10.h>
> > +#include <linux/mfd/samsung/s2mpg11.h>
> > =C2=A0#include <linux/mod_devicetable.h>
> > =C2=A0#include <linux/module.h>
> > =C2=A0#include <linux/of.h>
> > @@ -216,6 +217,155 @@ static const struct regmap_config s2mpg10_regmap_=
config_meter =3D {
> > =C2=A0	.cache_type =3D REGCACHE_FLAT,
> > =C2=A0};
> > =C2=A0
> > +static const struct regmap_range s2mpg11_common_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x02), /* CHIP_ID_S, INT, INT_MASK */
> > +	regmap_reg_range(0x0a, 0x0c), /* Speedy control */
> > +	regmap_reg_range(0x1a, 0x27), /* Debug */
>=20
> These numbers are usually defined, and rightfully so.

We already had this discussion when S2MPG10 core support was added, so
I used the same approach again for consistency.

>=20
> > +};
> > +
> > +static const struct regmap_range s2mpg11_common_ro_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x01), /* CHIP_ID_S, INT */
> > +	regmap_reg_range(0x25, 0x27), /* Debug */
> > +};
> > +
> > +static const struct regmap_range s2mpg11_common_nonvolatile_registers[=
] =3D {
> > +	regmap_reg_range(0x00, 0x00), /* CHIP_ID_S */
> > +	regmap_reg_range(0x02, 0x02), /* INT_MASK */
> > +	regmap_reg_range(0x0a, 0x0c), /* Speedy control */
> > +};
> > +
> > +static const struct regmap_range s2mpg11_common_precious_registers[] =
=3D {
> > +	regmap_reg_range(0x01, 0x01), /* INT */
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_common_wr_table =3D {
> > +	.yes_ranges =3D s2mpg11_common_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_common_registers),
> > +	.no_ranges =3D s2mpg11_common_ro_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(s2mpg11_common_ro_registers),
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_common_rd_table =3D {
> > +	.yes_ranges =3D s2mpg11_common_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_common_registers),
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_common_volatile_table =
=3D {
> > +	.no_ranges =3D s2mpg11_common_nonvolatile_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(s2mpg11_common_nonvolatile_registers),
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_common_precious_table =
=3D {
> > +	.yes_ranges =3D s2mpg11_common_precious_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_common_precious_registers),
> > +};
> > +
> > +static const struct regmap_config s2mpg11_regmap_config_common =3D {
> > +	.name =3D "common",
> > +	.reg_bits =3D ACPM_ADDR_BITS,
> > +	.val_bits =3D 8,
> > +	.max_register =3D S2MPG11_COMMON_SPD_DEBUG4,
> > +	.wr_table =3D &s2mpg11_common_wr_table,
> > +	.rd_table =3D &s2mpg11_common_rd_table,
> > +	.volatile_table =3D &s2mpg11_common_volatile_table,
> > +	.precious_table =3D &s2mpg11_common_precious_table,
> > +	.num_reg_defaults_raw =3D S2MPG11_COMMON_SPD_DEBUG4 + 1,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_range s2mpg11_pmic_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x5a), /* All PMIC registers */
> > +	regmap_reg_range(0x5c, 0xb7), /* All PMIC registers */
> > +};
> > +
> > +static const struct regmap_range s2mpg11_pmic_ro_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x05), /* INTx */
> > +	regmap_reg_range(0x0c, 0x0d), /* STATUS OFFSRC */
> > +	regmap_reg_range(0x98, 0x98), /* GPIO input */
> > +};
> > +
> > +static const struct regmap_range s2mpg11_pmic_nonvolatile_registers[] =
=3D {
> > +	regmap_reg_range(0x06, 0x0b), /* INTxM */
> > +};
> > +
> > +static const struct regmap_range s2mpg11_pmic_precious_registers[] =3D=
 {
> > +	regmap_reg_range(0x00, 0x05), /* INTx */
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_pmic_wr_table =3D {
> > +	.yes_ranges =3D s2mpg11_pmic_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_pmic_registers),
> > +	.no_ranges =3D s2mpg11_pmic_ro_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(s2mpg11_pmic_ro_registers),
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_pmic_rd_table =3D {
> > +	.yes_ranges =3D s2mpg11_pmic_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_pmic_registers),
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_pmic_volatile_table =
=3D {
> > +	.no_ranges =3D s2mpg11_pmic_nonvolatile_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(s2mpg11_pmic_nonvolatile_registers),
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_pmic_precious_table =
=3D {
> > +	.yes_ranges =3D s2mpg11_pmic_precious_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_pmic_precious_registers),
> > +};
> > +
> > +static const struct regmap_config s2mpg11_regmap_config_pmic =3D {
> > +	.name =3D "pmic",
> > +	.reg_bits =3D ACPM_ADDR_BITS,
> > +	.val_bits =3D 8,
> > +	.max_register =3D S2MPG11_PMIC_LDO_SENSE2,
> > +	.wr_table =3D &s2mpg11_pmic_wr_table,
> > +	.rd_table =3D &s2mpg11_pmic_rd_table,
> > +	.volatile_table =3D &s2mpg11_pmic_volatile_table,
> > +	.precious_table =3D &s2mpg11_pmic_precious_table,
> > +	.num_reg_defaults_raw =3D S2MPG11_PMIC_LDO_SENSE2 + 1,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_range s2mpg11_meter_registers[] =3D {
> > +	regmap_reg_range(0x00, 0x3e), /* Meter config */
> > +	regmap_reg_range(0x40, 0x8a), /* Meter data */
> > +	regmap_reg_range(0x8d, 0x9c), /* Meter data */
> > +};
> > +
> > +static const struct regmap_range s2mpg11_meter_ro_registers[] =3D {
> > +	regmap_reg_range(0x40, 0x9c), /* Meter data */
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_meter_wr_table =3D {
> > +	.yes_ranges =3D s2mpg11_meter_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_meter_registers),
> > +	.no_ranges =3D s2mpg11_meter_ro_registers,
> > +	.n_no_ranges =3D ARRAY_SIZE(s2mpg11_meter_ro_registers),
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_meter_rd_table =3D {
> > +	.yes_ranges =3D s2mpg11_meter_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_meter_registers),
> > +};
> > +
> > +static const struct regmap_access_table s2mpg11_meter_volatile_table =
=3D {
> > +	.yes_ranges =3D s2mpg11_meter_ro_registers,
> > +	.n_yes_ranges =3D ARRAY_SIZE(s2mpg11_meter_ro_registers),
> > +};
> > +
> > +static const struct regmap_config s2mpg11_regmap_config_meter =3D {
> > +	.name =3D "meter",
> > +	.reg_bits =3D ACPM_ADDR_BITS,
> > +	.val_bits =3D 8,
> > +	.max_register =3D S2MPG11_METER_LPF_DATA_NTC7_2,
> > +	.wr_table =3D &s2mpg11_meter_wr_table,
> > +	.rd_table =3D &s2mpg11_meter_rd_table,
> > +	.volatile_table =3D &s2mpg11_meter_volatile_table,
> > +	.num_reg_defaults_raw =3D S2MPG11_METER_LPF_DATA_NTC7_2 + 1,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > =C2=A0struct sec_pmic_acpm_shared_bus_context {
> > =C2=A0	const struct acpm_handle *acpm;
> > =C2=A0	unsigned int acpm_chan_id;
> > @@ -325,16 +475,22 @@ static struct regmap *sec_pmic_acpm_regmap_init(s=
truct device *dev,
> > =C2=A0	return regmap;
> > =C2=A0}
> > =C2=A0
> > -static void sec_pmic_acpm_mask_common_irqs(void *regmap_common)
> > +static void sec_pmic_acpm_mask_common_s2mpg10_irqs(void *regmap_common=
)
> > =C2=A0{
> > =C2=A0	regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10_COM=
MON_INT_SRC);
> > =C2=A0}
> > =C2=A0
> > +static void sec_pmic_acpm_mask_common_s2mpg11_irqs(void *regmap_common=
)
> > +{
> > +	regmap_write(regmap_common, S2MPG11_COMMON_INT_MASK, S2MPG11_COMMON_I=
NT_SRC);
> > +}
> > +
> > =C2=A0static int sec_pmic_acpm_probe(struct platform_device *pdev)
> > =C2=A0{
> > =C2=A0	struct regmap *regmap_common, *regmap_pmic, *regmap;
> > =C2=A0	const struct sec_pmic_acpm_platform_data *pdata;
> > =C2=A0	struct sec_pmic_acpm_shared_bus_context *shared_ctx;
> > +	void (*masq_irqs_handler)(void *data);
> > =C2=A0	const struct acpm_handle *acpm;
> > =C2=A0	struct device *dev =3D &pdev->dev;
> > =C2=A0	int ret, irq;
> > @@ -365,7 +521,19 @@ static int sec_pmic_acpm_probe(struct platform_dev=
ice *pdev)
> > =C2=A0		return PTR_ERR(regmap_common);
> > =C2=A0
> > =C2=A0	/* Mask all interrupts from 'common' block, until successful ini=
t */
> > -	ret =3D regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10_=
COMMON_INT_SRC);
> > +	switch (pdata->device_type) {
> > +	case S2MPG10:
> > +		ret =3D regmap_write(regmap_common, S2MPG10_COMMON_INT_MASK, S2MPG10=
_COMMON_INT_SRC);
> > +		break;
> > +
> > +	case S2MPG11:
> > +		ret =3D regmap_write(regmap_common, S2MPG11_COMMON_INT_MASK, S2MPG11=
_COMMON_INT_SRC);
> > +		break;
> > +
> > +	default:
> > +		return dev_err_probe(dev, -EINVAL, "Unsupported device type %d\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 pdata->device_type);
> > +	}
> > =C2=A0	if (ret)
> > =C2=A0		return dev_err_probe(dev, ret, "failed to mask common block int=
errupts\n");
> > =C2=A0
> > @@ -374,10 +542,12 @@ static int sec_pmic_acpm_probe(struct platform_de=
vice *pdev)
> > =C2=A0	if (IS_ERR(regmap_pmic))
> > =C2=A0		return PTR_ERR(regmap_pmic);
> > =C2=A0
> > -	regmap =3D sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_A=
CCESSTYPE_RTC,
> > -					=C2=A0=C2=A0 pdata->regmap_cfg_rtc, true);
> > -	if (IS_ERR(regmap))
> > -		return PTR_ERR(regmap);
> > +	if (pdata->regmap_cfg_rtc) {
> > +		regmap =3D sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_ACPM_=
ACCESSTYPE_RTC,
> > +						=C2=A0=C2=A0 pdata->regmap_cfg_rtc, true);
> > +		if (IS_ERR(regmap))
> > +			return PTR_ERR(regmap);
> > +	}
> > =C2=A0
> > =C2=A0	regmap =3D sec_pmic_acpm_regmap_init(dev, shared_ctx, SEC_PMIC_A=
CPM_ACCESSTYPE_METER,
> > =C2=A0					=C2=A0=C2=A0 pdata->regmap_cfg_meter, true);
> > @@ -392,13 +562,28 @@ static int sec_pmic_acpm_probe(struct platform_de=
vice *pdev)
> > =C2=A0		devm_device_init_wakeup(dev);
> > =C2=A0
> > =C2=A0	/* Unmask PMIC interrupt from 'common' block, now that everythin=
g is in place. */
> > -	ret =3D regmap_clear_bits(regmap_common, S2MPG10_COMMON_INT_MASK,
> > -				S2MPG10_COMMON_INT_SRC_PMIC);
> > +	switch (pdata->device_type) {
> > +	case S2MPG10:
> > +		ret =3D regmap_clear_bits(regmap_common, S2MPG10_COMMON_INT_MASK,
> > +					S2MPG10_COMMON_INT_SRC_PMIC);
> > +		masq_irqs_handler =3D sec_pmic_acpm_mask_common_s2mpg10_irqs;
> > +		break;
> > +
> > +	case S2MPG11:
> > +		ret =3D regmap_clear_bits(regmap_common, S2MPG11_COMMON_INT_MASK,
> > +					S2MPG11_COMMON_INT_SRC_PMIC);
> > +		masq_irqs_handler =3D sec_pmic_acpm_mask_common_s2mpg11_irqs;
> > +		break;
> > +
> > +	default:
> > +		return dev_err_probe(dev, -EINVAL, "Unsupported device type %d\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 pdata->device_type);
> > +	}
> > =C2=A0	if (ret)
> > =C2=A0		return dev_err_probe(dev, ret, "failed to unmask PMIC interrupt=
\n");
> > =C2=A0
> > =C2=A0	/* Mask all interrupts from 'common' block on shutdown */
> > -	ret =3D devm_add_action_or_reset(dev, sec_pmic_acpm_mask_common_irqs,=
 regmap_common);
> > +	ret =3D devm_add_action_or_reset(dev, masq_irqs_handler, regmap_commo=
n);
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > @@ -420,8 +605,18 @@ static const struct sec_pmic_acpm_platform_data s2=
mpg10_data =3D {
> > =C2=A0	.regmap_cfg_meter =3D &s2mpg10_regmap_config_meter,
> > =C2=A0};
> > =C2=A0
> > +static const struct sec_pmic_acpm_platform_data s2mpg11_data =3D {
> > +	.device_type =3D S2MPG11,
> > +	.acpm_chan_id =3D 2,
> > +	.speedy_channel =3D 1,
> > +	.regmap_cfg_common =3D &s2mpg11_regmap_config_common,
> > +	.regmap_cfg_pmic =3D &s2mpg11_regmap_config_pmic,
> > +	.regmap_cfg_meter =3D &s2mpg11_regmap_config_meter,
> > +};
> > +
> > =C2=A0static const struct of_device_id sec_pmic_acpm_of_match[] =3D {
> > =C2=A0	{ .compatible =3D "samsung,s2mpg10-pmic", .data =3D &s2mpg10_dat=
a, },
> > +	{ .compatible =3D "samsung,s2mpg11-pmic", .data =3D &s2mpg11_data, },
> > =C2=A0	{ },
> > =C2=A0};
> > =C2=A0MODULE_DEVICE_TABLE(of, sec_pmic_acpm_of_match);
> > diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> > index b722481594801e545d24014af6afd5e1e39d7522..4daa0ece91dc783560dfad4=
99f11193b689c2fd1 100644
> > --- a/drivers/mfd/sec-common.c
> > +++ b/drivers/mfd/sec-common.c
> > @@ -15,6 +15,7 @@
> > =C2=A0#include <linux/mfd/samsung/core.h>
> > =C2=A0#include <linux/mfd/samsung/irq.h>
> > =C2=A0#include <linux/mfd/samsung/s2mpg10.h>
> > +#include <linux/mfd/samsung/s2mpg11.h>
> > =C2=A0#include <linux/mfd/samsung/s2mps11.h>
> > =C2=A0#include <linux/mfd/samsung/s2mps13.h>
> > =C2=A0#include <linux/module.h>
> > @@ -82,6 +83,39 @@ static const struct mfd_cell s2mpg10_devs[] =3D {
> > =C2=A0	MFD_CELL_OF("s2mpg10-gpio", NULL, NULL, 0, 0, "samsung,s2mpg10-g=
pio"),
> > =C2=A0};
> > =C2=A0
> > +static const struct mfd_cell s2mpg11_devs[] =3D {
> > +	MFD_CELL_NAME("s2mpg11-meter"),
> > +	MFD_CELL_BASIC("s2mpg11-regulator", NULL, NULL, 0, S2MPG11_BUCKBOOST)=
,
>=20
> This is highly irregular - in that, we've never done this before.
>=20
> We're going to need to have Mark look at this.

I did see this in at least one other driver, ah yes at least
drivers/mfd/88pm860x-core.c is doing something similar, maybe others, too
(I stopped there).

Cheers,
Andre'

