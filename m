Return-Path: <linux-gpio+bounces-500-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A27F8697
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Nov 2023 00:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F852815B9
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 23:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAE13BB2A;
	Fri, 24 Nov 2023 23:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qazBRhiv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280A91735
	for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 15:21:02 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5ce4b3f138eso8575537b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Nov 2023 15:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700868061; x=1701472861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=832S1f2Xwx2zLdOice0oOrUzqvYUU/GTrx3blD3lxiY=;
        b=qazBRhivtjdkP4YfKiqIJpG/+XMxXRcEkMXpMUl+HvHU6xDMYQLLeKQOiix16R4bvu
         XU4BAeoqMMOZVPeiTYcPqFR7wK/nMJW0mzBYw28e8+BwONZmTaPgChYz0S7vjSrobVJ9
         bWQpskqZl7nnmt2QvMEl2ZSpfZ4Gx7foPEY6PapHrmEmBxvU+NxCqEN5z05AR4PpSPGY
         OF0kkBlECn4PUnLaQOIdunWET+a9O9Y96Aj1pF4ZbNFcRlopk7AFkcbLj3sN+wy6vVB/
         oREpRFb7HUQwu8u/NGNbUbMnnfBHqTkSSuJVJy/yxI+wpNcPdQZ+Vr3iaFmagBlU2hqd
         b5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700868061; x=1701472861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=832S1f2Xwx2zLdOice0oOrUzqvYUU/GTrx3blD3lxiY=;
        b=Ey7CN58Hy1zaZYO4YNcKoa2cuVXQjvRaDw/zs8jn9ic4c0KsZ5CFXNMvscloEbzqls
         PpteaZnQgwnTIgzs6P21z/cUTcdrRKaYIfrSgEHIpcuQukbi7WSnEqXx92dsmy6iLatL
         dIaUZzv9d4nbszAWAj+ogcSM2R1c8rGLWCSRgyIwLfCsH07/iigCbtB4bF0uWoKmfmXq
         +Wq6qQ7ci+tYqULmUSjeMZ6zdEm3jc1u6SxDfiZ0XeVvbNEl2FIqDBaHQMuuWBTCqF9V
         3gS3x35jlePsT//pLGikGoCzCnZotwD2sdA1aojXJBNq4nciSKgsw8yt3ZcWTxp3m2q6
         qgnA==
X-Gm-Message-State: AOJu0Ywludepob/SahZmZS87mJFRJ9ZKFiOQA7ELz99gUZBddjzdmnF7
	EXYeFPtTMWAWio9oun7x+RgGHtP8fLBZtVCN5fJQSxfvsRmOCXaV7fk=
X-Google-Smtp-Source: AGHT+IFnKIHCM2+6sKxBbaunPlgos10y3oJI9IgpcaWwZnPVGb+1pvpl5sQpqI88g2tR1KtMJ2amQwH6ec0zYCv1d7Q=
X-Received: by 2002:a0d:e20a:0:b0:5cc:3963:ff69 with SMTP id
 l10-20020a0de20a000000b005cc3963ff69mr4774855ywe.8.1700868061272; Fri, 24 Nov
 2023 15:21:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
In-Reply-To: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 25 Nov 2023 00:20:49 +0100
Message-ID: <CACRpkdapj9jdSC0bsoaLxrYKy3aB5ui5c3pAg+Zr0acP9umG=A@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Kent Gibson <warthog618@gmail.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 5:00=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> There are more instances of this pattern. This seems to be a way to
> work around the fact that we have GPIO API functions that can be
> called from atomic context (gpiod_set/get_value(),
> gpiod_direction_input/output(), etc.) that in their implementation
> call driver callbacks that may as well sleep (gc->set(),
> gc->direction_output(), etc.).

Correct, AFAIK this is why this looks like it does.

> Protecting the list of GPIO devices is simple. It should be a mutex as
> the list should never be modified from atomic context.

If you are referring to gpio_lock then go back and look how that
got where it is today:

git checkout d2876d08d86f2 (initial gpiolib commit 2008)

The ultimately confusing thing is that:

1. Yes it is protecting the list of gpio chips
2. The struct holding items in the list of the gpio chips is
  called gpio_desc...

Then this comment:

/* gpio_lock prevents conflicts during gpio_desc[] table updates.
 * While any GPIO is requested, its gpio_chip is not removable;
 * each GPIO's "requested" flag serves as a lock and refcount.
 */

Is cargo-culted to present day and is talking about gpio_desc, but
nowadays gpio_desc means something completely different...

OK I'll send a patch just deleting this comment, it looks insane.

> This can be easily factored out right now.

JustDoIt :)

> Protecting GPIO descriptors is
> trickier. If we use a spinlock for that, we'll run into problems with
> GPIO drivers that can sleep. If we use a mutex, we'll have a problem
> with users calling GPIO functions from atomic context.
>
> One idea I have is introducing a strict limit on which functions can
> be used from atomic context (we don't enforce anything ATM in
> functions that don't have the _cansleep suffix in their names) and
> check which parts of the descriptor struct they modify. Then protect
> these parts with a spinlock in very limited critical sections. Have a
> mutex for everything else that can only be accessed from process
> context.
>
> Another one is introducing strict APIs like gpiod_set_value_atomic()
> that'll be designed to be called from atomic context exclusively and
> be able to handle it. Everything else must only be called from process
> context. This of course would be a treewide change as we'd need to
> modify all GPIO calls in interrupt handlers.

This is a much harder problem.

Many of the current API functions can be called from atomic and
nonatomic contexts alike :/ this has historical reasons of course.
Back in 2008 most GPIO chips were just on-SoC and resulted in
a register write: no problem. Now we have quite a bunch of GPIOs
on I2C, SPI ... and the API looks the same.

The _cansleep functions were supposed to be used explicitly in
places where it is OK that the GPIO can sleep (as in: I don't care
if you sleep or not), and every other site using the non-_cansleep
versions should be where it has to be atomic.

Every call where non-_cansleep is called but it doesn't matter is
essentially a bug, they should be using _cansleep versions.
(Oh boy ... such much bug.)

In 2008 when it was introduced, *_cansleep had one single user:
drivers/leds/led-gpio.c because it was assumed that users of
that driver would not care if LEDs are on GPIO expanders or
on SoC-resident GPIOs. Ironically that driver now keeps track
of whether the GPIO is sleepable or not...

So if you propose turning this on it's head by creating *_atomic
and opt-in to atomic behaviour instead of opting out of it, I'd say
yes, but only if we delete all uses of _cansleep at the same time
and that means the default behaviour becomes _cansleep.

Keeping both around at the same time is going to be
a complete mess.

Yours,
Linus Walleij

