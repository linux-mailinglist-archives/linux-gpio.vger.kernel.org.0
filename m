Return-Path: <linux-gpio+bounces-16582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083FFA44BAE
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 20:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 053717ADE4C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 19:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E5920D51E;
	Tue, 25 Feb 2025 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgJSpR9b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AEC20CCF1
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740512412; cv=none; b=cSt3T6KJpP8i+qR943Lvpp0fBsVnpwP6JQnGSjBJr4IaMPgsMdq+laF18tU5uCp7Zu5hDoCvJhte36Kr1T+8UI5cf/+hMnzjy4n5ikYRJp5tlkEmpYGXlrwjasD/6nkg97VQN8VcLRwT0uCkSOA9kwSJPd46suUk7Iz6nLCXTls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740512412; c=relaxed/simple;
	bh=UzqNz4qePd9Tiwn8s9jRV14VOQ81J8An/buet0CEwJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVmdOG19djEwp5LkVuvcLjiHH5/QNoCmyYoc40ivamjMhMh7cUlWnhKG9g8u2GLYkdjhrzAND+BEla/VBHgDM41IWDvtWxTYS8FWBPgqJn/YK7UHPtmNjBP3vkJsQnlxfa9Zpp9DCqVLEMINbMF0As/fWPRJJW08gCgdJkEJ1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WgJSpR9b; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30737db1aa9so58471921fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 11:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740512409; x=1741117209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrI4eyKHKAB8OlFAfXlotm5QwqBvF1pzNhT9UZb4Yn8=;
        b=WgJSpR9b4EfL45c0wT+rsTxLMJC7fdOiptjcxPIOy++65KYZF0591vKBOg2UodiPLe
         ZZGxV51OeGQf31ZkVcS6rHriyCuaHoJb2iVYkGpp1nuLe8e7JSPI9aG1kS5pseVcosPY
         hUoXdKFEjEpeVtO6oEXxpF/Irpma124nQBKEVW7kBghtxqfWnsY1v7MT4pIZZCp4wiTm
         fDd8nmwW/A20HvVvg2OHmKlGd8izuOTAws8DR0BAtTn2oFpeOPyw033ay/rTScvZUcy8
         pCkac+sxCJz5jXuj+Uw7yRWLSnOb++qpRpQJ9JhYgct1dW3S7SwezAmrmm95Ut0fcucf
         4l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740512409; x=1741117209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrI4eyKHKAB8OlFAfXlotm5QwqBvF1pzNhT9UZb4Yn8=;
        b=niE6OoWC6yiDwFFaA2pPIP6TeSyslzCy41VpaF2iTlluRmmjf5oi3pjd0P0mvpfdIk
         1ybju5TTE/uh9Qp0RiZOBvgYnuOI63twfCBmMz0C+1QUsFXPDVzbQfRZaiohpJAs7niA
         8KmtvlWc9wqg1XU7ymSn+g3slhYpnF/VER9DXLWOuq9l/vlMrdly+crF7saemNUTJK3M
         AyD6oQ8J+o63ZTyl2kvg6qU33SfmRkrigCsbqk8Bh8xk7ILKQHRZblXmnqHVJgsUqWkh
         gmqQTQK4aHZT2xI4I1PiJhtxESK6vElz/0yiNvroAi2730fIzTPZuZxOC1/V0gQDRjRF
         f+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWa6iQuOvi2dRRwxgIJbiu5epxR1fvbUTsWTjRng5cGbB3ZLAD2TgpOvyuywkGJ9oI+aHSD6rOTO4lI@vger.kernel.org
X-Gm-Message-State: AOJu0YypsNcWngYSnTbeUlU92MCtOTzAYlArOWBdsUDpHFJr5qHYEpgk
	pW+MpBJ3G569ZUIgQobePebQMLBMrCHX0f0vIhNDd8Nd6s26Lp9NzxmAP0ttoKHc7Z/sgsOuyUO
	LdaBw2KrboWX4Wz5qicMLDN9amK+SLu7eEMkg4g==
X-Gm-Gg: ASbGncs43SvYePMh0SUO7wFQ35UJtn64V4yHSgXqq2mXSdN5o2tMi9Zy6+BWQDvI8tm
	1SLdjW3UyWMifO2Y3F4URaehpcaSbQKyPLOLzwaXguQ2KxO/BW5jhYDu/blHrj8L+o9z1LNMC3p
	OAhJ8+kP8=
X-Google-Smtp-Source: AGHT+IFO7BEELdyBCBEZrcaolbyPHaxlxv8dQJEQLtePWmPpfaPqEdq0h6205QSicJkwMrrBkjlRTruyGdDQCN9kUAA=
X-Received: by 2002:a2e:bc82:0:b0:308:f6fc:9569 with SMTP id
 38308e7fff4ca-30b792d7af8mr8531811fa.29.1740512409148; Tue, 25 Feb 2025
 11:40:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-gpio-ranges-fourcell-v2-0-8da9998fa976@linaro.org>
 <20250225-gpio-ranges-fourcell-v2-2-8da9998fa976@linaro.org> <CAL_JsqL1tLPP_Waw61ygTZECCRVBE_asTccCWMOQTYnJb9=wvA@mail.gmail.com>
In-Reply-To: <CAL_JsqL1tLPP_Waw61ygTZECCRVBE_asTccCWMOQTYnJb9=wvA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 20:39:56 +0100
X-Gm-Features: AWEUYZmTPuVieR3wwQ3Sya5wqe8qMXJ-walK09kV0is1Ai3eVmL7lKiMT6oH2Rw
Message-ID: <CACRpkdYFVO8ATw9mrk+pDW4WuHeCH8aaT+zNKxE9PN3hgjTPhg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: of: Handle threecell GPIO chips
To: Rob Herring <robh@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 5:58=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Tue, Feb 25, 2025 at 10:15=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > When describing GPIO controllers in the device tree, the ambition
> > of device tree to describe the hardware may require a three-cell
> > scheme:
> >
> > gpios =3D <&gpio instance offset flags>;
>
> I think we have cases where bank/instance and offset are in 1 cell.
> Not sure if you want to make it possible to split those into separate
> gpio chips.

Hm maybe with your suggested changes that can be done.

> >         /*
> >          * We're discouraging gpio_cells < 2, since that way you'll hav=
e to
>
> Note that this function only rejects <2, but I doubt 3 cells worked
> for it. So it should probably check for !=3D2.

I fixed it, will send v3 with these changes.

> > +       /*
> > +        * Check chip instance number, the driver responds with true if
> > +        * this is the chip we are looking for.
> > +        */
> > +       if (!gc->of_node_instance_match(gc, gpiospec->args[0]))
>
> I would just pass gpiospec here. Then it can look at anything it wants
> in the args.
>
> Taking it a step further, if you made the function return the GPIO
> line number, you could combine the 2 translate functions. You'd need a
> default of_node_instance_match() to return args[0] for the 2 cell
> case.
>
> > +               return -EINVAL;
> > +
> > +       if (gpiospec->args[1] >=3D gc->ngpio)
> > +               return -EINVAL;
> > +
> > +       if (flags)
> > +               *flags =3D gpiospec->args[2];
>
> With the above, this would work for both cases:
>
> gpiospec->args[gpiospec->args_count - 1]
>
>
> Just an idea. Keep it as-is if you prefer.

I prefer to merge this and the Spacemit driver because we have already
asked the contributor to rewrite everything so many times.

But these are all internal interfaces, so what about I do the above
refactorings as soon as we have this pile merged? Because I can
see how that makes more transitions to helper libraries possible
also for other GPIO drivers.

Yours,
Linus Walleij

