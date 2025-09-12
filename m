Return-Path: <linux-gpio+bounces-26054-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A071B5502E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20902582615
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC2C30DEC5;
	Fri, 12 Sep 2025 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCkAPhH1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CD130E857
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 14:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757685606; cv=none; b=QPY1A9aQcoDIag0B3/HTXX38Qna2WqwMNVQWf6Lo38zJWgXyY9xlbi+xbBzdkEyY3oCm4BGWcEiR3hnmXt391peF2rSmj9mZcds4VxBGm8NrRQMzO4yOmdajsWnh/5XjBhnuVfYjtl/HlShQOG3wJF5Lllcgoo8KCFlh+1SozqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757685606; c=relaxed/simple;
	bh=qStA8A9t1k0uYnXzX5SqSdSktpL0/bU9UepEjHhF0mk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pyh8ol+jHogMs7f90ogSbBc3MezZnVnE07IeZYdhBmEHKYrAITRYECK3rlu+/tyl+oY/RR38vTDoC0mj4l7NlCGlTXgKLUVSRclgqoIriTw62HzF+UO4/qKTAjum95/22j+eOdkadLjsNn1YyBIFt3PtLhBTYyAWYlq/RTx+hUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCkAPhH1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so302318466b.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757685600; x=1758290400; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jjvRbUkC84e6kHJdBBexAwYms1qD2hwBK4q8w7gIjqQ=;
        b=iCkAPhH1yZ1eMwuPEvfOUEnkzRlJzx/vr250k3UCHStVj0teG1r0YmQAwUorjcvdHL
         gsyqsI+5/job7OlAxRn/AgAI0qCrYurDajnDKdc0wwJx6PLiFMqf/pJ7/35OGseTP5v+
         bQqRj4gfbfV4d70zrkHmBRly09QL3zRJA6Fd62GQNqew6wo4N0ea0X5atB8B3SYLC52r
         1bHbOs2f4ZykHyrxpuVw1t5ox0VSfxzeVVXXOttA9v/xSnYxVBOUXEGwp8aSfCt8zeSf
         khGAAGdzRbms1LLLWDwDjRKdd0B3N2O8yuJ363JGt7n94tRbod6I/x1/chknwCQtYpD1
         d4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757685600; x=1758290400;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjvRbUkC84e6kHJdBBexAwYms1qD2hwBK4q8w7gIjqQ=;
        b=AHg2UL2o/378eOiEULUppZlc6zLgfqvqOU1Lyj9d893muyjykKgG6Wi4N+mSsleuRw
         VOd6O5b1zWf7YYsJ5GwR60q/XgrZXesJ2xeylewVsPBWVVngsrlKEUKjm6LdByy9w86S
         MLzB9FEJ0EC+T0kCccNQ4inJG+pPdDclxlEGRT5yogmFNzC//ZFZSpnvgv4Z33neydj/
         CNEqVoisFqqpzEsigMhYFfnG4u9EsCz6vYwt5w8ttyqkxl2gA+GTWZb5Rb6finlJnrFv
         TTxFmkLdUc7DmaXI9fwUHhOYG//FjRE+uoShdPs0zl9i++x1QL/F4UOplJQQpWRKj8YS
         iSfA==
X-Forwarded-Encrypted: i=1; AJvYcCUGMW5sDLRaKmDU2qOfgwOUq58crigbq2WJ/u6W9efJuuAjrRu7PUPB5SPX7BYfbKMpkmDRTZPk9m1r@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqHPnI98ipdL+ULUuvCd58zID543wvZ8lkYdiyRRbqNQdQuK0
	GlpTCZXHFyXcGBl0AwaNSj2F9YwIDUTwKaH4zLAdpPMjOfkWVU7QSk9f
X-Gm-Gg: ASbGnctW4QcLUgGoTRjwwpKTFYHAu389I040JYU0KTeLka09ubzY4dPHHK//qHdil2F
	7gf/788UXsxiyYSswVAzsXkHOsQDR6vOHTLzVX5tu81w3iBGbDryb/ehqr1v4+VhGVfiOQPM8xH
	O7S64HynolQttVsMYLSuFOYOB+hEEDWmGfQPe1mMlNaQb0JYgAbHKWErK8saEKFrrE89tTwr61N
	lJ5AGtuZbpSBKRdGU1sSi2Nd5cykVxT524GWOHuQaiKYoAEAeoxAxXZfxjkPB7PeExQJLXSwSal
	mUAcg6+rirM7K6B9nXuBTqbgQMC5H27PKOO/Sphoe5g8RAT50zDObKDtQZAc/BuZ+IRqOatlMfc
	Ap71uUWCn632TtCO9/nVI5g==
X-Google-Smtp-Source: AGHT+IE71nOczlha04OPI6Cb12sfRoZP2Sq3hG00e3e4WHPJ90LZOQOFdFrHi0/0gvNpn8QVLjQuXg==
X-Received: by 2002:a17:907:2d91:b0:b04:2252:7cb1 with SMTP id a640c23a62f3a-b07c353f091mr323202566b.12.1757685598863;
        Fri, 12 Sep 2025 06:59:58 -0700 (PDT)
Received: from [10.5.0.2] ([185.128.9.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32f2122sm377728266b.85.2025.09.12.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 06:59:58 -0700 (PDT)
Message-ID: <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Date: Fri, 12 Sep 2025 15:00:22 +0100
In-Reply-To: <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
	 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
	 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-09-05 at 18:24 -0700, Guenter Roeck wrote:
> On 9/3/25 03:05, Nuno S=C3=A1 via B4 Relay wrote:
> > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> >=20
> > Support the LTC4283 How Swap Controller. The device features programmab=
le
> > current limit with foldback and independently adjustable inrush current=
 to
> > optimize the MOSFET safe operating area (SOA). The SOA timer limits MOS=
FET
> > temperature rise for reliable protection against overstresses.
> >=20
> > An I2C interface and onboard ADC allow monitoring of board current,
> > voltage, power, energy, and fault status.
> >=20
>=20
> Some initial feedback. I'll have to spend much more time on this.
> The calculations are not easy to understand.
>=20

Thanks for it!

> Also, please send me a register map (generated with i2cdump).
> I'll want to run unit test code to ensure that there are no obvious
> problems with the code.
>=20

Here it goes.

i2cdump -y 1 0x15 -r 0x00-0x40

No size specified (using byte-data access)
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
00: b9 90 d0 20 00 00 00 00 00 00 93 03 00 ac d8 00    ??? ......??.??.
10: 00 04 f0 ff 0f 00 00 00 00 00 00 00 ff 00 ff 00    .??.?...........
20: ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00    ................
30: ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00    ................
40: ff=20

i2cdump -y -r 0x41-0x79 1 0x15 w
     0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
40:      b004 0000 b00c a03e a03e a03e 2501
48: 0000 1a03 e07f e07f f07f e07f e07f e07f
50: e07f e07f e07f e07f e07f e07f 0000 0000
58: 0000 7002 7002 7002 b07e b07e b07e a030
60: 9030 a030 0000 0000 802f 1000 1000 f0ff
68: a004 a004 0014 a004 a004 c004 0000 0000
70: 0000 0000 0000 0000 0000 0000 0000 0000
78: 0000 0000

i2cdump -y -r 0x7a-0xff 1 0x15
No size specified (using byte-data access)
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f    0123456789abcdef
70:                               00 00 ac 8c 59 e2              ..??Y?
80: 00 00 96 7f 00 00 00 00 00 00 00 00 00 00 00 00    ..??............
90: 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................
a0: 00 00 00 00 00 00 00 00 00 00 93 03 00 ac d8 00    ..........??.??.
b0: 00 04 f0 ff 0f 00 00 00 00 00 00 00 ff 00 ff 00    .??.?...........
c0: ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00    ................
d0: ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00 ff 00    ................
e0: ff 00 00 00 00 00 00 00 70 00 00 00 00 00 00 00    ........p.......
f0: 00 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff    ................

                          =20
I hope the above is correct. I had to break it like this because of the wor=
d
sized registers. Not sure if there is a better way of doing it.=20

> Thanks,
> Guenter
>=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > ---
> > =C2=A0 Documentation/hwmon/ltc4283.rst |=C2=A0 266 ++++++
>=20
> Add to index.
>=20
> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 12 +
> > =C2=A0 drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0 drivers/hwmon/ltc4283.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1748
> > +++++++++++++++++++++++++++++++++++++++
> > =C2=A0 5 files changed, 2028 insertions(+)
> >=20
> > diff --git a/Documentation/hwmon/ltc4283.rst
> > b/Documentation/hwmon/ltc4283.rst
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..0a8d72904122660360a33150d5046=
fe493
> > b1c3d8
> > --- /dev/null
> > +++ b/Documentation/hwmon/ltc4283.rst
> > @@ -0,0 +1,266 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +Kernel drivers ltc4283
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chips:
> > +
> > +=C2=A0 * Analog Devices LTC4283
> > +
> > +=C2=A0=C2=A0=C2=A0 Prefix: 'ltc4283'
> > +
> > +=C2=A0=C2=A0=C2=A0 Addresses scanned: - I2C 0x10 - 0x17 (7-bit)
> > +=C2=A0=C2=A0=C2=A0 Addresses scanned: - I2C 0x20 - 0x2E (8-bit)
> > +
> > +=C2=A0=C2=A0=C2=A0 Datasheet:
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ltc=
4283.pdf
> > +
> > +Author: Nuno S=C3=A1 <nuno.sa@analog.com>
> > +
> > +Description
> > +___________
> > +
> > +The LTC4283 negative voltage hot swap controller drives an external N-
> > channel
> > +MOSFET to allow a board to be safely inserted and removed from a live
> > backplane.
> > +The device features programmable current limit with foldback and
> > independently
> > +adjustable inrush current to optimize the MOSFET safe operating area (=
SOA).
> > The
> > +SOA timer limits MOSFET temperature rise for reliable protection again=
st
> > +overstresses. An I2C interface and onboard gear-shift ADC allow monito=
ring
> > of
> > +board current, voltage, power, energy, and fault status.=C2=A0 Additio=
nal
> > features
> > +respond to input UV/OV, interrupt the host when a fault has occurred,
> > notify
> > +when output power is good, detect insertion of a board, turn off the M=
OSFET
> > +if an external supply monitor fails to indicate power good within a ti=
meout
> > +period, and auto-reboot after a programmable delay following a host
> > commanded
> > +turn-off.
> > +
> > +Sysfs entries
> > +_____________
> > +
> > +The following attributes are supported. Limits are read-write and all =
the
> > other
> > +attributes are read-only. Note that the VADIOx channels might not be
> > available
> > +if the ADIO pins are used as GPIOs (naturally also affects the respect=
ive
> > +differential channels).
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +in0_lcrit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Critic=
al Undervoltage alarm
> > +in0_crit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 C=
ritical Overvoltage alarm
> > +in0_label		Channel label (VIN)
> > +
> > +in1_input		Output voltage (mV).
> > +in1_min			Undervoltage threshold
> > +in1_max			Overvoltage threshold
> > +in1_lowest		Lowest measured voltage
> > +in1_highest		Highest measured voltage
> > +in1_reset_history	Write 1 to reset history.
> > +in1_min_alarm		Undervoltage alarm
> > +in1_max_alarm		Overvoltage alarm
> > +in1_label		Channel label (VPWR)
> > +
> > +in2_input		Output voltage (mV).
> > +in2_min			Undervoltage threshold
> > +in2_max			Overvoltage threshold
> > +in2_lowest		Lowest measured voltage
> > +in2_highest		Highest measured voltage
> > +in2_reset_history	Write 1 to reset history.
> > +in2_min_alarm		Undervoltage alarm
> > +in2_max_alarm		Overvoltage alarm
> > +in2_enable		Enable/Disable monitoring.
> > +in2_label		Channel label (VADI1)
> > +
> > +in3_input		Output voltage (mV).
> > +in3_min			Undervoltage threshold
> > +in3_max			Overvoltage threshold
> > +in3_lowest		Lowest measured voltage
> > +in3_highest		Highest measured voltage
> > +in3_reset_history	Write 1 to reset history.
> > +in3_min_alarm		Undervoltage alarm
> > +in3_max_alarm		Overvoltage alarm
> > +in3_enable		Enable/Disable monitoring.
> > +in3_label		Channel label (VADI2)
> > +
> > +in4_input		Output voltage (mV).
> > +in4_min			Undervoltage threshold
> > +in4_max			Overvoltage threshold
> > +in4_lowest		Lowest measured voltage
> > +in4_highest		Highest measured voltage
> > +in4_reset_history	Write 1 to reset history.
> > +in4_min_alarm		Undervoltage alarm
> > +in4_max_alarm		Overvoltage alarm
> > +in4_enable		Enable/Disable monitoring.
> > +in4_label		Channel label (VADI3)
> > +
> > +in5_input		Output voltage (mV).
> > +in5_min			Undervoltage threshold
> > +in5_max			Overvoltage threshold
> > +in5_lowest		Lowest measured voltage
> > +in5_highest		Highest measured voltage
> > +in5_reset_history	Write 1 to reset history.
> > +in5_min_alarm		Undervoltage alarm
> > +in5_max_alarm		Overvoltage alarm
> > +in5_enable		Enable/Disable monitoring.
> > +in5_label		Channel label (VADI4)
> > +
> > +in6_input		Output voltage (mV).
> > +in6_min			Undervoltage threshold
> > +in6_max			Overvoltage threshold
> > +in6_lowest		Lowest measured voltage
> > +in6_highest		Highest measured voltage
> > +in6_reset_history	Write 1 to reset history.
> > +in6_min_alarm		Undervoltage alarm
> > +in6_max_alarm		Overvoltage alarm
> > +in6_enable		Enable/Disable monitoring.
> > +in6_label		Channel label (VADIO1)
> > +
> > +in7_input		Output voltage (mV).
> > +in7_min			Undervoltage threshold
> > +in7_max			Overvoltage threshold
> > +in7_lowest		Lowest measured voltage
> > +in7_highest		Highest measured voltage
> > +in7_reset_history	Write 1 to reset history.
> > +in7_min_alarm		Undervoltage alarm
> > +in7_max_alarm		Overvoltage alarm
> > +in7_enable		Enable/Disable monitoring.
> > +in7_label		Channel label (VADIO2)
> > +
> > +in8_input		Output voltage (mV).
> > +in8_min			Undervoltage threshold
> > +in8_max			Overvoltage threshold
> > +in8_lowest		Lowest measured voltage
> > +in8_highest		Highest measured voltage
> > +in8_reset_history	Write 1 to reset history.
> > +in8_min_alarm		Undervoltage alarm
> > +in8_max_alarm		Overvoltage alarm
> > +in8_enable		Enable/Disable monitoring.
> > +in8_label		Channel label (VADIO3)
> > +
> > +in9_input		Output voltage (mV).
> > +in9_min			Undervoltage threshold
> > +in9_max			Overvoltage threshold
> > +in9_lowest		Lowest measured voltage
> > +in9_highest		Highest measured voltage
> > +in9_reset_history	Write 1 to reset history.
> > +in9_min_alarm		Undervoltage alarm
> > +in9_max_alarm		Overvoltage alarm
> > +in9_enable		Enable/Disable monitoring.
> > +in9_label		Channel label (VADIO4)
> > +
> > +in10_input		Output voltage (mV).
> > +in10_min		Undervoltage threshold
> > +in10_max		Overvoltage threshold
> > +in10_lowest		Lowest measured voltage
> > +in10_highest		Highest measured voltage
> > +in10_reset_history	Write 1 to reset history.
> > +in10_min_alarm		Undervoltage alarm
> > +in10_max_alarm		Overvoltage alarm
> > +in10_enable		Enable/Disable monitoring.
> > +in10_label		Channel label (DRNS)
> > +
> > +in11_input		Output voltage (mV).
> > +in11_min		Undervoltage threshold
> > +in11_max		Overvoltage threshold
> > +in11_lowest		Lowest measured voltage
> > +in11_highest		Highest measured voltage
> > +in11_reset_history	Write 1 to reset history.
> > +			Also clears fet bad and short fault logs.
> > +in11_min_alarm		Undervoltage alarm
> > +in11_max_alarm		Overvoltage alarm
> > +in11_enable		Enable/Disable monitoring
> > +in11_fault		Failure in the MOSFET. Either bad or shorted FET.
> > +in11_label		Channel label (DRAIN)
> > +
> > +in12_input		Output voltage (mV).
> > +in12_min		Undervoltage threshold
> > +in12_max		Overvoltage threshold
> > +in12_lowest		Lowest measured voltage
> > +in12_highest		Highest measured voltage
> > +in12_reset_history	Write 1 to reset history.
> > +in12_min_alarm		Undervoltage alarm
> > +in12_max_alarm		Overvoltage alarm
> > +in12_enable		Enable/Disable monitoring.
> > +in12_label		Channel label (ADIN2-ADIN1)
> > +
> > +in13_input		Output voltage (mV).
> > +in13_min		Undervoltage threshold
> > +in13_max		Overvoltage threshold
> > +in13_lowest		Lowest measured voltage
> > +in13_highest		Highest measured voltage
> > +in13_reset_history	Write 1 to reset history.
> > +in13_min_alarm		Undervoltage alarm
> > +in13_max_alarm		Overvoltage alarm
> > +in13_enable		Enable/Disable monitoring.
> > +in13_label		Channel label (ADIN4-ADIN3)
> > +
> > +in14_input		Output voltage (mV).
> > +in14_min		Undervoltage threshold
> > +in14_max		Overvoltage threshold
> > +in14_lowest		Lowest measured voltage
> > +in14_highest		Highest measured voltage
> > +in14_reset_history	Write 1 to reset history.
> > +in14_min_alarm		Undervoltage alarm
> > +in14_max_alarm		Overvoltage alarm
> > +in14_enable		Enable/Disable monitoring.
> > +in14_label		Channel label (ADIO2-ADIO1)
> > +
> > +in15_input		Output voltage (mV).
> > +in15_min		Undervoltage threshold
> > +in15_max		Overvoltage threshold
> > +in15_lowest		Lowest measured voltage
> > +in15_highest		Highest measured voltage
> > +in15_reset_history	Write 1 to reset history.
> > +in15_min_alarm		Undervoltage alarm
> > +in15_max_alarm		Overvoltage alarm
> > +in15_enable		Enable/Disable monitoring.
> > +in15_label		Channel label (ADIO4-ADIO3)
> > +
> > +curr1_input		Sense current (mA)
> > +curr1_min		Undercurrent threshold
> > +curr1_max		Overcurrent threshold
> > +curr1_lowest		Lowest measured current
> > +curr1_highest		Highest measured current
> > +curr1_reset_history	Write 1 to reset curr1 history.
> > +			Also clears overcurrent fault logs.
> > +curr1_min_alarm		Undercurrent alarm
> > +curr1_max_alarm		Overcurrent alarm
> > +curr1_crit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Critical Ov=
ercurrent alarm
> > +curr1_label		Channel label (ISENSE)
> > +
> > +power1_input		Power (in uW)
> > +power1_min		Low power threshold
> > +power1_max		High power threshold
> > +power1_input_lowest	Historical minimum power use
> > +power1_input_highest	Historical maximum power use
> > +power1_reset_history	Write 1 to reset power1 history.
> > +			Also clears power fault logs.
> > +power1_min_alarm	Low power alarm
> > +power1_max_alarm	High power alarm
> > +power1_label		Channel label (Power)
> > +
> > +energy1_input		Measured energy over time (in microJoule)
> > +energy1_enable		Enable/Disable Energy accumulation
> > +
> > +DebugFs entries
> > +_______________
> > +
> > +The chip also has a fault log register where failures can be logged. H=
ence,
> > +as these are logging events, we give access to them in debugfs. Note t=
hat
> > +even if some failure is detected in these logs, it does necessarily me=
an
> > +that the failure is still present. As mentioned in the proper Sysfs
> > entries,
> > +these logs can be cleared by writing in the proper reset_history attri=
bute.
> > +
> > +.. warning:: The debugfs interface is subject to change without notice
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 and is only available when the kernel is compiled with
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ``CONFIG_DEBUG_FS`` defined.
> > +
> > +``/sys/kernel/debug/i2c/i2c-[X]/[X]-addr/``
> > +contains the following attributes:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D=3D=3D=3D
> > +power1_failed_fault_log		Set to 1 by a power1 fault
> > occurring.
> > +power1_good_input_fault_log	Set to 1 by a power1 good input fault
> > occurring at PGIO3.
> > +in11_fet_short_fault_log	Set to 1 when a FET-short fault occurs.
> > +in11_fet_bad_fault_log		Set to 1 when a FET-BAD fault occurs.
> > +in0_lcrit_fault_log		Set to 1 by a VIN undervoltage fault
> > occurring.
> > +in0_crit_fault_log		Set to 1 by a VIN overvoltage fault
> > occurring.
> > +curr1_crit_fault_log		Set to 1 by an overcurrent fault occurring.
>=20
> We do have crit and lcrit alarms as standard attributes. Your call,
> but I would suggest to use them.

I do use them in the standard attributes (reading status registers). The ab=
ove
are in debugsfs and are fault logs (reading fault log registers) that have =
to be
manually cleared. To clear them I'm using the same mechanism we discussed f=
or
ltc4282 which means using the reset_history attributes. And I now realize I
probably need reset_history for in0.

I kind of use the same names in debugfs (with fault_log suffix) so it relat=
es to the channel where the fault applies.

>=20
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=C2=A0	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index
> > 23a337246b99060161c620388c73829d9b98729d..10f7869bc8d91a093d841b9e42295=
66b08
> > f0eec0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14505,6 +14505,7 @@ M:	Nuno S=C3=A1 <nuno.sa@analog.com>
> > =C2=A0 L:	linux-hwmon@vger.kernel.org
> > =C2=A0 S:	Supported
> > =C2=A0 F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> > +F:	drivers/hwmon/ltc4283.c
> > =C2=A0=20
> > =C2=A0 LTC4286 HARDWARE MONITOR DRIVER
> > =C2=A0 M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index
> > 9d28fcf7cd2a6f9e2f54694a717bd85ff4047b46..948b2555dd3331fbb258e39b20913=
fad1f
> > 09da3b 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1157,6 +1157,18 @@ config SENSORS_LTC4282
> > =C2=A0=C2=A0	=C2=A0 This driver can also be built as a module. If so, t=
he module will
> > =C2=A0=C2=A0	=C2=A0 be called ltc4282.
> > =C2=A0=20
> > +config SENSORS_LTC4283
> > +	tristate "Analog Devices LTC4283"
> > +	depends on I2C
> > +	select REGMAP_I2C
> > +	select AUXILIARY_BUS
> > +	help
> > +	=C2=A0 If you say yes here you get support for Analog Devices LTC4283
> > +	=C2=A0 Negative Voltage Hot Swap Controller I2C interface.
> > +
> > +	=C2=A0 This driver can also be built as a module. If so, the module w=
ill
> > +	=C2=A0 be called ltc4283.
> > +
> > =C2=A0 config SENSORS_LTQ_CPUTEMP
> > =C2=A0=C2=A0	bool "Lantiq cpu temperature sensor driver"
> > =C2=A0=C2=A0	depends on SOC_XWAY
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index
> > cd8bc4752b4dbf015c6eb46157626f4e8f87dfae..ab93ea83d7a7d05eac3ba40851fda=
31eb1
> > e1735f 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -146,6 +146,7 @@ obj-$(CONFIG_SENSORS_LTC4245)	+=3D ltc4245.o
> > =C2=A0 obj-$(CONFIG_SENSORS_LTC4260)	+=3D ltc4260.o
> > =C2=A0 obj-$(CONFIG_SENSORS_LTC4261)	+=3D ltc4261.o
> > =C2=A0 obj-$(CONFIG_SENSORS_LTC4282)	+=3D ltc4282.o
> > +obj-$(CONFIG_SENSORS_LTC4283)	+=3D ltc4283.o
> > =C2=A0 obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) +=3D ltq-cputemp.o
> > =C2=A0 obj-$(CONFIG_SENSORS_MAX1111)	+=3D max1111.o
> > =C2=A0 obj-$(CONFIG_SENSORS_MAX127)	+=3D max127.o
> > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..0b41291836fcecf612ee9a1d165ba=
8ef7a
> > 8425d6
> > --- /dev/null
> > +++ b/drivers/hwmon/ltc4283.c
> > @@ -0,0 +1,1748 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Analog Devices LTC4283 I2C Negative Voltage Hot Swap Controller (HW=
MON)
> > + *
> > + * Copyright 2025 Analog Devices Inc.
> > + */
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bitmap.h>
> > +#include <linux/bitops.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/device.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/i2c.h>
> > +#include <linux/math.h>
> > +#include <linux/math64.h>
> > +#include <linux/minmax.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/overflow.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <linux/units.h>
> > +
> > +#define LTC4283_SYSTEM_STATUS		0x00
> > +#define LTC4283_FAULT_STATUS		0x03
> > +#define=C2=A0=C2=A0 LTC4283_OV_MASK		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_UV_MASK		BIT(1)
> > +#define=C2=A0=C2=A0 LTC4283_OC_MASK		BIT(2)
> > +#define=C2=A0=C2=A0 LTC4283_FET_BAD_MASK		BIT(3)
> > +#define=C2=A0=C2=A0 LTC4283_FET_SHORT_MASK	BIT(6)
> > +#define LTC4283_FAULT_LOG		0x04
> > +#define=C2=A0=C2=A0 LTC4283_OV_FAULT_MASK		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_UV_FAULT_MASK		BIT(1)
> > +#define=C2=A0=C2=A0 LTC4283_OC_FAULT_MASK		BIT(2)
> > +#define=C2=A0=C2=A0 LTC4283_FET_BAD_FAULT_MASK	BIT(3)
> > +#define=C2=A0=C2=A0 LTC4283_PGI_FAULT_MASK	BIT(4)
> > +#define=C2=A0=C2=A0 LTC4283_PWR_FAIL_FAULT_MASK	BIT(5)
> > +#define=C2=A0=C2=A0 LTC4283_FET_SHORT_FAULT_MASK	BIT(6)
> > +#define LTC4283_ADC_ALM_LOG_1		0x05
> > +#define=C2=A0=C2=A0 LTC4283_POWER_LOW_ALM		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_POWER_HIGH_ALM	BIT(1)
> > +#define=C2=A0=C2=A0 LTC4283_SENSE_LOW_ALM		BIT(4)
> > +#define=C2=A0=C2=A0 LTC4283_SENSE_HIGH_ALM	BIT(5)
> > +#define LTC4283_ADC_ALM_LOG_2		0x06
> > +#define LTC4283_ADC_ALM_LOG_3		0x07
> > +#define LTC4283_ADC_ALM_LOG_4		0x08
> > +#define LTC4283_ADC_ALM_LOG_5		0x09
> > +#define LTC4283_CONTROL_1		0x0a
> > +#define=C2=A0=C2=A0 LTC4283_PIGIO2_ACLB_MASK	BIT(2)
> > +#define=C2=A0=C2=A0 LTC4283_PWRGD_RST_CTRL_MASK	BIT(3)
> > +#define=C2=A0=C2=A0 LTC4283_FET_BAD_OFF_MASK	BIT(4)
> > +#define=C2=A0=C2=A0 LTC4283_THERM_TMR_MASK	BIT(5)
> > +#define=C2=A0=C2=A0 LTC4283_DVDT_MASK		BIT(6)
> > +#define LTC4283_CONTROL_2		0x0b
> > +#define=C2=A0=C2=A0 LTC4283_OV_RETRY_MASK		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_UV_RETRY_MASK		BIT(1)
> > +#define=C2=A0=C2=A0 LTC4283_OC_RETRY_MASK		GENMASK(3, 2)
> > +#define=C2=A0=C2=A0 LTC4283_FET_BAD_RETRY_MASK	GENMASK(5, 4)
> > +#define=C2=A0=C2=A0 LTC4283_EXT_FAULT_RETRY_MASK	BIT(7)
> > +#define LTC4283_RESERVED_OC		0x0c
> > +#define LTC4283_CONFIG_1		0x0d
> > +#define=C2=A0=C2=A0 LTC4283_FB_MASK		GENMASK(3, 2)
> > +#define=C2=A0=C2=A0 LTC4283_ILIM_MASK		GENMASK(7, 4)
> > +#define LTC4283_CONFIG_2		0x0e
> > +#define=C2=A0=C2=A0 LTC4283_COOLING_DL_MASK	GENMASK(3, 1)
> > +#define=C2=A0=C2=A0 LTC4283_FTBD_DL_MASK		GENMASK(5, 4)
> > +#define LTC4283_CONFIG_3		0x0f
> > +#define=C2=A0=C2=A0 LTC4283_VPWR_DRNS_MASK	BIT(6)
> > +#define=C2=A0=C2=A0 LTC4283_EXTFLT_TURN_OFF_MASK	BIT(7)
> > +#define LTC4283_PGIO_CONFIG		0x10
> > +#define=C2=A0=C2=A0 LTC4283_PGIO1_CFG_MASK	GENMASK(1, 0)
> > +#define=C2=A0=C2=A0 LTC4283_PGIO2_CFG_MASK	GENMASK(3, 2)
> > +#define=C2=A0=C2=A0 LTC4283_PGIO3_CFG_MASK	GENMASK(5, 4)
> > +#define=C2=A0=C2=A0 LTC4283_PGIO4_CFG_MASK	GENMASK(7, 6)
> > +#define LTC4283_PGIO_CONFIG_2		0x11
> > +#define=C2=A0=C2=A0 LTC4283_ADC_MASK		GENMASK(2, 0)
> > +#define LTC4283_ADC_SELECT(c)		(0x13 + (c) / 8)
> > +#define=C2=A0=C2=A0 LTC4283_ADC_SELECT_MASK(c)	BIT((c) % 8)
> > +#define LTC4283_SENSE_MIN_TH		0x1b
> > +#define LTC4283_SENSE_MAX_TH		0x1c
> > +#define LTC4283_VPWR_MIN_TH		0x1d
> > +#define LTC4283_VPWR_MAX_TH		0x1e
> > +#define LTC4283_POWER_MIN_TH		0x1f
> > +#define LTC4283_POWER_MAX_TH		0x20
> > +#define LTC4283_ADC_2_MIN_TH(c)		(0x21 + (c) * 2)
> > +#define LTC4283_ADC_2_MAX_TH(c)		(0x22 + (c) * 2)
> > +#define LTC4283_ADC_2_MIN_TH_DIFF(c)	(0x39 + (c) * 2)
> > +#define LTC4283_ADC_2_MAX_TH_DIFF(c)	(0x3a + (c) * 2)
> > +#define LTC4283_SENSE			0x41
> > +#define LTC4283_SENSE_MIN		0x42
> > +#define LTC4283_SENSE_MAX		0x43
> > +#define LTC4283_VPWR			0x44
> > +#define LTC4283_VPWR_MIN		0x45
> > +#define LTC4283_VPWR_MAX		0x46
> > +#define LTC4283_POWER			0x47
> > +#define LTC4283_POWER_MIN		0x48
> > +#define LTC4283_POWER_MAX		0x49
> > +/* get channels from ADC 2 */
> > +#define LTC4283_ADC_2(c)		(0x4a + (c) * 3)
> > +#define LTC4283_ADC_2_MIN(c)		(0x4b + (c) * 3)
> > +#define LTC4283_ADC_2_MAX(c)		(0x4c + (c) * 3)
> > +#define LTC4283_ADC_2_DIFF(c)		(0x6e + (c) * 3)
> > +#define LTC4283_ADC_2_MIN_DIFF(c)	(0x6f + (c) * 3)
> > +#define LTC4283_ADC_2_MAX_DIFF(c)	(0x70 + (c) * 3)
> > +#define LTC4283_ENERGY			0x7a
> > +#define LTC4283_METER_CONTROL		0x84
> > +#define=C2=A0=C2=A0 LTC4283_INTEGRATE_I_MASK	BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_METER_HALT_MASK	BIT(6)
> > +#define LTC4283_RESERVED_86		0x86
> > +#define LTC4283_RESERVED_8F		0x8F
> > +#define LTC4283_FAULT_LOG_CTRL		0x90
> > +#define=C2=A0=C2=A0 LTC4283_FAULT_LOG_EN_MASK	BIT(7)
> > +#define LTC4283_RESERVED_91		0x91
> > +#define LTC4283_RESERVED_A1		0xA1
> > +#define LTC4283_RESERVED_A3		0xA3
> > +#define LTC4283_RESERVED_AC		0xAC
> > +#define LTC4283_POWER_PLAY_MSB		0xE7
> > +#define LTC4283_POWER_PLAY_LSB		0xE8
> > +#define LTC4283_RESERVED_F1		0xF1
> > +#define LTC4283_RESERVED_FF		0xFF
> > +
> > +/* also applies for differential channels */
> > +#define LTC4283_ADC1_FS_uV		32768
> > +#define LTC4283_ADC2_FS_mV		2048
> > +#define LTC4283_TCONV_uS		64103
> > +#define LTC4283_VILIM_MIN_uV		15000
> > +#define LTC4283_VILIM_MAX_uV		30000
> > +#define LTC4283_VILIM_RANGE	\
> > +	(LTC4283_VILIM_MAX_uV - LTC4283_VILIM_MIN_uV + 1)
> > +
> > +#define LTC4283_PGIO_FUNC_GPIO		2
> > +#define LTC4283_PGIO2_FUNC_ACLB		3
> > +
> > +/* voltage channels */
> > +enum {
> > +	LTC4283_CHAN_VIN,
> > +	LTC4283_CHAN_VPWR,
> > +	LTC4283_CHAN_ADI_1,
> > +	LTC4283_CHAN_ADI_2,
> > +	LTC4283_CHAN_ADI_3,
> > +	LTC4283_CHAN_ADI_4,
> > +	LTC4283_CHAN_ADIO_1,
> > +	LTC4283_CHAN_ADIO_2,
> > +	LTC4283_CHAN_ADIO_3,
> > +	LTC4283_CHAN_ADIO_4,
> > +	LTC4283_CHAN_DRNS,
> > +	LTC4283_CHAN_DRAIN,
> > +	/* differential channels */
> > +	LTC4283_CHAN_ADIN12,
> > +	LTC4283_CHAN_ADIN34,
> > +	LTC4283_CHAN_ADIO12,
> > +	LTC4283_CHAN_ADIO34,
> > +	LTC4283_CHAN_MAX
> > +};
> > +
> > +struct ltc4283_hwmon {
> > +	struct regmap *map;
> > +
> > +	unsigned long gpio_mask;
> > +	/* lock to protect concurrent device accesses and shared data */
> > +	struct mutex lock;
> > +	unsigned long ch_enable_mask;
> > +	/* in microwatt */
> > +	long power_max;
> > +	/* in millivolt */
> > +	u32 vsense_max;
> > +	/* in tenths of microohm*/
> > +	u32 rsense;
> > +	bool energy_en;
> > +	bool ext_fault;
> > +};
> > +
> > +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
>=20
> It might be valuable to explain what "fs" stands for. More on that below.

What I mean by fs is full scale. Like, if you we are measuring single ended
voltages in ADC2, fs =3D 2,048V. But for differential voltages, fs =3D 32.7=
68mV.

So, the default formula to get voltage is:

V =3D (code(word) * fs) / 2^16

And ISENSE is pretty much =3D V * Rsense (with fs =3D 32.768mV)

>=20
> > +{
> > +	__be16 in;
> > +	int ret;
> > +
> > +	ret =3D regmap_bulk_read(st->map, reg, &in, sizeof(in));
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(be16_to_cpu(in) * fs, BIT(16));
>=20
> For example, if fs is the ADC resolution (LSB), and the return value
> from this function is supposed to be normalized to uV, I would expect
> the function to return 2,048 if fs=3D2,048 and the register reads 1.
> But that value is divided by 65,536. Which I really don't understand.
>=20
> Ultimately, each call to ltc4283_read_voltage_word() drops
> a number of bits from the ADC value. It either drops 5 bit (ls=3D2,048)
> or 1 bit (ls=3D32,768). That just seems odd.
>=20
> What am I missing ?

The resolution of the ADC is 12bits (it's configurable but I'm using the de=
fault
for now). I think the below information from the datasheet might be key for=
 you:

"Since the data are left justified, the same equations apply to all
resolutions."

>=20
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_voltage_byte(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
> > +{
> > +	int ret;
> > +	u32 in;
> > +
> > +	ret =3D regmap_read(st->map, reg, &in);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(in * fs, BIT(8));
> > +	return 0;
> > +}
> > +
> > +static u32 ltc4283_in_reg(u32 attr, u32 channel)
> > +{
> > +	switch (attr) {
> > +	case hwmon_in_input:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D
> > LTC4283_CHAN_DRAIN)
> > +			return LTC4283_ADC_2(channel - LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	case hwmon_in_highest:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR_MAX;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D
> > LTC4283_CHAN_DRAIN)
> > +			return LTC4283_ADC_2_MAX(channel -
> > LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_MAX_DIFF(channel -
> > LTC4283_CHAN_ADIN12);
> > +	case hwmon_in_lowest:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR_MIN;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D
> > LTC4283_CHAN_DRAIN)
> > +			return LTC4283_ADC_2_MIN(channel -
> > LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_MIN_DIFF(channel -
> > LTC4283_CHAN_ADIN12);
> > +	case hwmon_in_max:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR_MAX_TH;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D
> > LTC4283_CHAN_DRAIN)
> > +			return LTC4283_ADC_2_MAX_TH(channel -
> > LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_MAX_TH_DIFF(channel -
> > LTC4283_CHAN_ADIN12);
> > +	default:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR_MIN_TH;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D
> > LTC4283_CHAN_DRAIN)
> > +			return LTC4283_ADC_2_MIN_TH(channel -
> > LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_MIN_TH_DIFF(channel -
> > LTC4283_CHAN_ADIN12);
> > +	}
> > +}
> > +
> > +static int ltc4283_read_in_vals(const struct ltc4283_hwmon *st,
> > +				u32 attr, u32 channel, long *val)
> > +{
> > +	u32 reg =3D ltc4283_in_reg(attr, channel);
> > +	int ret;
> > +
> > +	if (channel < LTC4283_CHAN_ADIN12) {
> > +		if (attr !=3D hwmon_in_max && attr !=3D hwmon_in_min)
> > +			return ltc4283_read_voltage_word(st, reg,
> > +						=09
> > LTC4283_ADC2_FS_mV,
> > +							 val);
> > +
> > +		return ltc4283_read_voltage_byte(st, reg,
> > +						 LTC4283_ADC2_FS_mV, val);
> > +	}
> > +
> > +	if (attr !=3D hwmon_in_max && attr !=3D hwmon_in_min)
> > +		ret =3D ltc4283_read_voltage_word(st, reg,
> > +						LTC4283_ADC1_FS_uV, val);
> > +	else
> > +		ret =3D ltc4283_read_voltage_byte(st, reg,
> > +						LTC4283_ADC1_FS_uV, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(*val, MILLI);
>=20
> So the value returned from ltc4283_read_voltage_word() is in micro-Volt ?

Nope, it actually depends on fs. If you pass in millivolt that's what you g=
et.
If micro-Volt, then you get that and that is the reason why for
LTC4283_ADC2_FS_mV  you return right away and for LTC4283_ADC1_FS_uV we con=
vert
to the hwmon ABI expectations.

Yeah, it's not helping reviewers.

> I guess I must be missing something, because the datasheet seems to sugge=
st
> that the minimum ADC resolution is 1uV, but ltc4283_read_voltage_word()
> does a divide/multiply operation, and the divisor is always larger than
> the multiplier (LTC4283_ADC1_FS_uV=3D32768 which is divided by 65,536).
> That means the maximum returned value from
> 	ret =3D ltc4283_read_voltage_word(st, reg,
> 					LTC4283_ADC1_FS_uV, val);
> is 65,535 * 32768 / 65,536 =3D 32767 and that is divided again here by 1,=
000.
> So the maximum reported value (in mV) would be 33mV. Is that as intended =
?

Yes, when fs =3D 32.768mV, 33mv seems ok. Anyways, I hope the above explana=
tion
makes sense to you.

>=20
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 mask, long *val)
> > +{
> > +	u32 alarm;
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +	ret =3D regmap_read(st->map, reg, &alarm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D !!(alarm & mask);
> > +
> > +	/* If not status/fault logs, clear the alarm after reading it. */
> > +	if (reg !=3D LTC4283_FAULT_STATUS && reg !=3D LTC4283_FAULT_LOG)
> > +		return regmap_clear_bits(st->map, reg, mask);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel=
,
> > +				 bool max_alm, long *val)
> > +{
> > +	if (channel =3D=3D LTC4283_VPWR)
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 BIT(2 + max_alm), val);
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_ADI_=
4)
> > {
> > +		u32 bit =3D (channel - LTC4283_CHAN_ADI_1) * 2;
> > +		/*
> > +		 * Lower channels go to higher bits. We also want to go +1
> > down
> > +		 * in the min_alarm case.
> > +		 */
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> > +					=C2=A0 BIT(7 - bit - !max_alm), val);
> > +	}
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADIO_1 && channel <=3D
> > LTC4283_CHAN_ADIO_4) {
> > +		u32 bit =3D (channel - LTC4283_CHAN_ADIO_1) * 2;
> > +
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> > +					=C2=A0 BIT(7 - bit - !max_alm), val);
> > +	}
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADIN12 && channel <=3D
> > LTC4283_CHAN_ADIN34) {
> > +		u32 bit =3D (channel - LTC4283_CHAN_ADIN12) * 2;
> > +
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> > +					=C2=A0 BIT(7 - bit - !max_alm), val);
> > +	}
> > +
> > +	if (channel =3D=3D LTC4283_CHAN_DRNS)
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> > +					=C2=A0 BIT(6 + max_alm), val);
> > +
> > +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 +
> > max_alm),
> > +				=C2=A0 val);
> > +}
> > +
> > +static int ltc4283_read_in(struct ltc4283_hwmon *st, u32 attr, u32 cha=
nnel,
> > +			=C2=A0=C2=A0 long *val)
> > +{
> > +	int ret =3D 0;
> > +
> > +	switch (attr) {
> > +	case hwmon_in_input:
> > +		scoped_guard(mutex, &st->lock) {
> > +			if (!test_bit(channel, &st->ch_enable_mask))
> > +				return -ENODATA;
> > +
> > +			ret =3D ltc4283_read_in_vals(st, attr, channel, val);
> > +		}
> > +		return ret;
> > +	case hwmon_in_highest:
> > +	case hwmon_in_lowest:
> > +	case hwmon_in_max:
> > +	case hwmon_in_min:
> > +		return ltc4283_read_in_vals(st, attr, channel, val);
> > +	case hwmon_in_max_alarm:
> > +		return ltc4283_read_in_alarm(st, channel, true, val);
> > +	case hwmon_in_min_alarm:
> > +		return ltc4283_read_in_alarm(st, channel, false, val);
> > +	case hwmon_in_crit_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> > +					=C2=A0 LTC4283_OV_MASK, val);
> > +	case hwmon_in_lcrit_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> > +					=C2=A0 LTC4283_UV_MASK, val);
> > +	case hwmon_in_fault:
> > +		/*
> > +		 * We report failure if we detect either a fer_bad or a
> > +		 * fet_short in the status register.
> > +		 */
> > +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> > +					=C2=A0 LTC4283_FET_BAD_MASK |
> > LTC4283_FET_SHORT_MASK, val);
> > +	case hwmon_in_enable:
> > +		scoped_guard(mutex, &st->lock) {
> > +			*val =3D test_bit(channel, &st->ch_enable_mask);
> > +		}
>=20
> I don't think that guard adds any value. The returned value is 0 or 1 eit=
her
> way, and it may change almost at the same time from another thread. The c=
aller
> still won't know its _current_ value when it gets the data.

I put it more for consistency but I guess you're right.

>=20
> > +
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_current_word(const struct ltc4283_hwmon *st, u=
32
> > reg,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
> > +	__be16 curr;
> > +	int ret;
> > +
> > +	ret =3D regmap_bulk_read(st->map, reg, &curr, sizeof(curr));
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(be16_to_cpu(curr) * temp,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT_ULL(16) * st->rsense);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_current_byte(const struct ltc4283_hwmon *st, u=
32
> > reg,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
> > +	u32 curr;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &curr);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST_ULL(curr * temp, BIT(8) * st->rsense);
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_curr(struct ltc4283_hwmon *st, u32 attr, long =
*val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_curr_input:
> > +		return ltc4283_read_current_word(st, LTC4283_SENSE, val);
> > +	case hwmon_curr_highest:
> > +		return ltc4283_read_current_word(st, LTC4283_SENSE_MAX,
> > val);
> > +	case hwmon_curr_lowest:
> > +		return ltc4283_read_current_word(st, LTC4283_SENSE_MIN,
> > val);
> > +	case hwmon_curr_max:
> > +		return ltc4283_read_current_byte(st, LTC4283_SENSE_MAX_TH,
> > val);
> > +	case hwmon_curr_min:
> > +		return ltc4283_read_current_byte(st, LTC4283_SENSE_MIN_TH,
> > val);
> > +	case hwmon_curr_max_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 LTC4283_SENSE_HIGH_ALM, val);
> > +	case hwmon_curr_min_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 LTC4283_SENSE_LOW_ALM, val);
> > +	case hwmon_curr_crit_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> > +					=C2=A0 LTC4283_OC_MASK, val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0 u32 reg, long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA *
> > MILLI;
> > +	__be16 raw;
> > +	int ret;
> > +
> > +	ret =3D regmap_bulk_read(st->map, reg, &raw, sizeof(raw));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Power is given by:
> > +	 *=C2=A0=C2=A0=C2=A0=C2=A0 P =3D CODE(16b) * 32.768mV * 2.048V / (2^1=
6 * Rsense)
> > +	 */
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp * be16_to_cpu(raw),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT_ULL(16) * st->rsense);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_power_byte(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0 u32 reg, long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA *
> > MILLI;
> > +	u32 power;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &power);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST_ULL(power * temp, BIT(8) * st->rsense);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_power(struct ltc4283_hwmon *st, u32 attr, long
> > *val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_power_input:
> > +		return ltc4283_read_power_word(st, LTC4283_POWER, val);
> > +	case hwmon_power_input_highest:
> > +		return ltc4283_read_power_word(st, LTC4283_POWER_MAX, val);
> > +	case hwmon_power_input_lowest:
> > +		return ltc4283_read_power_word(st, LTC4283_POWER_MIN, val);
> > +	case hwmon_power_max_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 LTC4283_POWER_HIGH_ALM, val);
> > +	case hwmon_power_min_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 LTC4283_POWER_LOW_ALM, val);
> > +	case hwmon_power_max:
> > +		return ltc4283_read_power_byte(st, LTC4283_POWER_MAX_TH,
> > val);
> > +	case hwmon_power_min:
> > +		return ltc4283_read_power_byte(st, LTC4283_POWER_MIN_TH,
> > val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> > +			u32 attr, int channel, long *val)
> > +{
> > +	struct ltc4283_hwmon *st =3D dev_get_drvdata(dev);
> > +
> > +	switch (type) {
> > +	case hwmon_in:
> > +		return ltc4283_read_in(st, attr, channel, val);
> > +	case hwmon_curr:
> > +		return ltc4283_read_curr(st, attr, val);
> > +	case hwmon_power:
> > +		return ltc4283_read_power(st, attr, val);
> > +	case hwmon_energy:
> > +		scoped_guard(mutex, &st->lock) {
> > +			*val =3D st->energy_en;
> > +		}
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4282_write_power_byte(const struct ltc4283_hwmon *st, u3=
2
> > reg,
> > +				=C2=A0=C2=A0=C2=A0 long val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA *
> > MILLI;
> > +	u32 __raw;
> > +
> > +	if (val > st->power_max)
> > +		val =3D st->power_max;
> > +
> > +	__raw =3D DIV64_U64_ROUND_CLOSEST(val * BIT_ULL(8) * st->rsense,
> > temp);
> > +
> > +	return regmap_write(st->map, reg, __raw);
> > +}
> > +
> > +static int ltc4283_write_power_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0 u32 reg, long val)
> > +{
> > +	u64 temp =3D st->rsense * BIT_ULL(16), temp_2;
> > +	__be16 __raw;
> > +	u16 code;
> > +
> > +	if (check_mul_overflow(val, temp, &temp_2)) {
> > +		temp =3D DIV_ROUND_CLOSEST_ULL(temp, DECA * MILLI);
> > +		code =3D DIV_ROUND_CLOSEST_ULL(temp * val, LTC4283_ADC1_FS_uV
> > * LTC4283_ADC2_FS_mV);
> > +	} else {
> > +		temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA
> > * MILLI;
> > +		code =3D DIV64_U64_ROUND_CLOSEST(temp_2, temp);
> > +	}
> > +
> > +	__raw =3D cpu_to_be16(code);
> > +	return regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
> > +}
> > +
> > +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
> > +{
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	ret =3D ltc4283_write_power_word(st, LTC4283_POWER_MIN, st-
> > >power_max);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_write_power_word(st, LTC4283_POWER_MAX, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Clear possible power faults. */
> > +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > +				 LTC4283_PWR_FAIL_FAULT_MASK |
> > LTC4283_PGI_FAULT_MASK);
> > +}
> > +
> > +static int ltc4283_write_power(struct ltc4283_hwmon *st, u32 attr, lon=
g
> > val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_power_max:
> > +		return ltc4282_write_power_byte(st, LTC4283_POWER_MAX_TH,
> > val);
> > +	case hwmon_power_min:
> > +		return ltc4282_write_power_byte(st, LTC4283_POWER_MIN_TH,
> > val);
> > +	case hwmon_power_reset_history:
> > +		return ltc4283_reset_power_hist(st);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int __ltc4283_write_in_history(struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, long lowest, u32 fs)
> > +{
> > +	__be16 __raw;
> > +	u16 tmp;
> > +	int ret;
> > +
> > +	tmp =3D DIV_ROUND_CLOSEST(BIT(16) * lowest, fs);
> > +	if (tmp =3D=3D BIT(16))
> > +		tmp =3D U16_MAX;
>=20
> As pointed out by 0-day, the if statement is always false.
>=20

yes, will fix that.

> Anyway, this needs explanation. The idea behing history reset functions
> is to reset the history to 0. This code sets the history to some value.
> And it doesn't do what the documentation claims it would do (write 1
> to reset history)
>=20
> What is the purpose of doing this ?

Hmm, this is kind of doing it in software. I did the same thing on ltc4282 =
so I
replicated in here. The main idea is to put lowest to the maximum possible =
value
and highest to the minimum value (the registers are R/W). So when you do=C2=
=A0
echo 1 > reset_history, the above is what's happening which is typically wh=
at
happens (I think) in chips that offer this via a special register write.

>=20
> > +
> > +	__raw =3D cpu_to_be16(tmp);
> > +
> > +	ret =3D regmap_bulk_write(st->map, reg, &__raw, sizeof(__raw));
> > +	if (ret)
> > +		return ret;
> > +
> > +	tmp =3D 0;
> > +	return regmap_bulk_write(st->map, reg + 1,=C2=A0 &tmp, sizeof(tmp));
> > +}
> > +
> > +static int ltc4283_write_in_history(struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0 u32 reg, long lowest, u32 fs)
> > +{
> > +	guard(mutex)(&st->lock);
> > +	return __ltc4283_write_in_history(st, reg, lowest, fs);
> > +}
> > +
> > +static int ltc4283_write_in_byte(const struct ltc4283_hwmon *st,
> > +				 u32 reg, u32 fs, long val)
> > +{
> > +	u32 __raw;
> > +
> > +	val =3D clamp_val(val, 0, fs);
> > +	__raw =3D DIV_ROUND_CLOSEST(val * BIT(8), fs);
> > +
> > +	return regmap_write(st->map, reg, __raw);
> > +}
> > +
> > +static int ltc4283_reset_in_hist(struct ltc4283_hwmon *st, u32 channel=
)
> > +{
> > +	u32 reg, fs;
> > +	int ret;
> > +
> > +	if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +		return ltc4283_write_in_history(st, LTC4283_VPWR_MIN,
> > +						LTC4283_ADC2_FS_mV,
> > +						LTC4283_ADC2_FS_mV);
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAI=
N)
> > {
> > +		fs =3D LTC4283_ADC2_FS_mV;
> > +		reg =3D LTC4283_ADC_2_MIN(channel - LTC4283_CHAN_ADI_1);
> > +	} else {
> > +		fs =3D LTC4283_ADC1_FS_uV;
> > +		reg =3D LTC4283_ADC_2_MIN_DIFF(channel -
> > LTC4283_CHAN_ADIN12);
> > +	}
> > +
> > +	guard(mutex)(&st->lock);
> > +	ret =3D __ltc4283_write_in_history(st, reg, fs, fs);
> > +	if (ret)
> > +		return ret;
> > +	if (channel !=3D LTC4283_CHAN_DRAIN)
> > +		return 0;
> > +
> > +	/* Then, let's also clear possible fet faults. */
>=20
> Please document this.

I'll improve the comment but I do have it documented in the Docs for this d=
river
(IIRC).

>=20
> > +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > +				 LTC4283_FET_BAD_FAULT_MASK |
> > LTC4283_FET_SHORT_FAULT_MASK);
> > +}
> > +
> > +static int ltc4283_write_in_en(struct ltc4283_hwmon *st, u32 channel, =
bool
> > en)
> > +{
> > +	unsigned int bit, adc_idx =3D channel - LTC4283_CHAN_ADI_1;
> > +	unsigned int reg =3D LTC4283_ADC_SELECT(adc_idx);
> > +	int ret;
> > +
> > +	bit =3D LTC4283_ADC_SELECT_MASK(adc_idx);
> > +	if (channel > LTC4283_CHAN_DRAIN)
> > +		/* Account for two reserved fields after DRAIN. */
> > +		bit <<=3D 2;
> > +
> > +	guard(mutex)(&st->lock);
> > +	if (en)
> > +		ret =3D regmap_set_bits(st->map, reg, bit);
> > +	else
> > +		ret =3D regmap_clear_bits(st->map, reg, bit);
> > +	if (ret)
> > +		return ret;
> > +
> > +	__assign_bit(channel, &st->ch_enable_mask, en);
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_write_minmax(struct ltc4283_hwmon *st, long val,
> > +				u32 channel, bool is_max)
> > +{
> > +	u32 reg;
> > +
> > +	if (channel =3D=3D LTC4283_CHAN_VPWR) {
> > +		if (is_max)
> > +			return ltc4283_write_in_byte(st,
> > LTC4283_VPWR_MAX_TH,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV,
> > val);
> > +
> > +		return ltc4283_write_in_byte(st, LTC4283_VPWR_MIN_TH,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV, val);
> > +	}
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAI=
N)
> > {
> > +		if (is_max) {
> > +			reg =3D LTC4283_ADC_2_MAX_TH(channel -
> > LTC4283_CHAN_ADI_1);
> > +			return ltc4283_write_in_byte(st, reg,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV,
> > val);
> > +		}
> > +
> > +		reg =3D LTC4283_ADC_2_MIN_TH(channel - LTC4283_CHAN_ADI_1);
> > +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC2_FS_mV,
> > val);
> > +	}
> > +
> > +	if (is_max) {
> > +		reg =3D LTC4283_ADC_2_MAX_TH_DIFF(channel -
> > LTC4283_CHAN_ADIN12);
> > +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 val * MILLI);
> > +	}
> > +
> > +	reg =3D LTC4283_ADC_2_MIN_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV, val *
> > MILLI);
> > +}
> > +
> > +static int ltc4283_write_in(struct ltc4283_hwmon *st, u32 attr, long v=
al,
> > +			=C2=A0=C2=A0=C2=A0 int channel)
> > +{
> > +	switch (attr) {
> > +	case hwmon_in_max:
> > +		return ltc4283_write_minmax(st, val, channel, true);
> > +	case hwmon_in_min:
> > +		return ltc4283_write_minmax(st, val, channel, false);
> > +	case hwmon_in_reset_history:
> > +		return ltc4283_reset_in_hist(st, channel);
> > +	case hwmon_in_enable:
> > +		return ltc4283_write_in_en(st, channel, !!val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_write_curr_byte(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0 u32 reg, long val)
> > +{
> > +	u32 temp =3D LTC4283_ADC1_FS_uV * DECA * MILLI;
> > +	u32 reg_val;
> > +
> > +	reg_val =3D DIV_ROUND_CLOSEST_ULL(val * BIT_ULL(8) * st->rsense,
> > temp);
> > +	return regmap_write(st->map, reg, reg_val);
> > +}
> > +
> > +static int ltc4283_write_curr_history(struct ltc4283_hwmon *st)
> > +{
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	ret =3D __ltc4283_write_in_history(st, LTC4283_SENSE_MIN, st-
> > >vsense_max,
> > +					 LTC4283_ADC1_FS_uV);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Now, let's also clear possible overcurrent logs. */
> > +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > +				 LTC4283_OC_FAULT_MASK);
> > +}
> > +
> > +static int ltc4283_write_curr(struct ltc4283_hwmon *st, u32 attr, long=
 val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_curr_max:
> > +		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MAX_TH,
> > val);
> > +	case hwmon_curr_min:
> > +		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MIN_TH,
> > val);
> > +	case hwmon_curr_reset_history:
> > +		return ltc4283_write_curr_history(st);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_energy_enable_set(struct ltc4283_hwmon *st, long va=
l)
> > +{
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	/* Setting the bit halts the meter. */
> > +	val =3D !!val;
> > +	ret =3D regmap_update_bits(st->map, LTC4283_METER_CONTROL,
> > +				 LTC4283_METER_HALT_MASK,
> > +				 FIELD_PREP(LTC4283_METER_HALT_MASK,
> > !val));
> > +	if (ret)
> > +		return ret;
> > +
> > +	st->energy_en =3D val;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_write(struct device *dev, enum hwmon_sensor_types t=
ype,
> > +			 u32 attr, int channel, long val)
> > +{
> > +	struct ltc4283_hwmon *st =3D dev_get_drvdata(dev);
> > +
> > +	switch (type) {
> > +	case hwmon_power:
> > +		return ltc4283_write_power(st, attr, val);
> > +	case hwmon_in:
> > +		return ltc4283_write_in(st, attr, val, channel);
> > +	case hwmon_curr:
> > +		return ltc4283_write_curr(st, attr, val);
> > +	case hwmon_energy:
> > +		return ltc4283_energy_enable_set(st, val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static umode_t ltc4283_in_is_visible(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 attr, int channel)
> > +{
> > +	/* If ADIO is set as a GPIO, don=C2=B4t make it visible. */
> > +	if (channel >=3D LTC4283_CHAN_ADIO_1 && channel <=3D
> > LTC4283_CHAN_ADIO_4) {
> > +		/* ADIOX pins come at index 0 in the gpio mask. */
> > +		channel -=3D LTC4283_CHAN_ADIO_1;
> > +		if (test_bit(channel, &st->gpio_mask))
> > +			return 0;
> > +	}
> > +
> > +	/* Also take care of differential channels. */
> > +	if (channel >=3D LTC4283_CHAN_ADIO12 && channel <=3D
> > LTC4283_CHAN_ADIO34) {
> > +		channel -=3D LTC4283_CHAN_ADIO12;
> > +		/* If one channel in the pair is used, make it invisible.
> > */
> > +		if (test_bit(channel * 2, &st->gpio_mask) ||
> > +		=C2=A0=C2=A0=C2=A0 test_bit(channel * 2 + 1, &st->gpio_mask))
> > +			return 0;
> > +	}
> > +
> > +	switch (attr) {
> > +	case hwmon_in_input:
> > +	case hwmon_in_highest:
> > +	case hwmon_in_lowest:
> > +	case hwmon_in_max_alarm:
> > +	case hwmon_in_min_alarm:
> > +	case hwmon_in_label:
> > +	case hwmon_in_lcrit_alarm:
> > +	case hwmon_in_crit_alarm:
> > +	case hwmon_in_fault:
> > +		return 0444;
> > +	case hwmon_in_max:
> > +	case hwmon_in_min:
> > +	case hwmon_in_enable:
> > +	case hwmon_in_reset_history:
> > +		return 0644;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static umode_t ltc4283_curr_is_visible(u32 attr)
> > +{
> > +	switch (attr) {
> > +	case hwmon_curr_input:
> > +	case hwmon_curr_highest:
> > +	case hwmon_curr_lowest:
> > +	case hwmon_curr_max_alarm:
> > +	case hwmon_curr_min_alarm:
> > +	case hwmon_curr_crit_alarm:
> > +	case hwmon_curr_label:
> > +		return 0444;
> > +	case hwmon_curr_max:
> > +	case hwmon_curr_min:
> > +	case hwmon_curr_reset_history:
> > +		return 0644;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static umode_t ltc4283_power_is_visible(u32 attr)
> > +{
> > +	switch (attr) {
> > +	case hwmon_power_input:
> > +	case hwmon_power_input_highest:
> > +	case hwmon_power_input_lowest:
> > +	case hwmon_power_label:
> > +	case hwmon_power_max_alarm:
> > +	case hwmon_power_min_alarm:
> > +		return 0444;
> > +	case hwmon_power_max:
> > +	case hwmon_power_min:
> > +	case hwmon_power_reset_history:
> > +		return 0644;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static umode_t ltc4283_is_visible(const void *data,
> > +				=C2=A0 enum hwmon_sensor_types type,
> > +				=C2=A0 u32 attr, int channel)
> > +{
> > +	switch (type) {
> > +	case hwmon_in:
> > +		return ltc4283_in_is_visible(data, attr, channel);
> > +	case hwmon_curr:
> > +		return ltc4283_curr_is_visible(attr);
> > +	case hwmon_power:
> > +		return ltc4283_power_is_visible(attr);
> > +	case hwmon_energy:
> > +		/* hwmon_energy_enable */
> > +		return 0644;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static const char * const ltc4283_in_strs[] =3D {
> > +	"VIN", "VPWR", "VADI1", "VADI2", "VADI3", "VADI4", "VADIO1",
> > "VADIO2",
> > +	"VADIO3", "VADIO4", "DRNS", "DRAIN", "ADIN2-ADIN1", "ADIN4-ADIN3",
> > +	"ADIO2-ADIO1", "ADIO4-ADIO3"
> > +};
> > +
> > +static int ltc4283_read_labels(struct device *dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum hwmon_sensor_types type,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 attr, int channel, const c=
har **str)
> > +{
> > +	switch (type) {
> > +	case hwmon_in:
> > +		*str =3D ltc4283_in_strs[channel];
> > +		return 0;
> > +	case hwmon_curr:
> > +		*str =3D "ISENSE";
> > +		return 0;
> > +	case hwmon_power:
> > +		*str =3D "Power";
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static ssize_t ltc4283_energy_show(struct device *dev,
> > +				=C2=A0=C2=A0 struct device_attribute *da, char *buf)
> > +{
> > +	u64 temp =3D LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV, energy, temp_2;
> > +	struct ltc4283_hwmon *st =3D dev_get_drvdata(dev);
> > +	__be64 raw;
> > +	int ret;
> > +
> > +	guard(mutex)(&st->lock);
> > +	if (!st->energy_en)
> > +		return -ENODATA;
> > +
> > +	ret =3D regmap_bulk_read(st->map, LTC4283_ENERGY, &raw, sizeof(raw));
> > +	if (ret)
> > +		return ret;
> > +
> > +	energy =3D=C2=A0 be64_to_cpu(raw) >> 16;
> > +
> > +	/*
> > +	 * The formula for energy is given by:
> > +	 *	E =3D CODE(48b) * 32.768mV * 2.048V * Tconv / 2^24 * Rsense
> > +	 *
> > +	 * As Rsense can have tenths of micro-ohm resolution, we need to
> > +	 * multiply by DECA to get microjoule.
> > +	 */
> > +	if (check_mul_overflow(temp * LTC4283_TCONV_uS, energy, &temp_2)) {
> > +		/*
> > +		 * We multiply again by 1000 to make sure that we don't get
> > 0
> > +		 * in the following division which could happen for big
> > rsense
> > +		 * values. OTOH, we then divide energy first by 1000 so
> > that
> > +		 * we do not overflow u64 again for very small rsense
> > values.
> > +		 * We add 100 factor for proper conversion to microjoule.
> > +		 */
> > +		temp_2 =3D DIV64_U64_ROUND_CLOSEST(temp * LTC4283_TCONV_uS *
> > MILLI,
> > +						 BIT_ULL(24) * st->rsense);
> > +		energy =3D DIV_ROUND_CLOSEST_ULL(energy, MILLI * CENTI) *
> > temp_2;
> > +	} else {
> > +		/* Put rsense back into nanoohm so we get microjoule. */
> > +		energy =3D DIV64_U64_ROUND_CLOSEST(temp_2, BIT_ULL(24) * st-
> > >rsense * CENTI);
> > +	}
> > +
> > +	return sysfs_emit(buf, "%llu\n", energy);
> > +}
>=20
> I just submitted a patch for the hwmon core which adds support for a 64-b=
it
> energy attribute. See
> https://patchwork.kernel.org/project/linux-hwmon/patch/20250905204159.261=
8403-12-linux@roeck-us.net/
>=20
> I'll make it available in hwmon-next. Please use it.
>=20

Sure. Will do

> > +
> > +/*
> > + * Set max limits for ISENSE and Power as that depends on the max volt=
age
> > on
> > + * rsense that is defined in ILIM_ADJUST. This is specially important =
for
> > power
> > + * because for some rsense and vfsout values, if we allow the default =
raw
> > 255
> > + * value, that would overflow long in 32bit archs when reading back th=
e max
> > + * power limit.
> > + */
> > +static int ltc4283_set_max_limits(struct ltc4283_hwmon *st, struct dev=
ice
> > *dev)
> > +{
> > +	u32 temp =3D st->vsense_max * DECA * MICRO;
> > +	int ret;
> > +
> > +	ret =3D ltc4283_write_in_byte(st, LTC4283_SENSE_MAX_TH,
> > LTC4283_ADC1_FS_uV,
> > +				=C2=A0=C2=A0=C2=A0 st->vsense_max * MILLI);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Power is given by ISENSE * Vout. */
> > +	st->power_max =3D DIV_ROUND_CLOSEST(temp, st->rsense) *
> > LTC4283_ADC2_FS_mV;
> > +	return ltc4282_write_power_byte(st, LTC4283_POWER_MAX_TH, st-
> > >power_max);
> > +}
> > +
> > +static int ltc4283_parse_array_prop(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0 struct device *dev, const char *prop,
> > +				=C2=A0=C2=A0=C2=A0 const u32 *vals, u32 n_vals)
> > +{
> > +	u32 prop_val;
> > +	int ret;
> > +	u32 i;
> > +
> > +	ret =3D device_property_read_u32(dev, prop, &prop_val);
> > +	if (ret)
> > +		return n_vals;
> > +
> > +	for (i =3D 0; i < n_vals; i++) {
> > +		if (prop_val !=3D vals[i])
> > +			continue;
> > +
> > +		return i;
> > +	}
> > +
> > +	return dev_err_probe(dev, -EINVAL,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid %s property value %u, expected on=
e
> > of: %*ph\n",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 prop, prop_val, n_vals, vals);
> > +}
> > +
> > +static int ltc4283_get_defaults(struct ltc4283_hwmon *st)
> > +{
> > +	u32 reg_val, ilm_adjust, c;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, LTC4283_METER_CONTROL, &reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	st->energy_en =3D !FIELD_GET(LTC4283_METER_HALT_MASK, reg_val);
> > +
> > +	ret =3D regmap_read(st->map, LTC4283_CONFIG_1, &reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ilm_adjust =3D FIELD_GET(LTC4283_ILIM_MASK, reg_val);
> > +	st->vsense_max =3D LTC4283_VILIM_MIN_uV / MILLI + ilm_adjust;
> > +
> > +	/* VPWR and VIN are always enabled */
> > +	__set_bit(LTC4283_CHAN_VIN, &st->ch_enable_mask);
> > +	__set_bit(LTC4283_CHAN_VPWR, &st->ch_enable_mask);
> > +	for (c =3D LTC4283_CHAN_ADI_1; c < LTC4283_CHAN_MAX; c++) {
> > +		u32 chan =3D c - LTC4283_CHAN_ADI_1, bit;
> > +
> > +		ret =3D regmap_read(st->map, LTC4283_ADC_SELECT(chan),
> > &reg_val);
> > +		if (ret)
> > +			return ret;
> > +
> > +		bit =3D LTC4283_ADC_SELECT_MASK(chan);
> > +		if (c > LTC4283_CHAN_DRAIN)
> > +			/* account for two reserved fields after DRAIN */
> > +			bit <<=3D 2;
> > +
> > +		if (!(bit & reg_val))
> > +			continue;
> > +
> > +		__set_bit(c, &st->ch_enable_mask);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const char * const ltc4283_pgio1_funcs[] =3D {
> > +	"inverted_power_good", "power_good", "gpio"
> > +};
> > +
> > +static const char * const ltc4283_pgio2_funcs[] =3D {
> > +	 "inverted_power_good", "power_good", "gpio",
> > "active_current_limiting"
> > +};
> > +
> > +static const char * const ltc4283_pgio3_funcs[] =3D {
> > +	"inverted_power_good_input", "power_good_input", "gpio"
> > +};
> > +
> > +static const char * const ltc4283_pgio4_funcs[] =3D {
> > +	"inverted_external_fault", "external_fault", "gpio"
> > +};
> > +
> > +enum {
> > +	LTC4283_PIN_ADIO1,
> > +	LTC4283_PIN_ADIO2,
> > +	LTC4283_PIN_ADIO3,
> > +	LTC4283_PIN_ADIO4,
> > +	LTC4283_PIN_PGIO1,
> > +	LTC4283_PIN_PGIO2,
> > +	LTC4283_PIN_PGIO3,
> > +	LTC4283_PIN_PGIO4,
> > +};
> > +
> > +static int ltc4283_pgio_config(struct ltc4283_hwmon *st, struct device
> > *dev)
> > +{
> > +	int ret, func;
> > +
> > +	func =3D device_property_match_property_string(dev, "adi,pgio1-func",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio1_funcs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > ARRAY_SIZE(ltc4283_pgio1_funcs));
> > +	if (func < 0 && func !=3D -EINVAL)
> > +		return dev_err_probe(dev, func,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio1-func property\n");
> > +	if (func >=3D 0) {
> > +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> > +			__set_bit(LTC4283_PIN_PGIO1, &st->gpio_mask);
> > +			/* If GPIO, default to an input pin. */
> > +			func++;
> > +		}
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> > +					 LTC4283_PGIO1_CFG_MASK,
> > +					 FIELD_PREP(LTC4283_PGIO1_CFG_MASK,
> > func));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	func =3D device_property_match_property_string(dev, "adi,pgio2-func",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio2_funcs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > ARRAY_SIZE(ltc4283_pgio2_funcs));
> > +
> > +	if (func < 0 && func !=3D -EINVAL)
> > +		return dev_err_probe(dev, func,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio2-func property\n");
> > +	if (func >=3D 0) {
> > +		if (func !=3D LTC4283_PGIO2_FUNC_ACLB) {
> > +			if (func =3D=3D LTC4283_PGIO_FUNC_GPIO)=C2=A0 {
> > +				__set_bit(LTC4283_PIN_PGIO2, &st-
> > >gpio_mask);
> > +				func++;
> > +			}
> > +
> > +			ret =3D regmap_update_bits(st->map,
> > LTC4283_PGIO_CONFIG,
> > +						 LTC4283_PGIO2_CFG_MASK,
> > +					=09
> > FIELD_PREP(LTC4283_PGIO2_CFG_MASK, func));
> > +		} else {
> > +			ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_1,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_PIGIO2_ACLB_MASK);
> > +		}
> > +
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	func =3D device_property_match_property_string(dev, "adi,pgio3-func",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio3_funcs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > ARRAY_SIZE(ltc4283_pgio3_funcs));
> > +
> > +	if (func < 0 && func !=3D -EINVAL)
> > +		return dev_err_probe(dev, func,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio3-func property\n");
> > +	if (func >=3D 0) {
> > +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> > +			__set_bit(LTC4283_PIN_PGIO3, &st->gpio_mask);
> > +			func++;
> > +		}
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> > +					 LTC4283_PGIO3_CFG_MASK,
> > +					 FIELD_PREP(LTC4283_PGIO3_CFG_MASK,
> > func));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	func =3D device_property_match_property_string(dev, "adi,pgio4-func",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio4_funcs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0
> > ARRAY_SIZE(ltc4283_pgio4_funcs));
> > +
> > +	if (func < 0 && func !=3D -EINVAL)
> > +		return dev_err_probe(dev, func,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio4-func property\n");
> > +	if (func >=3D 0) {
> > +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> > +			__set_bit(LTC4283_PIN_PGIO4, &st->gpio_mask);
> > +			func++;
> > +		} else {
> > +			st->ext_fault =3D true;
> > +		}
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> > +					 LTC4283_PGIO4_CFG_MASK,
> > +					 FIELD_PREP(LTC4283_PGIO4_CFG_MASK,
> > func));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_adio_config(struct ltc4283_hwmon *st, struct device
> > *dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *prop, u32 pin)
> > +{
> > +	u32 adc_idx;
> > +	int ret;
> > +
> > +	if (!device_property_read_bool(dev, prop))
> > +		return 0;
> > +
> > +	adc_idx =3D LTC4283_CHAN_ADIO_1 - LTC4283_CHAN_ADI_1 + pin;
> > +	ret =3D regmap_clear_bits(st->map, LTC4283_ADC_SELECT(adc_idx),
> > +				LTC4283_ADC_SELECT_MASK(adc_idx));
> > +	if (ret)
> > +		return ret;
> > +
> > +	__set_bit(pin, &st->gpio_mask);
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_pin_config(struct ltc4283_hwmon *st, struct device =
*dev)
> > +{
> > +	int ret;
> > +
> > +	ret =3D ltc4283_pgio_config(st, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio1",
> > LTC4283_PIN_ADIO1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio2",
> > LTC4283_PIN_ADIO2);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio3",
> > LTC4283_PIN_ADIO3);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ltc4283_adio_config(st, dev, "adi,gpio-on-adio4",
> > LTC4283_PIN_ADIO4);
> > +}
> > +
> > +static const char * const ltc4283_oc_fet_retry[] =3D {
> > +	"latch-off", "1", "7", "unlimited"
> > +};
> > +
> > +static const u32 ltc4283_fb_factor[] =3D {
> > +	100, 50, 20, 10
> > +};
> > +
> > +static const u32 ltc4283_cooling_dl[] =3D {
> > +	512, 1002, 2005, 4100, 8190, 16400, 32800, 65600
> > +};
> > +
> > +static const u32 ltc4283_fet_bad_delay[] =3D {
> > +	256, 512, 1002, 2005
> > +};
> > +
> > +static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
> > +{
> > +	int ret;
> > +
> > +	/* The part has an eeprom so let's get the needed defaults from it
> > */
> > +	ret =3D ltc4283_get_defaults(st);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D device_property_read_u32(dev, "adi,rsense-nano-ohms",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &st->rsense);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to read adi,rsense-nano-
> > ohms\n");
> > +	if (st->rsense < CENTI)
> > +		return dev_err_probe(dev, -EINVAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "adi,rsense-nano-ohms too small (<
> > %lu)\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 CENTI);
> > +
> > +	/*
> > +	 * The resolution for rsense is tenths of micro (eg: 62.5 uOhm)
> > which
> > +	 * means we need nano in the bindings. However, to make things
> > easier to
> > +	 * handle (with respect to overflows) we divide it by 100 as we
> > don't
> > +	 * really need the last two digits.
> > +	 */
> > +	st->rsense /=3D CENTI;
> > +
> > +	ret =3D device_property_read_u32(dev, "adi,current-limit-sense-
> > microvolt",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &st->vsense_max);
> > +	if (!ret) {
> > +		u32 reg_val;
> > +
> > +		if (!in_range(st->vsense_max, LTC4283_VILIM_MIN_uV,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_VILIM_RANGE)) {
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,current-limit-sense-
> > microvolt (%u) out of range [%u %u]\n",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 st->vsense_max,
> > LTC4283_VILIM_MIN_uV,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_VILIM_MAX_uV);
> > +		}
> > +
> > +		st->vsense_max /=3D MILLI;
> > +		reg_val =3D FIELD_PREP(LTC4283_ILIM_MASK,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 st->vsense_max - LTC4283_VILIM_MIN_uV
> > / MILLI);
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_1,
> > +					 LTC4283_ILIM_MASK, reg_val);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,current-limit-
> > foldback-factor",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_fb_factor,
> > ARRAY_SIZE(ltc4283_fb_factor));
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret < ARRAY_SIZE(ltc4283_fb_factor)) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_1,
> > LTC4283_FB_MASK,
> > +					 FIELD_PREP(LTC4283_FB_MASK, ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,cooling-delay-ms",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_cooling_dl,
> > ARRAY_SIZE(ltc4283_cooling_dl));
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret < ARRAY_SIZE(ltc4283_cooling_dl)) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_2,
> > LTC4283_COOLING_DL_MASK,
> > +				=09
> > FIELD_PREP(LTC4283_COOLING_DL_MASK, ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,fet-bad-timer-delay-
> > ms",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_fet_bad_delay,
> > ARRAY_SIZE(ltc4283_fet_bad_delay));
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret < ARRAY_SIZE(ltc4283_fet_bad_delay)) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_2,
> > LTC4283_FTBD_DL_MASK,
> > +					 FIELD_PREP(LTC4283_FTBD_DL_MASK,
> > ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4283_set_max_limits(st, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_pin_config(st, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (device_property_read_bool(dev, "adi,power-good-reset-on-fet"))
> > {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> > +					LTC4283_PWRGD_RST_CTRL_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,fet-turn-off-disable")) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> > +					LTC4283_FET_BAD_OFF_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,tmr-pull-down-disable")) {
> > +		ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_1,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_THERM_TMR_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,dvdt-inrush-control-
> > disable")) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> > +					LTC4283_DVDT_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,undervoltage-retry-
> > disable")) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_2,
> > +					LTC4283_UV_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,overvoltage-retry-
> > disable")) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_2,
> > +					LTC4283_OV_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,external-fault-retry-
> > enable")) {
> > +		if (!st->ext_fault)
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,external-fault-retry-
> > enable set but PGIO4 not configured\n");
> > +		ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_2,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_EXT_FAULT_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
> > +		ret =3D regmap_set_bits(st->map, LTC4283_FAULT_LOG_CTRL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_FAULT_LOG_EN_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D device_property_match_property_string(dev, "adi,overcurrent-
> > retries",
> > +						=C2=A0=C2=A0=C2=A0 ltc4283_oc_fet_retry,
> > +						=C2=A0=C2=A0=C2=A0
> > ARRAY_SIZE(ltc4283_oc_fet_retry));
> > +	/* We still want to catch when an invalid string is given. */
> > +	if (ret !=3D -EINVAL)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "adi,overcurrent-retries invalid
> > value\n");
> > +	if (ret >=3D 0) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONTROL_2,
> > +					 LTC4283_OC_RETRY_MASK,
> > +					 FIELD_PREP(LTC4283_OC_RETRY_MASK,
> > ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D device_property_match_property_string(dev, "adi,fet-bad-
> > retries",
> > +						=C2=A0=C2=A0=C2=A0 ltc4283_oc_fet_retry,
> > +						=C2=A0=C2=A0=C2=A0
> > ARRAY_SIZE(ltc4283_oc_fet_retry));
> > +	if (ret !=3D -EINVAL)
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "adi,fet-bad-retries invalid
> > value\n");
> > +	if (ret >=3D 0) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONTROL_2,
> > +					 LTC4283_FET_BAD_RETRY_MASK,
> > +				=09
> > FIELD_PREP(LTC4283_FET_BAD_RETRY_MASK, ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,external-fault-fet-off-
> > enable")) {
> > +		if (!st->ext_fault)
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,external-fault-fet-off-
> > enable set but PGIO4 not configured\n");
> > +		ret =3D regmap_set_bits(st->map, LTC4283_CONFIG_3,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_EXTFLT_TURN_OFF_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,vpower-drns-enable")) {
> > +		u32 drns_chan =3D LTC4283_CHAN_DRNS - LTC4283_CHAN_ADI_1;
> > +
> > +		ret =3D regmap_set_bits(st->map, LTC4283_CONFIG_3,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_VPWR_DRNS_MASK);
> > +		if (ret)
> > +			return ret;
> > +
> > +		/*
> > +		 * Then, let's by default disable the DRNS channel from the
> > ADC2
> > +		 * as this is already being monitored by the VPWR channel.
> > One
> > +		 * can still enable it later on if needed.
> > +		 */
> > +		ret =3D regmap_clear_bits(st->map,
> > LTC4283_ADC_SELECT(drns_chan),
> > +					LTC4283_ADC_SELECT_MASK(drns_chan))
> > ;
> > +		if (ret)
> > +			return ret;
> > +
> > +		__clear_bit(LTC4283_CHAN_DRNS, &st->ch_enable_mask);
> > +	}
> > +
> > +	/* Make sure the ADC has 12bit resolution since we're assuming
> > that. */
> > +	ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG_2,
> > +				 LTC4283_ADC_MASK,
> > +				 FIELD_PREP(LTC4283_ADC_MASK, 3));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Make sure we are integrating power as we only support reporting
> > +	 * consumed energy.
> > +	 */
> > +	return regmap_clear_bits(st->map, LTC4283_METER_CONTROL,
> > +				 LTC4283_INTEGRATE_I_MASK);
> > +}
> > +
> > +static const struct hwmon_channel_info * const ltc4283_info[] =3D {
> > +	HWMON_CHANNEL_INFO(in,
> > +			=C2=A0=C2=A0 HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_MAX_ALARM | HWMON_I_RESET_HISTORY |
> > +			=C2=A0=C2=A0 HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_FAULT | HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL),
> > +	HWMON_CHANNEL_INFO(curr,
> > +			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST
> > |
> > +			=C2=A0=C2=A0 HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> > +			=C2=A0=C2=A0 HWMON_C_RESET_HISTORY | HWMON_C_LABEL),
> > +	HWMON_CHANNEL_INFO(power,
> > +			=C2=A0=C2=A0 HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
> > +			=C2=A0=C2=A0 HWMON_P_INPUT_HIGHEST | HWMON_P_MAX |
> > HWMON_P_MIN |
> > +			=C2=A0=C2=A0 HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_P_RESET_HISTORY | HWMON_P_LABEL),
> > +	HWMON_CHANNEL_INFO(energy,
> > +			=C2=A0=C2=A0 HWMON_E_ENABLE | HWMON_E_LABEL),
> > +	NULL
> > +};
> > +
> > +static const struct hwmon_ops ltc4283_ops =3D {
> > +	.read =3D ltc4283_read,
> > +	.write =3D ltc4283_write,
> > +	.is_visible =3D ltc4283_is_visible,
> > +	.read_string =3D ltc4283_read_labels,
> > +};
> > +
> > +static const struct hwmon_chip_info ltc4283_chip_info =3D {
> > +	.ops =3D &ltc4283_ops,
> > +	.info =3D ltc4283_info,
> > +};
> > +
> > +/* energy attributes are 6bytes wide so we need u64 */
> > +static SENSOR_DEVICE_ATTR_RO(energy1_input, ltc4283_energy, 0);
> > +
> > +static struct attribute *ltc4283_attrs[] =3D {
> > +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> > +	NULL
> > +};
> > +ATTRIBUTE_GROUPS(ltc4283);
> > +
> > +static int ltc4283_show_fault_log(void *arg, u64 *val, u32 mask)
> > +{
> > +	struct ltc4283_hwmon *st =3D arg;
> > +	long alarm;
> > +	int ret;
> > +
> > +	ret =3D ltc4283_read_alarm(st, LTC4283_FAULT_LOG, mask, &alarm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D alarm;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_show_in0_lcrit_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_UV_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_in0_lcrit_fault_log,
> > +			 ltc4283_show_in0_lcrit_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_in0_crit_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_OV_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_in0_crit_fault_log,
> > +			 ltc4283_show_in0_crit_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_fet_bad_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val,
> > LTC4283_FET_BAD_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_fet_bad_fault_log,
> > +			 ltc4283_show_fet_bad_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_fet_short_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val,
> > LTC4283_FET_SHORT_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_fet_short_fault_log,
> > +			 ltc4283_show_fet_short_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_curr1_crit_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_OC_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_curr1_crit_fault_log,
> > +			 ltc4283_show_curr1_crit_fault_log, NULL,
> > "%llu\n");
> > +
> > +static int ltc4283_show_power1_failed_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val,
> > LTC4283_PWR_FAIL_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_power1_failed_fault_log,
> > +			 ltc4283_show_power1_failed_fault_log, NULL,
> > "%llu\n");
> > +
> > +static int ltc4283_show_power1_good_input_fault_log(void *arg, u64 *va=
l)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_PGI_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_power1_good_input_fault_log,
> > +			 ltc4283_show_power1_good_input_fault_log, NULL,
> > "%llu\n");
> > +
> > +static void ltc4283_debugfs_init(struct ltc4283_hwmon *st, struct
> > i2c_client *i2c)
> > +{
> > +	debugfs_create_file_unsafe("in0_crit_fault_log", 0400, i2c-
> > >debugfs, st,
> > +				=C2=A0=C2=A0 &ltc4283_in0_crit_fault_log);
> > +	debugfs_create_file_unsafe("in0_lcrit_fault_log", 0400, i2c-
> > >debugfs, st,
> > +				=C2=A0=C2=A0 &ltc4283_in0_lcrit_fault_log);
> > +	debugfs_create_file_unsafe("in0_fet_bad_fault_log", 0400, i2c-
> > >debugfs, st,
> > +				=C2=A0=C2=A0 &ltc4283_fet_bad_fault_log);
> > +	debugfs_create_file_unsafe("in0_fet_short_fault_log", 0400, i2c-
> > >debugfs, st,
> > +				=C2=A0=C2=A0 &ltc4283_fet_short_fault_log);
> > +	debugfs_create_file_unsafe("curr1_crit_fault_log", 0400, i2c-
> > >debugfs, st,
> > +				=C2=A0=C2=A0 &ltc4283_curr1_crit_fault_log);
> > +	debugfs_create_file_unsafe("power1_failed_fault_log", 0400, i2c-
> > >debugfs, st,
> > +				=C2=A0=C2=A0 &ltc4283_power1_failed_fault_log);
> > +	debugfs_create_file_unsafe("power1_good_input_fault_log", 0400,
> > i2c->debugfs,
> > +				=C2=A0=C2=A0 st,
> > &ltc4283_power1_good_input_fault_log);
> > +}
> > +
> > +static bool ltc4283_writable_reg(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case LTC4283_SYSTEM_STATUS ... LTC4283_FAULT_STATUS:
> > +		return false;
> > +	case LTC4283_RESERVED_OC:
> > +		return false;
> > +	case LTC4283_RESERVED_86 ... LTC4283_RESERVED_8F:
> > +		return false;
> > +	case LTC4283_RESERVED_91 ... LTC4283_RESERVED_A1:
> > +		return false;
> > +	case LTC4283_RESERVED_A3:
> > +		return false;
> > +	case LTC4283_RESERVED_AC:
> > +		return false;
> > +	case LTC4283_POWER_PLAY_MSB ... LTC4283_POWER_PLAY_LSB:
> > +		return false;
> > +	case LTC4283_RESERVED_F1 ... LTC4283_RESERVED_FF:
> > +		return false;
> > +	default:
> > +		return true;
> > +	}
> > +}
> > +
> > +static const struct regmap_config ltc4283_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +	.max_register =3D 0xff,
> > +	.writeable_reg =3D ltc4283_writable_reg,
> > +};
> > +
> > +static int ltc4283_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev =3D &client->dev, *hwmon;
> > +	struct auxiliary_device *adev;
> > +	struct ltc4283_hwmon *st;
> > +	int ret;
> > +
> > +	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> > +	if (!st)
> > +		return -ENOMEM;
> > +
> > +	st->map =3D devm_regmap_init_i2c(client, &ltc4283_regmap_config);
> > +	if (IS_ERR(st->map))
> > +		return dev_err_probe(dev, PTR_ERR(st->map),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to create regmap\n");
> > +
> > +	ret =3D ltc4283_setup(st, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D devm_mutex_init(dev, &st->lock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	hwmon =3D devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 &ltc4283_chip_info,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_groups);
> > +
> > +	if (IS_ERR(hwmon))
> > +		return PTR_ERR(hwmon);
> > +
> > +	ltc4283_debugfs_init(st, client);
> > +
> > +	if (!st->gpio_mask)
> > +		return 0;
> > +
> > +	adev =3D devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> > +	if (!adev)
> > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO
> > device\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ltc4283_of_match[] =3D {
> > +	{ .compatible =3D "adi,ltc4283" },
> > +	{ }
> > +};
> > +
> > +static const struct i2c_device_id ltc4283_i2c_id[] =3D {
> > +	{ "ltc4283" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ltc4283_i2c_id);
> > +
> > +static struct i2c_driver ltc4283_driver =3D {
> > +	.driver	=3D {
> > +		.name =3D "ltc4283",
> > +		.of_match_table =3D ltc4283_of_match,
> > +	},
> > +	.probe =3D ltc4283_probe,
> > +	.id_table =3D ltc4283_i2c_id,
> > +};
> > +module_i2c_driver(ltc4283_driver);
> > +
> > +MODULE_AUTHOR("Nuno S=C3=A1 <nuno.sa@analog.com>");
> > +MODULE_DESCRIPTION("LTC4283 How Swap Controller driver");
> > +MODULE_LICENSE("GPL");
> >=20

