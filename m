Return-Path: <linux-gpio+bounces-29619-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA3CC31FE
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 14:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C97A33031B14
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 13:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C1733D4E3;
	Tue, 16 Dec 2025 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQH7mhPy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE053BE54B
	for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 13:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765891006; cv=none; b=OW5gF4OUodWNj6g4eDCDM/1jSs8x1gY01OMh1RC3KEklh+8oRZ0t7hB54+8Ig2sFH68mNwVK6JSySi9q0QL7ii7uNDsXStanzMvax6Jkg+DGdkBKFKrDyA7Pf/l6lDn1JcicZ4xM+85HuLGt1vghnE9FP00snNgscOeaKcoWIb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765891006; c=relaxed/simple;
	bh=ie+AJbWUF5jtAMvd+Vk2sYgjyzBsY+yVmjQ8OwD7xm4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TgBVp0YEFcIXyylISseU6D3IXgyHjyhZxOrjbHRRNfT8P1MTcdpHsxmP8Jp9FFKCoqzJLqUGsHJViavtX70HhPxfS0ow29YyrDEBasQpaezeIc6L3xhDpCx+uA2VsSqc37e4JYMgjpATldvAGCH2HNQn60a2qjh5E8zYN1MYN4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQH7mhPy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so56583905e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 05:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765890997; x=1766495797; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9wEQyxMelFUxIKkKjwpqNdvXFJKNGJ/TVkTqrb2W9yo=;
        b=cQH7mhPyhODzTUmWb7AP/SnvcqSZ5JMfmdA4afCm/ROKeT3lGClRoS0+cl1yaZCpxx
         CTyXx0njdamGeS1tnUawkfAYin1ifKRgRi+7OynH0fS3CJpqBfmxzT+zo7Het1J15BWX
         ytsDp8nqbEU2UqE+iCN1wZvsgnYw+wlgircupK3NlZe1iBUmtmvgQu7dJAde8fXegKaP
         CoBv+u5RrgAwbho+dEApk4Z9wDzEeP61FYKMzfKud38xmco0HqXfVWsycu5+wkqt3gzu
         f2KLe+FPCjlU2ycNjJ47lWsDh95mrGJUgbqYKmKCQiCqV6JLP5HAv7Tm19TeH9dmUGw6
         CcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765890997; x=1766495797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wEQyxMelFUxIKkKjwpqNdvXFJKNGJ/TVkTqrb2W9yo=;
        b=wFHhfIsHuzxkVsDCw6FV12pWEF0YlDFRHtMzJDuRJ6y3VrJNsPTkZ0uWHZB8Jcy6RD
         AkZxWNPmi0bc+IXOxQTyDIMm0JlnCCm6FSxzq5iM15NK3r4r0rS910Bs5GLaTrV8RXq3
         R5vlxKFjN5zH4l+V0WpD27zWKKkc6h7c6xxYyV10sbsV8tfBG/FdCREdSOgMyzzXVZwE
         RdXRK5l5/zri+aBzEfPED4JFkW8i9bHVxEfIqly3ftO/xvli/yPIWgonu70nwG8wIMV8
         s/s5SdqZF8+XvYjOWqlRqnz2XAvYTWhaBHDQ8rxYOM9uimhAJiXQPfBTyYXmBC+GNhq+
         bOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnVid34px4TL4cxwuIv/i/AO3PwQWoHFZ3O4EYq8zwS+ZAlMUDAlefKnM9jZHxp/7oiFrJ5evG1cPQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0ufRl6LcCYRxhLcWHcYN9/ZZ4Lvuv1o7RTBQL8V34lyAAGwK
	TGmyGNL+8AcqhG3za6BSzllKf6IOfavuuyr8vtxcQ9oDRodnMlDr9oe8/Np1HA==
X-Gm-Gg: AY/fxX7PLLioBA9N6Qz99I52kNqAQVzRMZFK1MoJHWwnh+ZuA0lIz37ZSe7sCqYmPzp
	eHBhes0rvuS+P18aF3EW3oMNil1x5ftz2b/8i6QKBa+vvalNvJA++CZms2+C1Ok+aGHHvYqOr5a
	O3mQINN4YRbwx6l3w4kx7cLRvIeGBfDA1Xo2ky3mGUck0LRjrneafK7Nw31NjsYmpy4qIKb8fK/
	b0WdHmmPYqvLNoR7iqLWHOMx1SHfAil+y1Pn3OcE1fdI3vKZoObAdZRMEiV8ibwbXDlKSXkheZT
	n03HiYsHis80eS+0skJh/BdLRVIXhZIQnSpBkFwzBxAwRzU85Thd/Od/Z4pZ6am3Faa8FYDKH9r
	2ukS5o8TEXHJjDvQLytSaD8Cb2TI4ZCVUmHOzIkp8NzNLPAAX7kFoRNI6tlh3zKU4KxJ1c5WzKk
	kLDV8BnmYWt6aLSIniaok=
X-Google-Smtp-Source: AGHT+IFBWulMuxuU7oloQiW42dIOzblQOJkSMSYM3mkR4FEHTZuiqpMj0PdGHiwFPjZwBQ0pemM/Ww==
X-Received: by 2002:a05:600c:4f4a:b0:477:28c1:26ce with SMTP id 5b1f17b1804b1-47a8f8a717dmr161923995e9.7.1765890996571;
        Tue, 16 Dec 2025 05:16:36 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6e5baasm257873965e9.13.2025.12.16.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:16:36 -0800 (PST)
Message-ID: <50bea4bef338490cae92f61a8cc9a555db4529c2.camel@gmail.com>
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Date: Tue, 16 Dec 2025 13:17:17 +0000
In-Reply-To: <ca659699-e5f8-436f-bfdb-d0d250d34fca@roeck-us.net>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
	 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
	 <c9cb3a2b-da6b-42a6-87b0-7a2b780f5ad8@roeck-us.net>
	 <56a6c6a1b800090522a61eea5141aa8c986faea1.camel@gmail.com>
	 <ca659699-e5f8-436f-bfdb-d0d250d34fca@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-12-12 at 09:07 -0800, Guenter Roeck wrote:
> On 12/12/25 08:50, Nuno S=C3=A1 wrote:
> > On Thu, 2025-12-11 at 09:56 -0800, Guenter Roeck wrote:
> > > On 12/4/25 08:15, Nuno S=C3=A1 via B4 Relay wrote:
> > > > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > >=20
> > > > Support the LTC4283 How Swap Controller. The device features progra=
mmable
> > > > current limit with foldback and independently adjustable inrush cur=
rent to
> > > > optimize the MOSFET safe operating area (SOA). The SOA timer limits=
 MOSFET
> > > > temperature rise for reliable protection against overstresses.
> > > >=20
> > > > An I2C interface and onboard ADC allow monitoring of board current,
> > > > voltage, power, energy, and fault status.
> > > >=20
> > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > > ---
> > > ...
> > > > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > > > new file mode 100644
> > > > index 000000000000..d79432678b84
> > > > --- /dev/null
> > > > +++ b/drivers/hwmon/ltc4283.c
> > > ...
> > > > +
> > > > +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *s=
t,
> > > > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
> > > > +{
> > > > +	__be16 in;
> > > > +	int ret;
> > > > +
> > > > +	ret =3D regmap_bulk_read(st->map, reg, &in, sizeof(in));
> > >=20
> > > I had a look into the regmap code. In its current implementation,
> > > that will work as long as
> > > 1) regmap is configured to not cache anything
> > > 2) the I2C controller supports I2C_FUNC_SMBUS_I2C_BLOCK
> > >=20
> >=20
> > Possibly dumb question... what would be the issue about doing multiple
> > regmap reads if we can't do the bulk?=C2=A0That would be my naive appro=
ach in
> > the driver if I'm not going to use the bulk API.
> >=20
>=20
> You mean on the same address ? I don't have the chip to check, but I am q=
uite
> sure that it would return the 1st byte again.
>=20
> FWIW, in the lm92 driver I used a regmap_bus to solve pretty much the sam=
e
> problem.
>=20
>=20

Ok, I know understand the issue. We do have real word registers (though the=
 energy
spans 6 registers IIRC) in which case the regmap bulk fallback would fail. =
So I do
agree with you that relying on regmap implementation details is questionabl=
e so
I'll add my own bus.

But the above made me start thinking about how we should handle
i2c_check_functionality()? For this device, I2C_FUNC_SMBUS_WORD_DATA and
I2C_FUNC_SMBUS_BYTE_DATA (can we have word without byte??) are the minimum =
the
controller needs to support. So I could add the below:

if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA
				    | I2C_FUNC_SMBUS_WORD_DATA))
		return -ENODEV;

But can't we have I2C_FUNC_I2C (or even I2C_FUNC_SMBUS_I2C_BLOCK) without
supporting SMBUS?

I mean, I can so something similar to what's being done in regmap-i2c but m=
aybe
that's too much? I'm leaning in that direction though...


This made me wonder, again, about ltc4282 but in there word registers are i=
n
fact reg and reg + 1.

- Nuno S=C3=A1

