Return-Path: <linux-gpio+bounces-2856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB89845300
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 09:43:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A464288563
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Feb 2024 08:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A9F433D6;
	Thu,  1 Feb 2024 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1WfLoA/w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433C91EEFB
	for <linux-gpio@vger.kernel.org>; Thu,  1 Feb 2024 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706777010; cv=none; b=k5LZx4PdRHocwY9LmX4i6mwYOmiEJ5QpLFoxv0eqAW+SzxTgCaSdUU2G4RXeQob8h5k9FgZpAf8oQ9bm1FqLeMqbZ3oksEtAZv7RAPp/ZPg5/Y6QJX4GBbicV6zKxvETLBgXhW7097SprpXIcgv9fMJElPoJGlKvoZPWq3TZ9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706777010; c=relaxed/simple;
	bh=IzmGUGaXz8wBIifiZyeg5ev1pL3ykf/0PKcEIh2DupU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeJXisr+MvwhEgYsQmbCw82Xnx3B+hWF6a7xVmvG02cG9jS9iz43qq5jV6hc4rofiGygusqBPePefVT1hJL9ncqaq188GpNgDegmRhWxxdTzNspkKKzEJqTmqd9TZEdncMRjNCgdHTTjDmLUBvWAmeNJ7p34ibsp4l4+ixIH+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1WfLoA/w; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4bdd39b62cdso246561e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Feb 2024 00:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706777008; x=1707381808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzmGUGaXz8wBIifiZyeg5ev1pL3ykf/0PKcEIh2DupU=;
        b=1WfLoA/wYv8Y9S/ruZyVeGdt/Czu97eH3vUdqgoxzqIET9VNJPE/PNXWAhzcvq9F/y
         QOKIsWa6x3JFYGnS4zmGpc+/2r5SZFxgkYfZisxgjNHn/xIVmWs6GqhyVBy5qpkgwrM2
         7YxgXssIXh2opY4AWn6PlEbJwB7kUcr/Yy3QPfO92WZE6m5WAITuSyOTZUipNKlZ5MqY
         9aHR4Dto+APusQib+xjBKhtN5qwUABo2Uj9RqdT7KxMeqhzzi/w8ANLLEHu48TTPQzG/
         AwKMSMN9I+cqkZi1hhWy1K9N4gtOKvEHRxRAfZJZc7U6uh0FiaEgtDJ4D/7Nfrg2UrSD
         7S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706777008; x=1707381808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzmGUGaXz8wBIifiZyeg5ev1pL3ykf/0PKcEIh2DupU=;
        b=ntvsSSvIFFlIPcwD+AkNn56nBH6zjgFdcYvnF3mGQYdKwWrYo7P0ZW6JZpBtPpP60m
         uU6U/UDN4aVgC9VC+fcRjscXLH6+Qb5gFRRr0r/caJqYtvkVvKh34tOyKTi37fcQE43J
         iA09NDeU2lLi8Uzc/ZVPbKuHkIV3JBrTyEd0kDzyiDIdN+Mhpe2z4mVVCbpogTiP007T
         YGjWklgO1NwzsKbJOhZZcGjDC5Uu20v+rpsSVbt/eQ+3ZsI75ssuEe0rYd9nIvF453tv
         MhxxyS9oZ1YMdZcSXQ/gKCJBiuwz/zEHDNlxW3ALH7n1+q5jOLc8+kzYUFIJxx9KrJkN
         xTxQ==
X-Gm-Message-State: AOJu0YwYvY9yrd5oxGCinBJohomg+w7F46+ctqQNwt9N4kbQtjlb4Jzw
	k7l7+YB5pTlFtHNyA6x3X8q0Ni3legEbQSulXR6AdOC1NxEt2wcS6n6VygZuCLXruDueNsbhCt2
	vVJQoYJXNjBSub7o4yR+2YBDo/vahlbWxL+KqNQ==
X-Google-Smtp-Source: AGHT+IEWitt5aHADd3KABSlQH1F2jCzCscaWz0pa+AEpfkGQEjYfRzCjE9lvQqSKzYQ1268NeVNSlgKX+72nRTQ9GXQ=
X-Received: by 2002:ac5:c5c1:0:b0:4b6:f0f7:1b53 with SMTP id
 g1-20020ac5c5c1000000b004b6f0f71b53mr2992060vkl.15.1706777008110; Thu, 01 Feb
 2024 00:43:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <CACRpkdZrKGHiaQc5NVq5ceV=++SE3j7xEfwD9FBWRz0GCFpMCw@mail.gmail.com>
In-Reply-To: <CACRpkdZrKGHiaQc5NVq5ceV=++SE3j7xEfwD9FBWRz0GCFpMCw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 1 Feb 2024 09:43:17 +0100
Message-ID: <CAMRc=Mcu2DbuvdeXugEr4w+sW0qLF7g9zDi8paoN1DpRtoVHSg@mail.gmail.com>
Subject: Re: [PATCH 00/22] gpio: rework locking and object life-time control
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 9:32=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > We do NOT serialize all API callbacks. This means that provider callbac=
ks
> > may be called simultaneously and GPIO drivers need to provide their own
> > locking if needed. This is on purpose. First: we only support exclusive
> > GPIO usage[1] so there's no risk of two drivers getting in each other's
> > way over the same GPIO. Second: with this series, we ensure enough
> > consistency to limit the chance of drivers or user-space users crashing
> > the kernel. With additional improvements in handling the flags field in
> > GPIO descriptors there's very little to gain, while bitbanging drivers
> > may care about the increased performance of going lockless.
>
> OK I read this before but didn't understand it, now I understand it.
>
> The series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I think you should merge it all soon so we get some time to shake
> it out in linux-next, hopefully any remaining bugs and cleanups
> can be done in-tree.
>
> Excellent work, by the way.
>

Thanks. There are still a few issues here and there, so I'll be
sending a v2 next week.

Bart

> Yours,
> Linus Walleij

