Return-Path: <linux-gpio+bounces-25807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970F5B4AA89
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D98014E63D0
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 10:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120DA31CA40;
	Tue,  9 Sep 2025 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTsHfrYq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54731C587;
	Tue,  9 Sep 2025 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413511; cv=none; b=Q5Ll2uMq49TPslDjlLJNxfN2Te0GJYk6vOkp8zbsqVOnYBjHZO4mXaRLfDu1Kgd3zl2SqhHtUZ+2MXA5tlpca95w0Q910qVRpik/yLCtSEc/T8H5s135suxLbBtS5fj/JOlW1XuLMFWFE96JcdevAEzmpvBiKRiLhstH6hIcqRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413511; c=relaxed/simple;
	bh=l/5gzFI6b8fbqA2nvKDgbGnH+CK2hVLTvP9O+FQjpTY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sHmcjBq7DMqvzZnuGh8pEPmogSM+W6zudp4d8Aa5nUMb668rgv1IQsfaivglX/d9tS96xs3muLkHNDcySiY2pefufRqJmRKOwkpuVNYHJLiPEKuLjfvehNfin0P+dMX5GGUzZyMPoG1hr8FI/bVt5XlUooGhIEWajeGOVGt2jxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTsHfrYq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b0475ce7f41so945948966b.1;
        Tue, 09 Sep 2025 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757413508; x=1758018308; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l/5gzFI6b8fbqA2nvKDgbGnH+CK2hVLTvP9O+FQjpTY=;
        b=HTsHfrYqxwmQc/A6HcJH3W4i9tj1P3IKLnQ1Ly7y6YbOrpoMs8fEw7Pn5Kvp6HMEy3
         jtPmI3RZjMkuLM+rHkyzbVEcY/aEV+EOQK/kYbv6BjcAO3mCtABPAKqnMHKc7rf+cxY8
         SCkvQZqkgrI7HqxAi/gMsSUJRYi0u7Gf0HRJC4k0SI31/9vjIPCv30ySHVoxqhuj04mT
         r6oDEOIMWdJY4HDmwMZnG6vmQKRR2kO+Sv/X4/J6Qu27svLbxgeMl7MpidYhCiTSBuBv
         trvnAgFcCg4lYzvHUQXo0Rkg8S0VIL9bmMad/zvMFMWpZVSB1Rea43tHP9B51aoHeepj
         d9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413508; x=1758018308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/5gzFI6b8fbqA2nvKDgbGnH+CK2hVLTvP9O+FQjpTY=;
        b=H3LEeeU8yWXeGV7419xFD0QAokRBo/zoM5wpiitJVIJ5SBYTEV9W2I94m1GvInygbf
         r5O1Z5qzb+9q+cD+BSP2NPz3UM1XCGqqJmom0VN7R9aaBL/l587FubWliGSnbd/PhxrI
         O9EjlGKTIoer4TV8ZsRLbRYlIbVAXkQjE2wnk8lo3yGeB73jUcGDNoFebtumgg0UjPxZ
         bTh9AY4IRkK6UkiypUnfzJWvAM/Wjx/XxEn5dWn6z0Tt9w10wZH5BC7vjGhWgd02pi/G
         8yuAhvp/ax+4cuO/6UNIDo9YSMZT7O4zv5TZ7oHgDPeW+yQewKfW+kkuiaFVH1+Ui9bD
         cyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVedzGObF3fyDbkpVqM8ntbG2AewQcVFU0OAlMfG+f7L3FGpcjAucLgHm6ToZ+0DvwzqUvxQeBwAUvJ@vger.kernel.org, AJvYcCW56Aee6VzKYXO5UbEBewbKk9vTF1MWlNMmLSUVFFkq8anpqG73zNd4DvFswF3ua9NAC2Ie9vT6A2F8Aw==@vger.kernel.org, AJvYcCXKKBX1eesMuvDa0Qo9xzMw+GdhjnBvwz0k0ocEHVTVzms4gSNTGQ4A6IF/bBHYcfyKZn4hUGXaXVoG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ/3/KP9o7stjIsQfRDwsQbH/jmdIaiN1h2bUmaDWYJPcJ6cAU
	NZ9SCcfIXxEMjF3tsbbizHEcCebPfeWZW6MdiFkn8rVZlHsuNL0FQIWu
X-Gm-Gg: ASbGncvMHcq7uMRlMcywSqaWxjeCzGFIZ3ZfR/jzsdIb5MmbAFwT0+JY5qSCF4jzBnp
	C9z2I5cwI1ETIvC4yeQyNCiIaBOO/1FxSPX7uWDM3Ti/t6F8eGKN0mFtZRaNAmOLjXla9M1Fj5d
	XdAbMdkY8gdzS+f7WPuL44AXYEUu3YYn9ceAylMAl65nMrRPETTTXF8nQpzfFnfesQE505IoeN1
	SQuL66rgiTRQvqLibLjzzPxVxAZSK2qeMK6kYoGL6uAgXgoKpp193k0odwkg/0eic/TfZYeCwTg
	MUsLsy26loSnAXsXiGlw09KnS0BQKzoF6eMkIrVSZ7y2TY+0D35hQnSOjv//4xsQQNed454dylY
	j88+Hr83gQhZv4xsz29aey2s=
X-Google-Smtp-Source: AGHT+IGJRqMThdCz5eYAro1ZqiwOu+2iK0cjiEraUSYJY0u8glc8BOzF50GlplJD4rpkw8dBxYWB0g==
X-Received: by 2002:a17:907:1c28:b0:b04:6fc9:f101 with SMTP id a640c23a62f3a-b04b16ca6b0mr1154926466b.54.1757413508146;
        Tue, 09 Sep 2025 03:25:08 -0700 (PDT)
Received: from [10.5.0.2] ([45.94.208.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04b89f4001sm707033466b.98.2025.09.09.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:25:07 -0700 (PDT)
Message-ID: <a7bb4d2057af52f23a73f439190261f8253b9d5c.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare
	 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet
	 <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:25:32 +0100
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

(forgot to reply to this)

Hmm SENSOR_LTC4283 already depends on that and REGMAP (and selects AUXBUS) =
so
isn't enough to depend on SENSOR_LTC4283? Or is the above so that we can do
COMPILE_TEST?

- Nuno S=C3=A1

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
> Yours,
> Linus Walleij

