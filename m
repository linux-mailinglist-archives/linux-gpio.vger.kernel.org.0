Return-Path: <linux-gpio+bounces-28191-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08CC3BB73
	for <lists+linux-gpio@lfdr.de>; Thu, 06 Nov 2025 15:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 209F84F688F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 14:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D84E33FE32;
	Thu,  6 Nov 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ylPbjCkI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CED92E7F1C
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438722; cv=none; b=QySH9wO/x97+BJokwjl/3S0yKnUEykDAEZ/fJTgV5Jcz89afFtnMB0qQzEUYlz9m5fVgUyj4P9jKtefq1CduWbQLhuHLrI+6HU9So03b9mwpbR9Gtn0TsTZW3VMjLDXAtB5GzNP/FfYGEeLWmeB0O4+43hNupiRhKy7bSl0Hxx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438722; c=relaxed/simple;
	bh=nbU9VTJQs8QIjbledFSiiMZSbQur1NbRbjuGKQHQDy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyKqnT+VR329NEy4nDyN+xXy1hMDLqnzJFfGluVnw6jg5G+Tp9420qt3Qk8DguMbEGDOPUpaIR7AbtCKpr3j5/hLhq1Grxq++1BDsAuEegEn+KzFkkg5VdPUNsR4EW36tMfUlSXPjvJhVXtYJQoOPZ74Ye5Ixz54RkIgH43GZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ylPbjCkI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59431f57bf6so1054760e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762438718; x=1763043518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UYCyFD4Bb6aFEIHyNbsrjvvwW06LJgyiNw5ci5l6Zw=;
        b=ylPbjCkI66k6A0ncr7t2GiAUCQ1ie8tF/WRaSRAUevrkVrQ24Ri7Xcl4uOUtoiuNxi
         IVgRLe592zxyH3sRldeCZa3Yi7HUGqXdQpM17/VDz+WUB5m7qLwt10DRKW0coCYubewU
         j6n++SkNpwUZDfaUUy47xt43vdZQnQ2g45PTl/nRxo58Bpv7CDoi7XkYf4xjBs1McUlL
         Y31DJ9kimin2sEHEl2u1QHsaCRfFhyasBnExqo3wW74oKnHrj2gSfaNU3gE6yZ48A/7f
         kCMCMfBvjWUl2KSdLsFbaShNFRzOAsaOb4nesmJlR2xaLRJVMuME6Z+ziiieUn17EWUN
         /RjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438718; x=1763043518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UYCyFD4Bb6aFEIHyNbsrjvvwW06LJgyiNw5ci5l6Zw=;
        b=N+QlfwRiZp87RfP9ZtqXDzSoMnU+QBiHwGVzM8SVYv+v2tpp0MsvvnthViN89u46FG
         S4xtyp4oFsyZFR9uwXMHdzwO1wyceNJUgdcoLoafbsav7KeQcAM1gVTqtDS2XQnbrX13
         kMi8Mxwm6sUndAqI+67vP0qzfnh6bN/fqOWRBLmCnUjsyel+GRE/en6FabzoqWYMJmiV
         ueLhVuaK4H3CPQaG1472iDYLsgzM6Ys3TuRtxIbQ0GYuAklRn4RtXnOxAmsPg7gfgkdA
         kIwpXKzmPJ90nw/WgcG0/YtmZ61BkmzK9SRhkgdIRRfZfGmIRV1Df3yz2KqqEawdVcXW
         AK3w==
X-Forwarded-Encrypted: i=1; AJvYcCXuqg7733f3n8OBCEBaI0KK+EtVTqCuwqFNCJDEAmkYKF7wg7I+JSc6s6kQKYSccd+awk7eZo+X2W+W@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Rib29VF4OMVc9MNyY4//wE2qo+uh12UwxdmcHJuZyRoGE3Ao
	2p5M44PIMNPJudoXKgCnOW/dkmV7OpRunA9z43eiOowxRfjBKQMZwtZ/0HC49Gv/GI7G6bxPCrc
	33rt25/8+6SuQcQbVrKeBhclzdMAK495C5g/5PGh7EA==
X-Gm-Gg: ASbGncsxYKmw0Q4Q6ALo3Sjxz6JjKJ41dizUmnAUVqB46matJfqqxxDKzhOVEJFzXWm
	TH5s4gL87eb9dH1WfDJp84vSrCpu9BHqTW1OHqVgA9hgR3Vt9ao9uo7R877RwC3+HFnWoSeMrjm
	NGSajRTT8ZHYgNMpR5NchV696wyfvi2eycrbptdudIPbpDtXGAbToDIVpWMIDs4qTds2+cZ5tN+
	53TAyeXICm/fpw7GAD7aNxM227nxJ9oWafjDAtQM1rpWI9CnWnD5GYdaXXGBYcSm5Z8gYPKdok6
	qW6QBuCJPvAD3f0=
X-Google-Smtp-Source: AGHT+IHdQJZPunwUY3ZHIE+wSItRDRGbaVjfDZ3bclHs8LsxocMfrUMoNk7HzUzk835mq0tyKBc5gXkBG+W/siXqRXk=
X-Received: by 2002:a05:6512:61b1:b0:594:34b9:a817 with SMTP id
 2adb3069b0e04-5943d7c01acmr2183793e87.33.1762438718011; Thu, 06 Nov 2025
 06:18:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105-reset-gpios-swnodes-v5-0-1f67499a8287@linaro.org>
 <20251105-reset-gpios-swnodes-v5-8-1f67499a8287@linaro.org> <aQta01b_PyeHirxu@smile.fi.intel.com>
In-Reply-To: <aQta01b_PyeHirxu@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Nov 2025 15:18:26 +0100
X-Gm-Features: AWmQ_bm4y26DefF3te9d8PCRfESO6EycvWadxioNhhdZRQkv54SvcFlwZN3U2B4
Message-ID: <CAMRc=MfgPsf78pPTD2zNYkjp6QYO2xFnzN-niEaVn7nkjnUB5A@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] reset: gpio: use software nodes to setup the GPIO lookup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 3:10=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 05, 2025 at 09:47:39AM +0100, Bartosz Golaszewski wrote:
> >
> > GPIO machine lookup is a nice mechanism for associating GPIOs with
> > consumers if we don't know what kind of device the GPIO provider is or
> > when it will become available. However in the case of the reset-gpio, w=
e
> > are already holding a reference to the device and so can reference its
> > firmware node. Let's setup a software node that references the relevant
> > GPIO and attach it to the auxiliary device we're creating.
>
> ...
>
> >  static int __reset_add_reset_gpio_device(const struct of_phandle_args =
*args)
> >  {
> > +     struct property_entry properties[] =3D { {}, {} };
>
> It's an interesting way of saying this?
>

I hope this is the final round of nit-picking...

>         struct property_entry properties[2] =3D { };
>
> >       struct reset_gpio_lookup *rgpio_dev;
> > +     unsigned int offset, of_flags;
> > +     struct device *parent;
> > +     int id, ret, lflags;
>
> I assumed that lflags shouldn't be signed. And IIRC they are unsigned lon=
g
> elsewhere (yes, just confirmed).
>

It doesn't really matter that much here but whatever. I do plan on
tackling the duplication of machine and OF flags at some point though.

> ...
>
> > +     rgpio_dev->swnode =3D fwnode_create_software_node(properties, NUL=
L);
> > +     if (IS_ERR(rgpio_dev->swnode)) {
> > +             ret =3D PTR_ERR(rgpio_dev->swnode);
> > +             goto err_put_of_node;
> > +     }
>
> Can save 1 LoC?
>

Oh come on...

Bart

>         rgpio_dev->swnode =3D fwnode_create_software_node(properties, NUL=
L);
>         ret =3D PTR_ERR_OR_ZERO(rgpio_dev->swnode);
>         if (ret)
>                 goto err_put_of_node;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

