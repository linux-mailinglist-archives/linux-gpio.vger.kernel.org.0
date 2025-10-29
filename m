Return-Path: <linux-gpio+bounces-27826-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEFFC1AB1A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 14:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F1E620B2B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 13:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6A6344038;
	Wed, 29 Oct 2025 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSayh/xO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A733F37A
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743353; cv=none; b=BTC4Fn/A94rydv8LpPAmvEvXXUJ7WMFtei4xVSQk6uveixySoMoaKrGYZo2nlvZJvKojT+yqbP2QX5N3bppDtv7Xfgdpp7jMya07HcWS5JpnB7fObtkFure8qmbwoUSFChr10S+shez5q+unI8iEcVCA0JOJ4lSMcbGBOH/1KtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743353; c=relaxed/simple;
	bh=fyeNQjPbHba2zQACV1XwHgrmcj9u7mbSw/E0lwVQwQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhixaiLcbRq/kde905ffSnem2/KekVyJhlMVJ6QIG7Ic1/1o5ulsU53a6uTLt9bAy4RmHnIPFHUZbA7cRO+ScqBrO6U17+pyRKKu3P1iwGFGNQgYSqudDmySjRcGVuuXbDvwXLHlUvEbRttCQUSihGFxrDNw/oaoKdKsYr+ILNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSayh/xO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-592f098f7adso9277201e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 06:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761743347; x=1762348147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpAhRZEcISe/L4obGO6K/aBf0H3CSDRAh1WJSbvQ7BI=;
        b=wSayh/xOnAy3dXi4ntAukqEAHjvP9ucW73ZNIZyHbw2cHQsLL1Szf+DGPNGYsn58u6
         J0lwB0G/6WXg8TK1O1xAu8Frak99gd/QnbDsG5k9aR5NWpMNTDbuTL7oxRWZPWpRSOFx
         xVvP+51Ubm/kNNqZYitAOZdba2XhAhmt56BKrWjh3RH4FNJICFR+nON5Pti46FzTT5X3
         V25xSseaffbJRROIyrMREOd1AAqVkx51lYyblWTF4trc7wR1xEMOfoXA5rLlso0sYxnx
         sgyo4EO5o2qzKCCrqcLaGoGl+Pw64TwIG1bOSVwYd4/QlwFZqZYmuo7DnuaZmUHhVtZr
         9GHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743347; x=1762348147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpAhRZEcISe/L4obGO6K/aBf0H3CSDRAh1WJSbvQ7BI=;
        b=V0RkMJRgO9peSkGRqseMHzAvfgFxCwTDyO1Md32atsfSVrJD6q44yTlTABCcTyzXVi
         3g9FDd0GdyCLE6T7Z1pAsY/bCkmgkhhFdWr5P8nNrzqhgrU8dhbJ0JSFSI7ZzNbyPYeJ
         re8uRbzAkMr5X9sPDy77UaGu7/LN0y6FjTQp295r9UYi4GLyusxThl8VPv3AGW+l70yh
         PSKKQstafW4p+SNXGSWfF0pQHNQGWzbCQOQkyHhjGWWqrFp8yNMlSg+NCavL6EPNRN/Y
         vTiTGckdZWsEkOuOr+rm1YdSrohPggc1moPtLa8n8gzJkthRFwyaqzX1aBlwHsG5asTK
         dZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQzoYsFY1eRlBIoZDvfFx31GsmHODgITb/ePqv/Zuc2irZIEXSRplFqZl1hfJrVjZyTT/oswJgc43l@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt9lpd2WTY2Zbe4owRYfCvzcFzfiHDjIPSBxQtchE7jtB10RzM
	xpdT9lK7UAt6njFzuBZEcOvE5gXvH0gqlFxoCuX0X1vdzp8DrsGRJjHejlxmWpNBYuBgcZjwxi7
	BWU1SGPaMxbFVzM5I1CofXwC6Ue7HGmwI5U2Zh++ZLg==
X-Gm-Gg: ASbGnct6ODjc+vHpJJd5m4LTZkmcV6Th1hWzNgaMAdJTxTVHSX6QWKJdSQiTGjREGQx
	PUitopNmfiRdAqO5Ds1qYibaYA7jMnSyKjyZEkZhjhsE22IM3r8Hb76LeaRbzF3Tm4nnjL1Zdiu
	Dp1EW6m8jhQoD3W+xUTLZq8N+ApRmX1qsDKSgxuju6YWBS3pn1gltVkxwmvGipN5ONP8oZneuqH
	C3hkqlf2qjh7CrWq6+aUHNH3Ic/MfsarngV6Xi282oEPcecTsrcJ4zPJw0T
X-Google-Smtp-Source: AGHT+IHoNXhvs7nAEQT1Pr7YoG6bCNTomzDjqEik5GRK5GTNnbmdXX4kn01zdcQcoosBSkAxyYQ6vANHvlPp3vj1L2g=
X-Received: by 2002:a05:6512:3a8a:b0:592:f449:cbae with SMTP id
 2adb3069b0e04-594128617a3mr1173473e87.11.1761743347041; Wed, 29 Oct 2025
 06:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
 <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com> <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
In-Reply-To: <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 14:08:55 +0100
X-Gm-Features: AWmQ_bmctKf4r03BFEQZEB7--T8kdCIHNsOEFNutvbq6JrwVjRi4Ptn1KMtyXrQ
Message-ID: <CACRpkdaK52wY7MYhnqCqzOAFVu2V=NejDTjAAhkxhf9rmrV8iA@mail.gmail.com>
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 1:30=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
> On 28/10/2025 00:42, Linus Walleij wrote:
> > Hi Matti,
> >
> > thanks for your patch!
> >
> > On Mon, Oct 27, 2025 at 12:45=E2=80=AFPM Matti Vaittinen
> > <mazziesaccount@gmail.com> wrote:
> >
> >> +  rohm,clkout-open-drain:
> >> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "=
cmos".
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    minimum: 0
> >> +    maximum: 1
> >
> > I think CMOS is the same as "push-pull" ( I could be wrong, but I think=
 I've
> > seen that before) so I would probably try to use the pin config standar=
d
> > names as strings here but I'm not sure.
> >
> > rohm,clkout-bias-open-drain;
> > rohm,clkout-bias-push-pull;
> >
> > Mutually exclusive.
> >
> > Or maybe use the pattern from rohm,pin-dvs0
> > with string enumerators?
> >
> > rohm,clkout-bias =3D "open-drain";
> > rohm,clkout-bias =3D "push-pull";
> >
>
> Hmm. I kind of agree with you. Still, the way it was done in this patch
> is used by the other existing ROHM PMICs (bd71815, bd71828, bd71879). I
> am kind of reluctant to support another way in the same driver - and I
> am also reluctant to change the existing bindings as that sounds a bit
> like asking for a nose-bleed :) (I've in the past worked with some
> devices which didn't update the device-trees when kernel was updated...)
>
> Do you think you could live with using this existing convention? :)

Yeah if there are precedents, either we can reuse that or we need to
change them all, and that invariably involves deprecation and re-implementi=
ng
the parsing in several drivers in that case, which is annoying and
takes time.

It's fine with me to keep like this.

Yours,
Linus Walleij

