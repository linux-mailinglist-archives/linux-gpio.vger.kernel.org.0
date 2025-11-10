Return-Path: <linux-gpio+bounces-28298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC7C469E5
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 13:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C3A93A3008
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 12:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294E830AACE;
	Mon, 10 Nov 2025 12:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEbv6jB5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1AA30EF87
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777938; cv=none; b=GrZXqFSQeZO5MiD2mGjwaguWQinThr3BhiXJOIfqtFMbGC7oMoOZhQxFOjpab/r5dndhfWZ1EFhqPD9rS9DgfUhJqoYQjNd0HXh6kmERK1mCV9pR2OQGW07XdtZMONjipGoeq3Lh2VisMPdoALs6hs8GmaX08Xzt4umUn0Un+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777938; c=relaxed/simple;
	bh=xbn6RDPlAz1JBYaCMfNzcorMgqIxLXlfE2DgvYo/pIc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eEHa+j4lDhOafEZHC4GTej+Ico6CA9dabTNF50kDJ/2loWd51tufY3G+l/6madE5ETFvMTD3XniYCg3GFEahVRmM5PyqsSrp8g+gkFN7V2tE7lngQfuBoOP/VkV9ZmgVcNIHzXAcMelCUImc3JvzGjXs52BeAV1umgfBl0vWls4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEbv6jB5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477770019e4so19194105e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 04:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762777926; x=1763382726; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xbn6RDPlAz1JBYaCMfNzcorMgqIxLXlfE2DgvYo/pIc=;
        b=bEbv6jB5OfPLMDJaO4TwA3DEv525aPXe4vHlZsC3Fnz4CBv+nrEha6tiuzCu7FvoTW
         U4kwm0SiFUi2YKtt3+hQ5+UJd5PddicKITkipZM4fmp2gmNcJzSpqv/L8HoiEe88Y4ta
         k7+Zi7vMJZiiGkH8WzvF6h7y7CxitWjtTAw/R92IckmpNTGrcixZuq0YIjYffl0LvEGW
         Wzkf+JMvtpPeBmWSeqWK1QYqSjsgEwmqIWAwy/NxvBaVr3HFuoYirZ0hZY+KiFHRbj/8
         37EQQeUBuhl5VFwLRyRzwSmJKG0L0XcPqvcMjNh3PLjd5iqJyb9UmYlEb5yoZ7Pxmt0I
         NN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762777926; x=1763382726;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbn6RDPlAz1JBYaCMfNzcorMgqIxLXlfE2DgvYo/pIc=;
        b=aqZAm/J4+XNpH/sjt7PvPGadxi/fnVsMjX5KuOJrtYA7QNAhVQgMx4/6wnSdDHOBsN
         MZrW+N/teVfy4bYwlW3riswNh7JtK4ejFL+Ak1lzumqFNVM1mMwE6gjghvCDnV4bIhBk
         gVurNN7hxI5iZ7v0uGCS4O48yai8hagTGC04peanf+oZJPPKqw/8vrmjtVuMDLKaZh6R
         K4oKcnoOpacQPUY0BkFDS0QHSqESYlWDlUWvizrqBc4HQIuAdYXT70Pjp/72BDG6yUzx
         6bx6eu0IjVfC4KFwhtQCHVlAIepn2MPUldiNdVhfLY3n7HXg3SFRQ4gNjyN4lI8zcKJm
         86/A==
X-Forwarded-Encrypted: i=1; AJvYcCVP/3YE1KptiVg7CykyRtD6TeAakvFqhAv4khfCypy5koZf8eu0igfN628Xjbbu3ZSZVORdg1nQxWM9@vger.kernel.org
X-Gm-Message-State: AOJu0YykAJPfyOAJqa3IuIgTUHPLC2LFSjiaX6Jn8/f1o0KGi16+q1eQ
	bPWGt0MjCj8v5v/GBkXq5TpuiYbXbJeB92tMLJ2D/tigEqCrh8zjz+oZ
X-Gm-Gg: ASbGnctyGoFPa2InrYeTiAcCn1Y3cA9nZyNjqN+stTCfXPf0lSlxXmRLtnkwvGXn3AP
	ZbN94USADMdCatPK7hiZxTeOeVzPWofax4qIc8l0LyMEeq9uG/ZhqajF4QMgdetcY+LCTR/21xC
	XAJVU2K5mZFRz1EDez1i4rAOtWu0nrJCio9Cx9QlgvmuPdsherAFMFdcQgRPDxY4DJWczKTR5wi
	HnsN2dwCvlExCmJfXTQMMiHy2k9NwDmb21Si3ibDz0mKQiouprbCaV31Cpd9wMGikgTPGy3Gf+H
	XIc6DUQ64JAvEQFcXa9dHvUIwfgCFYGKSgSfb0JKPQYfnstCO9DDAV19L61D9xGZ39IT69RJGyz
	g9u9e8FUhk5ycwXJGDqDnWLuUwBrCoeoz6hdnbMy8XNIPD2+kVrt2XdVvVzC4EaGAVwaXEU4uIi
	AzfdXjDqoe
X-Google-Smtp-Source: AGHT+IGdjmBcJW+8X35ii7y+/PGwV34Q4JqH9e5PMe/Gj88DnW3qWYR3wQhKPBIE+gTXCpLrK7KBEA==
X-Received: by 2002:a05:600c:1c1c:b0:475:dac3:699f with SMTP id 5b1f17b1804b1-4777322f0c4mr73804405e9.9.1762777925514;
        Mon, 10 Nov 2025 04:32:05 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bd084d4sm249891675e9.14.2025.11.10.04.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:32:05 -0800 (PST)
Message-ID: <3ead5d7aa5e6be2b6df3bb91b35fec37e23353f3.camel@gmail.com>
Subject: Re: [PATCH 2/2] gpio: adg1712: add driver support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Antoniu Miclaus
	 <antoniu.miclaus@analog.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 12:32:42 +0000
In-Reply-To: <CACRpkdYdtcnxyP4xVsqVK+geurEOEURqZO5eLC96YMqh1sE5Sw@mail.gmail.com>
References: <20251031160710.13343-1-antoniu.miclaus@analog.com>
	 <20251031160710.13343-3-antoniu.miclaus@analog.com>
	 <CACRpkdYdtcnxyP4xVsqVK+geurEOEURqZO5eLC96YMqh1sE5Sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-11-10 at 11:30 +0100, Linus Walleij wrote:
> Hi Antoniu,
>=20
> thanks for your patch!
>=20
> On Fri, Oct 31, 2025 at 5:08=E2=80=AFPM Antoniu Miclaus
> <antoniu.miclaus@analog.com> wrote:
>=20
> > Add driver support for the ADG1712, which contains four independent
> > single-pole/single-throw (SPST) switches and operates with a
> > low-voltage single supply range from +1.08V to +5.5V or a low-voltage
> > dual supply range from =C2=B11.08V to =C2=B12.75V.
> >=20
> > Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
>=20
> So tying into the binding discussion:
>=20
> GPIO means "general purpose input/output".
>=20
> I am really confused as whether this is:
>=20
> - General purpose - seems to be for the purpose of switching
> =C2=A0 currents and nothing else.
>=20
> - Input/Output - It's switching something else and not inputting
> =C2=A0 or outputting anything and this makes the driver look strange.
>=20
>=20

Not the first time a part like this pops up [1]. At the time, the final
conclusion was to go with gpiolib. Naturally you can think otherwise now :)

Also, it looks like that series did not went anywhere (I'll probably ping t=
he author internally)


[1]:=C2=A0https://lore.kernel.org/linux-gpio/20250213-for_upstream-v2-2-ec4=
eff3b3cd5@analog.com/

- Nuno S=C3=A1


