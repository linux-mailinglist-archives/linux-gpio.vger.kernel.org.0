Return-Path: <linux-gpio+bounces-18360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B58A7DDDE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 14:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 638813AD5ED
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 12:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173B02475D0;
	Mon,  7 Apr 2025 12:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qCAqJriv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7022A7EA
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029509; cv=none; b=uAImBUgeKDLv5qwawPWH7xTbj5rGxzVXai8kpuoLgH1b2dXkxVkBaSJ2u4fkIm3k7VySkwWpSDJiT1J3iGtgj/rJx8Gb8PyoyyAmp9pWP4W61kFnLL8qdFq8PkQG4+vMCzm/84z82sedwnrZg8hrPhnr4SfAvRJVi0r5LdjJPNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029509; c=relaxed/simple;
	bh=pAtGxBTML0R69VpqhiO34biELTHBQcCt68gQZIWR51M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqbHouvnDy/nu0hWMV9XO4Ap6g2j67+gCMLeDYT8fEQ90xztp5WCYvwnRVv26TUpddy6bmdCrCndabeutP5140Xp5mYgfRUFq5t82OXfdYEu6hbTCY7Im+W+mxoFHe9gW513RvhiUUPE5i02047ypbEvI/ZpGL8ZDgc579Anw+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qCAqJriv; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499bd3084aso4017842e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744029506; x=1744634306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy4szLRSe8vbxOkm8ppBiJGXBESdF1XCg0JLSJwZApU=;
        b=qCAqJrivBwmRByzmk5eHPdoPWtZ70Uo12USYPwnd8t32Z/OUwvnyIAoInFdhCyhuto
         7ZlRkPL3lEFe0RukJwm806+Wt1W0xnLSdsHYUUVYi+IOgeQzZK7wjExRpODYCuCm72iO
         poXbNxAt7UVDsMC9UAffgmdv8x25m73vn0nw6IR+p8gsNI/L3QodEHrZmhGuXRerfiip
         k03y9yzE2QNPKpP6GngzC6SkRLZooumVQLURqOMiHM09aFvGbQWNNMPDc4Mq9hkKJkwx
         8U1MgJiT4mTQRn3r15DnLlMZHx7e0hW+18cNKVBg9vhYGNFnupWNZqENsHv0f9+G/ZpS
         Ah0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029506; x=1744634306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iy4szLRSe8vbxOkm8ppBiJGXBESdF1XCg0JLSJwZApU=;
        b=Pi1tY7yQFUJjPNRcGubLZ09kkhWQ3iUc0dsp2bcCRr2WwGJy8kJaPykDsBl4Wocf2e
         J5KA9uvxhBIkETxmr/UQfwwLPC4SZbF5EVjvxS/6ikPdqcWQZRLvmwuqEAJkpmVg52NQ
         7SaMkxca6FwveQMYXRqSFXuurf6qrvNkwBysltaGmrV7qk49z8asHldri6z669lih17v
         144Fj3J2Um/HvOoB10PYojzFHnPoM+mVBDXxjdVFb6q3EmCNjS3Bv7Cu42PvBfIBjFAj
         IHklPa3jjVfw3QiZtllEYwbq/kcK9qors7opCu4QxbOIDv3O6vh3kE7Hq/eIPE0q7VjO
         nYDw==
X-Gm-Message-State: AOJu0YxOvONi82NT6qmd7MsLAzl7PwrsNWzdBYBpPx3FJGCRijqYq5FH
	g5mSPgrUZ9Kfjluw1MfrFl4XMtShz2NtlFUBOo/VshgkbTf7GxdG31PZ2jyYjketycquOt2f9S/
	5gvhXbhbXgssJcOp7NmBF0NDmokkLMx7NprolOg==
X-Gm-Gg: ASbGnct8gND5M26d7BUpSyzFlNSu+MyouWuV9DqRp/E6eIi0wTzB6K1mx0qJwFYYNfR
	8wyuDPHdK+VZxTashk2IVCFLGLlqBLShJxEdAP0hrhb1Zm94uFxraf06cgXE2d0B0BGOAhRhUKK
	iE9A4TM9uarzZ+64/rM9XZ7VYbTcVtkEU4klK8/dzFjDjVaa1q51MqfVU3jA==
X-Google-Smtp-Source: AGHT+IGdH3gSPLDN9gl6cP7jpNmIl84e0kbjukzAlZsBAHpyHrW4IWPlbV43lMfcKk8pPXKe3hAYFgJpiXbC3nQ3wcM=
X-Received: by 2002:a05:6512:39d2:b0:549:b0f3:43a2 with SMTP id
 2adb3069b0e04-54c227dc8cbmr3043106e87.40.1744029505709; Mon, 07 Apr 2025
 05:38:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331-gpio-todo-remove-nonexclusive-v1-0-25f72675f304@linaro.org>
 <20250331-gpio-todo-remove-nonexclusive-v1-3-25f72675f304@linaro.org>
 <CACRpkdYMRnmYD1YRavZs7MHEVFM42bOL2=6s4rJzFDnfLJ4fAQ@mail.gmail.com>
 <CAMRc=McBWncrCcX87a3pYeZ3=uYGNhpSrK74hDP-XNYrT8WMMg@mail.gmail.com> <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com>
In-Reply-To: <CACRpkdbeObj7t=quffRrZtZQRRSr6GBeayN3o_8H8zGDD22XpQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 7 Apr 2025 14:38:14 +0200
X-Gm-Features: ATxdqUGl2wqh4ZOWupG9tgo9s9dJU72oPdHvkqUaP5UmimCE45Echc5dShzPz3k
Message-ID: <CAMRc=McKgfT1ZLVzsVbBJ5pFc3bwcGT4AyXG+V0JPP0z6ft3tg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: TODO: track the removal of GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 11:02=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Apr 1, 2025 at 10:57=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > > If several providers with their own struct device is using one
> > > and the same GPIO line, the devres consumer is unclear: which
> > > struct device should own the GPIO line?
> > >
> >
> > Well, other subsystems just use reference-counted resources in this
> > case but see above - this is not a good fit for GPIOs.
>
> So to rehash, for example clocks and regulators are by definition the
> equivalent to NONEXCLUSIVE, that is their default behaviour.
>
> Two devices can surely request the same clock.
>
> They can independently issue clk_enable() and clk_disable(),
> and the semantics is a reference count increase/decrease.
>
> They can have the same phandle in the device tree.
>
> But GPIOs can not. They can only have one owner.
>
> Technically this is because the only reference count we have in a gpio
> descriptor is the boolean flag FLAG_REQUESTED, and it
> happens like this in gpiod_request_commit():
>
>         if (test_and_set_bit(FLAG_REQUESTED, &desc->flags))
>                 return -EBUSY;
>
> This semantic is in a way natural because what would you do when
> two owners make something a GPIO cannot do, such as
> one does gpiod_set_value(1) and the other does gpiod_set_value(0)?
>

Or even better: one goes gpiod_direction_output(desc, 1), the other
goes gpiod_direction_input()!

One goes gpiod_set_config(OPEN_DRAIN), the other gpiod_set_config(OPEN_SOUR=
CE)!!

There's just no good way of allowing multiple users to work with the
same line in a safe and sane way.

> This issue does not exist in resources such as clocks or
> regulators that only do enable/disable and that is why GPIOs
> are different from other resources.
>
> Then we can think of solutions to that.
>
> One way would be to add a new type of refcounted GPIO
> descriptor for this specific usecase, like (OTOMH):
>
> struct gpio_desc_shared {
>     struct gpio_desc *gpiod;
>     struct device *devs[MAX_OWNERS];
>     u32 use_count;
> };
>
> struct gpio_desc_shared *gpiod_shared_get(struct device *dev ...);
> void gpiod_shared_put(struct gpio_desc_shared *gds);
>
> int gpiod_shared_enable(struct gpio_desc_shared *gds);
> int gpiod_shared_disable(struct gpio_desc_shared *gds);
>
> So this compound struct will not be able to set value
> directly.
>
> The gpiod inside that shared descriptor need to be obtained with
> some gpiolib-internal quirk, not with gpiod_request().
>
> It will issue gpiod_set_value(1) on the first enable and
> gpiod_set_value(0) on last disable its internal descriptor.
>
> If existing valid users are switched over to that then the
> NONEXCLUSIVE stuff can be deleted.
>

I don't agree with this. I could possibly live with that being used
exclusively in lower-level core subsystem code (for instance:
regulator/core.c) but, in this form, this still requires drivers - who
have no business knowing whether the GPIO they use is shared - to use
the right API. Not to mention that once you make an interface
available, people will be very eager to abuse it. IMO this should be
approached from the other side.

The closest thing to making the sharing opaque to consumers is
providing a pwrseq-backed, faux GPIO chip that allows a very limited
set of operations on GPIOs - get, get_value, set_value - and return an
error on others. A value set would actually be equivalent to "enable
high" and be refcounted by pwrseq. I have something in mind but this
cycle, I already have a lot on my plate. I will get to it eventually
and come up with some code to back my idea.

In any case: the GPIO sharing logic should be hidden, I just need to
figure out how to make it possible to be notified about when the value
change actually happens as per Mark's requirement.

Let me reiterate: a random ethernet PHY driver should not have to call
gpiod_get_shared() or anything similar - why would it? It can be used
in all kinds of situations, whether the GPIO is shared is none of its
business.

Bartosz

