Return-Path: <linux-gpio+bounces-11460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C4D9A119C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 20:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 907DD1F2540C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 18:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BC6212F10;
	Wed, 16 Oct 2024 18:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnS5GF3A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6E19993F
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729103533; cv=none; b=REtT/j8UqNZgkO1wfILdnU+X0aSnmjiT5VoYGSW878cebtS0sAxO4UwH4T4Nh1ncyBK20a5q+Y/hpFU4LnpW9uoQeJR5ayBIJ6AXd+rJ7WnljnlGskTp0Ge5mSWlyeFz4pvJeLClEI/ghNwXkpHb4z0oqyL5SrnyDXe/00RtV90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729103533; c=relaxed/simple;
	bh=zLO6aZwyUl+3LfycLrqZXToqmieLhN3tIxuDQ8INOFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LecT23+1oPayJfqeZPaPZRxqw6UX04ZJx7TvNldds+0oAUtQtvL3Z8eR1dR4uihnwWyx/+29dqKxVq0yxEisiJskMaH7DoLVYJhZLl5CZbwuUwdQIm3sAwwpmuiILTjI1gIpWE1yDHeKOHvdiO81OEtFKiGRzgBIto3c+fF2DwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MnS5GF3A; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so2659831fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 11:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729103530; x=1729708330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLO6aZwyUl+3LfycLrqZXToqmieLhN3tIxuDQ8INOFU=;
        b=MnS5GF3AOVtkeqhyOUF58roJxmRo2C1LWSeb3GfYEHRs1hRF64Ovsuk1ky+yQsOM8W
         hOYLASn+bUMTXQNUmBeQtzqaWtrmCxR5wJ7umrB7rt4RUBUo7LOVL9QBrt6wstsLcKrV
         zr7PadkX17k4zqLlpLpaBT38+rxwrEa/gB4TBLZp+Lnp+LBlNZoC/j/18qK/kpkvNE8W
         vw6PMSREUHhntyT3WGSsPd2KjeSFc8nBaytHgMI9LiWhtEJZJ7bzXS3WWkHpXk7liLRV
         dVsNkoMPx388J7jlp/ulyCPKgj9hrDmtb7pv39czD4Lo+51YvQ2/B2mVyiq7TqMz/nJg
         fiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729103530; x=1729708330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLO6aZwyUl+3LfycLrqZXToqmieLhN3tIxuDQ8INOFU=;
        b=O2FnkMW9TwLZ9EdSbWP/iZhcTZLNCmvOVeQVyQYl0ALIfLMoUEOGClGXQyzSXcSld0
         KUmJTh9t19YbANT/F94HR5rkbbwqdgpvrnQtl/c1wWopeP7fGqFhDs5Y83hdasm72iqB
         eG67qCPsl8S5bhmkvHio5Np3lCGW03FAumDAN74zI/rkjoK1PoikAfxHGSm+JT4pTFcN
         1BHX0F1lJTrA8f0XfoEojQYUIM5N5HTstDOLliV+G/cZ40+7RLxVCnnydINt9bQvmABT
         8jZT80eHdRjzENugwUtY1HnOvJpJeXGYxay4RRXbu6l1LNfFt2yugar8PsYnvFPb11KS
         5GEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIwMbbipt4lj3spsvGFtvVwmFz3AP9N1Tja6fr3Ygmz7Z1D+0uX6FRUN/nVPQYsvXBe0zl4GQp/2zX@vger.kernel.org
X-Gm-Message-State: AOJu0YxzWyANdRc/6KIJYl4Ub4ajvOKIrRA6A8yGUP8UA6D/KgEf0ZF0
	UyZIe1U7fLE8gf8ms07c+zCLcIyMSV78ISCS4hL5e/wy1KACLI9wS5HD0VBnaAtVq8gfUjnTsIN
	a1g7eFQ3VcPQ/2mHad/oawp3YtuhKHJ5M2glf/w==
X-Google-Smtp-Source: AGHT+IHpAeDWCA8i/8V+jXTEhlCjTBpvAe50DUbf+6GO3QbkdbjrySiEqxkK4J1c1Y+WN39i8NFPotc1h2p87Pt9UM4=
X-Received: by 2002:a2e:be9c:0:b0:2fa:c5d9:105b with SMTP id
 38308e7fff4ca-2fb3f16fabcmr118616141fa.2.1729103530208; Wed, 16 Oct 2024
 11:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016-gpio-ngpios-v1-0-f16cf154f715@linaro.org>
 <20241016-gpio-ngpios-v1-1-f16cf154f715@linaro.org> <CAL_JsqK-Nd6izk6RFf4NyoOCkobDwye+QPsRKHBDwovxO9NTDQ@mail.gmail.com>
In-Reply-To: <CAL_JsqK-Nd6izk6RFf4NyoOCkobDwye+QPsRKHBDwovxO9NTDQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 20:31:58 +0200
Message-ID: <CACRpkdYipbtgW1odod288fEV33SqoJo8vcN7=c+tSRUsR4dE6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio-mmio: Add ngpios property
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:47=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Wed, Oct 16, 2024 at 2:21=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > This adds the ngpios property to MMIO GPIO. We restrict the
> > property to 1..63 since there is no point in 0 GPIO lines and
> > we support up to 64bits wide registers for now.
>
> Why does it need to be restricted? Is something bad going to happen if
> for some reason someone tries to control a non-existent GPIO?

Unlikely. But the biggest inconvenience is that non-existing GPIO lines
gets exposed to userspace which causes confusion. It's a bit like
saying you have 32 harddisks on your system just because the register
has 32 bits.

> If there
> is, maybe there should be a specific compatible as the h/w is not so
> generic.

The gpio-mmio is quite generic, it's the most generic GPIO
driver we have.

The ngpios property is also generic, it is in:
Documentation/devicetree/bindings/gpio/gpio.txt
(commit aacaffd1d9a6f8e2c7369d83c21d41c3b53e2edc)

At the time (2015) I just documented the already widespread use
of this property.

It is also reflected in several of the new yaml bindings, a git grep
ngpios will show you.

Yours,
Linus Walleij

