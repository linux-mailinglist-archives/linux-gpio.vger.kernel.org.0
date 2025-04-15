Return-Path: <linux-gpio+bounces-18835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B23A8977E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 11:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78F1189CB6E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574EC27B4E3;
	Tue, 15 Apr 2025 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIobY3En"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE8A27FD4D;
	Tue, 15 Apr 2025 09:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708013; cv=none; b=SJrs5nimueVH7xrQA56gZWkKNsdxC/moAL8p9W/sYOXEMiOKweGcXXR7A0tfaxvFOq+hAtC8Nec/NKco1Lj7aE3dPU67Kp2ZUbk0u9FFY02b+Azq5kKWci9YQ9lHs5xMbVJ+2l0AHIxvoSusphf+a6/k60Byc6kiCyI7enSVK/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708013; c=relaxed/simple;
	bh=O/d31RAm1mGcy+kfMhiEw/6FixiYmW/gas2RnLCYDls=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gaFxqGAR+0rNuE0vvk2jqEhYqY0uldHQwdh2X/VWoMDWBafKjgplMvTzoDWa3NjC4xX3BzeqdyqgH/tiu1H7ZBzLvcKaYE78fOmXAJ3G6krPJVfbgVp8L5lqGcNlDrBPkAlEwqEh6KEGfWCES/SQXbjyEQfgDWmmSQwFT9thi4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIobY3En; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso35693505e9.3;
        Tue, 15 Apr 2025 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744708009; x=1745312809; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R4weQ0hJdqt2Ob7aD2MCcANU6053ICls1QjwBHiZL6E=;
        b=QIobY3Eny6N3DKT7XwUEPTjsvsMDFtmDH4zAosUYicKF0FcMg3rjIg6DpQ0o4O+/OW
         q2REjt5iIqWkwKLCX1YpLQDKWbxRrupTiG1jFpT4VE9o8DmxbcsZOh/dO0eLusWkHog0
         ZtWNg9rlAEa/YJBZDUT+GsvepMocNZDKUcK0O79TNMDFMExjw0NBlulPyb85jb9Z6TPh
         Zb9WhNZW9HHnOAihVJ8QCRpuWuO6a09k+RPXN6MDkRdWM9Pf4OLBzjQcE2nYMMjLVcQG
         ZUcsndjJijm9DD/CaxAUbDnu46TMpSMpQNCgWtcLfb0imeFiWeghRkXqIPjCuOzrDDS3
         00hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708009; x=1745312809;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4weQ0hJdqt2Ob7aD2MCcANU6053ICls1QjwBHiZL6E=;
        b=Ig3qous0+rQ8YqDdKRJD5NR0njdmJXPJctFyxrpvYbY8cnn7DVAnmZChPYfa5pdD6+
         V8RHwp1iZVDcVB332t/gVBN16Yg3eyBVz1YOgl5SM22ucX4Cyx8jblXhGWhwMyvLxAnv
         l5FKxQyuWInWLgvhiYmiP2urQkdETCYllu8p/cTd0Y3m9SpuUekaMrwIJ3gKtREtMW5m
         YizmYGnqlOYUG37SkZ6nJ/4Qy6Rh5/cKBaHBzvGe9y2y8hSiqNRfC8hgtjAbW2Omkht+
         JZtM/lKalY85FkvtbyY8YBCzbt30CXqewZ7E4nZ2/NGL68chT3947d0B6JwOkjObQ4O8
         so/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEaUxhhOPUnVyOLLpbVW/uhooICM50tsL2C16Jb17ztnrBYlJbii3lwtKBnBxxIu/8vYdtWan9MG7v@vger.kernel.org, AJvYcCXegusmiqhVyM1Vn9C2NOFNKpK1B8h/669F5LkMhm9+o7kzjZ81qoobTIuajVgwtvQRDyDseDTgDVXGtoF3@vger.kernel.org
X-Gm-Message-State: AOJu0YyBay9KsECYtDXSXFkBbDP554F3s07e1BBBQW2Kv8685oj/jqXA
	TPKG/kEMiuKIAdhdbLgILUFVbAuIBDm6ixOq5cDpnx6nGc8B+Hx1en2qvo9toJPTYQ==
X-Gm-Gg: ASbGncsQiy8LXvPlXJINTFElIZc3tN/ktd7Rt7N/wc8c+7F/+UJ51KmGPb8k5H2pwZ9
	uVF1IPoycWTwx54tE8KaxRCoIbos+xM4+RfZ7NjXDL51W+B2W0e2Bd7WtXliOC6SqY7m/e7C/sN
	K8bflQ0yhsOKALC8mE/gigBiqWhX983I0EFWXqIYjN2Kcba5bJQ97y1WKqBfsmv0pXlnd08j/IV
	E0vRUtLWP3EQ69xf20RBydMJWRX7nvtJJ7e1wgpQf7hIBALSv8mPDjFny232cFRM+17tL9e6xPi
	u0G0TpJ51flLQEDhDmLnQAs61dPTjypR7DHyvtc/ZTinsD26/VdCAIAojK7mTHSlaUo3elLp9Z3
	O7jfuJ5z1VKOJ
X-Google-Smtp-Source: AGHT+IHS7QLmS9RJ7Ep5aiRG98JXmZ4nWjOytHx+fAY1q9twG8rVUIYxqAD4RY2hPgDmNpv+lI2UdA==
X-Received: by 2002:a05:600c:1d84:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43f3a9b014emr122590615e9.29.1744708009373;
        Tue, 15 Apr 2025 02:06:49 -0700 (PDT)
Received: from ?IPv6:2001:818:ea8e:7f00:2575:914:eedd:620e? ([2001:818:ea8e:7f00:2575:914:eedd:620e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97c243sm13680510f8f.59.2025.04.15.02.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:06:49 -0700 (PDT)
Message-ID: <4cd7b1ea029f7cdb6312f61b1008116b58b85efe.camel@gmail.com>
Subject: Re: [PATCH 3/3] Input: adp5589 - use new GPIO line value setter
 callbacks
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Michael Hennerich	
 <michael.hennerich@analog.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,  Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Date: Tue, 15 Apr 2025 10:06:51 +0100
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org>
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
	 <20250407-gpiochip-set-rv-input-v1-3-a8b45b18e79c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-04-07 at 09:19 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Let's maybe drop this one? I'll send a new version of this [1] that will dr=
op
this driver...

BTW, I can already change my v2 and use .set_rv()...

[1]: https://lore.kernel.org/linux-input/20250313-dev-adp5589-fw-v1-13-20e8=
0d4bd4ea@analog.com/

- Nuno S=C3=A1

> =C2=A0drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
> =C2=A01 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/input/keyboard/adp5589-keys.c
> b/drivers/input/keyboard/adp5589-keys.c
> index 81d0876ee358..986a789f1ec3 100644
> --- a/drivers/input/keyboard/adp5589-keys.c
> +++ b/drivers/input/keyboard/adp5589-keys.c
> @@ -404,8 +404,8 @@ static int adp5589_gpio_get_value(struct gpio_chip *c=
hip,
> unsigned off)
> =C2=A0	return !!(val & bit);
> =C2=A0}
> =C2=A0
> -static void adp5589_gpio_set_value(struct gpio_chip *chip,
> -				=C2=A0=C2=A0 unsigned off, int val)
> +static int adp5589_gpio_set_value(struct gpio_chip *chip, unsigned int o=
ff,
> +				=C2=A0 int val)
> =C2=A0{
> =C2=A0	struct adp5589_kpad *kpad =3D gpiochip_get_data(chip);
> =C2=A0	unsigned int bank =3D kpad->var->bank(kpad->gpiomap[off]);
> @@ -418,8 +418,9 @@ static void adp5589_gpio_set_value(struct gpio_chip *=
chip,
> =C2=A0	else
> =C2=A0		kpad->dat_out[bank] &=3D ~bit;
> =C2=A0
> -	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) +
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bank, kpad->dat_out[bank]);
> +	return adp5589_write(kpad->client,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + ban=
k,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 kpad->dat_out[bank]);
> =C2=A0}
> =C2=A0
> =C2=A0static int adp5589_gpio_direction_input(struct gpio_chip *chip, uns=
igned off)
> @@ -520,7 +521,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad=
)
> =C2=A0	kpad->gc.direction_input =3D adp5589_gpio_direction_input;
> =C2=A0	kpad->gc.direction_output =3D adp5589_gpio_direction_output;
> =C2=A0	kpad->gc.get =3D adp5589_gpio_get_value;
> -	kpad->gc.set =3D adp5589_gpio_set_value;
> +	kpad->gc.set_rv =3D adp5589_gpio_set_value;
> =C2=A0	kpad->gc.can_sleep =3D 1;
> =C2=A0
> =C2=A0	kpad->gc.base =3D gpio_data->gpio_start;

