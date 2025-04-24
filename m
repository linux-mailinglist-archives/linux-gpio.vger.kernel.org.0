Return-Path: <linux-gpio+bounces-19234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC3CA9A31C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 09:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FD983B09D6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 07:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9F71DFD86;
	Thu, 24 Apr 2025 07:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iFgq2CrK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5ADDC3
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 07:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479023; cv=none; b=trJSmdv3uYQcpT6taMnK9vsjAWMne8EFqXcCPV5aKrORcSXjEeAs6UgCK6aN5JQWEVGluc+HJmpZvISid++FxYsn4wLxlHPeACOjqFoQcWT7zfvKfE0utoF4gm9yMD6s15PFP8LzPuej+27YhKyTDamAiIXGGboZfVqA3dfIlBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479023; c=relaxed/simple;
	bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWzTTdLz4KczkWvRs8c57Z/fs8YlRHLu/ZfNNQioPDekEhzVrwa2zFgsd4U3FaKKZgb7D0mrYJp9MVJhZgMrAqU/J97ThahlMyf8uSNVYSkbasi8h/DSjh/TQZiiEP+GL+BGGhneOUOc2IgBYX9Ag9BmBbYnzNr/OIELOE6hPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iFgq2CrK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b10594812so692317e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 00:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745479020; x=1746083820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
        b=iFgq2CrKN5ooXXvj1AdN3AukOU1QQBrq7qbmTZwNi+gDnVp28ahPlbABX2zKqj433Q
         iOx5eplyI5CJpxSRGEOecMF5Yf1p+OUiI6NWbThKgfJhlVGmTUMds0LZBzCf6zIVXn9L
         o80BJ1t0pVW9nkFbuHkSPFyhnoNYSAerCS8gVuO9I2fL6gO1Va/XEgFpWnYMBY36CWlE
         XwLTrTrpcGQArNPz/zB3W6na1sNp3a5sTiTA7kg/79slgAlE1F83UjHVar+nw5LLtSoT
         wGztuShaeoNOdNgZUVRDY/mURz4bG4ANHSFlDfcwWJ/9B0z7N8iUwY8fiuTKlEAeay6y
         BAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479020; x=1746083820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guNwUuYB1XS70rv7UL0LfJmT859rRszSPJy1YBjgdfM=;
        b=dg2EL+FEzQf2N3ygjFnel8Bf6nAPDOSjZw5XYx5CVRSFyTu1l0eTeKRPNRl8Wup4cW
         Vc/X7HIoewhdLAWB0KUTFtegn5xNxNXm2KuPGuU53sXGvjcWmeOzTH2Y/6jME97Mpf9F
         M+URFy+P1aJXsV99MKUz8PgkavLhaV1x8texEcRJfxvtCvR+QEanzbJG5hIWTJDb2HRg
         R4mQ8aKZpphLTYsbJWUH5T4mk9q1wImQWGw2edkTjVjBwLBsTnxvpqkPELmsE6r251kq
         eQZtghhccgK7APf0PWxnWskICZFc6l1kQdU1up/p7HUIqCd2AGqPtsCdOqH1G5gPeDkD
         FPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4qWGPvZyFvCO4rmTDEh1i715WvpDcJJ03KsOBuufk0uIJQuRvIncIyz1aPessAn10gmrsNOIB3V84@vger.kernel.org
X-Gm-Message-State: AOJu0YwIsmnnEiCHtsg8W9xqDbfE3kDWX3uoLShQJZ13FytiDtJN5Fw3
	BvjdfBglO4BjSaa4Cm6AbBXBW7zyVnuENfZQFaQNrNAx7uDgBJQtg1oDPuLdiQILTjBv3nEpNZO
	VoY62EFG6PW5gx8bgrS11I/hnhFv8LlrZbgivIw==
X-Gm-Gg: ASbGncuK9vJpX2Qz2AEoGo5F+P5FpjIFd5eLZdKaG63p6JDV542eEZVsMQ56friHYwb
	P66X0gLKDSSdGm/SrtEhQWjo2jI3UNWnvFX1ZH1mb2nE6EAN/Qh2jl5W8yMl0NksP7RIqoKkm7O
	hu/HPNG8OmMJ23+aX6m+GQ7/bAwS0nY3Fx0vaDxHzCMzUcWM1fV0aR0Q==
X-Google-Smtp-Source: AGHT+IG7sbNkW6K4E+gZCj9BvmRurRuIOdRBZYRXKnKeo9MdE3o52+XU5EDUC66JU8GTial2FaxDd9hruPwHijYGY+Q=
X-Received: by 2002:a05:6512:15a5:b0:549:8e54:da9c with SMTP id
 2adb3069b0e04-54e7c41682fmr591334e87.4.1745479019474; Thu, 24 Apr 2025
 00:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-i2c-mux-v1-1-7330a0f4df1a@linaro.org> <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se>
In-Reply-To: <16b14e5e-e5eb-5203-4cdf-44fbde9a5688@axentia.se>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 09:16:48 +0200
X-Gm-Features: ATxdqUGJSrKABbl7cdx0FUWA6bl4aWMdgNufCjq59VS62rLqVUFNqJgqC7ohSmc
Message-ID: <CAMRc=MeYs0W31Kj-o530_8+EvhoDNzyZunk4xu6PbwK8N1OE4Q@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: ltc4306: use new GPIO line value setter callbacks
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, 
	Andi Shyti <andi.shyti@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 10:08=E2=80=AFAM Peter Rosin <peda@axentia.se> wrote=
:
>
> Hi!
>
> 2025-04-07 at 09:17, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> > Peter: I know you've not been very active recently. If you prefer to
> > just Ack it and let me take it through the GPIO tree, please do.
>
> What normally happens is that I just Ack trivial things like this, and
> then either Wolfram or Andi picks it. The risk of future conflicts in
> this area (and cycle) should be low, so I don't think it really matters
> if you pick it, but Wolfram/Andi should have first dibs, since it makes
> for slightly neater PRs during the merge window.
>
> Acked-by: Peter Rosin <peda@axentia.se>
>

I just realized their emails didn't pop up in b4 --auto-to-cc. Cc'ed
now. Wolfram, Andi: do you want to pick it up or should I take it via
the GPIO tree?

Bartosz

