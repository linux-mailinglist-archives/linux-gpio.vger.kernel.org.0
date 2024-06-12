Return-Path: <linux-gpio+bounces-7404-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF12905B2C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 20:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F5F28A0C9
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 18:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC7E4AEF2;
	Wed, 12 Jun 2024 18:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XzWw7Ews"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E514597A
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 18:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217509; cv=none; b=XmeoVxY9x0FEQVTQh+oMaV2xeftPM5u+JFBaX9moAU4K5EkJStxh6HDCreieTgQYcDYNnuz5a59ot31TQSyChdXaXdIVyv52ZCcifKXSXWT48jx/e5TSM3sz7J312Kvb86JpkL1rZo5KDmiRK7e9M8RUNYs5TgGSxQtOob+blgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217509; c=relaxed/simple;
	bh=eEoCMvafOUroA2LzRkSDgFQPGWLzmeZMU/Qpu50wCCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNfH1RJgYkp8JSJ2uXYey9GCRKvOZ/PLpdH+Fckgk+izkgwl/Pe4iHVmpq33g3si0NtJ98cUO8oAAVSScK77D3xUCd7M3cuCUm5zUn81PTJixNEPLLnei1cPsAuQ7QqBk8qhhSQVZIkFMR4sjSkPYIRyvY+NQbwnLLYWIHYgjGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XzWw7Ews; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f4a5344ec7so1297485ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 11:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718217507; x=1718822307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5MjpIfnFC+/yhugwVSUtGBFX+NWlpkUODCD7ykEcrk=;
        b=XzWw7Ews9WpMQ3SJa4sqwIlvjTwcmaQZ/fe9FkzW9HAvzXhnD4LVHIPRi9vpegPLxE
         j8adbOC4BN7jQvXNByVw9zPyYq9vp5x5na6OnstvTXSUZmZys0tV8sc9oyJ3f/jy3Jg7
         jv5oyFlhtGCTlSCmfQ8O4+ByQaeEpCI0FXMEGR9OhHvh985LNueijsqqAMTi36Xj91Bm
         Sc0VzFiAlYUJ7YYFNsRKTBwjLhhTABPgTbstqBrdiaz147rwM2ffh2jOWkKaIzeB1s1H
         v4AcQfYIIxJXfyuFLdo3m1tNGbLmjrXIvfOuhZQYgWwcZgJc5ZBXu7IY3rmz2ZPG1Dhq
         2AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718217507; x=1718822307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5MjpIfnFC+/yhugwVSUtGBFX+NWlpkUODCD7ykEcrk=;
        b=AIHjOUW5MBNmxn8XfPSmIX+LrEefZZviILcU+xYIWR8JU7DuLzNUAyV5oxfyID/DH2
         FZ+uBbYwapHgUSWVtdFu9NeevwelwhqzE0sIVS6VJg2NUR5c1U9w+9G9hnvykF/tkHAb
         LWFjWarWA0mNVKFT4ZU4p/OaNDbxgJTOBP0Hz7WfsW7qYm7hnjj3ceNkoibH+GRUpum9
         VFH3ae4oqTgDHdbnVAv9sWTBFnq5nOq5trsAwtHpUl/uMWFRMg1f2QXAFVsGX9zTgZOX
         pNiQbU6yzB5wlI82+7vnjRH+9WVekMXP7k3eDAMypvmBK3lUQl1QoSxag4q1gUohxtdn
         iFiw==
X-Forwarded-Encrypted: i=1; AJvYcCWFQ+xHt1L1h0+n0eHHNT1vMBpcn/9EqizqNQis4RYvVF762ZP3sn14NkKObuHF/A/hRH4LQOt/oADc3jbX+RCzKVm1uGrghtgbmQ==
X-Gm-Message-State: AOJu0YwAGwd2Uyy3DyUCjbn9durdn7+fS0ubN42pt2fIp+e48UTveyUW
	Uy4SD1pdsn6f/1F1PEhzpV6OFr3HfkLp3ShfESQe34gljHt+PUOScRp59Qpb6NHRsS7uJ5rofv0
	2G/KryfKawwa0hEJiYH+IpOOguKEMsQm/1Mvl8w==
X-Google-Smtp-Source: AGHT+IFWIIgdF8K4XMGFWEjbR2SBhBXtFm6zX/rmou0r0omVeaE2RT7IJQPemyPZiA/HCzqNlL/M/H4mA1itAoWRA2o=
X-Received: by 2002:a17:903:22c2:b0:1f6:ef8b:c366 with SMTP id
 d9443c01a7336-1f84df9b5b8mr6823955ad.4.1718217507154; Wed, 12 Jun 2024
 11:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527144054.155503-1-brgl@bgdev.pl> <ZleXc6tLbiWQ59i-@surfacebook.localdomain>
 <CAMRc=MftW0y7GicBy4vwABomUYuMndsJBUTdsQzZijDtgX1ohQ@mail.gmail.com> <ZmcUbe1aQfezZy5B@surfacebook.localdomain>
In-Reply-To: <ZmcUbe1aQfezZy5B@surfacebook.localdomain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Jun 2024 20:38:14 +0200
Message-ID: <CAMRc=McjAAFX1R4wAbLu5bcUkpPuy8rf=fwDOqCiUY1hbjmhMg@mail.gmail.com>
Subject: Re: [PATCH v7] gpio: virtuser: new virtual driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 4:57=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Mon, Jun 10, 2024 at 03:22:32PM +0200, Bartosz Golaszewski kirjoitti:
> > On Wed, May 29, 2024 at 11:00=E2=80=AFPM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > Mon, May 27, 2024 at 04:40:54PM +0200, Bartosz Golaszewski kirjoitti:
>
> ...
>
> > > > User must pass exactly the number of values that the array contains
> > >
> > > Can't we assume non-active values for the rest if less than needed we=
re
> > > provided? For more than that, why do we care?
> >
> > Honestly, what good would it do? It would just be more confusing IMO.
>
> Let's say you can leave documentation as is, but relax the code. That's t=
he
> benefit, less complex checks in the code.
>

Actually this is more ambiguity in the code. I'm against it.

> ...
>
> > > > +#include <linux/atomic.h>
> > > > +#include <linux/bitmap.h>
> > > > +#include <linux/cleanup.h>
> > > > +#include <linux/completion.h>
> > > > +#include <linux/configfs.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/err.h>
> > > > +#include <linux/gpio/consumer.h>
> > > > +#include <linux/gpio/driver.h>
> > > > +#include <linux/gpio/machine.h>
> > >
> > > > +#include <linux/idr.h>
> > >
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/irq_work.h>
> > >
> > > > +#include <linux/kernel.h>
> > >
> > > Do you need this?
> >
> > ARRAY_SIZE() used to live here when I first wrote this but it was
> > since moved. I'll drop this.
>
> Rather replace with array_size.h.
>

Yeah this is what I did.

> > > > +#include <linux/limits.h>
> > > > +#include <linux/list.h>
> > > > +#include <linux/lockdep.h>
> > > > +#include <linux/mod_devicetable.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/notifier.h>
> > > > +#include <linux/of.h>
> > > > +#include <linux/overflow.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/printk.h>
> > > > +#include <linux/property.h>
> > > > +#include <linux/slab.h>
> > >
> > > > +#include <linux/string.h>
> > >
> > > Implied by string_helpers.h
> >
> > Yeah, but we still use symbols directly from string.h, we shouldn't
> > depend on implicit includes.
>
> string_helpers.h is and will continue guranteening inclusion of string.h.
> It's the same as we drop bits.h when we include, for instance, bitmap.h.
>

Whatever, ok.

> > > > +#include <linux/string_helpers.h>
> > > > +#include <linux/sysfs.h>
> > > > +#include <linux/types.h>
>
> ...
>
> > > > +struct gpio_virtuser_attr_descr {
> > > > +     const char *name;
> > > > +     ssize_t (*show)(struct device *, struct device_attribute *, c=
har *);
> > > > +     ssize_t (*store)(struct device *, struct device_attribute *,
> > > > +                      const char *, size_t);
> > > > +};
> > >
> > > struct device_attribute ? (Yes, I know that that one is a bit bigger =
but
> > > benefit is that we have some code that you may reuse)
> >
> > Not sure what you mean here, these are callbacks for sysfs.
>
> I mean to replace your custom data type with the existing device_attribut=
e.
>

Doesn't make sense here. struct device_attribute has lots of cruft we
don't need here. It's just the name and the callback pointers.

> ...
>
> > > > +static ssize_t gpio_virtuser_sysfs_emit_value_array(char *buf,
> > > > +                                                 unsigned long *va=
lues,
> > > > +                                                 size_t num_values=
)
> > > > +{
> > > > +     ssize_t len =3D 0;
> > > > +     size_t i;
> > > > +
> > > > +     for (i =3D 0; i < num_values; i++)
> > > > +             len +=3D sysfs_emit_at(buf, len, "%d",
> > > > +                                  test_bit(i, values) ? 1 : 0);
> > > > +     return len + sysfs_emit_at(buf, len, "\n");
> > >
> > > Why not use %pb?
> >
> > Because it outputs hex? I want to output binary, can I do it?
>
> But why do you need that? You can also print a list of numbers of bits th=
at
> set (%pbl).
>
> We have a few ABIs in the kernel that works nice and people are familiar =
with
> (CPU sets, IRQ affinity masks, etc). Why to reinvent the wheel?

If I see "11001011" as output, I can immediately convert that to pins
in my head. If I see 0xcb, I need to use a calculator.

>
> > > > +}
>
> ...
>
> > > > +static int gpio_virtuser_sysfs_parse_value_array(const char *buf, =
size_t len,
> > > > +                                              unsigned long *value=
s)
> > > > +{
> > > > +     size_t i;
> > > > +
> > > > +     for (i =3D 0; i < len; i++) {
> > >
> > > Perhaps
> > >
> > >                 bool val;
> > >                 int ret;
> > >
> > >                 ret =3D kstrtobool(...);
> >
> > kstrtobool() accepts values we don't want here like [Tt]rue and [Ff]als=
e.
>
> Yes, see below.
>
> > >                 if (ret)
> > >                         return ret;
> > >
> > >                 assign_bit(...); // btw, why atomic?
> > >
> > > > +             if (buf[i] =3D=3D '0')
> > > > +                     clear_bit(i, values);
> > > > +             else if (buf[i] =3D=3D '1')
> > > > +                     set_bit(i, values);
> > > > +             else
> > > > +                     return -EINVAL;
> > >
> > > > +     }
> > >
> > > BUT, why not bitmap_parse()?
> >
> > Because it parses hex, not binary.
>
> So, why do we reinvent a wheel? Wouldn't be better that users may apply t=
he
> knowledge they familiar with (and I believe the group of the users who kn=
ow
> about bitmaps is much bigger than those who will use this driver).
>
> > > > +     return 0;
> > > > +}
>
> ...
>
> > > > +     return sysfs_emit(buf, "%s\n",
> > > > +                       dir =3D=3D GPIO_LINE_DIRECTION_IN ? "input"=
 : "output");
> > >
> > > I think this maybe transformed to something like str_input_output() i=
n
> > > string_choices.h (and you don't even need to include that as it's imp=
lied by
> > > string_helpers.h)
> >
> > These helpers take bool as argument. Hard to tell whether input or
> > output should correspond to true. I'd leave it as is.
>
> There is a convention: str_TRUE_FALSE().
>
> ...
>
> > > > +static int gpio_virtuser_parse_direction(const char *buf, int *dir=
, int *val)
> > > > +{
> > > > +     if (sysfs_streq(buf, "input")) {
> > > > +             *dir =3D GPIO_LINE_DIRECTION_IN;
> > > > +             return 0;
> > > > +     }
> > > > +
> > > > +     if (sysfs_streq(buf, "output-high"))
> > > > +             *val =3D 1;
> > > > +     else if (sysfs_streq(buf, "output-low"))
> > > > +             *val =3D 0;
> > > > +     else
> > > > +             return -EINVAL;
> > > > +
> > > > +     *dir =3D GPIO_LINE_DIRECTION_OUT;
> > >
> > > This can be transformed to use sysfs_match_string() with
> > >
> > > static const char * const dirs[] =3D { "output-low", "output-high", "=
input" };
> > >
> > >         int ret;
> > >
> > >         ret =3D sysfs_match_string(...);
> > >         if (ret < 0)
> > >                 return ret;
> > >
> > >         *val =3D ret;
> > >         *dir =3D ret =3D=3D 2 ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DI=
RECTION_OUT;
> > >
> > > And with this approach it even not clear why do you need dir and val =
to be
> > > separated here (esp. if we add a enum like
> >
> > We do want them to be separated not for better UX but to be able to
> > test all kernel APIs (gpiod_direction_input|output() and
> > gpiod_set_value()).
>
> Still you can do some optimisations I proposed above.
>

IMO they are much less readable and you don't gain anything. NAK on this on=
e.

> > >         GPIO_VIRTUSER_OUT_LOW,
> > >         GPIO_VIRTUSER_OUT_HIGH,
> > >         GPIO_VIRTUSER_IN,
> > >
> > > (with it the string array can also be indexed).
> > >
> > > > +     return 0;
> > > > +}
>
> ...
>
> > > > +static int gpio_virtuser_parse_value(const char *buf)
> > > > +{
> > > > +     int value, ret;
> > > > +
> > > > +     value =3D sysfs_match_string(gpio_virtuser_sysfs_value_string=
s, buf);
> > > > +     if (value < 0) {
> > > > +             /* Can be 0 or 1 too. */
> > > > +             ret =3D kstrtoint(buf, 0, &value);
> > > > +             if (ret)
> > > > +                     return ret;
> > >
> > > > +             if (value !=3D 0 && value !=3D 1)
> > > > +                     return -EINVAL;
> > >
> > > Why not kstrtobool()?
> >
> > I don't want to accept all the other strings kstrtobool() is fine with.
>
> What's wrong with other strings?
>

A line is False? I mean sure, you can map that to inactive but it's
not a naming convention associated with GPIOs very often.

> At bare minumum you can reduce the range by using kstrtou8().
>

As opposed to just checking '0' and '1'? Meh...

> > > > +     }
> > > > +
> > > > +     return value;
> > > > +}
>
> ...
>
> > > > +     ret =3D kstrtouint(buf, 10, &debounce);
> > >
> > > Why restrict to decimal?
> >
> > Not sure what you gain from passing a period in hex?
>
> For example, if I compare this to the real HW, I might be able to do some=
thing
> like 0x1234 (let's say it's debounce step) and shifting it by 4 bits will=
 give
> me something I want. But despite that quite unlikely case the restriction=
 here
> doesn't bring us much.
>

Ok, whatever.

> > > > +     if (ret)
> > > > +             return ret;
>
> ...
>
> > > > +     return dash && strcmp(dash, "-gpios") =3D=3D 0;
> > >
> > > Can't we reuse the suffix from the array from the gpiolib internal he=
ader?
> > > Also I don't like the form of '-' in the line. "gpios" is good and ch=
ance
> > > that linker deduplicates the same string if it occurs somewhere else =
in the
> > > binary (in case this goes with =3Dy in .config).
> >
> > I'm not sure I follow what you're saying here. Please rephrase.
>
> Do strcmp() against one from the gpio_suffixes array.
>

I don't want to accept the "gpio" suffix. Also: I don't want to
include gpiolib.h.

> ...
>
> > > > +/*
> > > > + * If this is an OF-based system, then we iterate over properties =
and consider
> > > > + * all whose names end in "-gpios". For configfs we expect an addi=
tional string
> > > > + * array property - "gpio-virtuser,ids" - containing the list of a=
ll GPIO IDs
> > > > + * to request.
> > >
> > > Why not any other system? What's wrong for having this available for =
ACPI, for
> > > example? Okay, I see that this is probably due to absence of API.
> > >
> > > OTOH the last call in the function assumes non-OF cases. Why can't we=
 have the
> > > same approach in both?
> >
> > Again: I have no idea what you mean. We support device-tree and
> > configfs as sources of configuration for these virtual consumers. If
> > you want to add something more, be my guest once it's upstream.
> >
> > The reason to use a different approach is to not require the
> > "gpio-virtuser,ids" property in device-tree.
>
> Yes, and I'm asking why can't we unify and require it there as well?
> But okay, I might give up on the trying of the DT/ACPI property unificati=
on.
>
> > > > + */
>
> ...
>
> > > > +                     if (gpio_virtuser_prop_is_gpio(prop))
> > > > +                             ++ret;
> > >
> > > Why pre-increment?
> >
> > Why not?
>
> Because we have a pattern. Pre-increment adds into additional questioning
> "why?". I.e. What does make this case special? When I read such a code I =
need
> more brain power to parse it.
>

Ok whatever.

> ...
>
> > > > +                     dash =3D strpbrk(prop->name, "-");
>
> Btw, don't you want strrchr() here? (Note 'r' variant).

Already changed.

>
> > > > +                     diff =3D dash - prop->name;
> > > > +
> > > > +                     tmp =3D devm_kmemdup(dev, prop->name, diff + =
1,
> > > > +                                        GFP_KERNEL);
> > >
> > > devm_kstrndup() is not okay? Okay, we don't have it (yet?), but at le=
ast I
> > > would rather expect wrapped kstrndup() than this.
> >
> > Meh, this logic is fine as we know the range exactly. IMO kstrndup()
> > here would be overkill. I'd leave it for now.
> >
> > > > +                     if (!tmp)
> > > > +                             return -ENOMEM;
>
> > > > +                     tmp[diff] =3D '\0';
>
> This line will gone with kstrndup(). I think we will benefit from it.
>

I'll allow myself to keep my version here.

> ...
>
> > > > +     int i =3D 0;
> > >
> > > Why signed? And in all this kind of case, I would split assignment...
>
> (1)
>
> > > > +     memset(properties, 0, sizeof(properties));
> > > > +
> > > > +     num_ids =3D list_count_nodes(&dev->lookup_list);
> > > > +     char **ids __free(kfree) =3D kcalloc(num_ids + 1, sizeof(*ids=
),
> > > > +                                        GFP_KERNEL);
> > > > +     if (!ids)
> > > > +             return ERR_PTR(-ENOMEM);
> > > > +
> > >
> > > To be here, that the reader will see immediately (close enough) what =
is the
> > > initial values. Moreover this code will be robuse against changes in =
between
> > > (if i become reusable).
> >
> > Sorry, I can't parse it.
>
> I meant to see here
>
>         i =3D 0;
>
> instead of the above (1).
>

Why? I see no good reason.

> > > > +     list_for_each_entry(lookup, &dev->lookup_list, siblings)
> > > > +             ids[i++] =3D lookup->con_id;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Bart

