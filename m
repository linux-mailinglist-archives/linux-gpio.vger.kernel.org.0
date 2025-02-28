Return-Path: <linux-gpio+bounces-16803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5683BA4980A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 12:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C9761895153
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 11:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E088260A3A;
	Fri, 28 Feb 2025 11:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AksxK9oA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A6B26039D
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740740800; cv=none; b=msJkCjMEB9q97MAlTurQmFN9L6QN/W65Mezsm/Gd6aQaKRbGbwlx3UypWXymd5HCVQ5tx4jp2IGQGrI930H2uhXDAD+CqyUaZwaDzBN9GW1O9HV75Y0FeKO17kEj0wzJPEcWlHeptR7ojRieqjQMr4nLNNSwIA/tvG47TylaGNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740740800; c=relaxed/simple;
	bh=PqzNhXG8rEzrQIahSpPfvm8F5A9fOvQwMmFjKMVbc+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cEyJcKoUgONaQAdZ4lb8NA6h0n7UhOcq31IQnaFxAlnV07fnqwaozcqcMJO3C47S44D4yhw4kDimEvzwCTA4gbhgBYIx42eocPkvK+sHxWM6RI6fQjloUYySkABTQX5y6TY/arRo29CYTuZyB8ko4CUd1GJ8V9yYsDVYEd3i4Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AksxK9oA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2234e5347e2so39704325ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740740798; x=1741345598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuWdIFYbGdIGzbdoqtKFKJ3QGnIaDDX+fXvfRKGdsQ8=;
        b=AksxK9oAufkksBakvAlBXxhS4WgoV29qWAt6qVsSZk7NfjSapzCbtr1FP1Y2+DpbYK
         GelfCW3i04E967RKOBD5khXl0cbvpB8zKsbjmaI8ENf31r4Im5r6Hp2yD7H2vmzh1dR1
         R0qCrmVAOJHYeIYRE0cHoMmgjJNjP53P+w+klHaqwuvRPvV05ZJ7gyLtTLCTkb3W68RK
         sN3V+XcQxRjuRlZFQd2TgdGJb42iRo+vriJhWyBycK4fDeVnCs5tKcz7OLXtbtNNkRZk
         PHWRvjPI7VnzCGn08HRk7z9R31q0HcgUCbmseyUE632ocMV5Jvn0TwCoD/im0iWX03xu
         k5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740740798; x=1741345598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuWdIFYbGdIGzbdoqtKFKJ3QGnIaDDX+fXvfRKGdsQ8=;
        b=nIBiR1msUxTTJkWK3SGWhMNUfIDTNt6tWGxbVA5jeCo+mY90LreMt082a4VNp+anIX
         woDE0FU2ph6vs4QXOnnRf6BG4i7evwwHNqt8VKEw7tYbPmgBrgVhdkfKUts9RSkrpDUQ
         QSF9/8gZHBd0YITGWI6YpbGjoXKN/WV0wr8eINI+pchWjc6vrvhWsRnxGqQbKU8HxOlU
         b4AjjvxNtrOekORL9nGLC+45J9zzwEwGlyreAvxnTZnmbtGQcZGkzzU2lMcRwr0611hm
         SX9V0HNsw5Whq0v1K85hpJIcIP/zpfzTgecKuZG9DyYsxtVV9xbYyHci8IWwllfqUjMb
         t9kw==
X-Forwarded-Encrypted: i=1; AJvYcCWdv9sT6R8Mge+d5NZiQW1pS2cHoYIxreEyrPQybjLLmRdhBr0WfJS/UCF9lSypqCccaOy1CI6DQx2C@vger.kernel.org
X-Gm-Message-State: AOJu0YzYwCAiAtTudzJZVk1fSn6m7/a53TRPg0MNVZ4q2viNiZ9YN8D1
	2z+TOm2I7b/3PhghB5xXMYnxAv0CQ2hNnzheoSxJwjxu4rkPCx53tRVpr5+MPpA8J4CgTU1fgL8
	Wtq8nnMHct2b7NUWeRZfejjlFXMt31kkB02fl1A==
X-Gm-Gg: ASbGncu7Wm4qtPtwHPOnNHhFwHpQOpEQJ4om62lW8mlY61gvx7ykXqcJBY3y3SpQ+rK
	6FfNEi5LImN5ufiY51o6TYFq/7/o28IaqG0SXdQP5EfqSEfedJHdrK3AVoYsFBmXfWP5Vq7MZ+a
	8wqyMMTF5vbYygPmx+J7I5EgQaJUnxF1dq3emQ8x4=
X-Google-Smtp-Source: AGHT+IE14J5EyrjT41IPrMy+AQqz4ht6I0+szOFBOfKDh5RgLjx+o6ItD3Gjmbn3/n+lVnncYUTWUZPZNtHUAosDJvE=
X-Received: by 2002:a17:90a:e703:b0:2f4:43ce:dcea with SMTP id
 98e67ed59e1d1-2febac0573fmr4660509a91.25.1740740798309; Fri, 28 Feb 2025
 03:06:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0f3ea3f6-8ae3-4352-b790-de0642edc4a2@stanley.mountain>
In-Reply-To: <0f3ea3f6-8ae3-4352-b790-de0642edc4a2@stanley.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Feb 2025 12:06:24 +0100
X-Gm-Features: AQ5f1JpeV5ycRU3DrKxW61_3nMWiAgdQ9swVjRcBZJsLsp0orZtWoPZ9LK6Zx_8
Message-ID: <CAMRc=MeF42NeNJ_kR7H7oJsCHt=grTtN=c-3RbjFhX=uRQ5X9w@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] gpiolib: Fix Oops in gpiod_direction_input_nonotify()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 9:17=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The gpiod_direction_input_nonotify() function is supposed to return zero
> if the direction for the pin is input.  But instead it accidentally
> returns GPIO_LINE_DIRECTION_IN (1) which will be cast into an ERR_PTR()
> in gpiochip_request_own_desc().  The callers dereference it and it leads
> to a crash.
>
> I changed gpiod_direction_output_raw_commit() just for consistency but
> returning GPIO_LINE_DIRECTION_OUT (0) is fine.
>
> Cc: stable@vger.kernel.org
> Fixes: 9d846b1aebbe ("gpiolib: check the return value of gpio_chip::get_d=
irection()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

This doesn't apply on top of v6.14-rc4, could you please rebase and
resend? Thanks for the catch!

Bartosz

