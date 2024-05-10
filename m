Return-Path: <linux-gpio+bounces-6292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075D8C25D9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 15:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBE112857E4
	for <lists+linux-gpio@lfdr.de>; Fri, 10 May 2024 13:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A850612C46B;
	Fri, 10 May 2024 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhoA8unw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6515E099
	for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715348111; cv=none; b=kw4ikZoVMbwv/n+K08hL3/MrBBMxLYlomCsLSyVXvluZ6UIoiQpwgPB5N4hHVVfkrXcUKD4ZeyezbOQ4AEzx1FpkjMJITovs3bJIh3y6cYNCBEuiakFoOvV5F5ywPzRy+fPbehQS6Bkb09Lq3PuKTJ5FXB+ZbrDQZ9rBC92ug+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715348111; c=relaxed/simple;
	bh=OvjM22bKQ7Yx9DCNrSgwuO1UVOGrCYf05iWG7mJURDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTZNX8evKaWSgP2otG6YIw4Y0stg78OkbY5xsDB04uXRLAPIg6Pyob7bKaxwvr4sTAoY5I3Fja/js6rZmMg1cn7fRFJGPs1SqmaaifwB1ap1PEK4ifWqYlKPgT32TOF5Y6qKczZ142qw1Ni6P5bRcOBPXByYy3vtmr3ALaI+OwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhoA8unw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59a0e4b773so491290666b.2
        for <linux-gpio@vger.kernel.org>; Fri, 10 May 2024 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715348108; x=1715952908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z/WF9EK9tZcqaL8I/iPFkkiWdIRn1J1eTch4hQphBo=;
        b=RhoA8unwXkCYTh6oLoXs21RxfwQhtkXxE0lAL9vexOVkAFunwQXvloiNBdXqcbCMFx
         fhU3+ql5eUXbYqhE+VqoVbkLGSkvkRVclufaUH5IUaeBHkBcftsyPYsYdkLEv3oxl9DI
         G0IklxBBr98LGf21NKJuW42zNrE0nptE1wH95ROi0izxjxrpfO54NPCT0ClE41ObuyIz
         zhh2nlCKtC+RnfCWccCXZhakE+/h/0B/z2QefMdtV4OVhlK/OzEd//oiqiYlLr8E0Tjw
         89UiV/75tBNZUm+ka4a55IKreLWU2J28HrJpTk3MGE0kMc8DnbsZjOrrKSxgofSViikH
         NG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715348108; x=1715952908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z/WF9EK9tZcqaL8I/iPFkkiWdIRn1J1eTch4hQphBo=;
        b=Tcz0pb4o9DDx7eNgM/sFUkB8BdCy48oFzHIGvRXh6Hiv2mnKdKkcNOjpzXvyf1MxK/
         EPoxYQDOJVqoUDSCGnQ41mwXEaqQpijxyAktJfF1zwGgKlfqASG5nTUnhnKmemdIabzZ
         a5wULtZ2GPP8zqCnzllTJgxBV4agfkzwCIvHIfY3ixMy4IdF0+D49kxKT5LxVPB8ppjG
         0EZIMHK06uzhMQe4Ef7l2VCaIy5q51JkpkeFlP8ajDTXk5Dl1kdtLgHILn0PTBxZdNHb
         QzVo/mXxZ3/MbC9vTGw4Egwka/WRGNfFlFLUP2iZOtrNSfPhK5/Lq0muPxWJhmDh8WxK
         MczA==
X-Forwarded-Encrypted: i=1; AJvYcCX60LT8sNad9EweiRH1wiF5TEPSGm4ytiBxRN8Wc3oBxfXnJuPlqgREQ1rnGFkX3vhh2u4L+P29pnC92xWvrBGeWLxWdNd4CepN7Q==
X-Gm-Message-State: AOJu0YxFiNMKZjsSvQX3qBc7nxbz2hVYHUaDSGL+BxnHZZuEWzZdw2+7
	Jd+HhPNq5HUlXEl4cI4znUIs6cTRsh/esO1q76l9Cna6rdfg5KdYafdHI+jLc3nsjiLSwkAAwUm
	3DZLpynoFdlM0PWhavZDxDnqo9cc=
X-Google-Smtp-Source: AGHT+IFru+UqFq9gfmS5rsgmHO4zzjFJhXOFUjvCHZibm2WFbDnhHkjJYccZLh/xglciE/NLKzlOFCXyYxSoDusK6YU=
X-Received: by 2002:a17:906:3b50:b0:a5a:7a1:5d9c with SMTP id
 a640c23a62f3a-a5a2d66879bmr183692566b.62.1715348108221; Fri, 10 May 2024
 06:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240508103118.23345-1-kabel@kernel.org> <20240508103118.23345-4-kabel@kernel.org>
 <ZjtfCjAlDMMndRfv@smile.fi.intel.com> <20240510100946.270c00e3@dellmb>
In-Reply-To: <20240510100946.270c00e3@dellmb>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 10 May 2024 16:34:31 +0300
Message-ID: <CAHp75VdEDhShmZDriikP0799BrV0sCZiwENhpLBoo2zGNMkLsA@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] platform: cznic: turris-omnia-mcu: Add support for
 MCU connected GPIOs
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 11:09=E2=80=AFAM Marek Beh=C3=BAn <kabel@kernel.org=
> wrote:
> On Wed, 8 May 2024 14:16:26 +0300
> Andy Shevchenko <andy@kernel.org> wrote:
> > On Wed, May 08, 2024 at 12:31:12PM +0200, Marek Beh=C3=BAn wrote:

...

> > > +   if (type & IRQ_TYPE_EDGE_RISING)
> > > +           mcu->rising |=3D bit;
> > > +   else
> > > +           mcu->rising &=3D ~bit;
> > > +
> > > +   if (type & IRQ_TYPE_EDGE_FALLING)
> > > +           mcu->falling |=3D bit;
> > > +   else
> > > +           mcu->falling &=3D ~bit;
> >
> > If those variables was defined as unsigned long, these can be just
> >
> >       __assign_bit()
> >       __assign_bit()
> >
> > And other non-atomic bitops elsewhere, like __clear_bit().
>
> Changing this propagated to many other variables and even required
> some refactoring of the omnia_gpio structure, since the bit, ctl_bit
> and int_bit members are stored as a masks, but __assign_bit() /
> __set_bit() / __clear_bit() requires bit numbers.
>
> For example
>   if (gpio->int_bit && (mcu->is_cached & gpio->int_bit))
>     return !!(mcu->cached & gpio->int_bit);
> needed to change to
>   if (gpio->has_int && (mcu->is_cached & BIT(gpio->int_bit)))
>     return !!(mcu->cached & BIT(gpio->int_bit));

You rather meant

  return test_bit(...);

> and so on.

...and so on :-)

> Moreover, I agree that the if-else statement which you commented on,
> when changed to __assign_bit(), looks much nicer, but some changes that
> sprouted from this are in my opinion less readable.

Maybe. It can be done later on.

> I have prepared the fixup patch, but I am not confident enough that
> everything is done correctly. I would prefer leaving this one for
> later, if it is okay with you.

--
With Best Regards,
Andy Shevchenko

