Return-Path: <linux-gpio+bounces-3444-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF28685A76D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 16:34:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A191281F4A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Feb 2024 15:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073C338DF1;
	Mon, 19 Feb 2024 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m7vj9A4f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C093AC08
	for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708356856; cv=none; b=D+LDa6uQ2Vp9+DXP1Jtx2L3KoWPxVaGikg7ApLTzcT6WBLUD5jt0nYzBnR16+Fb4T3ANr5t8Hi1gFTiq3dWkz0sq8WLtt5E6WBC5la06/T2sVb3Gl554NBlE/5jyRIDQQsx2SJz+a/HrWJA+g0SlDNqcwVS2V1Az8cf1/+dJ8tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708356856; c=relaxed/simple;
	bh=OFg9oqTwcZyyxLA+PL9UVn1Rcz+N4HoQ9s8zDEcli2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVFm6XDQTfXuCsNXfjJpFhdTt0r3k/k3ojPkXwMd+5rsiSuyNKTWa+wNhePXdh7BIv3aNFb3X1uTxar5PeYv6+wQlbfnV0Ubjhg3gbi+hYSysWey8hNeY5d43kGgGoNNX3bF7SgEpMY0hGRRv/8BYQ3jSF3O7CECEm0v95ByLHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m7vj9A4f; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e2df04c812so2604952a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Feb 2024 07:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708356846; x=1708961646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvVPolj8oeG4AKFrK8d+pLPilaj1PpVh47xpBNRxg+w=;
        b=m7vj9A4f5LEzjmiSmDA/WYeQCusxwYIQiuPFw5YyE7Zsjs1qW5UoGBphfd/0GbHN7x
         beNs5yZ9h2EVHeAfxQLvUn7cqQvZuMWq9aEjZe4a0ojsXnvjxVzdn4XwPKUxatoR25bo
         CRqnlACzqTcmZANl0jr/CnK0S0gI7EflsuCP6LindZOlboJHu/cHTvMH6FlCHqT3qNTG
         2DEdDC7VY1mN7rXlrTIZgvdWUEnXTzx5Rj31bjNyiPSzpIh+9jxmumangJTvPwWAyBsY
         NZuiruElBb13g0vl4AM6T3nHDGhrTSxwWT+rSiQPImMOe44BUU+EIXhFPUg1k4R7D6vp
         spFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708356846; x=1708961646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvVPolj8oeG4AKFrK8d+pLPilaj1PpVh47xpBNRxg+w=;
        b=Xc0tWRLhi1f8zr9CPBGV6v3BDN8kFWoBeUNFUId20QBri0f2KqwEVaRT7dZNSqT7j3
         W/ngc/kknWCUGPJS/YlvEOSTuZrCqBHJxnqN0Zk4EhW+KFR/XBjNHKP+IHW+j2O2/sx4
         wwkZsm2XyD7PcuMYYj+/JbZS9D6Ys/mAwPT4W2LXhhrJ/7cNV0wVENw9VVFJ0Jdr1CIi
         4EMdXdjkKZ2dzxZVjcLigAe/7pnMULtSyCT/LIUXooOZSCCvyqP6be0wV0+D6ZQhqnj4
         Ir1cdkIEyC+u70IuF1iN9N05SV/RrLPZQLa9uW2Mb9rAyHonNszgekTPp82Dq0iubuye
         Ljnw==
X-Forwarded-Encrypted: i=1; AJvYcCU9WNpid2885oAE2RFTOx5uMlVmelKsubQK3i/KJ6Zw+IXTHQyYor0m1ty7LszWXo4hrztVFWETkGAc94oOFXyT3yBX/o63NpCh/w==
X-Gm-Message-State: AOJu0Yz+7yAozjYdppAEpFk2Ak8QynuTFP1vp4GJZ2yBsHQbyvhXP8WU
	BOMjUbPo/SDcpXIZyJKdmENVzebhldhzMOrSfMKg4EQkNKWjaYpifkym53RsJ8CV3psYbSDqt7/
	SA46zYnOngWyfiPJ84FznEeegibeFzDDV8A70Qg==
X-Google-Smtp-Source: AGHT+IH6wgFWgrzdMctoV3icDI335MC/CdaUuFj+nGvrkX8vJ7pjFLlj1xEDLlkiBRM39lL8enM+OZmAUPyDNuGbujs=
X-Received: by 2002:a05:6870:d24b:b0:21f:a33:e48f with SMTP id
 h11-20020a056870d24b00b0021f0a33e48fmr444912oac.11.1708356846558; Mon, 19 Feb
 2024 07:34:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
 <20240214-mbly-gpio-v1-5-f88c0ccf372b@bootlin.com> <e031566a85ae0da0ee71dffba5d87c6414ef83e1.camel@pengutronix.de>
In-Reply-To: <e031566a85ae0da0ee71dffba5d87c6414ef83e1.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2024 16:33:55 +0100
Message-ID: <CAMRc=Me-oEx9S0w=XhwC4MzV9uzV0o0HnWBfNSstcqg5jpXyZg@mail.gmail.com>
Subject: Re: [PATCH 05/23] gpio: nomadik: extract GPIO platform driver from drivers/pinctrl/nomadik/
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 11:03=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
>
> On Mi, 2024-02-14 at 17:23 +0100, Th=C3=A9o Lebrun wrote:
> [...]
> > diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
> > new file mode 100644
> > index 000000000000..e39477e1a58f
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-nomadik.c
> > @@ -0,0 +1,660 @@
> [...]
> > +static int nmk_gpio_probe(struct platform_device *dev)
> > +{
> [...]
> > +     ret =3D gpiochip_add_data(chip, nmk_chip);
>
> Use devm_gpiochip_add_data() to cleanup on unbind, before nmk_chip goes
> away. Or make the driver un-unbindable via suppress_bind_attrs. In that
> case you could drop devm_ prefixes everywhere for consistency.
>

No! Why? What about error paths in probe() where you want to undo everythin=
g?

Bart

> regards
> Philipp

