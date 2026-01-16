Return-Path: <linux-gpio+bounces-30655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DE6D317BD
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 14:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A4DA301A4F9
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jan 2026 13:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F5823BD1F;
	Fri, 16 Jan 2026 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u97JnkF8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BEE238171
	for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568600; cv=none; b=lxtEqiVpLX3OzuLy06DPHhmgb3GBR4dUNXobj0UTnM0lKboAEjoqYEydUtynzOREdyDaCEg99b2+0e+by3N+IADMClntZpIr6w9ErxEeBMf0KpF9QqJBArO3oi/9qCzBNwCVTJ0Ev6BZjRawV/zHfxl5v8t9QB6pM4Sr6TIKmiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568600; c=relaxed/simple;
	bh=ie4G4ur51A6e6k3vsTccGcKjtOGF6MpnoTbCUV6RqMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDHy6VhuIBkVXhy8UKDTREP3PIy9rB8y0fT8cy7G2mf+ylLpZNM66d+hdiiTPXiCc4VBiPIsID08saiqTqV4gZZyXNo2AHroIE2PnX/Wm976KOX8r9beQZDh7iWtHmQ8iCXJhq2J9pOJSaGt4cIvhu6KePN/fwLrlj3Xzd8pInU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u97JnkF8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22139C116C6
	for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 13:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768568600;
	bh=ie4G4ur51A6e6k3vsTccGcKjtOGF6MpnoTbCUV6RqMY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u97JnkF82MXRfIPggqt4viRuC/EbQeGkWgvmFuwzI84Vu5P2r38OGaIk+NqYOY82K
	 7DvyZQNOxk3BjoVX3sgfsInitrq5jOJQzfMqKTH2b/z90UCnSjmh6hiBeRcWo/cUVo
	 ck9xAk0QycAMdMvpkmkHtZBVjGLLLh1S/3NC+Qt1TCrLxuCsovP0C3Pm9OfmQfjq6F
	 nXjcz98yXEMr2afe3iYLmovyNN+MKLvodfque86MOA8ELB22dkOq0dos/F5R3HhZMF
	 b3hL2CaWcAWyiOhrcPMduzE0bcL7t0vbFYD/LRp8o07RJvcjn3RZ/mgTDKXEbUUKhU
	 fdZY43OlBQxzQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b6c89d302so1746279e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jan 2026 05:03:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKFNjTR4buchL8YgRKWBzxTURC7YbNdw9dv7eKvg6N96cR2yl80sS5LhakX2J1YWWLT3U1UPhmDvPX@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHAcUbRaR8qBX18ws/CLnDIbVHevbJIckGi/rZ6tljHRyywvn
	+k5NeIHe9boT4We6GN9U8VMlopAZKSL6jDw6HvztKEHabfsOuBkrvU8kchVs+qmYIdUM9Okz3L4
	4GKKju3FrgkkPm7fW07Yxv5ZUrhq9ao2vTdZbsMEChQ==
X-Received: by 2002:a05:6512:4015:b0:59b:b0f9:53ed with SMTP id
 2adb3069b0e04-59bb0f9545fmr728142e87.3.1768568598697; Fri, 16 Jan 2026
 05:03:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD++jLkJfyhmpepkanMyvLc_C0v_XZeoEKj8XJ3bw5fJAqJYyQ@mail.gmail.com>
 <aWjlJTnrI8r0iIMR@smile.fi.intel.com>
In-Reply-To: <aWjlJTnrI8r0iIMR@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 16 Jan 2026 14:03:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me4dMf2hV1R=aFrmOqH5=07JBHH68wjMdgUE79FQjNwGQ@mail.gmail.com>
X-Gm-Features: AZwV_QgdSwOtKccJ-UBi3AYmHyExexUncON5DGqsqyE7bUw4Xlbu_EQyjdZc0bQ
Message-ID: <CAMRc=Me4dMf2hV1R=aFrmOqH5=07JBHH68wjMdgUE79FQjNwGQ@mail.gmail.com>
Subject: Re: GPIO direction problems in gpio-shared-proxy.c
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Linux pin control <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 2:01=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jan 15, 2026 at 10:41:11AM +0100, Linus Walleij wrote:
> > Hi Bartosz, Andy,
> >
> > Andy is good with problems like this, so I explicitly address you!
> >
> > A review of the I2C core brought this problem to my attention:
>
> (and seems it's spreading:
>  drivers/tty/serial/mxs-auart.c:1522)
>
> > we have the following confusion in gpio-shared-proxy.c:
> >
> > dir =3D gpiod_get_direction(desc);
> > (...)
> >
> > This function from <linux/gpio/consumer.h>
> >
> > if (dir =3D=3D GPIO_LINE_DIRECTION_OUT) {
> >
> > This define is from <linux/gpio/driver.h>
> >
> > So we need to move the GPIO_LINE_DIRECTION_[IN|OUT] to
> > consumer.h if you want to use it like that.
> >
> > But we don't want to include consumer.h into driver.h or explicitly
> > into every driver.
> >
> > The I2C core and any external direction user looks like this:
> >
> > /* FIXME: add proper flag instead of '0' once available */
> > if (gpiod_get_direction(bri->sda_gpiod) =3D=3D 0)
> >
> > So this needs a proper define too and it isn't a driver.
> >
> > Shall we create <linux/gpio/directions.h>
> > with just these defines and include that into consumer.h and driver.h?
>
> If we talking about header level of splitting, I would do it as gpio/type=
s.h
> (gpio/defs.h) as others usually do.
>
> As for the particular problem, and I think Bart has better view on it,
> I think the use cases should be revisit first to understand "whu?" do
> we even need that in the code. Since we have two so far (or more?) we
> can try to address each of them in a better way.
>
> OTOH if we have _get_direction() in consumer.h, why don't we have defined
> possible answers in the same header?
>

Because we also have the .get_direction() callback defined in struct
gpio_chip in gpio/driver.h. :)

This isn't a big problem. It can probably be fixed as Andy suggested:
add gpio/defs.h, move these defines there and include it from
consumer.h and driver.h. Possibly adding some more symbols to defs.h
that are used both by drivers and consumers.

The bigger issue for me is the mix-up of the defines from dt-bindings
and gpio/machine.h. Some of them share names but not values, others
share both while some none. I have it on my list to start untangling
it and provide interfaces for translating between OF and machine
definitions. We already have that buried deep in gpiolib code but
sometimes we need it externally - for instance: to translate
properties between different types of fwnodes.

Bart

