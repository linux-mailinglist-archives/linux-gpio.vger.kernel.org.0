Return-Path: <linux-gpio+bounces-25806-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84442B4AA57
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6E747A90D3
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 10:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59862EBB8C;
	Tue,  9 Sep 2025 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpqXtRyG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1476256C7E;
	Tue,  9 Sep 2025 10:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413340; cv=none; b=CUkaHlNa7sZUpKfU067EjBFIdmnEBHqNhT5WnszYDvqN6E9kafCFsS/nC3TsZXf3+OaTopOM91vnBPWfCdNwJBYCnpvq9xvz07H5DdQFoM4X4tAWL29tadMVFFdhNcth7VMk0Si9mB17lfyiZmASJ6C2D1MwS2kVtLTRaivVwxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413340; c=relaxed/simple;
	bh=kP+p4T77fU+/uQu2mK7yMlAfDmd3j6+05hh7HsoLMq0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YbK/+O7tMvkPx+9imBTbZSVGX63tS7h3Y3P69jtOb0zXEEpsSTH8R8uUGbOVm5xbg907NdDEw+4RNBodyB0/xQ0zh01XokrTOvlMTlO/nmJlNOfXA2wEEagTgSch885OcAvBR0kh91lEr12rKYs2BfoAv5B3+Yii/Lkc8vETXM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpqXtRyG; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b02c719a117so960675366b.1;
        Tue, 09 Sep 2025 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757413335; x=1758018135; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kP+p4T77fU+/uQu2mK7yMlAfDmd3j6+05hh7HsoLMq0=;
        b=cpqXtRyGlXngZ/3SwGcL5k4co31BHVBMezUu6fBbK6VdRcg0htTYYn/02NVhxml4h+
         62+V4Up5CAy5wfVwxU2NtbDMF9TWTJe7Mq5LaGSJGlK9Um5uucg+eftmZdhAJcBgIr2B
         FEebMJQMlRUx7gvp1bRSPV4ZIVwkjvF5VlJ59E3gYuMhLZpKc5jrNRjYlA9hryDWmheK
         9MPElJwcBqec6hPpZE71M0+yD5Dym+vCwr17c36aCmdPPCMbOr5ynlcFgOBhKM+HUnC6
         Je7YAzxiaNr46cH+Oo0jE6qJaAloRrUkSdJUf9Rx7Nw/YzX3KdgWRcvqwefSCGmx7L6K
         YzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413335; x=1758018135;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kP+p4T77fU+/uQu2mK7yMlAfDmd3j6+05hh7HsoLMq0=;
        b=WF1Pw0ARrfBsKYetu1AE8F3b9l+Xyhelj820hiHtv8QzJZGtVz2X2xAxDAPsRJGToR
         9O0Olzi0V5ixk3iXvwd27RLOuXcSa6Y1/s1R+gF54Y7+akRFPmP8BFi3A/2AkI0mzXnK
         +hZArv1Yenvr9lvr4GiMR3WymVl79A570jFOPJu7+5cNwQcKIZcMZlbBE2086iL/L3MD
         xCt3tzILvkYlJtduteMv8QqDFEEs8rxxIs+Azh+yXnT7SoBQCK2R1m9EYj8hOzxYLwjb
         N5O5hpUWTDWuWa/GXDEkuuGYZhvTeaUK41EPl7SLmdcJEXUpmh8jBK9zbQtV3FcpOHpY
         5Chw==
X-Forwarded-Encrypted: i=1; AJvYcCU4wAhlE3q0vplFs9Ulo/NfaF3Zr13JLHhy+6Sr1BdV+JRQGaey00z55ZRnRuuVrYuT+aDKrgT5f2sArg==@vger.kernel.org, AJvYcCU6v3TlMSxaxc1l0xVwWKVXksPBXY+WPTBRwiGt/FwECdAqIEeEJUMy3RjMcpQ88cc9dYaNKNtAxbt8@vger.kernel.org, AJvYcCXA+CXHNltpdNC328yedAwBE/fvpHwYO9cCLor1om0dHH9RtDlsLOFYY4AxOAExsMV3+e6E1BgcBThx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+jkaTUAyrzovhT4OxeMs+bTSF69QBzZ6u8L5XtQGRC7X8V3I8
	+tRCy9J7aI+SCks3VG2RZ6YVwhGebLeMqJ7a3tyFWF2MNoprOid0NkhHfLKw9oVfpFI=
X-Gm-Gg: ASbGncuXBfXI5WkrZhUcZuJM8Fe5FJ5XMy3p8ZXimD1SjAFXAu1xKmYpnaUCPrNmmg+
	WKI7NMZJvFd7T7waeQkUyjbsns4dYL2AQQEbl7p1VgYy7gxNmXwDYV/15cDkCCclzFiC87WhcLX
	gwYES338+TEsIKp3c/uLFZxa+FSzRtsy/9y3fVP1lTieToe+vIxb6U7AfbTKXpsdVS/X7UBlUgv
	oUf1UFQUAKDPMNkpnGtiqqXHAEEEWNv1/XheUxF67Yvsp2hV0X7f0walepwbAtyn07SwoMQ4GW3
	z/yp7tkTegDwqAlFH9zTd0kDsADygYMKOpSNklnwxdLN2s36lLM80+cSCtpxDwRoOf3pGxXVmql
	E4caQyINKZqXI1J/+7xrbIrLPJSZ+2Z0Wm3aDtLUcTbjr
X-Google-Smtp-Source: AGHT+IEeiZhQ5iRi/NkjSzSOS3+Gwg1chX2/517JIJATKBdRH5Qr4QTujWHjK/JQezMyCQLaAzb36w==
X-Received: by 2002:a17:907:97d3:b0:b04:5435:901b with SMTP id a640c23a62f3a-b04b177b6femr1105112566b.62.1757413334715;
        Tue, 09 Sep 2025 03:22:14 -0700 (PDT)
Received: from [10.5.0.2] ([45.94.208.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04709b3effsm1447556566b.5.2025.09.09.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:22:14 -0700 (PDT)
Message-ID: <9133df7af594a0066a555bc81332d7876bc08c82.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare
	 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet
	 <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:22:39 +0100
In-Reply-To: <CACRpkdbgcCjZbZ2HtrNO7vK1HXzrwxkrNFCzqGguq=ckKg3cFQ@mail.gmail.com>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
	 <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
	 <CACRpkdbgcCjZbZ2HtrNO7vK1HXzrwxkrNFCzqGguq=ckKg3cFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-09-04 at 21:57 +0200, Linus Walleij wrote:
> Hi Nuno,
>=20
> thanks for your patch!
>=20
> On Wed, Sep 3, 2025 at 12:04=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
> <devnull+nuno.sa.analog.com@kernel.org> wrote:
>=20
> > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> >=20
> > The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> >=20
> > Note that PGIO pins are not set as GPIOs by default so if they are
> > configured to be used as GPIOs we need to make sure to initialize them
> > to a sane default. They are set as inputs by default.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> (...)
>=20
> > +config GPIO_LTC4283
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Analog Devices LTC4283 =
GPIO support"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on SENSORS_LTC4283
>=20
> Could that be
> depends on REGMAP && (SENSOR_LTC4283 || COMPILE_TEST)
> ?
>=20
> Or does something blow up if you do that? (I guess it also needs
> AUXBUS but more on that below)
>=20
> should it also be
>=20
> default SENSOR_LTC4283
>=20
> Sof if that is compiled in (=3Dy) or module (=3Dm) then this becomes
> the same by default?
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you say yes here y=
ou want the GPIO function available in Analog
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Devices LTC4283 Negat=
ive Voltage Hot Swap Controller.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This driver can also =
be built as a module. If so, the module will
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be called gpio-ltc428=
3.
> > +
> > =C2=A0config GPIO_MB86S7X
>=20
> This is placed among the memory-mapped drivers, but:
>=20
> > +#include <linux/auxiliary_bus.h>
> (...)
> > +static struct auxiliary_driver ltc4283_gpio_driver =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .probe =3D ltc4283_gpio_probe,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id_table =3D ltc4283_aux_id_tabl=
e,
> > +};
> > +module_auxiliary_driver(ltc4283_gpio_driver);
>=20
> Create a new submenu for auxiliary bus drivers and add it
> there. We already have a submenu for MFD so why not?
>=20
> menu "AUXBUS GPIO expanders"
> =C2=A0 depends on AUXILIARY_BUS
> ...
>=20
> Have you looked into using GPIO_REGMAP?
> I guess some specials are used here so maybe it is
> not possible.
>=20

Yeps I looked and I even replied to you on some other thread

https://lore.kernel.org/linux-iio/908feb42783fd182c8b0f22ae5c147de2f7a60d2.=
camel@gmail.com/

So for now, .init_valid_mask() is the real blocker (I think)

- Nuno S=C3=A1

> Yours,
> Linus Walleij

