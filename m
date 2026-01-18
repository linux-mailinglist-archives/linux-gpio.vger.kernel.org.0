Return-Path: <linux-gpio+bounces-30694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E764D393E2
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 11:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE069301074A
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jan 2026 10:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE322DE6E6;
	Sun, 18 Jan 2026 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWXzVz4w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F827FB1F
	for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 10:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731103; cv=none; b=CxXyZ27UWshfbEoh6+TFLhNfjbq584+DBPJae6mlmv4HM08HpFu1pIciscwRYRNPrfvFiLmD5cUqRuYZZ3b3BfM8kjDBjVRsLL8ne2uBEXlFCdw4SCe0sPHmZT6wIOoEHAwMIunp52EHItPh0Z3WPlUGgbknwbXU1yEb/0PVqLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731103; c=relaxed/simple;
	bh=LvWRP8Kvnm4HcYbXM1gISUJO/wKhYPV7aq8AvbjshSY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R2t6nfW04DJV2pLC5a5tbXKTZPp7kkHfP6KweT8MKE8TLbKGwWFW7LIHbnVqAvPpN+mEiwCYiteqfxdDQv+VavnoxMj5WD8Rlog+va5z1U0uOq9uTb79WEPV2v0+imXz5uJlmejexz9ayo48FwgQAOotgYuwM+2cgRHdbx5XqJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWXzVz4w; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee974e230so27926405e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 02:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768731100; x=1769335900; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LvWRP8Kvnm4HcYbXM1gISUJO/wKhYPV7aq8AvbjshSY=;
        b=nWXzVz4w//cEpWYq8CWQj/iOOl8JdJfsdlWtmAlJ/4ZppLoCwFVfDaUWBbo33kvVlc
         8DawAMgM9oqQ7mrZl7+7SqY+6mnd0gxfyV4pb7FNFv7yLreBWRAi+Ta4d1+L60iRvEQN
         pF75Ft478NOJnCnxa+60DT4NZuGgiSIkYWpyjFBfRpHqRr/sbPCa1fhE9QcMufXo9Bhp
         w1WiSmucMUGR9AZCYB8a3da/73IcgKiE02u3bC0mUuqYqFLtS0IMLL7ThVQibJcPgAmf
         WMztp1S4n8mRj0D6O7h59Je3KEiigsCiL2kBaOeOzLDQSpyTqi+Prk8wxP27V5Dqb8er
         Lp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768731100; x=1769335900;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvWRP8Kvnm4HcYbXM1gISUJO/wKhYPV7aq8AvbjshSY=;
        b=lvbU6Vod7r/riSj3TwnBnzXaSOur9GQrOBF5IuKStXuE4vypjvwehQRVEnpYteUGJH
         7v4aWsWg7xIPfUnXvSPZ0N0VGxP+01ZGSIELUHXdWI9XR2rOTKl2YhvOMtVkoshyavAk
         +aCr0KRXQwekil3wSTQnD7ylvWGL/LTebqTxmQXyI4s1A0RSe1NIYonBfTkBEsBrQuKP
         HkYaw3M/qnPJ1/KRJhrJDA2SoV/gxM+aeevvRpDwYwWvA62ksHwikhKnufWIgkMNWTfM
         psqjiF9llZGpuiQYdUkcDwEQMvX3RCx1x3+1WYSy4IHkknXeP0t7JFa2VKgvd5MpNUWD
         jkYw==
X-Forwarded-Encrypted: i=1; AJvYcCXv27IyZkicEz5YVI/s4PS4wpSFXSQt2V3xAvic1u9cMHEsJ17GME1NHSejNzUiQQqsmC2A7/MdSUSg@vger.kernel.org
X-Gm-Message-State: AOJu0YyEq/1ANU5Uwu+8f0VzSx51pfv5FqBpdMC23Uaqaf5E8L18OWYZ
	S3FzK+FLuByOX12lsqR8sfJTIwzR56H5TXgxYR4KbkOgWE+m/Nh+23jF
X-Gm-Gg: AY/fxX6SiTsCLx9iR4L+wykcWVbmi3CSzRZURKuh66FVStX1X5mkkgIRIfTnFNA1M9+
	zMGeRV37eyIiQc5qXJBHNkSDJwWUT8hWCugGLR3o1Y7DenOBaSERBJAqeIRMGv7N2n5yw4GuYV9
	KX7G/KRhGkV2mKD0AW9u9z3rCl8ZIlUp4/9ZHb39fqNjgOq1G5iKOFR3mCDo3WapWQBaY9sN2Lg
	/tOaudgm3XSqqHxDKHV8LQ2ttRIbsT3NDIBugbg0g6qkbwh+Zi/w+GnMC4829fuGXFGNksukWkM
	44s+BkLiRT8AAeD9LjxZWtdVfnoUuqpnbeEvAFNeEdBHyGp8c1F8SzvmlJ4dYxRVqASc4CwA7HL
	EQS3f2HTMBSIY/Pk5fY9wrK2MtIWh5L4NfOLGmsbGF35PsRkKqGnFH6yiirShKHOuy7ihKqFLJH
	CiLGR5e/bSiLJipLV+JLByf1OvqBnd2Pm4q9f+zGfiihtTZUpCOxHFJ5lCIlgPl1XAaui1IA==
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4801e30d482mr95822395e9.13.1768731099475;
        Sun, 18 Jan 2026 02:11:39 -0800 (PST)
Received: from ?IPv6:2001:818:ea56:d000:94c4:fb0e:28f:2a8d? ([2001:818:ea56:d000:94c4:fb0e:28f:2a8d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992681esm16102416f8f.11.2026.01.18.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 02:11:39 -0800 (PST)
Message-ID: <91c052abe2f88be12ef9f557120d540373471d67.camel@gmail.com>
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
Date: Sun, 18 Jan 2026 10:12:43 +0000
In-Reply-To: <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <0ae2d448-06e3-41f6-89aa-8aa3f939d64f@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-01-17 at 16:27 -0800, Guenter Roeck wrote:
> Hi Nuno,
>=20
> On 12/23/25 04:21, Nuno S=C3=A1 via B4 Relay wrote:
> > This is v3 for the LTC4283 how swap controller. Main change is that I'm
> > now using the auxiliary bus for adding the GPIO device (done depending
> > on FW properties).
> >=20
> > Similar to the LTC4282 device, we're clearing some fault logs in the
> > reset_history attributes.
> >=20
> > Guenter, in [1] you can find some replies for some questions you had in
> > v2 that likely you don't remember anymore. Regarding the regmap story I
> > ended up adding a secong regmap for the 16 bit wide registers which
> > seems like a clean solution (if I'm not missing nothing).
> >=20
>=20
> Sorry for the long delay.
>=20
> Actually I prefer the solution used in the lm75 driver: Map all registers
> to 16-bit registers using a regmap bus. Would that be possible ?

I do like the current approach as we get the proper i2c functionality check=
s from
regmap and it actually maps the device register layout. But no strong feeli=
ng so
obvioulsy I'll try the lm75 way. However looking at code, something come to=
 mind.
Won't the below break on big endian machines (assuming big endian device)?

https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/hwmon/lm75.c#L594

Sunday morning for me so I might be missing something :). FWIW, if I'=E1=B8=
=BF right about
the above, then regmap i2c has the same issue (tough the issue seems to be =
on the i2c
API - at first glance).

Will also look at the below feedback.

Thanks!
- Nuno S=C3=A1

>=20
> Other than that, I ran the series through an AI review. This is what it t=
old me:
>=20
> =C2=A0=C2=A0 Identified Violations and Observations:
>=20
> =C2=A0=C2=A0=C2=A0 * Alphabetical Order of Includes: In drivers/hwmon/ltc=
4283.c, the include files
> are not strictly in alphabetical order.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * #include <linux/hwmon.h> is =
listed before #include <linux/hwmon-sysfs.h>.
>=20
> -> Actually, linux/hwmon-sysfs.h> does not have to be included in the fir=
st place.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * According to strict ASCII so=
rting (e.g., LC_ALL=3DC sort), hwmon-sysfs.h
> should come first because the hyphen - (ASCII 45) precedes the dot . (ASC=
II 46).
> =C2=A0=C2=A0=C2=A0 * Documentation Discrepancy: The file Documentation/hw=
mon/ltc4283.rst includes
> a section for "Addresses scanned" listing I2C addresses 0x10-0x17 and 0x2=
0-0x2E.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Inaccuracy: The driver does =
not implement a .detect function, meaning no
> I2C address scanning is actually performed.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Guideline Violation: The sub=
mitting-patches.rst guideline states that
> only specific I2C addresses (0x18-0x1f, 0x28-0x2f, etc.) shall be probed.=
 The
> addresses listed in the documentation (specifically 0x10-0x17) are outsid=
e of this
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 approved range. Wh=
ile the driver doesn't probe, the documentation
> misleadingly suggests it does so on non-approved addresses.
>=20
> -> Please fix.
>=20
> Thanks,
> Guenter
>=20
> > [1]:
> > https://lore.kernel.org/linux-hwmon/0765a0b89779331c62a3f136ef030f7f2f4=
0ea47.camel@gmail.com/
> > [2]:
> > https://lore.kernel.org/linux-iio/cover.1761588465.git.geert+renesas@gl=
ider.be/
> >=20
> > ---
> > Changes in v5:
> > - Patch 2:
> > =C2=A0=C2=A0 * Added a secong regmap for the 16bit wide registers;
> > =C2=A0=C2=A0 * Add default value for rsense so that we can probe withou=
t FW
> > =C2=A0=C2=A0=C2=A0=C2=A0 properties;
> > =C2=A0=C2=A0 * Make sure to give the right file permissions to the rese=
t_history
> > =C2=A0=C2=A0=C2=A0=C2=A0 attrs.
> > - Patch 3:
> > =C2=A0=C2=A0 * Make sure to get the right regmap (given that the device=
 now has 2);
> > =C2=A0=C2=A0 * Add error handling for getting the regmap.
> > - Link to v4:
> > https://lore.kernel.org/r/20251204-ltc4283-support-v4-0-db0197fd7984@an=
alog.com
> >=20
> > ---
> > Nuno S=C3=A1 (3):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: hwmon: Document the L=
TC4283 Swap Controller
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwmon: ltc4283: Add support for th=
e LTC4283 Swap Controller
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio: gpio-ltc4283: Add support fo=
r the LTC4283 Swap Controller
> >=20
> > =C2=A0 .../devicetree/bindings/hwmon/adi,ltc4283.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 272 +++
> > =C2=A0 Documentation/hwmon/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 Documentation/hwmon/ltc4283.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 266 +++
> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 9 +
> > =C2=A0 drivers/gpio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 15 +
> > =C2=A0 drivers/gpio/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0 1 +
> > =C2=A0 drivers/gpio/gpio-ltc4283.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 218 +++
> > =C2=A0 drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 12 =
+
> > =C2=A0 drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/hwmon/ltc4283.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1766 +++++++++++++++++++=
+
> > =C2=A0 10 files changed, 2561 insertions(+)
> > ---
> > base-commit: bc04acf4aeca588496124a6cf54bfce3db327039
> > change-id: 20250812-ltc4283-support-27c8c4e69c6b
> > --
> >=20
> > Thanks!
> > - Nuno S=C3=A1
> >=20
> >=20
> >=20

