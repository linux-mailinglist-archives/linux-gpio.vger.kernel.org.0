Return-Path: <linux-gpio+bounces-26984-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAA9BCD662
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 16:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 313704FE3F5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 14:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADF22F5A0F;
	Fri, 10 Oct 2025 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="z5niHqba"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E572F549C
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105289; cv=none; b=gPKQBkMkJGjh/G75AOuM1qi1/jB9DHUEjNZfuvMWRpb6udLc13zqYhDX93DSB53I0uHu2/3vvwHpR4bAT1xQiBzS6ZZhBW0ntQL0SfrORnUwcjnHYgXESG8A5AtRLDIU9ZwbOwZsgxxz2jWGisdPpS4lVex4UtCa4/55RHKWIJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105289; c=relaxed/simple;
	bh=PRCrERU4iVFNJh1/SE6Rm+MP1O2bUJxcYnVz9FA91xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=btDoMd7c+5V2/AUZO+SUpz3CYMnsm/WKdRzWD+8U2yanNxa2DNutXMG+Ym9VSjL4mMLB+3jnE2pVptX7NEmxAdUhl5DuHISlYnDmDRswYmrOI8E6+XYRab4Adkw6CAkCQjTURkjUSU4MUHEfuAmScOw6fALR38qeuEeb72xgPFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=z5niHqba; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57e8e67aa3eso3937581e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760105285; x=1760710085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0a5YLRen5Jr09E/K99v7KsUndARndAX2xcF5o7YCUo=;
        b=z5niHqbaDGZ5AHiPOHCDBz6TaMm5zo5mpWqWaQaB4BDoGFIy2JpbjA9sk+7Ep/EQP1
         ClqccSqBZuHdgEBEAuY3kgWMsWy0jdfBrDkCUqgE/KoMUrreRicunU/B756kCf2J/CpX
         ufm4DE6AotR1N+qwh386HaOLBJHaJlIi+gV9YY/1CaB+22VDTkSxMFVn1VCHQYo4HNEe
         3LXO8I+0O/YNK4tboyF5Nr3XnuxNit6cU4S6sS5BOMAwx2iv8Qb6A3qfNmXd1DjWhlvy
         I9s+Qmjdy21L0FIEISS+oaL5XaiQBkSDtW4BSAzKwC3DNcV9Xa3gmpxA3vlHMo532vKi
         eFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105285; x=1760710085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0a5YLRen5Jr09E/K99v7KsUndARndAX2xcF5o7YCUo=;
        b=MfB4w9CCaH74fTJLn99syvi+YWjkjxWegch72YUWnsIq/H2VvStU1KzVWtwp5+YUMI
         19K+iIccQ8xfU8X45eEZeYPnW+Ds6ukM0xmi1utlua46hOGWTt9LDXCrpxb6Vd9ho0YF
         /o0xTjc/WcitCQU8XkN/r0ie2KfKQqI0tEihSjVXq359r1OEZ7PhVSRb1aOwhO/3yj/g
         tj1rnWVMwvVMEBV2MWSbwIW+qKWvlE51oTDDRpj/719+Y/78x/7Nd+BuB4NJfSSH6YZK
         sHD5ZXR4YL6dTBkAUIRHZVUYq4AMC3NnVb8xRuWnSnC2kzD7aLtMR7nwogkkaqPS2LBg
         fLhA==
X-Forwarded-Encrypted: i=1; AJvYcCVK3fBwrtA7qOP5ainX97snDZ/ih9Exx91qB/VLAcvrommgT+a/VX/IgIpq78gCH41unSKh/kWkZETe@vger.kernel.org
X-Gm-Message-State: AOJu0YwFBZojqCSIbTHcJ5BaGhPr2NaXN54ZJ9kiVNsyot5G92q8kGpa
	9E7Lj74hEEi/vChqIp/ctuWu+K3FE6FSxefGfj4UmBpRrFOIlWzN1TaCr49xSRWiYxaWOkZx/r7
	St1qM9PiLk5LEbZsMRS09+9DDGeZgfuKIn4vpcpuZZQ==
X-Gm-Gg: ASbGncv/mIYFzOsSCiCc9ZadEgakkmjL5c35KCjtE9saMcTpIR8AgVQSnItqyjKcg5L
	rwdeJZVKCLllXgAWD6YtiS7wLa+lw/FV2JMqHYbDZ0YxkPRpUUJG84Y+Yo/SY2OkOlgIDf8gHCV
	m19hMBgXIdSKmBefcchJTK7wc9Y3y3y3QFGE05DrQwiS8taqmW0IoxBikR5w5WCxPlsW71COIH8
	E1FM7E/Zx5gXbW9Wllun86Cjt+7f1Kgnewxycr2ayw1OHTnfe2W3FmI
X-Google-Smtp-Source: AGHT+IGzd/RV4m2csqJwfl2wvErFyOi6f4EmGo14pLO5tBbgZuIxAQFDkvvt3JonlccY2Jv3pT8PyJsCPWKSiuW+diw=
X-Received: by 2002:a05:6512:3090:b0:58a:fc90:dc4a with SMTP id
 2adb3069b0e04-5906f46bf97mr3108025e87.26.1760105285026; Fri, 10 Oct 2025
 07:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
 <20251006-reset-gpios-swnodes-v1-9-6d3325b9af42@linaro.org> <e6a120d4ada6d032f69812f14a7e794ac1796a85.camel@pengutronix.de>
In-Reply-To: <e6a120d4ada6d032f69812f14a7e794ac1796a85.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 10 Oct 2025 16:07:52 +0200
X-Gm-Features: AS18NWC3cpUqOn5EYBxfR9jtS4J-XcBnvOLMhJwgqUTGQfoEQWXYId7bq8SLyKU
Message-ID: <CAMRc=MdS778OB+CcFp_Q8S9by+ua1E_o2E1wDpjB_WJKzT5=zw@mail.gmail.com>
Subject: Re: [PATCH 9/9] reset: gpio: use software nodes to setup the GPIO lookup
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 5:55=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> On Mo, 2025-10-06 at 15:00 +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > GPIO machine lookup is a nice mechanism for associating GPIOs with
> > consumers if we don't know what kind of device the GPIO provider is or
> > when it will become available. However in the case of the reset-gpio, w=
e
> > are already holding a reference to the device and so can reference its
> > firmware node. Let's setup a software node that references the relevant
> > GPIO and attach it to the auxiliary device we're creating.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/reset/core.c | 132 ++++++++++++++++++++++++++++++-------------=
--------
> >  1 file changed, 78 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index c9f13020ca3a7b9273488497a7d4240d0af762b0..b3e6ba7a9c3d756d2e30dc2=
0edda9c02b624aefd 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> [...]
> > @@ -849,52 +852,45 @@ static void __reset_control_put_internal(struct r=
eset_control *rstc)
> >       kref_put(&rstc->refcnt, __reset_control_release);
> >  }
> >
> > -static int __reset_add_reset_gpio_lookup(struct gpio_device *gdev, int=
 id,
> > -                                      struct device_node *np,
> > -                                      unsigned int gpio,
> > -                                      unsigned int of_flags)
> > +static void reset_aux_device_release(struct device *dev)
>
> static void reset_gpio_aux_device_release(struct device *dev)
>
> [...]
> > @@ -903,8 +899,10 @@ static int __reset_add_reset_gpio_lookup(struct gp=
io_device *gdev, int id,
> >  static int __reset_add_reset_gpio_device(const struct of_phandle_args =
*args)
> >  {
> >       struct reset_gpio_lookup *rgpio_dev;
> > -     struct auxiliary_device *adev;
> > -     int id, ret;
> > +     struct property_entry properties[2];
>
> It would be nice if this could be initialized instead of the memset() +
> assignment below. Maybe splitting the function will make this more
> convenient.
>
> > +     unsigned int offset, of_flags;
> > +     struct device *parent;
> > +     int id, ret, lflags;
>
> Should this be unsigned int, or enum gpio_lookup_flags?

It's represented as u64 in struct software_node_ref_args so unsigned
int works fine.

>
> >
> >       /*
> >        * Currently only #gpio-cells=3D2 is supported with the meaning o=
f:
> > @@ -915,11 +913,30 @@ static int __reset_add_reset_gpio_device(const st=
ruct of_phandle_args *args)
> >       if (args->args_count !=3D 2)
> >               return -ENOENT;
> >
> > +     offset =3D args->args[0];
> > +     of_flags =3D args->args[1];
> > +
> > +     /*
> > +      * Later we map GPIO flags between OF and Linux, however not all
> > +      * constants from include/dt-bindings/gpio/gpio.h and
> > +      * include/linux/gpio/machine.h match each other.
> > +      *
> > +      * FIXME: Find a better way of translating OF flags to GPIO looku=
p
> > +      * flags.
> > +      */
> > +     if (of_flags > GPIO_ACTIVE_LOW) {
> > +             pr_err("reset-gpio code does not support GPIO flags %u fo=
r GPIO %u\n",
> > +                    of_flags, offset);
> > +             return -EINVAL;
> > +     }
> > +
> >       struct gpio_device *gdev __free(gpio_device_put) =3D
> >               gpio_device_find_by_fwnode(of_fwnode_handle(args->np));
> >       if (!gdev)
> >               return -EPROBE_DEFER;
> >
> > +     parent =3D gpio_device_to_device(gdev);
> > +
> >       /*
> >        * Registering reset-gpio device might cause immediate
> >        * bind, resulting in its probe() registering new reset controlle=
r thus
> > @@ -936,6 +953,13 @@ static int __reset_add_reset_gpio_device(const str=
uct of_phandle_args *args)
> >               }
> >       }
> >
> > +     lflags =3D GPIO_PERSISTENT | (of_flags & GPIO_ACTIVE_LOW);
>
> Could we get an of_flags_to_gpio_lookup_flags() kind of helper for
> this?
>

I have this on my TODO list but it's not straightforward. The defines
under include/dt-bindings/gpio/gpio.h and include/linux/gpio/machine.h
are named the same in some instances but have different values.
Additionally gpiolib-of.c (re)defines its own of_gpio_flags with the
values taken from the dt bindings. It's a mess to untangle. I will get
there but not just yet, hence the FIXME comment.

Bart

