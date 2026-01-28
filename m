Return-Path: <linux-gpio+bounces-31253-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULHxAqRRemnk5AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31253-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 19:12:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC5A792C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 19:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF81D30225BB
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 18:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8536E37473B;
	Wed, 28 Jan 2026 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4aosgMO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF8F374732
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623605; cv=none; b=r0UMTQwfHkqjyzFNvbE1Cj58EvErsrS+4M553HurJsUuTtuvnQjk2Ej7tUpFGiZiH03jSp0J3u0+gpCYMgebousaqONu1UdXg9SCrdsQ7awKmbfgMug/d0plfjJeKvwgApTXTLKEI5nzaOkvFzFmZSUsKhUS6y/7Z7vlXs16wRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623605; c=relaxed/simple;
	bh=8wTbKFDxZbZCQ1Q7yTsRV4W/LC5P/5on3cRlcOF4pOA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Suebm1KZShy3RsFB88zUGvoB3KVxbMRB2vHebY8MSab1nI4vI8IwMhOQKK7E1aAOI9T2yNEvyH+/Z1JDQSQvGBTij51sWzipRra2GqbglTqQdhnQC96Zs1Hchz8B/D6y1OXEi3+BT9Qpf2xqqdAI3N4WYYUQJTLtjXJAiXttzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4aosgMO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-432755545fcso119744f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 10:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769623602; x=1770228402; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bv3Ru//yBMPMzCGxGlXC/tIcSHnEGcKaRRDL4KweM6Y=;
        b=X4aosgMOpCId7mxCyyIUchG1tEuXzQpw4a3QLA+6VElOqpuclOFzwvIgT4YsHLRTrl
         TwuJct3SkVHpVjAPgEe8AuB+pVUJUqpCVS8izcyozuXHNN2Yw5u+tepoVBMYOOYNGhVe
         2+R2xOCQ0hmiBCIsxeY0AW+IhOljZ8P47icwjgngB2XhhNMVzSDl24+uh50j1xrMeI5W
         3mSpFFtV/mL3uKV4Ed5CvA/cVSJ5NiZlEBRsG0MzXwuvRUwV0tAAN820NgApt7P5uEYB
         FpluslxaGxykQwmgPU5jvdNcGo5jzCt4d9Tk3MkI/XriiE5R5/aPxjCAMm/mnWx5OhxZ
         x8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769623602; x=1770228402;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bv3Ru//yBMPMzCGxGlXC/tIcSHnEGcKaRRDL4KweM6Y=;
        b=Vxad9kzg0QK5pbXHPvJqTGBZFEA5RbubvxmNRXwvZG4bUm49Led/t57XgHlalUd8WF
         rxw6rwlePEpZ4SYBSSXSC/tsSV9DnFLVYT9yC0ThCGecKHZ+ij/THG8Q+DmiMba7AGX1
         qQrG0eaEgHM9qJ223lpu1tP2b3zHxQiY8xa8eA+3wz7NtA5EHlW9egbEbEEROQ7Rk2X+
         iHhgu208RT8gp/4K5dcjN6hzHjUKIAWuL0aPDmWIwqpV4IIDmHoha66ppFptap17v9br
         RTNV4luUu1Q6Sm8l36AkRwjgqMCX1wbTpDlHtKhWiCIkS8dTdLOTYL1QpKSz/RIhaKgZ
         B7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCX+EKIWDAUYRBuJISjKSsDN3CTe+QYppbdUgnEiP3XTfOeGkd6WX4TVU0CjXYCRdGKQ+0mZw+lkzAMd@vger.kernel.org
X-Gm-Message-State: AOJu0YyPE+UaqHKkCrtKwqZMqo09ezRVH09hAQfHHcU0AKBDbILD+KU3
	/DYtSh2vWdRdemRl15uk+D7XKjLX/d4cuj1QoOgTdGJDFYrcdKXL9Byn
X-Gm-Gg: AZuq6aJVfvFmy3b8KqrrvU9jK2KpK6cTxFSiz9g6LtEUyqSuRqd1nVPQoQpkgctDsPU
	G5T8SKZ+fJ7va0zb06knc8Nt5hJAUSLvEGV8Oyklt/8NZorDBSMIakz2SOF/VIgFUWYfk6elCQn
	3O2O1gI8BX3kxR7VzlmvMwwdJB2UZGR1Vkmkn9B96g+3h+hUOPuZlxcTMplYMpLqsjdnDWe6Bm2
	nwbvyI9y9BPAWy0H71gOUZ3W8HXNyHanhGOUJF4AeAbxXT0TWVAfju8ry1+HL7GJwF00upYZgku
	i+GsaSsLwu5lruDsj+3x64jgke7uzM9NKntUh2FbupGymy0Y9iTmT++QnvSqRp8oMtKCw3TXrmz
	pmVz1T5osthaNUdQM3Iez2nnYqNd4I32YONQ867sm/tF/Dq8ASGP5SBgJaw3rakNaUkvg7RyFFm
	2PDMbmsA4jJMbMzGyN6Y0kBAXdByfaHg==
X-Received: by 2002:a05:6000:2001:b0:435:9f41:d54 with SMTP id ffacd0b85a97d-435dd1d8e78mr8748442f8f.60.1769623601691;
        Wed, 28 Jan 2026 10:06:41 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm9024567f8f.33.2026.01.28.10.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:06:41 -0800 (PST)
Message-ID: <e5b775065b92cada730f42a3d60546700ec46db9.camel@gmail.com>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>, Linus
 Walleij	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Jan 2026 18:07:24 +0000
In-Reply-To: <02b7cf63-4f87-4cdd-8d9e-53a7d0e808a6@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
	 <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
	 <8efa188b-8b91-479c-ac10-3fba5b0cbb5f@roeck-us.net>
	 <02b7cf63-4f87-4cdd-8d9e-53a7d0e808a6@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31253-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CACC5A792C
X-Rspamd-Action: no action

On Wed, 2026-01-28 at 08:55 -0800, Guenter Roeck wrote:
> On Wed, Jan 28, 2026 at 02:04:35AM -0800, Guenter Roeck wrote:
> > On 1/28/26 01:44, Nuno S=C3=A1 wrote:
> > > Hi Guenter,
> > >=20
> > > On Tue, 2026-01-27 at 09:39 -0800, Guenter Roeck wrote:
> > > > Hi Nuno,
> > > >=20
> > > > On 12/23/25 04:21, Nuno S=C3=A1 via B4 Relay wrote:
> > > > > This is v3 for the LTC4283 how swap controller. Main change is th=
at I'm
> > > > > now using the auxiliary bus for adding the GPIO device (done depe=
nding
> > > > > on FW properties).
> > > > >=20
> > > > > Similar to the LTC4282 device, we're clearing some fault logs in =
the
> > > > > reset_history attributes.
> > > > >=20
> > > >=20
> > > > I ran the patch series through an AI review. Results are below.
> > > > Please take a look.
> > > >=20
>=20
> Another run through AI below. Please let me know if there are further ina=
ccuracies.
>=20
> Thanks,
> Guenter
>=20
> ---
> commit 82433332ce165903d56fae327ced975aeef30475
> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> hwmon: ltc4283: Add support for the LTC4283 Swap Controller
>=20
> Adds support for the LTC4283 Hot Swap Controller I2C interface.
>=20
> > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > new file mode 100644
> > index 000000000000..402b53f81548
> > --- /dev/null
> > +++ b/drivers/hwmon/ltc4283.c
>=20
> [ ... ]
>=20
> > +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0 u32 reg, long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MI=
LLI;
> > +	unsigned int __raw;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map_word, reg, &__raw);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Power is given by:
> > +	 *=C2=A0=C2=A0=C2=A0=C2=A0 P =3D CODE(16b) * 32.768mV * 2.048V / (2^1=
6 * Rsense)
> > +	 */
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * st->rsen=
se);
>=20
> Does this overflow *val on 32-bit systems if the calculated power exceeds
> 2000 Watts (approx 2^31 microWatts)?=C2=A0 The intermediate calculation i=
s
> u64, but the result is assigned to a signed long.
>=20

I'll have to double check this one but IIRC 2000W is not a realistic value =
for
these applications. One thing that could overflow is power_max given that t=
he default
register value is 0xff but we do write the proper max value depending on
rsense (I actually need to check how will this behave in case we use a defa=
ult
rsense value - ie with no DT property).

> [ ... ]
>=20
> > +static bool ltc4283_word_reg(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case LTC4283_SENSE ... LTC4283_ADIO34_MAX:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > +}
>=20
> LTC4283_SENSE is 0x41 and LTC4283_ADIO34_MAX is 0x40.=C2=A0 Does this inv=
alid
> range (start > end) effectively disable access to the word registers
> via st->map_word?

The above is odd ad I'm pretty sure I ran sensors on this but could be some=
 late edit
mistake. Anyways irrelevant for the next version as you prefer the custom b=
us regmap
approach.

>=20
> > +static const struct regmap_config ltc4283_word_regmap_config =3D {
> > +	.name =3D "ltc4283-16",
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 16,
> > +	.max_register =3D LTC4283_ADIO34_MAX,
> > +	.val_format_endian =3D REGMAP_ENDIAN_BIG,
> > +	.writeable_reg =3D ltc4283_word_reg,
> > +	.readable_reg =3D ltc4283_word_reg,
> > +};
>=20
> Does max_register =3D 0x40 prevent access to the sensor value registers
> (LTC4283_SENSE at 0x41 and above) which are intended to be read as
> words?

ditto

>=20
> commit 5998c620fbd8915340a4b92635c9489a91fae567
> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
>=20
> Adds GPIO support for the LTC4283.
>=20
> > diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> > new file mode 100644
> > index 000000000000..fa0c106d4fac
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-ltc4283.c
>=20
> [ ... ]
>=20
> > +#define LTC4283_PINS_MAX			8
> > +#define LTC4283_PGIOX_START_NR			4
> > +#define LTC4283_INPUT_STATUS			0x02
> > +#define LTC4283_PGIO_CONFIG			0x10
> > +#define=C2=A0=C2=A0 LTC4283_PGIO_CFG_MASK(pin)=20
> > +	GENMASK(((pin) - LTC4283_PGIOX_START_NR) * 2 + 1, (((pin) - LTC4283_P=
GIOX_START_NR) *
> > 2))
> > +#define LTC4283_PGIO_CONFIG_2			0x11
> > +
> > +#define LTC42823_ADIO_CONFIG			0x12
>=20
> This isn't a bug, but should this be LTC4283_ADIO_CONFIG instead of
> LTC42823?

Indeed!

- Nuno S=C3=A1
		2

