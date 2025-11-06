Return-Path: <linux-gpio+bounces-28160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42786C3A405
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 11:29:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C03050209C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 10:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494BE2D9EC4;
	Thu,  6 Nov 2025 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAuObi3L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFBB299943
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762424609; cv=none; b=jzKWe2GutuFmrr0nhSpPNPxJ6twg8kLaMUr3BAJC2LBxOnSgJ6Z0SfQJNICjnbVuI3JMvwvgdsVxahdRtyJdHmLl8Jog6JjkSSlAFgiaUgJsKqjqhtmNnOxbhwxCIw0OotGthJJwgBsy2XlVhaQ0Je5JnWhme7nmQpbITWI+ysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762424609; c=relaxed/simple;
	bh=YJyKfjgGwyiXflpuNY3NUPQ4xABSSSUEEcYqP+BEZrE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FxR+qhP6gLxIBjrCVXuyg7RWWj1ZDLOL5jfIwOvJeACFpKTkqx/USus9/TgY5DiTaXHat/CnOozxZacT6NdRwsfL2NQSxmcUUvZE4r62WoXI0yjmH4epjuxcmD5MZSXYitO/1+TiFUnJr1/dHBhiikg06pRDEqywU52n8P5rU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAuObi3L; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f0ae439b56so494350f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 02:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762424603; x=1763029403; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UNNI2bVAqUI9ZUOAYMFOCZya35lpS80qMzXSV5yJcUE=;
        b=QAuObi3LtAts+PiJojgT8l6yH2WWWrlxGPINUyODwAm4i01opq7/2cfyv2LE2Ezjq+
         wCAMynO/hNRAe/XC98lcsKfBoMLv8pca5OGjNwfn3Lmm2Z7fZzoaTePTuOt430MGHAu4
         Bi6P2fVdFMMzjNlPP+PVdxDZdxJS/tjIGsW66oZAj8lrBw/aaX1qw5iw2mkiSJqYFOhO
         k6/XPdIscwxU9H8yI+l4BUWlUHLwUysasfQwnPxAFT0+EbolW+mjNtZjq9fSEcT5+8gq
         Sp9hGCaO8744Ck1PLjhBd6ikUVebH+WgalZgp/6kwOlkf/ajoWs/GiqgxsaeFRfVXPYs
         jvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762424603; x=1763029403;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNNI2bVAqUI9ZUOAYMFOCZya35lpS80qMzXSV5yJcUE=;
        b=k/14I3sDHQDOAiIqKSL97UtDg51JjpmokAHsqYlFqCLItiD8tz3M5jG2Q4piBBzT5G
         hKZ9PqyLIqNBAi9qAX6Kskcw89OZc1ZXUXV8F0ZMZQk5eewk1IbySsKP43JcrUH5oKzR
         yo865F/DG6HcWJu9hygylQgJ+Mwz+o48NhRpiaCttp8G/z1v60hfxF7yLw4LFI3K0Vl5
         HjwDNkayUb3qclziXA9hBF4/0G0uU0a0TeJ7ofSmtCXF8WyXduLxKvJaS/X/dvkpu6h1
         7fhkaFzT/CxNLVPyc5z8LBPSJkLgLYTIm5zAsgdXyC5rXLyJ0Hm1lOFZ+PG/wgfQ8Mjy
         Ulyg==
X-Forwarded-Encrypted: i=1; AJvYcCVq4IBtN4e6arH3f02lK3CXPp3d+DPa6E/07DgD7tE61x94eoQafi5TkI8DkToJVT7DAE4rHW4VWLGF@vger.kernel.org
X-Gm-Message-State: AOJu0YwInmbm48LxDOtsRws1rNcX7FcWfeXJ+ZuwvMA+phvEzLwkI8Bj
	n9m7pzoWw62hdJzx6rdpDbNZ93DqHzqzntQ/fQCK312LtQGAvfcmPi/a
X-Gm-Gg: ASbGnctZWNi6QGFfIX1gbsgHQu70W4SRYegN9TcxNn/0iHZ33v+omFkid0/FaxPDKNa
	uL5yzGxQWYs6AgrrE00n4ll8FHJEbNPj9Pt4XT7RiUxXLDTG1aLePFJ+rHHpvIaaCT5ik/hqFW/
	FOV9zHO/5IHBuDIQc5O0jiEZpqrEX+PCnFc6eXG/bSWUltMB68eoPWiua9MY0f8Mh81RvGFCNyE
	w9ZUdq43q9phyLD9KmyJQHfclxrizkoRjeBeQ80jWYZsfOJFYCBMOztWrrYvbCZMHhvpxwbdUe3
	vA49PTVGfCRW+PH3uFsxryPLYyoEaZ0woijXYk7CLNhRs5BA2VW4wAKhHQXexKGpTnI1yWZ7RC5
	CIiFCI2v68r/8frrk2Nm83b7XEcYKtptEf+0C0ItQny8Yv2Jbm95StmjtSquoX/EgKIrosScVz+
	7AQW0f72CM
X-Google-Smtp-Source: AGHT+IGBFTHHWLB+StYoBwiR7faANLXw1lPed3rZJmu21ZFTBlniWJyAh4aQCtdcxIh+QThlmy55Xg==
X-Received: by 2002:a05:6000:647:b0:429:d391:642d with SMTP id ffacd0b85a97d-429e32c6100mr6962097f8f.5.1762424602728;
        Thu, 06 Nov 2025 02:23:22 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb410d43sm4181385f8f.12.2025.11.06.02.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:23:22 -0800 (PST)
Message-ID: <f6f445b84b4b2592816f4df847cc852d1dbf0f00.camel@gmail.com>
Subject: Re: [PATCH v3 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,  Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Nov 2025 10:23:58 +0000
In-Reply-To: <20251104-ltc4283-support-v3-2-4bea496f791d@analog.com>
References: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com>
	 <20251104-ltc4283-support-v3-2-4bea496f791d@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-11-04 at 10:32 +0000, Nuno S=C3=A1 via B4 Relay wrote:
> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> Support the LTC4283 How Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current t=
o
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFE=
T
> temperature rise for reliable protection against overstresses.
>=20
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---
> =C2=A0Documentation/hwmon/index.rst=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0Documentation/hwmon/ltc4283.rst |=C2=A0 266 ++++++
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 1 +
> =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 12 +
> =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/hwmon/ltc4283.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1749 +++++++++++++++++++++++++++++++++++++++
> =C2=A06 files changed, 2030 insertions(+)
>=20

...

> +
> +struct ltc4283_hwmon {
> +	struct regmap *map;
> +
> +	unsigned long gpio_mask;
> +	/* lock to protect concurrent device accesses and shared data */
> +	struct mutex lock;

Completely forgot locking is now handled by the core. I'll drop it in the
next version.

- Nuno S=C3=A1


> +	unsigned long ch_enable_mask;
> +	/* in microwatt */
> +	long power_max;
> +	/* in millivolt */
> +	u32 vsense_max;
> +	/* in tenths of microohm*/
> +	u32 rsense;
> +	bool energy_en;
> +	bool ext_fault;
> +};
> +
> +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
> +{
> +	__be16 in;
> +	int ret;
> +
> +	ret =3D regmap_bulk_read(st->map, reg, &in, sizeof(in));
> +	if (ret)
> +		return ret;
> +
> +	*val =3D DIV_ROUND_CLOSEST(be16_to_cpu(in) * fs, BIT(16));
> +	return 0;
> +}
> +
> +static int ltc4283_read_voltage_byte(const struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
> +{
> +	int ret;
> +	u32 in;
> +
> +	ret =3D regmap_read(st->map, reg, &in);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D DIV_ROUND_CLOSEST(in * fs, BIT(8));
> +	return 0;
> +}
> +
> +static u32 ltc4283_in_reg(u32 attr, u32 channel)
> +{
> +	switch (attr) {
> +	case hwmon_in_input:
> +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR;
> +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAIN=
)
> +			return LTC4283_ADC_2(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	case hwmon_in_highest:
> +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR_MAX;
> +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAIN=
)
> +			return LTC4283_ADC_2_MAX(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_MAX_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	case hwmon_in_lowest:
> +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR_MIN;
> +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAIN=
)
> +			return LTC4283_ADC_2_MIN(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_MIN_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	case hwmon_in_max:
> +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR_MAX_TH;
> +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAIN=
)
> +			return LTC4283_ADC_2_MAX_TH(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_MAX_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	default:
> +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> +			return LTC4283_VPWR_MIN_TH;
> +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAIN=
)
> +			return LTC4283_ADC_2_MIN_TH(channel - LTC4283_CHAN_ADI_1);
> +		return LTC4283_ADC_2_MIN_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	}
> +}
> +
> +static int ltc4283_read_in_vals(const struct ltc4283_hwmon *st,
> +				u32 attr, u32 channel, long *val)
> +{
> +	u32 reg =3D ltc4283_in_reg(attr, channel);
> +	int ret;
> +
> +	if (channel < LTC4283_CHAN_ADIN12) {
> +		if (attr !=3D hwmon_in_max && attr !=3D hwmon_in_min)
> +			return ltc4283_read_voltage_word(st, reg,
> +							 LTC4283_ADC2_FS_mV,
> +							 val);
> +
> +		return ltc4283_read_voltage_byte(st, reg,
> +						 LTC4283_ADC2_FS_mV, val);
> +	}
> +
> +	if (attr !=3D hwmon_in_max && attr !=3D hwmon_in_min)
> +		ret =3D ltc4283_read_voltage_word(st, reg,
> +						LTC4283_ADC1_FS_uV, val);
> +	else
> +		ret =3D ltc4283_read_voltage_byte(st, reg,
> +						LTC4283_ADC1_FS_uV, val);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D DIV_ROUND_CLOSEST(*val, MILLI);
> +	return 0;
> +}
> +
> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 mask, long *val)
> +{
> +	u32 alarm;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +	ret =3D regmap_read(st->map, reg, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D !!(alarm & mask);
> +
> +	/* If not status/fault logs, clear the alarm after reading it. */
> +	if (reg !=3D LTC4283_FAULT_STATUS && reg !=3D LTC4283_FAULT_LOG)
> +		return regmap_clear_bits(st->map, reg, mask);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> +				 bool max_alm, long *val)
> +{
> +	if (channel =3D=3D LTC4283_VPWR)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					=C2=A0 BIT(2 + max_alm), val);
> +
> +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_ADI_4)=
 {
> +		u32 bit =3D (channel - LTC4283_CHAN_ADI_1) * 2;
> +		/*
> +		 * Lower channels go to higher bits. We also want to go +1 down
> +		 * in the min_alarm case.
> +		 */
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> +					=C2=A0 BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >=3D LTC4283_CHAN_ADIO_1 && channel <=3D LTC4283_CHAN_ADIO_=
4) {
> +		u32 bit =3D (channel - LTC4283_CHAN_ADIO_1) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> +					=C2=A0 BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >=3D LTC4283_CHAN_ADIN12 && channel <=3D LTC4283_CHAN_ADIN3=
4) {
> +		u32 bit =3D (channel - LTC4283_CHAN_ADIN12) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> +					=C2=A0 BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel =3D=3D LTC4283_CHAN_DRNS)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> +					=C2=A0 BIT(6 + max_alm), val);
> +
> +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> +				=C2=A0 val);
> +}
> +
> +static int ltc4283_read_in(struct ltc4283_hwmon *st, u32 attr, u32 chann=
el,
> +			=C2=A0=C2=A0 long *val)
> +{
> +	int ret =3D 0;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		scoped_guard(mutex, &st->lock) {
> +			if (!test_bit(channel, &st->ch_enable_mask))
> +				return -ENODATA;
> +
> +			ret =3D ltc4283_read_in_vals(st, attr, channel, val);
> +		}
> +		return ret;
> +	case hwmon_in_highest:
> +	case hwmon_in_lowest:
> +	case hwmon_in_max:
> +	case hwmon_in_min:
> +		return ltc4283_read_in_vals(st, attr, channel, val);
> +	case hwmon_in_max_alarm:
> +		return ltc4283_read_in_alarm(st, channel, true, val);
> +	case hwmon_in_min_alarm:
> +		return ltc4283_read_in_alarm(st, channel, false, val);
> +	case hwmon_in_crit_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> +					=C2=A0 LTC4283_OV_MASK, val);
> +	case hwmon_in_lcrit_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> +					=C2=A0 LTC4283_UV_MASK, val);
> +	case hwmon_in_fault:
> +		/*
> +		 * We report failure if we detect either a fer_bad or a
> +		 * fet_short in the status register.
> +		 */
> +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> +					=C2=A0 LTC4283_FET_BAD_MASK | LTC4283_FET_SHORT_MASK, val);
> +	case hwmon_in_enable:
> +		*val =3D test_bit(channel, &st->ch_enable_mask);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
> +}
> +
> +static int ltc4283_read_current_word(const struct ltc4283_hwmon *st, u32=
 reg,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 long *val)
> +{
> +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
> +	__be16 curr;
> +	int ret;
> +
> +	ret =3D regmap_bulk_read(st->map, reg, &curr, sizeof(curr));
> +	if (ret)
> +		return ret;
> +
> +	*val =3D DIV64_U64_ROUND_CLOSEST(be16_to_cpu(curr) * temp,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT_ULL(16) * st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_current_byte(const struct ltc4283_hwmon *st, u32=
 reg,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 long *val)
> +{
> +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
> +	u32 curr;
> +	int ret;
> +
> +	ret =3D regmap_read(st->map, reg, &curr);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D DIV_ROUND_CLOSEST_ULL(curr * temp, BIT(8) * st->rsense);
> +	return 0;
> +}
> +
> +static int ltc4283_read_curr(struct ltc4283_hwmon *st, u32 attr, long *v=
al)
> +{
> +	switch (attr) {
> +	case hwmon_curr_input:
> +		return ltc4283_read_current_word(st, LTC4283_SENSE, val);
> +	case hwmon_curr_highest:
> +		return ltc4283_read_current_word(st, LTC4283_SENSE_MAX, val);
> +	case hwmon_curr_lowest:
> +		return ltc4283_read_current_word(st, LTC4283_SENSE_MIN, val);
> +	case hwmon_curr_max:
> +		return ltc4283_read_current_byte(st, LTC4283_SENSE_MAX_TH, val);
> +	case hwmon_curr_min:
> +		return ltc4283_read_current_byte(st, LTC4283_SENSE_MIN_TH, val);
> +	case hwmon_curr_max_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					=C2=A0 LTC4283_SENSE_HIGH_ALM, val);
> +	case hwmon_curr_min_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					=C2=A0 LTC4283_SENSE_LOW_ALM, val);
> +	case hwmon_curr_crit_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> +					=C2=A0 LTC4283_OC_MASK, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0 u32 reg, long *val)
> +{
> +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILL=
I;
> +	__be16 raw;
> +	int ret;
> +
> +	ret =3D regmap_bulk_read(st->map, reg, &raw, sizeof(raw));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Power is given by:
> +	 *=C2=A0=C2=A0=C2=A0=C2=A0 P =3D CODE(16b) * 32.768mV * 2.048V / (2^16 =
* Rsense)
> +	 */
> +	*val =3D DIV64_U64_ROUND_CLOSEST(temp * be16_to_cpu(raw),
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT_ULL(16) * st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_power_byte(const struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0 u32 reg, long *val)
> +{
> +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILL=
I;
> +	u32 power;
> +	int ret;
> +
> +	ret =3D regmap_read(st->map, reg, &power);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D DIV_ROUND_CLOSEST_ULL(power * temp, BIT(8) * st->rsense);
> +
> +	return 0;
> +}
> +
> +static int ltc4283_read_power(struct ltc4283_hwmon *st, u32 attr, long *=
val)
> +{
> +	switch (attr) {
> +	case hwmon_power_input:
> +		return ltc4283_read_power_word(st, LTC4283_POWER, val);
> +	case hwmon_power_input_highest:
> +		return ltc4283_read_power_word(st, LTC4283_POWER_MAX, val);
> +	case hwmon_power_input_lowest:
> +		return ltc4283_read_power_word(st, LTC4283_POWER_MIN, val);
> +	case hwmon_power_max_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					=C2=A0 LTC4283_POWER_HIGH_ALM, val);
> +	case hwmon_power_min_alarm:
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					=C2=A0 LTC4283_POWER_LOW_ALM, val);
> +	case hwmon_power_max:
> +		return ltc4283_read_power_byte(st, LTC4283_POWER_MAX_TH, val);
> +	case hwmon_power_min:
> +		return ltc4283_read_power_byte(st, LTC4283_POWER_MIN_TH, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4283_read_energy(struct ltc4283_hwmon *st, u32 attr, s64 *=
val)
> +{
> +	u64 temp =3D LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV, energy, temp_2;
> +	__be64 raw;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +	if (!st->energy_en)
> +		return -ENODATA;
> +
> +	ret =3D regmap_bulk_read(st->map, LTC4283_ENERGY, &raw, sizeof(raw));
> +	if (ret)
> +		return ret;
> +
> +	energy =3D=C2=A0 be64_to_cpu(raw) >> 16;
> +
> +	/*
> +	 * The formula for energy is given by:
> +	 *	E =3D CODE(48b) * 32.768mV * 2.048V * Tconv / 2^24 * Rsense
> +	 *
> +	 * As Rsense can have tenths of micro-ohm resolution, we need to
> +	 * multiply by DECA to get microjoule.
> +	 */
> +	if (check_mul_overflow(temp * LTC4283_TCONV_uS, energy, &temp_2)) {
> +		/*
> +		 * We multiply again by 1000 to make sure that we don't get 0
> +		 * in the following division which could happen for big rsense
> +		 * values. OTOH, we then divide energy first by 1000 so that
> +		 * we do not overflow u64 again for very small rsense values.
> +		 * We add 100 factor for proper conversion to microjoule.
> +		 */
> +		temp_2 =3D DIV64_U64_ROUND_CLOSEST(temp * LTC4283_TCONV_uS * MILLI,
> +						 BIT_ULL(24) * st->rsense);
> +		energy =3D DIV_ROUND_CLOSEST_ULL(energy, MILLI * CENTI) * temp_2;
> +	} else {
> +		/* Put rsense back into nanoohm so we get microjoule. */
> +		energy =3D DIV64_U64_ROUND_CLOSEST(temp_2, BIT_ULL(24) * st->rsense * =
CENTI);
> +	}
> +
> +	*val =3D energy;
> +	return 0;
> +}
> +
> +static int ltc4283_read(struct device *dev, enum hwmon_sensor_types type=
,
> +			u32 attr, int channel, long *val)
> +{
> +	struct ltc4283_hwmon *st =3D dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc4283_read_in(st, attr, channel, val);
> +	case hwmon_curr:
> +		return ltc4283_read_curr(st, attr, val);
> +	case hwmon_power:
> +		return ltc4283_read_power(st, attr, val);
> +	case hwmon_energy:
> +		scoped_guard(mutex, &st->lock) {
> +			*val =3D st->energy_en;
> +		}
> +		return 0;
> +	case hwmon_energy64:
> +		return ltc4283_read_energy(st, attr, (s64 *)val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4282_write_power_byte(const struct ltc4283_hwmon *st, u32 =
reg,
> +				=C2=A0=C2=A0=C2=A0 long val)
> +{
> +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILL=
I;
> +	u32 __raw;
> +
> +	if (val > st->power_max)
> +		val =3D st->power_max;
> +
> +	__raw =3D DIV64_U64_ROUND_CLOSEST(val * BIT_ULL(8) * st->rsense, temp);
> +
> +	return regmap_write(st->map, reg, __raw);
> +}
> +
> +static int ltc4283_write_power_word(const struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0=C2=A0 u32 reg, long val)
> +{
> +	u64 temp =3D st->rsense * BIT_ULL(16), temp_2;
> +	__be16 __raw;
> +	u16 code;
> +
> +	if (check_mul_overflow(val, temp, &temp_2)) {
> +		temp =3D DIV_ROUND_CLOSEST_ULL(temp, DECA * MILLI);
> +		code =3D DIV_ROUND_CLOSEST_ULL(temp * val, LTC4283_ADC1_FS_uV *
> LTC4283_ADC2_FS_mV);
> +	} else {
> +		temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
> +		code =3D DIV64_U64_ROUND_CLOSEST(temp_2, temp);
> +	}
> +
> +	__raw =3D cpu_to_be16(code);
> +	return regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
> +}
> +
> +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D ltc4283_write_power_word(st, LTC4283_POWER_MIN, st->power_max);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ltc4283_write_power_word(st, LTC4283_POWER_MAX, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Clear possible power faults. */
> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK);
> +}
> +
> +static int ltc4283_write_power(struct ltc4283_hwmon *st, u32 attr, long =
val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return ltc4282_write_power_byte(st, LTC4283_POWER_MAX_TH, val);
> +	case hwmon_power_min:
> +		return ltc4282_write_power_byte(st, LTC4283_POWER_MIN_TH, val);
> +	case hwmon_power_reset_history:
> +		return ltc4283_reset_power_hist(st);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int __ltc4283_write_in_history(struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, long lowest, u32 fs)
> +{
> +	__be16 __raw;
> +	u16 tmp =3D 0;
> +	u32 tmp2;
> +	int ret;
> +
> +	tmp2 =3D DIV_ROUND_CLOSEST(BIT(16) * lowest, fs);
> +	if (tmp2 =3D=3D BIT(16))
> +		tmp2 =3D U16_MAX;
> +
> +	__raw =3D cpu_to_be16(tmp2);
> +
> +	ret =3D regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_bulk_write(st->map, reg + 1,=C2=A0 &tmp, sizeof(tmp));
> +}
> +
> +static int ltc4283_write_in_history(struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0=C2=A0 u32 reg, long lowest, u32 fs)
> +{
> +	guard(mutex)(&st->lock);
> +	return __ltc4283_write_in_history(st, reg, lowest, fs);
> +}
> +
> +static int ltc4283_write_in_byte(const struct ltc4283_hwmon *st,
> +				 u32 reg, u32 fs, long val)
> +{
> +	u32 __raw;
> +
> +	val =3D clamp_val(val, 0, fs);
> +	__raw =3D DIV_ROUND_CLOSEST(val * BIT(8), fs);
> +
> +	return regmap_write(st->map, reg, __raw);
> +}
> +
> +static int ltc4283_reset_in_hist(struct ltc4283_hwmon *st, u32 channel)
> +{
> +	u32 reg, fs;
> +	int ret;
> +
> +	/*
> +	 * Make sure to clear possible under/over voltage faults. Otherwise the
> +	 * chip won't latch on again.
> +	 */
> +	if (channel =3D=3D LTC4283_CHAN_VIN)
> +		return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +					 LTC4283_OV_FAULT_MASK | LTC4283_UV_FAULT_MASK);
> +
> +	if (channel =3D=3D LTC4283_CHAN_VPWR)
> +		return ltc4283_write_in_history(st, LTC4283_VPWR_MIN,
> +						LTC4283_ADC2_FS_mV,
> +						LTC4283_ADC2_FS_mV);
> +
> +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAIN)=
 {
> +		fs =3D LTC4283_ADC2_FS_mV;
> +		reg =3D LTC4283_ADC_2_MIN(channel - LTC4283_CHAN_ADI_1);
> +	} else {
> +		fs =3D LTC4283_ADC1_FS_uV;
> +		reg =3D LTC4283_ADC_2_MIN_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	}
> +
> +	guard(mutex)(&st->lock);
> +	ret =3D __ltc4283_write_in_history(st, reg, fs, fs);
> +	if (ret)
> +		return ret;
> +	if (channel !=3D LTC4283_CHAN_DRAIN)
> +		return 0;
> +
> +	/* Then, let's also clear possible fet faults. Same as above. */
> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_FET_BAD_FAULT_MASK | LTC4283_FET_SHORT_FAULT_MASK);
> +}
> +
> +static int ltc4283_write_in_en(struct ltc4283_hwmon *st, u32 channel, bo=
ol en)
> +{
> +	unsigned int bit, adc_idx =3D channel - LTC4283_CHAN_ADI_1;
> +	unsigned int reg =3D LTC4283_ADC_SELECT(adc_idx);
> +	int ret;
> +
> +	bit =3D LTC4283_ADC_SELECT_MASK(adc_idx);
> +	if (channel > LTC4283_CHAN_DRAIN)
> +		/* Account for two reserved fields after DRAIN. */
> +		bit <<=3D 2;
> +
> +	guard(mutex)(&st->lock);
> +	if (en)
> +		ret =3D regmap_set_bits(st->map, reg, bit);
> +	else
> +		ret =3D regmap_clear_bits(st->map, reg, bit);
> +	if (ret)
> +		return ret;
> +
> +	__assign_bit(channel, &st->ch_enable_mask, en);
> +	return 0;
> +}
> +
> +static int ltc4283_write_minmax(struct ltc4283_hwmon *st, long val,
> +				u32 channel, bool is_max)
> +{
> +	u32 reg;
> +
> +	if (channel =3D=3D LTC4283_CHAN_VPWR) {
> +		if (is_max)
> +			return ltc4283_write_in_byte(st, LTC4283_VPWR_MAX_TH,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV, val);
> +
> +		return ltc4283_write_in_byte(st, LTC4283_VPWR_MIN_TH,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV, val);
> +	}
> +
> +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAIN)=
 {
> +		if (is_max) {
> +			reg =3D LTC4283_ADC_2_MAX_TH(channel - LTC4283_CHAN_ADI_1);
> +			return ltc4283_write_in_byte(st, reg,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV, val);
> +		}
> +
> +		reg =3D LTC4283_ADC_2_MIN_TH(channel - LTC4283_CHAN_ADI_1);
> +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC2_FS_mV, val);
> +	}
> +
> +	if (is_max) {
> +		reg =3D LTC4283_ADC_2_MAX_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 val * MILLI);
> +	}
> +
> +	reg =3D LTC4283_ADC_2_MIN_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> +	return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV, val * MILLI);
> +}
> +
> +static int ltc4283_write_in(struct ltc4283_hwmon *st, u32 attr, long val=
,
> +			=C2=A0=C2=A0=C2=A0 int channel)
> +{
> +	switch (attr) {
> +	case hwmon_in_max:
> +		return ltc4283_write_minmax(st, val, channel, true);
> +	case hwmon_in_min:
> +		return ltc4283_write_minmax(st, val, channel, false);
> +	case hwmon_in_reset_history:
> +		return ltc4283_reset_in_hist(st, channel);
> +	case hwmon_in_enable:
> +		return ltc4283_write_in_en(st, channel, !!val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4283_write_curr_byte(const struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0 u32 reg, long val)
> +{
> +	u32 temp =3D LTC4283_ADC1_FS_uV * DECA * MILLI;
> +	u32 reg_val;
> +
> +	reg_val =3D DIV_ROUND_CLOSEST_ULL(val * BIT_ULL(8) * st->rsense, temp);
> +	return regmap_write(st->map, reg, reg_val);
> +}
> +
> +static int ltc4283_write_curr_history(struct ltc4283_hwmon *st)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D __ltc4283_write_in_history(st, LTC4283_SENSE_MIN, st->vsense_ma=
x,
> +					 LTC4283_ADC1_FS_uV);
> +	if (ret)
> +		return ret;
> +
> +	/* Now, let's also clear possible overcurrent logs. */
> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> +				 LTC4283_OC_FAULT_MASK);
> +}
> +
> +static int ltc4283_write_curr(struct ltc4283_hwmon *st, u32 attr, long v=
al)
> +{
> +	switch (attr) {
> +	case hwmon_curr_max:
> +		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MAX_TH, val);
> +	case hwmon_curr_min:
> +		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MIN_TH, val);
> +	case hwmon_curr_reset_history:
> +		return ltc4283_write_curr_history(st);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int ltc4283_energy_enable_set(struct ltc4283_hwmon *st, long val)
> +{
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	/* Setting the bit halts the meter. */
> +	val =3D !!val;
> +	ret =3D regmap_update_bits(st->map, LTC4283_METER_CONTROL,
> +				 LTC4283_METER_HALT_MASK,
> +				 FIELD_PREP(LTC4283_METER_HALT_MASK, !val));
> +	if (ret)
> +		return ret;
> +
> +	st->energy_en =3D val;
> +
> +	return 0;
> +}
> +
> +static int ltc4283_write(struct device *dev, enum hwmon_sensor_types typ=
e,
> +			 u32 attr, int channel, long val)
> +{
> +	struct ltc4283_hwmon *st =3D dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_power:
> +		return ltc4283_write_power(st, attr, val);
> +	case hwmon_in:
> +		return ltc4283_write_in(st, attr, val, channel);
> +	case hwmon_curr:
> +		return ltc4283_write_curr(st, attr, val);
> +	case hwmon_energy:
> +		return ltc4283_energy_enable_set(st, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t ltc4283_in_is_visible(const struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 attr, int channel)
> +{
> +	/* If ADIO is set as a GPIO, don=C2=B4t make it visible. */
> +	if (channel >=3D LTC4283_CHAN_ADIO_1 && channel <=3D LTC4283_CHAN_ADIO_=
4) {
> +		/* ADIOX pins come at index 0 in the gpio mask. */
> +		channel -=3D LTC4283_CHAN_ADIO_1;
> +		if (test_bit(channel, &st->gpio_mask))
> +			return 0;
> +	}
> +
> +	/* Also take care of differential channels. */
> +	if (channel >=3D LTC4283_CHAN_ADIO12 && channel <=3D LTC4283_CHAN_ADIO3=
4) {
> +		channel -=3D LTC4283_CHAN_ADIO12;
> +		/* If one channel in the pair is used, make it invisible. */
> +		if (test_bit(channel * 2, &st->gpio_mask) ||
> +		=C2=A0=C2=A0=C2=A0 test_bit(channel * 2 + 1, &st->gpio_mask))
> +			return 0;
> +	}
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +	case hwmon_in_highest:
> +	case hwmon_in_lowest:
> +	case hwmon_in_max_alarm:
> +	case hwmon_in_min_alarm:
> +	case hwmon_in_label:
> +	case hwmon_in_lcrit_alarm:
> +	case hwmon_in_crit_alarm:
> +	case hwmon_in_fault:
> +		return 0444;
> +	case hwmon_in_max:
> +	case hwmon_in_min:
> +	case hwmon_in_enable:
> +	case hwmon_in_reset_history:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ltc4283_curr_is_visible(u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_curr_input:
> +	case hwmon_curr_highest:
> +	case hwmon_curr_lowest:
> +	case hwmon_curr_max_alarm:
> +	case hwmon_curr_min_alarm:
> +	case hwmon_curr_crit_alarm:
> +	case hwmon_curr_label:
> +		return 0444;
> +	case hwmon_curr_max:
> +	case hwmon_curr_min:
> +	case hwmon_curr_reset_history:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ltc4283_power_is_visible(u32 attr)
> +{
> +	switch (attr) {
> +	case hwmon_power_input:
> +	case hwmon_power_input_highest:
> +	case hwmon_power_input_lowest:
> +	case hwmon_power_label:
> +	case hwmon_power_max_alarm:
> +	case hwmon_power_min_alarm:
> +		return 0444;
> +	case hwmon_power_max:
> +	case hwmon_power_min:
> +	case hwmon_power_reset_history:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static umode_t ltc4283_is_visible(const void *data,
> +				=C2=A0 enum hwmon_sensor_types type,
> +				=C2=A0 u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		return ltc4283_in_is_visible(data, attr, channel);
> +	case hwmon_curr:
> +		return ltc4283_curr_is_visible(attr);
> +	case hwmon_power:
> +		return ltc4283_power_is_visible(attr);
> +	case hwmon_energy:
> +		/* hwmon_energy_enable */
> +		return 0644;
> +	case hwmon_energy64:
> +		/* hwmon_energy_input */
> +		return 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const char * const ltc4283_in_strs[] =3D {
> +	"VIN", "VPWR", "VADI1", "VADI2", "VADI3", "VADI4", "VADIO1", "VADIO2",
> +	"VADIO3", "VADIO4", "DRNS", "DRAIN", "ADIN2-ADIN1", "ADIN4-ADIN3",
> +	"ADIO2-ADIO1", "ADIO4-ADIO3"
> +};
> +
> +static int ltc4283_read_labels(struct device *dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum hwmon_sensor_types type,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 attr, int channel, const cha=
r **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		*str =3D ltc4283_in_strs[channel];
> +		return 0;
> +	case hwmon_curr:
> +		*str =3D "ISENSE";
> +		return 0;
> +	case hwmon_power:
> +		*str =3D "Power";
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +/*
> + * Set max limits for ISENSE and Power as that depends on the max voltag=
e on
> + * rsense that is defined in ILIM_ADJUST. This is specially important fo=
r power
> + * because for some rsense and vfsout values, if we allow the default ra=
w 255
> + * value, that would overflow long in 32bit archs when reading back the =
max
> + * power limit.
> + */
> +static int ltc4283_set_max_limits(struct ltc4283_hwmon *st, struct devic=
e *dev)
> +{
> +	u32 temp =3D st->vsense_max * DECA * MICRO;
> +	int ret;
> +
> +	ret =3D ltc4283_write_in_byte(st, LTC4283_SENSE_MAX_TH, LTC4283_ADC1_FS=
_uV,
> +				=C2=A0=C2=A0=C2=A0 st->vsense_max * MILLI);
> +	if (ret)
> +		return ret;
> +
> +	/* Power is given by ISENSE * Vout. */
> +	st->power_max =3D DIV_ROUND_CLOSEST(temp, st->rsense) * LTC4283_ADC2_FS=
_mV;
> +	return ltc4282_write_power_byte(st, LTC4283_POWER_MAX_TH, st->power_max=
);
> +}
> +
> +static int ltc4283_parse_array_prop(const struct ltc4283_hwmon *st,
> +				=C2=A0=C2=A0=C2=A0 struct device *dev, const char *prop,
> +				=C2=A0=C2=A0=C2=A0 const u32 *vals, u32 n_vals)
> +{
> +	u32 prop_val;
> +	int ret;
> +	u32 i;
> +
> +	ret =3D device_property_read_u32(dev, prop, &prop_val);
> +	if (ret)
> +		return n_vals;
> +
> +	for (i =3D 0; i < n_vals; i++) {
> +		if (prop_val !=3D vals[i])
> +			continue;
> +
> +		return i;
> +	}
> +
> +	return dev_err_probe(dev, -EINVAL,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid %s property value %u, expected one =
of: %*ph\n",
> +			=C2=A0=C2=A0=C2=A0=C2=A0 prop, prop_val, n_vals, vals);
> +}
> +
> +static int ltc4283_get_defaults(struct ltc4283_hwmon *st)
> +{
> +	u32 reg_val, ilm_adjust, c;
> +	int ret;
> +
> +	ret =3D regmap_read(st->map, LTC4283_METER_CONTROL, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	st->energy_en =3D !FIELD_GET(LTC4283_METER_HALT_MASK, reg_val);
> +
> +	ret =3D regmap_read(st->map, LTC4283_CONFIG_1, &reg_val);
> +	if (ret)
> +		return ret;
> +
> +	ilm_adjust =3D FIELD_GET(LTC4283_ILIM_MASK, reg_val);
> +	st->vsense_max =3D LTC4283_VILIM_MIN_uV / MILLI + ilm_adjust;
> +
> +	/* VPWR and VIN are always enabled */
> +	__set_bit(LTC4283_CHAN_VIN, &st->ch_enable_mask);
> +	__set_bit(LTC4283_CHAN_VPWR, &st->ch_enable_mask);
> +	for (c =3D LTC4283_CHAN_ADI_1; c < LTC4283_CHAN_MAX; c++) {
> +		u32 chan =3D c - LTC4283_CHAN_ADI_1, bit;
> +
> +		ret =3D regmap_read(st->map, LTC4283_ADC_SELECT(chan), &reg_val);
> +		if (ret)
> +			return ret;
> +
> +		bit =3D LTC4283_ADC_SELECT_MASK(chan);
> +		if (c > LTC4283_CHAN_DRAIN)
> +			/* account for two reserved fields after DRAIN */
> +			bit <<=3D 2;
> +
> +		if (!(bit & reg_val))
> +			continue;
> +
> +		__set_bit(c, &st->ch_enable_mask);
> +	}
> +
> +	return 0;
> +}
> +
> +static const char * const ltc4283_pgio1_funcs[] =3D {
> +	"inverted_power_good", "power_good", "gpio"
> +};
> +
> +static const char * const ltc4283_pgio2_funcs[] =3D {
> +	 "inverted_power_good", "power_good", "gpio", "active_current_limiting"
> +};
> +
> +static const char * const ltc4283_pgio3_funcs[] =3D {
> +	"inverted_power_good_input", "power_good_input", "gpio"
> +};
> +
> +static const char * const ltc4283_pgio4_funcs[] =3D {
> +	"inverted_external_fault", "external_fault", "gpio"
> +};
> +
> +enum {
> +	LTC4283_PIN_ADIO1,
> +	LTC4283_PIN_ADIO2,
> +	LTC4283_PIN_ADIO3,
> +	LTC4283_PIN_ADIO4,
> +	LTC4283_PIN_PGIO1,
> +	LTC4283_PIN_PGIO2,
> +	LTC4283_PIN_PGIO3,
> +	LTC4283_PIN_PGIO4,
> +};
> +
> +static int ltc4283_pgio_config(struct ltc4283_hwmon *st, struct device *=
dev)
> +{
> +	int ret, func;
> +
> +	func =3D device_property_match_property_string(dev, "adi,pgio1-func",
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio1_funcs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_pgio1_funcs));
> +	if (func < 0 && func !=3D -EINVAL)
> +		return dev_err_probe(dev, func,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio1-func property\n");
> +	if (func >=3D 0) {
> +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> +			__set_bit(LTC4283_PIN_PGIO1, &st->gpio_mask);
> +			/* If GPIO, default to an input pin. */
> +			func++;
> +		}
> +
> +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> +					 LTC4283_PGIO1_CFG_MASK,
> +					 FIELD_PREP(LTC4283_PGIO1_CFG_MASK, func));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	func =3D device_property_match_property_string(dev, "adi,pgio2-func",
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio2_funcs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_pgio2_funcs));
> +
> +	if (func < 0 && func !=3D -EINVAL)
> +		return dev_err_probe(dev, func,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio2-func property\n");
> +	if (func >=3D 0) {
> +		if (func !=3D LTC4283_PGIO2_FUNC_ACLB) {
> +			if (func =3D=3D LTC4283_PGIO_FUNC_GPIO)=C2=A0 {
> +				__set_bit(LTC4283_PIN_PGIO2, &st->gpio_mask);
> +				func++;
> +			}
> +
> +			ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> +						 LTC4283_PGIO2_CFG_MASK,
> +						 FIELD_PREP(LTC4283_PGIO2_CFG_MASK, func));
> +		} else {
> +			ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_1,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_PIGIO2_ACLB_MASK);
> +		}
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	func =3D device_property_match_property_string(dev, "adi,pgio3-func",
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio3_funcs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_pgio3_funcs));
> +
> +	if (func < 0 && func !=3D -EINVAL)
> +		return dev_err_probe(dev, func,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio3-func property\n");
> +	if (func >=3D 0) {
> +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> +			__set_bit(LTC4283_PIN_PGIO3, &st->gpio_mask);
> +			func++;
> +		}
> +
> +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> +					 LTC4283_PGIO3_CFG_MASK,
> +					 FIELD_PREP(LTC4283_PGIO3_CFG_MASK, func));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	func =3D device_property_match_property_string(dev, "adi,pgio4-func",
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio4_funcs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_pgio4_funcs));
> +
> +	if (func < 0 && func !=3D -EINVAL)
> +		return dev_err_probe(dev, func,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio4-func property\n");
> +	if (func >=3D 0) {
> +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> +			__set_bit(LTC4283_PIN_PGIO4, &st->gpio_mask);
> +			func++;
> +		} else {
> +			st->ext_fault =3D true;
> +		}
> +
> +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> +					 LTC4283_PGIO4_CFG_MASK,
> +					 FIELD_PREP(LTC4283_PGIO4_CFG_MASK, func));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ltc4283_adio_config(struct ltc4283_hwmon *st, struct device *=
dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *prop, u32 pin)
> +{
> +	u32 adc_idx;
> +	int ret;
> +
> +	if (!device_property_read_bool(dev, prop))
> +		return 0;
> +
> +	adc_idx =3D LTC4283_CHAN_ADIO_1 - LTC4283_CHAN_ADI_1 + pin;
> +	ret =3D regmap_clear_bits(st->map, LTC4283_ADC_SELECT(adc_idx),
> +				LTC4283_ADC_SELECT_MASK(adc_idx));
> +	if (ret)
> +		return ret;
> +
> +	__set_bit(pin, &st->gpio_mask);
> +	return 0;
> +}
> +
> +static int ltc4283_pin_config(struct ltc4283_hwmon *st, struct device *d=
ev)
> +{
> +	int ret;
> +
> +	ret =3D ltc4283_pgio_config(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio1", LTC4283_PIN_A=
DIO1);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio2", LTC4283_PIN_A=
DIO2);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio3", LTC4283_PIN_A=
DIO3);
> +	if (ret)
> +		return ret;
> +
> +	return ltc4283_adio_config(st, dev, "adi,gpio-on-adio4", LTC4283_PIN_AD=
IO4);
> +}
> +
> +static const char * const ltc4283_oc_fet_retry[] =3D {
> +	"latch-off", "1", "7", "unlimited"
> +};
> +
> +static const u32 ltc4283_fb_factor[] =3D {
> +	100, 50, 20, 10
> +};
> +
> +static const u32 ltc4283_cooling_dl[] =3D {
> +	512, 1002, 2005, 4100, 8190, 16400, 32800, 65600
> +};
> +
> +static const u32 ltc4283_fet_bad_delay[] =3D {
> +	256, 512, 1002, 2005
> +};
> +
> +static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
> +{
> +	int ret;
> +
> +	/* The part has an eeprom so let's get the needed defaults from it */
> +	ret =3D ltc4283_get_defaults(st);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D device_property_read_u32(dev, "adi,rsense-nano-ohms",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &st->rsense);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to read adi,rsense-nano-ohms\n");
> +	if (st->rsense < CENTI)
> +		return dev_err_probe(dev, -EINVAL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "adi,rsense-nano-ohms too small (< %lu)\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 CENTI);
> +
> +	/*
> +	 * The resolution for rsense is tenths of micro (eg: 62.5 uOhm) which
> +	 * means we need nano in the bindings. However, to make things easier t=
o
> +	 * handle (with respect to overflows) we divide it by 100 as we don't
> +	 * really need the last two digits.
> +	 */
> +	st->rsense /=3D CENTI;
> +
> +	ret =3D device_property_read_u32(dev, "adi,current-limit-sense-microvol=
t",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &st->vsense_max);
> +	if (!ret) {
> +		u32 reg_val;
> +
> +		if (!in_range(st->vsense_max, LTC4283_VILIM_MIN_uV,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_VILIM_RANGE)) {
> +			return dev_err_probe(dev, -EINVAL,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,current-limit-sense-microvolt (%u) ou=
t of range
> [%u %u]\n",
> +					=C2=A0=C2=A0=C2=A0=C2=A0 st->vsense_max, LTC4283_VILIM_MIN_uV,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_VILIM_MAX_uV);
> +		}
> +
> +		st->vsense_max /=3D MILLI;
> +		reg_val =3D FIELD_PREP(LTC4283_ILIM_MASK,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 st->vsense_max - LTC4283_VILIM_MIN_uV / MIL=
LI);
> +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_1,
> +					 LTC4283_ILIM_MASK, reg_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,current-limit-foldback-f=
actor",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_fb_factor, ARRAY_SIZE(l=
tc4283_fb_factor));
> +	if (ret < 0)
> +		return ret;
> +	if (ret < ARRAY_SIZE(ltc4283_fb_factor)) {
> +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_1, LTC4283_FB_MASK,
> +					 FIELD_PREP(LTC4283_FB_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,cooling-delay-ms",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_cooling_dl, ARRAY_SIZE(=
ltc4283_cooling_dl));
> +	if (ret < 0)
> +		return ret;
> +	if (ret < ARRAY_SIZE(ltc4283_cooling_dl)) {
> +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_2, LTC4283_COOLING_=
DL_MASK,
> +					 FIELD_PREP(LTC4283_COOLING_DL_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,fet-bad-timer-delay-ms",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_fet_bad_delay, ARRAY_SI=
ZE(ltc4283_fet_bad_delay));
> +	if (ret < 0)
> +		return ret;
> +	if (ret < ARRAY_SIZE(ltc4283_fet_bad_delay)) {
> +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_2, LTC4283_FTBD_DL_=
MASK,
> +					 FIELD_PREP(LTC4283_FTBD_DL_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D ltc4283_set_max_limits(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ltc4283_pin_config(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	if (device_property_read_bool(dev, "adi,power-good-reset-on-fet")) {
> +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> +					LTC4283_PWRGD_RST_CTRL_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,fet-turn-off-disable")) {
> +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> +					LTC4283_FET_BAD_OFF_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,tmr-pull-down-disable")) {
> +		ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_1,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_THERM_TMR_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,dvdt-inrush-control-disable")) =
{
> +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> +					LTC4283_DVDT_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,undervoltage-retry-disable")) {
> +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_2,
> +					LTC4283_UV_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,overvoltage-retry-disable")) {
> +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_2,
> +					LTC4283_OV_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,external-fault-retry-enable")) =
{
> +		if (!st->ext_fault)
> +			return dev_err_probe(dev, -EINVAL,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,external-fault-retry-enable set but P=
GIO4 not
> configured\n");
> +		ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_2,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_EXT_FAULT_RETRY_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
> +		ret =3D regmap_set_bits(st->map, LTC4283_FAULT_LOG_CTRL,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_FAULT_LOG_EN_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D device_property_match_property_string(dev, "adi,overcurrent-ret=
ries",
> +						=C2=A0=C2=A0=C2=A0 ltc4283_oc_fet_retry,
> +						=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_oc_fet_retry));
> +	/* We still want to catch when an invalid string is given. */
> +	if (ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "adi,overcurrent-retries invalid value\n");
> +	if (ret >=3D 0) {
> +		ret =3D regmap_update_bits(st->map, LTC4283_CONTROL_2,
> +					 LTC4283_OC_RETRY_MASK,
> +					 FIELD_PREP(LTC4283_OC_RETRY_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret =3D device_property_match_property_string(dev, "adi,fet-bad-retries=
",
> +						=C2=A0=C2=A0=C2=A0 ltc4283_oc_fet_retry,
> +						=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_oc_fet_retry));
> +	if (ret !=3D -EINVAL)
> +		return dev_err_probe(dev, ret,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "adi,fet-bad-retries invalid value\n");
> +	if (ret >=3D 0) {
> +		ret =3D regmap_update_bits(st->map, LTC4283_CONTROL_2,
> +					 LTC4283_FET_BAD_RETRY_MASK,
> +					 FIELD_PREP(LTC4283_FET_BAD_RETRY_MASK, ret));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,external-fault-fet-off-enable")=
) {
> +		if (!st->ext_fault)
> +			return dev_err_probe(dev, -EINVAL,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,external-fault-fet-off-enable set but=
 PGIO4 not
> configured\n");
> +		ret =3D regmap_set_bits(st->map, LTC4283_CONFIG_3,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_EXTFLT_TURN_OFF_MASK);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (device_property_read_bool(dev, "adi,vpower-drns-enable")) {
> +		u32 drns_chan =3D LTC4283_CHAN_DRNS - LTC4283_CHAN_ADI_1;
> +
> +		ret =3D regmap_set_bits(st->map, LTC4283_CONFIG_3,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_VPWR_DRNS_MASK);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Then, let's by default disable the DRNS channel from the ADC2
> +		 * as this is already being monitored by the VPWR channel. One
> +		 * can still enable it later on if needed.
> +		 */
> +		ret =3D regmap_clear_bits(st->map, LTC4283_ADC_SELECT(drns_chan),
> +					LTC4283_ADC_SELECT_MASK(drns_chan));
> +		if (ret)
> +			return ret;
> +
> +		__clear_bit(LTC4283_CHAN_DRNS, &st->ch_enable_mask);
> +	}
> +
> +	/* Make sure the ADC has 12bit resolution since we're assuming that. */
> +	ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG_2,
> +				 LTC4283_ADC_MASK,
> +				 FIELD_PREP(LTC4283_ADC_MASK, 3));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Make sure we are integrating power as we only support reporting
> +	 * consumed energy.
> +	 */
> +	return regmap_clear_bits(st->map, LTC4283_METER_CONTROL,
> +				 LTC4283_INTEGRATE_I_MASK);
> +}
> +
> +static const struct hwmon_channel_info * const ltc4283_info[] =3D {
> +	HWMON_CHANNEL_INFO(in,
> +			=C2=A0=C2=A0 HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_MAX_ALARM | HWMON_I_RESET_HISTORY |
> +			=C2=A0=C2=A0 HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_FAULT | HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(curr,
> +			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
> +			=C2=A0=C2=A0 HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> +			=C2=A0=C2=A0 HWMON_C_RESET_HISTORY | HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(power,
> +			=C2=A0=C2=A0 HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
> +			=C2=A0=C2=A0 HWMON_P_INPUT_HIGHEST | HWMON_P_MAX | HWMON_P_MIN |
> +			=C2=A0=C2=A0 HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
> +			=C2=A0=C2=A0 HWMON_P_RESET_HISTORY | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(energy,
> +			=C2=A0=C2=A0 HWMON_E_ENABLE),
> +	HWMON_CHANNEL_INFO(energy64,
> +			=C2=A0=C2=A0 HWMON_E_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops ltc4283_ops =3D {
> +	.read =3D ltc4283_read,
> +	.write =3D ltc4283_write,
> +	.is_visible =3D ltc4283_is_visible,
> +	.read_string =3D ltc4283_read_labels,
> +};
> +
> +static const struct hwmon_chip_info ltc4283_chip_info =3D {
> +	.ops =3D &ltc4283_ops,
> +	.info =3D ltc4283_info,
> +};
> +
> +static int ltc4283_show_fault_log(void *arg, u64 *val, u32 mask)
> +{
> +	struct ltc4283_hwmon *st =3D arg;
> +	long alarm;
> +	int ret;
> +
> +	ret =3D ltc4283_read_alarm(st, LTC4283_FAULT_LOG, mask, &alarm);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D alarm;
> +
> +	return 0;
> +}
> +
> +static int ltc4283_show_in0_lcrit_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_UV_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_in0_lcrit_fault_log,
> +			 ltc4283_show_in0_lcrit_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_in0_crit_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_OV_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_in0_crit_fault_log,
> +			 ltc4283_show_in0_crit_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_fet_bad_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_FET_BAD_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_fet_bad_fault_log,
> +			 ltc4283_show_fet_bad_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_fet_short_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_FET_SHORT_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_fet_short_fault_log,
> +			 ltc4283_show_fet_short_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_curr1_crit_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_OC_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_curr1_crit_fault_log,
> +			 ltc4283_show_curr1_crit_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_power1_failed_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_PWR_FAIL_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_power1_failed_fault_log,
> +			 ltc4283_show_power1_failed_fault_log, NULL, "%llu\n");
> +
> +static int ltc4283_show_power1_good_input_fault_log(void *arg, u64 *val)
> +{
> +	return ltc4283_show_fault_log(arg, val, LTC4283_PGI_FAULT_MASK);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_power1_good_input_fault_log,
> +			 ltc4283_show_power1_good_input_fault_log, NULL, "%llu\n");
> +
> +static void ltc4283_debugfs_init(struct ltc4283_hwmon *st, struct i2c_cl=
ient *i2c)
> +{
> +	debugfs_create_file_unsafe("in0_crit_fault_log", 0400, i2c->debugfs, st=
,
> +				=C2=A0=C2=A0 &ltc4283_in0_crit_fault_log);
> +	debugfs_create_file_unsafe("in0_lcrit_fault_log", 0400, i2c->debugfs, s=
t,
> +				=C2=A0=C2=A0 &ltc4283_in0_lcrit_fault_log);
> +	debugfs_create_file_unsafe("in0_fet_bad_fault_log", 0400, i2c->debugfs,=
 st,
> +				=C2=A0=C2=A0 &ltc4283_fet_bad_fault_log);
> +	debugfs_create_file_unsafe("in0_fet_short_fault_log", 0400, i2c->debugf=
s, st,
> +				=C2=A0=C2=A0 &ltc4283_fet_short_fault_log);
> +	debugfs_create_file_unsafe("curr1_crit_fault_log", 0400, i2c->debugfs, =
st,
> +				=C2=A0=C2=A0 &ltc4283_curr1_crit_fault_log);
> +	debugfs_create_file_unsafe("power1_failed_fault_log", 0400, i2c->debugf=
s, st,
> +				=C2=A0=C2=A0 &ltc4283_power1_failed_fault_log);
> +	debugfs_create_file_unsafe("power1_good_input_fault_log", 0400, i2c->de=
bugfs,
> +				=C2=A0=C2=A0 st, &ltc4283_power1_good_input_fault_log);
> +}
> +
> +static bool ltc4283_writable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case LTC4283_SYSTEM_STATUS ... LTC4283_FAULT_STATUS:
> +		return false;
> +	case LTC4283_RESERVED_OC:
> +		return false;
> +	case LTC4283_RESERVED_86 ... LTC4283_RESERVED_8F:
> +		return false;
> +	case LTC4283_RESERVED_91 ... LTC4283_RESERVED_A1:
> +		return false;
> +	case LTC4283_RESERVED_A3:
> +		return false;
> +	case LTC4283_RESERVED_AC:
> +		return false;
> +	case LTC4283_POWER_PLAY_MSB ... LTC4283_POWER_PLAY_LSB:
> +		return false;
> +	case LTC4283_RESERVED_F1 ... LTC4283_RESERVED_FF:
> +		return false;
> +	default:
> +		return true;
> +	}
> +}
> +
> +static const struct regmap_config ltc4283_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D 0xff,
> +	.writeable_reg =3D ltc4283_writable_reg,
> +};
> +
> +static int ltc4283_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev, *hwmon;
> +	struct auxiliary_device *adev;
> +	struct ltc4283_hwmon *st;
> +	int ret;
> +
> +	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	st->map =3D devm_regmap_init_i2c(client, &ltc4283_regmap_config);
> +	if (IS_ERR(st->map))
> +		return dev_err_probe(dev, PTR_ERR(st->map),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to create regmap\n");
> +
> +	ret =3D ltc4283_setup(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_mutex_init(dev, &st->lock);
> +	if (ret)
> +		return ret;
> +
> +	hwmon =3D devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 &ltc4283_chip_info, NULL);
> +
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ltc4283_debugfs_init(st, client);
> +
> +	if (!st->gpio_mask)
> +		return 0;
> +
> +	adev =3D devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ltc4283_of_match[] =3D {
> +	{ .compatible =3D "adi,ltc4283" },
> +	{ }
> +};
> +
> +static const struct i2c_device_id ltc4283_i2c_id[] =3D {
> +	{ "ltc4283" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ltc4283_i2c_id);
> +
> +static struct i2c_driver ltc4283_driver =3D {
> +	.driver	=3D {
> +		.name =3D "ltc4283",
> +		.of_match_table =3D ltc4283_of_match,
> +	},
> +	.probe =3D ltc4283_probe,
> +	.id_table =3D ltc4283_i2c_id,
> +};
> +module_i2c_driver(ltc4283_driver);
> +
> +MODULE_AUTHOR("Nuno S=C3=A1 <nuno.sa@analog.com>");
> +MODULE_DESCRIPTION("LTC4283 How Swap Controller driver");
> +MODULE_LICENSE("GPL");

