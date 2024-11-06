Return-Path: <linux-gpio+bounces-12635-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D579BEF5C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B20321F24E0B
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 13:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705BD1FAC21;
	Wed,  6 Nov 2024 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f3CcdIPo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AD21FA25A
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900628; cv=none; b=JjjIGlC8yCZPo8iIJfq8awxqzwNNNPn4cMHgTRZQGYtfxmDYs4KKWSB3W3Lqifp84C4pNrPEgmpm7KA3QTpFvLP1lKrKAcfk4eb9qSQRZ6Sv0KLgh3QWm0d+OnawOXxLFZkga04S5yFUs7dNwXxoviXcbCI/4yt6H0hAr/vva0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900628; c=relaxed/simple;
	bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsH/+fUuHGfA8XIYE6snhyM4KF3N0YkVLwEsjx1BwMLsajGzMaL9XSOe4ArD4ANamAViLTNPLKUvaeRSgH07LCbLIMm+pYoxxkqjmoc9xkrYMzpxm7qVbaCh7NpTUO8vVKorUvgRV8RXaUAnVUSW1oXEZrekq+A+cuaSXN7uBR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f3CcdIPo; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso10623021fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2024 05:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730900624; x=1731505424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
        b=f3CcdIPoULNOErGfe7BXfAsURIm4et373ySgVx6cdoUgNhp4INO93h6R/F2yDiDfLu
         ldr/kxxfMhsdCTBO4RcOT3i+xlleOh6EIAVyvupoIGUXjOEbPAMoNDXWYyAQ8hjSTPPx
         /FGUHI5TnpwImxyp5vlsMgDzQVhWKduYrGOtSRP5e4vGzQ8P6j7kkfO4CRCvfs4t8H/B
         Pbl1MbBRrILWpxMq1M0rR85mBG77/ZXX20DC5hMUM8EJxMs6iRuQt1bvUHiqIbtq20zx
         YrrDXLLp8jj09I7DE0vrVcdzxKLcZAI+zsSpF1DP+U+sKuXSwZ7YgxTCVPivyP50Lqby
         NvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900624; x=1731505424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07turtyFaUtqmTN7irIArurWZHjH3oZpuJFzYmQgqlU=;
        b=gTObsGeWVQn1LlAjoPOkfXNx9joEWTHD3eJzQoipNevcO7i8hZEjGtk1Lljp94CkJU
         M+Rc5ls6zd+EdS9uKRmi24rrcAmQg0r+Yvi5iH4FjPzydy8wi6ZS1hp91fxsQp3p7+uj
         D6eaASuyTabNFdjRLk5hhq9KzqzvlS6YBLLBME7C3Z7isQuLfweRlQdjue+mXfrQhoYt
         xhJalPDYqetIoxZ1WkL2Y6ONwirPGomAXnoPYcY66te7L3gyIey2SI/YBdCh2R/j80St
         P208IZ00Z74ahaMQ48LB50XJZRK/x8Cm4p1tQswXoqkzf6I79Rd07v1l4sHemXLWS7l9
         cysA==
X-Forwarded-Encrypted: i=1; AJvYcCWpeGJFttNdNCf0NcemgkqrTLnekfp9ifVKcUHd6k2Wn3Piaf3+XcG/Jo114s+ezCbudad+oyrsdXVt@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGfvhKlg22V28N0cuuviuZ6UNBc5QrQQ3uKlZKE6laa6wVx+8
	3wJbFdUOGNZJGh/8a9n1U5XPVpVjpwdTEkUZcsto/rXXRRTndMrdIZ/KX0FyKAoRAoy9nC5tO1q
	tr7ESJKJ2mG09RnfErw6+gVC3BDXq6wXyUQB17Q==
X-Google-Smtp-Source: AGHT+IHUtnnhEva3lCB8uWh8uIWC06tcgEpMXvu5am5NhlAEbhUxeQ79Id1SoLC6uXkPBOCC/N9jH1BHhM6ITnKzWf8=
X-Received: by 2002:a05:651c:210a:b0:2fa:ce0d:ec34 with SMTP id
 38308e7fff4ca-2ff0cb2376emr8634191fa.2.1730900624427; Wed, 06 Nov 2024
 05:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104093609.156059-1-andriy.shevchenko@linux.intel.com> <ZytP0XGgmz_R5gos@smile.fi.intel.com>
In-Reply-To: <ZytP0XGgmz_R5gos@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 Nov 2024 14:43:32 +0100
Message-ID: <CAMRc=MfQw1YmOoq-rK5Bq3uDK8cmjG_xsUgVDs28phsqkcHofA@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] gpio: Get rid of deprecated GPIOF_ACTIVE_LOW
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 12:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 04, 2024 at 11:34:18AM +0200, Andy Shevchenko wrote:
> > This series targets the deprecated GPIOF_ACTIVE_LOW as only a few users
> > left. Convert those users to call modern APIs and drop this legacy piec=
e
> > from the source tree.
> >
> > The idea is to route this via GPIO tree, please Ack.
>
> Thank you for Acks, folks!
>
> Dominik, is it possible to get yours or are you inactive nowadays (I saw
> last mention of your name ca. 2023).
>
> Bart, we have all Acks except pcmcia (see also above), and the change is
> the same all over the places, do you think it's okay to apply if Dominik
> won't respond for a few days?
>

If we don't get an ack until Friday, I will take it as is.

Bart

