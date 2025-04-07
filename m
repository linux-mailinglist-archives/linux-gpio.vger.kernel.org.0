Return-Path: <linux-gpio+bounces-18365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21091A7DEC2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28CDC179E72
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA79253F0E;
	Mon,  7 Apr 2025 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OREqnu70"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A093253B55
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031728; cv=none; b=kqdGoPssdV+MuFhH7GWsU27vHXfhO3hyoXUiNR74Nls/PTZdRnYGMDZMPSUMNVmXAvYAj2Ftu838XAXOc922Cz0swNlfrJAi3KWr2NZy1XvuxzAhndMMP2lWRQakQqC8njANLkpzQIeEYBcDQtnCmQnof9Jx5MyIXZW7czoeSNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031728; c=relaxed/simple;
	bh=HgYlzcnLJ9b9/mpCUEd5T6pQNP655u5D2bo0QC6XM4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGPLdHMY8EFu+O9irQ0BdRq8JIZVkT87t+856bOHeAsoctQ1dKFOiauV6rdWRwaoxz1TFltLJIx8kRty2W9lSwb0InUdcoLq1/IVvjHCWdhOKGRfVKn1HjBz1eHj8CwLduHA1b0uu+ox+9ln42uUqspilG8Qd+4DM4EWGEY8Dgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OREqnu70; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54993c68ba0so4837188e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744031725; x=1744636525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjOh7XzZGVY4R8MmVTia4KQX1z2/N3OeHsPkBIQsJrs=;
        b=OREqnu70ZL8CBgn3ojRabwvpHhTUQoobpg+ra+hOcP6rCtuzOtOgBj+MD66xoVJgrX
         SB7x2THEIobkS4MmoljEPnZwqjm1t1YQOZnqUAYeWS/AegPLKVxEJzdhtu8XQVz3lhQg
         k9cfNu6gBAToeutnDR7wfZbC4mdr3SFPMHt7tUQDdnPC48BGQ0qQDZh5XoVDgdhP3kyz
         2MROhLX4hw9C7aKDIMDh8RshN8P+O78QWkklSNEpe95ocLruzDS/R9GzM65K4G5Cv3Di
         GT4JxgY5Ft+LORhg1/IeV0jpdGK0ov83HruyNXNrMlBgyLZ9mBnApCFtKySQUhY4Mfwi
         O7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031725; x=1744636525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjOh7XzZGVY4R8MmVTia4KQX1z2/N3OeHsPkBIQsJrs=;
        b=BZruwrmk6mcljyZc0jHC9XcIYf2IE0284JBhAGJU7tReWet2aXzHzur2bZnPJG6OSj
         v1/mu2jb8KIyTeAZwkkv84x3kNzHutOxMG2qiqW9K7/xlsPX4TwXJI/54AdobWid2ZHJ
         ZXYdZu/Mz8yhw73T9pQ2u+tqZVgYo5L4HdCblKsGmFY2M4ioFUvLYzBtA9oC8/OkFDWh
         e5s6BSDhyO975CCmxsrBrUYEY6442AE7ffJLFrN8fBRhzupfKHEp25x/3MQK/4/14XB7
         SFgNxXZ0pIg9ynSrOBLbgLK1dkmmZ8NlJZGjHnGd2Sqm4dJttk9oot9Jac8EYCz1bVNh
         Bb4w==
X-Forwarded-Encrypted: i=1; AJvYcCXeTpDvLSsQKrhUsJDjpWu0dJufmRGO5sjcBYOscJNYQstMt/AjEFjs+azwf+hSqdNUSEdZQKRVeLZS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6v0vhnc4bsrksNFp9lpotaDZ2gnW/STEt5uxrLbqUn6aDuHq2
	6BuYfh0+6AN9cyyXhLYDuyRZO7c5eqduQRl20NGdI/At0N3CE4gj5T3kk2C3zBxBQ9EoBhL7P6G
	MIEJC6p4R0o6u3eFr3oib2y2DfIQ9gt6F6uPjnvvj3PwZhmhGw9c=
X-Gm-Gg: ASbGnctWBAuhx+3V+7/L5gHHW8x8aOfOaVplx4lG2bWszxPXmLSgBc73cYh/uxwk0vG
	fkg08Y5LQi5AXWQYEs8zmYnq6uOhOwiqC9NL0KY31eJ00jy/80C5Q0LFgU5PGj4+swyJudIdIMf
	q2uNUnoIdOqFM+iCVcZ02lZQnB0HQxx7BCb+K9GAZPQCh+n1juK+94DZPvSA==
X-Google-Smtp-Source: AGHT+IHGh/udpIDf412kVmxk8cC6uRbVuJQNw0qJ5UZ+KPEK/XSf1l3aNBgq+8C7/E7v0WR/Tz7A5hPNiTW4JagzLhA=
X-Received: by 2002:a05:6512:250e:b0:549:8f10:ec25 with SMTP id
 2adb3069b0e04-54c227936a6mr4385760e87.31.1744031724736; Mon, 07 Apr 2025
 06:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk> <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk> <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk> <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk>
In-Reply-To: <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 15:15:13 +0200
X-Gm-Features: ATxdqUGTMDclH5TnKhaYhwXEVKf8DzhgQCWQOa-7tBSTsQlS14Edzh1z_6W0Qgc
Message-ID: <CAMRc=MeFqvJ3g3GhrZzto+jfgCUhtcRRyWqx51gCkKhYUqtsGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:08=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> > I believe pwrseq could actually be used to hide the enable counting
> > for GPIOs behind a faux GPIO chip and the consumer would never see a
> > pwrseq handle - they would instead use GPIO consumer interfaces and
> > we'd have to agree on what logic would we put behind gpiod_set_value()
> > (should it effectively work as gpiod_enable() meaning: value is 1 as
> > long as at least one user sets it to 1?) and
> > gpiod_direction_input()/output() (same thing: highest priority is
> > gpiod_direction_output(HIGH) and as long as at least one user sets it
> > as such, we keep it).
>
> Like I say that doesn't do the right thing since other users need to be
> able to see when something changes on the GPIO.  If that just happens on
> normal gpiolib then that complicates usage for the default case since
> they now have to worry about things not actually happening when
> requested which doesn't seem ideal.

If I understand correctly, regulator_ena_gpio_ctrl()[1] changes the
GPIO value (even if it's shared) and then notifies regulator consumers
about a DISABLE event. Now if we'd be implicitly sharing the GPIO with
an enable-counter, we could possibly emit an event that's a
false-positive?

In any case: I'll allow myself to apply this series, as the
description does not define a specific approach to take and instead
just allows us to track the rework.

Bartosz

[1] https://elixir.bootlin.com/linux/v6.13/source/drivers/regulator/core.c#=
L2607

