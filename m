Return-Path: <linux-gpio+bounces-28741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D1C6DC82
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 10:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A36472DA1A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 09:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2E23446C9;
	Wed, 19 Nov 2025 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX1ZCmvK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76D43446A4
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545095; cv=none; b=k9EHa7JYbllFmcLa8wd3iSpiPjKrsteN1xSszmdwoN8u2BzPW45/K3so3gJ8eA2DzTS/BH2jIySRN22RyN8LOpA+WGryD0WGIgsDaTvZtDXbcsDJlVucn85SHTmowR2g6aegj8gBZ1hcNo0mupsNOhnIaZggNiqtBn27ffLtxcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545095; c=relaxed/simple;
	bh=BA/QhjEOAvnHt2a7jJ7yUqi14IVlgeBAOD2GlMeu5zQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DERMekg22xhsbWiNQ2dW9zumxzKqhuil94hD7Dw9RaqU6sobSOk0/66qOlOHbSekFNg0rQWntGBs5BIV3/D9W/1Jq0nKNYO4GkzgCQ7w+oADae6hDFP50FhhjLkgq/w6FqV1QMoeiOK3BVT9vRhLTH/xPp15IwJLlPKG/lPet9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX1ZCmvK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3498797f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 01:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763545092; x=1764149892; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BA/QhjEOAvnHt2a7jJ7yUqi14IVlgeBAOD2GlMeu5zQ=;
        b=XX1ZCmvKPU+4XAfKnHtjUnQ2v8HRoLpbk9zb8tU/BrgV6j4APOR8aZuOV66BDYICyy
         5hKGHRpFzTMiE85Igz2sGoC6sWHaK31Bi6YFrl1Lva6raOhaQvBnKiYOSzRnGD+ahxuS
         M4xtD2sWcF6rsg3g5JaXyHhFY0sB1Y+isHHZXDu69EWBqSC+U2zJLkKcHL6SFRzcQNuL
         /l37MQDLNZD8SeCLM5Ql3S7AUxU3gbl7xsdE0eYwBgBhqcVy/E6+JbmlBlkFh0D0vP8D
         LGUPk307OLT+34JYm3VRY6nkvXkBPXaK4+BLvGWSfCiG3u4y7ZfEFXUNWqvTVgxvG/R2
         Qzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763545092; x=1764149892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BA/QhjEOAvnHt2a7jJ7yUqi14IVlgeBAOD2GlMeu5zQ=;
        b=gKyNr2nJIeS5hinj87IAW2/G3PdXG9GoCzLyj38nueC8jBneta0eJOEOhJRZS1aoQr
         p0UUk3jQ5WbgyjboWgKe5v0oK/mun7DVbhDY8CwPTfZ43yYtonGGuSJZk0c5lONp3cm/
         E+md5Vgv3OXhtzbULeIQAzMl1LFttdLQl3I6CpEzI2lFzWbzxqCsOtRd9ph6zsu6MoIY
         jJeP+GUc5YKHyuQQPNnGt60K7h1KiDKvpHI1TSLJOssuFYTrn8UlrpqpiqlGFqX1tK2e
         SvKuLa2yOWhoB/u1I2ruIDE3JnGnwsRsRAL5uUeJZ+yl28zf/+wh4GcP80SqwiElaBjy
         uxlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC2KQa8GMTSpRNuXfT9t+EBdTipaTDfuggvBk9YRC03LaVGUfzGE/NAvxlUvMAhnkEtgQoQLJGUwGm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7clbhat52818Q1aPFrdnHzkBW3qEVYZwMAQr2Kr6UI3btzpd
	xih0J/u6OhSdYxTHKdCo1TOtyINwsQic1sT7g7Gc0bRBFLzDRmnJf6Qu
X-Gm-Gg: ASbGncvpmHuXBiqP7ccyWRIYx9MKTXJHIdHP0O8gHGCiskniXQ5h4a0ftLZCAq4xGP9
	KgMewacw9E9Dg0nyvPuUAXx+76ObdO/zLEsZBtrB6QiDjck1gUu3sHH3LqfaRvZEbMkK6eGr+X/
	rjSFy26fzlAnZ+Xk8+kWxDxMslzBjX6b1J6tSSUifrwy5Z69P1nlJ2G+z5/YmYvpUDXlHFHDuOM
	04kiJpsTYK7hPTg51ASfl9VWrqf/ai3GyvuU4UdEL0pWoHdXL8mEsWzDU89SM52/tIljpCg+yru
	oBP+mTLfV7xP49QxFmPoYUI0NZLn1A2ZtuOgGoBX3XTnbh7BxFjPRRiGSAf+zbYwphfz8mj1AwP
	K9RoESNG6Jo2WxYjCr8PoBYYjCFElPhzi+YTpxUERVC4hZK5JO4obSlPCvcvSv4XVOhb8PlDGfM
	IWar0QHcF4Kb0RM421lzmGJEjMK2VJKA==
X-Google-Smtp-Source: AGHT+IEWzNEjxbuCnmwYlkD23l9ZyNOLZ82woEGJ46u5TpbCp1tYUrkPolXaHpgj5iFjnral8XQ5kw==
X-Received: by 2002:a05:6000:3101:b0:42b:36f4:cd20 with SMTP id ffacd0b85a97d-42cb1f9e9bamr1758191f8f.27.1763545091879;
        Wed, 19 Nov 2025 01:38:11 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84b12sm38667604f8f.15.2025.11.19.01.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:38:11 -0800 (PST)
Message-ID: <67d177ef5fa41e597459f88159fd289354f7dde3.camel@gmail.com>
Subject: Re: [PATCH 2/2] gpio: adg1712: add driver support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 19 Nov 2025 09:38:49 +0000
In-Reply-To: <CACRpkdbZgxWaf7B7vwD3n-OSbt8h8vGKQ_CmB_SNjDG6aXHayA@mail.gmail.com>
References: <20251031160710.13343-1-antoniu.miclaus@analog.com>
	 <20251031160710.13343-3-antoniu.miclaus@analog.com>
	 <CACRpkdYdtcnxyP4xVsqVK+geurEOEURqZO5eLC96YMqh1sE5Sw@mail.gmail.com>
	 <3ead5d7aa5e6be2b6df3bb91b35fec37e23353f3.camel@gmail.com>
	 <CACRpkdZf9D2PH5AR46Pwi8UoyfwumKS4P3ncJ=RN4iu_cJzZ5w@mail.gmail.com>
	 <0cd7cf10d47683f22a4358635f243a2dfb6be564.camel@gmail.com>
	 <CACRpkdbZgxWaf7B7vwD3n-OSbt8h8vGKQ_CmB_SNjDG6aXHayA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-11-18 at 23:54 +0100, Linus Walleij wrote:
> On Tue, Nov 11, 2025 at 5:01=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.c=
om> wrote:
>=20
> [Me]
> > > - Implement .set_config() and implement the generic pin
> > > =C2=A0 control property PIN_CONFIG_OUTPUT_ENABLE as 1
> > > =C2=A0 to switch "on" and 0 for switch "off".
> > > =C2=A0 See include/linux/pinctrl/pinconf-generic.h
>=20
> > The above makes sense to me. I'll let Antoniu take it from here and che=
ck if
> > the above fits the usecases he is aware of. Not sure if it makes sense =
for a piece
> > of HW like this but if the usecase is for userspace to control the on/o=
ff states,
> > then I guess we would need .get() and .set(). Or some kind of "frontend=
" driver
> > making use of the consumer helpers.
>=20
> There is already GPIO_V2_LINE_SET_CONFIG_IOCTL
> in <uapi/linux/gpio.h> so setting configs from userspace is no issue,
> just use the character device.
>=20
> You will need to add I think two new config flags for userspace:
> GPIO_V2_LINE_FLAG_OUTPUT_ENABLE
> GPIO_V2_LINE_FLAG_OUTPUT_DISABLE
>=20
> And update gpio_v2_line_config_flags_to_desc_flags() in
> drivers/gpio/gpiolib-cdev.c accordingly.
>=20
> Then you probably want some tests or examples in libgpiod to make
> sure userspace is fine. Bartosz knows all about how to do this.
>=20

It seems there's no need for userspace control. If you look at v3, it seems
we don't really need it to be a gpiochip (at least, I think). Maybe take a =
look,
you might have some good pointers :)


Thx!
- Nuno S=C3=A1

