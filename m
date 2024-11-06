Return-Path: <linux-gpio+bounces-12636-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879699BEF63
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9DCBB24426
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 13:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207621FBF76;
	Wed,  6 Nov 2024 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+cJjoeQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20D1FBF5B
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900736; cv=none; b=jM7ktHP6K63wWCnWvj+7PlrchB+iQtArDtQiMubO1rXWPEZ/NJ6kTw1DdXIGPErTCj4FE+NAxV5tvPPWbEkk2u80zo/Kidm6WYkxadsGrPou7DMWVJgfhWT8FPkpxazsOEv1ZZQihVvez0d/OEZSef4hP8Ls/19t1QEHAHnA8ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900736; c=relaxed/simple;
	bh=oe4ysEbOGugDdM+rEZI4gTDxZGKfGa+ZNN+0xqDf504=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfj/chu4oow14nqlpn2vqaVT65CzyEn2RH7jnNi9HWMjbn7CtZMeeGpfsU9LmHKvqbCAG6d0fdfuv0XvLZH/NXtfUty/BCEHrtKkzAtOnBu4NsCLBtlZLffCTpO2hIOp/KYvjb0LS3/6RrGm1t3/9T8MvLvEjycCdaOiEWCWrAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+cJjoeQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e63c8678so7509985e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 05:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730900733; x=1731505533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns1m01mlBn0TEXlYPEz7IqH4BJxD81zb8MxCwYwjObU=;
        b=Z+cJjoeQqf2SQFRLbSVXXzb4oAx36HxhUJ0ZApUEO40/TpA3i3YbMpVB67u3ZuoI3I
         QLxECA1i1pkCLsqZ+EeBrgbI/coK13307FMpRWZAaV8mYGcjeauTjd8G6CNlL5QIAdmh
         g+D8gNKVBxsGoPjWWmIne0LLchn5oJ4X2XswTwDlXvrtKgeQI/3jlA+xJ0htoq7U0GN4
         962txxxBA93/Wd7qz2npkI7TbNcwJpgpqw/sdq4M45cSzv6RSMUeIyLscQMHqpW6W/h7
         LzHaVtSk76nvzBtMe5EF0WJDGbmsMkgeajHkyZeoOa4JnmPyv+IRKRa5qj3Jh5gLfZ/r
         qAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900733; x=1731505533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns1m01mlBn0TEXlYPEz7IqH4BJxD81zb8MxCwYwjObU=;
        b=YVJ013gfV8N/1PIuxYgFyqlvlqKjaZhoKjmm3+4N5GKnzXs0bFrdpswd9H3mP2D6wS
         0RhTHKTv2B31nsN6J2e7J4+vFZugASHEAO7xUv5pZdLd58L/B8+KYBGtNt0S+SM76QfM
         XqT4n4k9FPInWs90PKq74zxv2Jd5WK+oye71lC8GDxacY8+kLCNcY9bIrrL2AYtXWZSf
         MWq8hedSBpi5wi5YBYQ3H48g5QDH53rKJx7mAzluJaxcIzNqFbMPkFGJYWivhSQ0nwXX
         nnOtHedx1DB2bo3cD1oNxremNoLASBfILCePa55dHCOTwJJeG6UT28yD1+fFS/cenA0B
         iwuA==
X-Forwarded-Encrypted: i=1; AJvYcCUP2Po4MzbbnkiBtel4I/t8yWFeR/3h0t0s7oOG6lfT+KOSRh09wcQW1qR3qqSWSP2SchgzOo89sPMz@vger.kernel.org
X-Gm-Message-State: AOJu0YxP05HrhLjhyEO7DFyFggy2pF2Qp7tLQ4YFlxDS2sCxTUwu07GU
	fEGjzp/noj1vk1ZBJ7WXDFOUHC1tNGypqeVosdXPy6nnzozyE3wKr7fTAALw8WpSviEOgtR6YAd
	o3UUCK+PHbL+bqRGL2m6i4FsMs0jcp5FNhfSjPA==
X-Google-Smtp-Source: AGHT+IHvynIL7AAsGHjP0xg8VCy9NFb8IBkKD896d3DxIuwUkQ972HHVN3qYlfPKYVhD5LyxxH0ykk/nP4raab/ulSQ=
X-Received: by 2002:a05:651c:19ab:b0:2ef:243b:6dce with SMTP id
 38308e7fff4ca-2fedb770dfdmr103418931fa.10.1730900733100; Wed, 06 Nov 2024
 05:45:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org> <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
 <ZyssJpR7xwbMzUsm@lore-desk> <20241106110046.GR1807686@google.com>
In-Reply-To: <20241106110046.GR1807686@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Nov 2024 14:45:21 +0100
Message-ID: <CACRpkdbf4Pb+n-F-K-JaUvytwCGUHHh8d2rYP4A9KgVTzqSnGw@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for Airoha
 EN7581 GPIO System Controller
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 12:00=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Wed, 06 Nov 2024, Lorenzo Bianconi wrote:
>
> > On Nov 06, Lee Jones wrote:
> > > On Wed, 23 Oct 2024 01:20:04 +0200, Lorenzo Bianconi wrote:
> > > > Add support for Airoha EN7581 GPIO System Controller which provide =
a
> > > > register map for controlling the GPIO, pinctrl and PWM of the SoC v=
ia
> > > > dedicated pinctrl and pwm child nodes.
> > > >
> > > >
> > >
> > > Applied, thanks!
> > >
> > > [4/6] dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Con=
troller
> > >       commit: f49f37f3cfe1482d4dc77d26f3e8c38eab630d52
> > >
> > > --
> > > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> > >
> >
> > Hi Lee,
> >
> > according to my understanding this patch has been already applied by Li=
nus
> > here:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t/commit/?h=3Ddevel&id=3D50dedb1eb1e6755ccab55f6140916c2d192be765
>
> An interesting choice.  Linus?

Yes I suggested that I merge patches 1-5 on oct 29 and applied the
day after:
https://lore.kernel.org/linux-gpio/CACRpkdYshPusdA7bDW2y8H_wp-Fm3N-YCsY1_Qn=
=3DdZqRiFy12w@mail.gmail.com/

It's because the bindings are dependent on each other, this one patch has:

+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/airoha,en7581-pinctrl.yaml
+    description:
+      Child node definition for EN7581 Pin controller
+
+  pwm:
+    type: object
+    $ref: /schemas/pwm/airoha,en7581-pwm.yaml
+    description:
+      Child node definition for EN7581 PWM controller

Those refs will explode unless the two others are merged at the same
time.

Usually we merge the whole shebang through MFD but this one felt
different because there is no actual MFD driver, just using simple-mfd.

In hindsight I should probs not have been so trigger happy and give
some more time for this to settle... Merge window stress I guess. :/

It's fine to apply textually identical patches to two trees though as
git will sort
that out so technically it's no big deal, you can keep it applied if you
want.

Yours,
Linus Walleij

