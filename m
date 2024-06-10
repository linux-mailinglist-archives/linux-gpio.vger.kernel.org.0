Return-Path: <linux-gpio+bounces-7316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 965449024C4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 16:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31A94287206
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 14:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0732135A63;
	Mon, 10 Jun 2024 14:57:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B87135A58
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718031474; cv=none; b=La9/6vpYv9s3Ff6bVHCi3nkiSRHA9bgPTgJzJM8tPZNZdkpBF6go0qn+jcZM2llXSmoyE+fEPpnZ6v4FJxx5XnniroohifNJ4M1D+FxmPB1s0bMhjLOs1kBzIe+fJpL5C3zz2lcXwXpQqJ5QDvZy4UXgZUvXUR63O8fi30nAFv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718031474; c=relaxed/simple;
	bh=rzJk6/CeDwWDTWDhgd/wsu6G/agmVzr+Qll0J50HCrA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHi2bkUQUZGTCWK76WyTpxsTu4CmgCiSICvKo/ZGpYGCDMBUj5T1ouo/rNjnj282+N22KpL6OtkuOKO6ZV5ZrzSLoSOGjC6aTo/c+JUC7sxGuTPVUOTulA+fzilOhKCLnPKmlUoHKigB9h1tWAYK/Rf9mGv9yyEVMKqPfv6w1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id ce702670-2739-11ef-ab0e-005056bdd08f;
	Mon, 10 Jun 2024 17:57:50 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jun 2024 17:57:49 +0300
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v7] gpio: virtuser: new virtual driver
Message-ID: <ZmcUbe1aQfezZy5B@surfacebook.localdomain>
References: <20240527144054.155503-1-brgl@bgdev.pl>
 <ZleXc6tLbiWQ59i-@surfacebook.localdomain>
 <CAMRc=MftW0y7GicBy4vwABomUYuMndsJBUTdsQzZijDtgX1ohQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MftW0y7GicBy4vwABomUYuMndsJBUTdsQzZijDtgX1ohQ@mail.gmail.com>

Mon, Jun 10, 2024 at 03:22:32PM +0200, Bartosz Golaszewski kirjoitti:
> On Wed, May 29, 2024 at 11:00 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > Mon, May 27, 2024 at 04:40:54PM +0200, Bartosz Golaszewski kirjoitti:

...

> > > User must pass exactly the number of values that the array contains
> >
> > Can't we assume non-active values for the rest if less than needed were
> > provided? For more than that, why do we care?
> 
> Honestly, what good would it do? It would just be more confusing IMO.

Let's say you can leave documentation as is, but relax the code. That's the
benefit, less complex checks in the code.

...

> > > +#include <linux/atomic.h>
> > > +#include <linux/bitmap.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/completion.h>
> > > +#include <linux/configfs.h>
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/gpio/driver.h>
> > > +#include <linux/gpio/machine.h>
> >
> > > +#include <linux/idr.h>
> >
> > > +#include <linux/interrupt.h>
> > > +#include <linux/irq_work.h>
> >
> > > +#include <linux/kernel.h>
> >
> > Do you need this?
> 
> ARRAY_SIZE() used to live here when I first wrote this but it was
> since moved. I'll drop this.

Rather replace with array_size.h.

> > > +#include <linux/limits.h>
> > > +#include <linux/list.h>
> > > +#include <linux/lockdep.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/notifier.h>
> > > +#include <linux/of.h>
> > > +#include <linux/overflow.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/printk.h>
> > > +#include <linux/property.h>
> > > +#include <linux/slab.h>
> >
> > > +#include <linux/string.h>
> >
> > Implied by string_helpers.h
> 
> Yeah, but we still use symbols directly from string.h, we shouldn't
> depend on implicit includes.

string_helpers.h is and will continue guranteening inclusion of string.h.
It's the same as we drop bits.h when we include, for instance, bitmap.h.

> > > +#include <linux/string_helpers.h>
> > > +#include <linux/sysfs.h>
> > > +#include <linux/types.h>

...

> > > +struct gpio_virtuser_attr_descr {
> > > +     const char *name;
> > > +     ssize_t (*show)(struct device *, struct device_attribute *, char *);
> > > +     ssize_t (*store)(struct device *, struct device_attribute *,
> > > +                      const char *, size_t);
> > > +};
> >
> > struct device_attribute ? (Yes, I know that that one is a bit bigger but
> > benefit is that we have some code that you may reuse)
> 
> Not sure what you mean here, these are callbacks for sysfs.

I mean to replace your custom data type with the existing device_attribute.

...

> > > +static ssize_t gpio_virtuser_sysfs_emit_value_array(char *buf,
> > > +                                                 unsigned long *values,
> > > +                                                 size_t num_values)
> > > +{
> > > +     ssize_t len = 0;
> > > +     size_t i;
> > > +
> > > +     for (i = 0; i < num_values; i++)
> > > +             len += sysfs_emit_at(buf, len, "%d",
> > > +                                  test_bit(i, values) ? 1 : 0);
> > > +     return len + sysfs_emit_at(buf, len, "\n");
> >
> > Why not use %pb?
> 
> Because it outputs hex? I want to output binary, can I do it?

But why do you need that? You can also print a list of numbers of bits that
set (%pbl).

We have a few ABIs in the kernel that works nice and people are familiar with
(CPU sets, IRQ affinity masks, etc). Why to reinvent the wheel?

> > > +}

...

> > > +static int gpio_virtuser_sysfs_parse_value_array(const char *buf, size_t len,
> > > +                                              unsigned long *values)
> > > +{
> > > +     size_t i;
> > > +
> > > +     for (i = 0; i < len; i++) {
> >
> > Perhaps
> >
> >                 bool val;
> >                 int ret;
> >
> >                 ret = kstrtobool(...);
> 
> kstrtobool() accepts values we don't want here like [Tt]rue and [Ff]alse.

Yes, see below.

> >                 if (ret)
> >                         return ret;
> >
> >                 assign_bit(...); // btw, why atomic?
> >
> > > +             if (buf[i] == '0')
> > > +                     clear_bit(i, values);
> > > +             else if (buf[i] == '1')
> > > +                     set_bit(i, values);
> > > +             else
> > > +                     return -EINVAL;
> >
> > > +     }
> >
> > BUT, why not bitmap_parse()?
> 
> Because it parses hex, not binary.

So, why do we reinvent a wheel? Wouldn't be better that users may apply the
knowledge they familiar with (and I believe the group of the users who know
about bitmaps is much bigger than those who will use this driver).

> > > +     return 0;
> > > +}

...

> > > +     return sysfs_emit(buf, "%s\n",
> > > +                       dir == GPIO_LINE_DIRECTION_IN ? "input" : "output");
> >
> > I think this maybe transformed to something like str_input_output() in
> > string_choices.h (and you don't even need to include that as it's implied by
> > string_helpers.h)
> 
> These helpers take bool as argument. Hard to tell whether input or
> output should correspond to true. I'd leave it as is.

There is a convention: str_TRUE_FALSE().

...

> > > +static int gpio_virtuser_parse_direction(const char *buf, int *dir, int *val)
> > > +{
> > > +     if (sysfs_streq(buf, "input")) {
> > > +             *dir = GPIO_LINE_DIRECTION_IN;
> > > +             return 0;
> > > +     }
> > > +
> > > +     if (sysfs_streq(buf, "output-high"))
> > > +             *val = 1;
> > > +     else if (sysfs_streq(buf, "output-low"))
> > > +             *val = 0;
> > > +     else
> > > +             return -EINVAL;
> > > +
> > > +     *dir = GPIO_LINE_DIRECTION_OUT;
> >
> > This can be transformed to use sysfs_match_string() with
> >
> > static const char * const dirs[] = { "output-low", "output-high", "input" };
> >
> >         int ret;
> >
> >         ret = sysfs_match_string(...);
> >         if (ret < 0)
> >                 return ret;
> >
> >         *val = ret;
> >         *dir = ret == 2 ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> >
> > And with this approach it even not clear why do you need dir and val to be
> > separated here (esp. if we add a enum like
> 
> We do want them to be separated not for better UX but to be able to
> test all kernel APIs (gpiod_direction_input|output() and
> gpiod_set_value()).

Still you can do some optimisations I proposed above.

> >         GPIO_VIRTUSER_OUT_LOW,
> >         GPIO_VIRTUSER_OUT_HIGH,
> >         GPIO_VIRTUSER_IN,
> >
> > (with it the string array can also be indexed).
> >
> > > +     return 0;
> > > +}

...

> > > +static int gpio_virtuser_parse_value(const char *buf)
> > > +{
> > > +     int value, ret;
> > > +
> > > +     value = sysfs_match_string(gpio_virtuser_sysfs_value_strings, buf);
> > > +     if (value < 0) {
> > > +             /* Can be 0 or 1 too. */
> > > +             ret = kstrtoint(buf, 0, &value);
> > > +             if (ret)
> > > +                     return ret;
> >
> > > +             if (value != 0 && value != 1)
> > > +                     return -EINVAL;
> >
> > Why not kstrtobool()?
> 
> I don't want to accept all the other strings kstrtobool() is fine with.

What's wrong with other strings?

At bare minumum you can reduce the range by using kstrtou8().

> > > +     }
> > > +
> > > +     return value;
> > > +}

...

> > > +     ret = kstrtouint(buf, 10, &debounce);
> >
> > Why restrict to decimal?
> 
> Not sure what you gain from passing a period in hex?

For example, if I compare this to the real HW, I might be able to do something
like 0x1234 (let's say it's debounce step) and shifting it by 4 bits will give
me something I want. But despite that quite unlikely case the restriction here
doesn't bring us much.

> > > +     if (ret)
> > > +             return ret;

...

> > > +     return dash && strcmp(dash, "-gpios") == 0;
> >
> > Can't we reuse the suffix from the array from the gpiolib internal header?
> > Also I don't like the form of '-' in the line. "gpios" is good and chance
> > that linker deduplicates the same string if it occurs somewhere else in the
> > binary (in case this goes with =y in .config).
> 
> I'm not sure I follow what you're saying here. Please rephrase.

Do strcmp() against one from the gpio_suffixes array.

...

> > > +/*
> > > + * If this is an OF-based system, then we iterate over properties and consider
> > > + * all whose names end in "-gpios". For configfs we expect an additional string
> > > + * array property - "gpio-virtuser,ids" - containing the list of all GPIO IDs
> > > + * to request.
> >
> > Why not any other system? What's wrong for having this available for ACPI, for
> > example? Okay, I see that this is probably due to absence of API.
> >
> > OTOH the last call in the function assumes non-OF cases. Why can't we have the
> > same approach in both?
> 
> Again: I have no idea what you mean. We support device-tree and
> configfs as sources of configuration for these virtual consumers. If
> you want to add something more, be my guest once it's upstream.
> 
> The reason to use a different approach is to not require the
> "gpio-virtuser,ids" property in device-tree.

Yes, and I'm asking why can't we unify and require it there as well?
But okay, I might give up on the trying of the DT/ACPI property unification.

> > > + */

...

> > > +                     if (gpio_virtuser_prop_is_gpio(prop))
> > > +                             ++ret;
> >
> > Why pre-increment?
> 
> Why not?

Because we have a pattern. Pre-increment adds into additional questioning
"why?". I.e. What does make this case special? When I read such a code I need
more brain power to parse it.

...

> > > +                     dash = strpbrk(prop->name, "-");

Btw, don't you want strrchr() here? (Note 'r' variant).

> > > +                     diff = dash - prop->name;
> > > +
> > > +                     tmp = devm_kmemdup(dev, prop->name, diff + 1,
> > > +                                        GFP_KERNEL);
> >
> > devm_kstrndup() is not okay? Okay, we don't have it (yet?), but at least I
> > would rather expect wrapped kstrndup() than this.
> 
> Meh, this logic is fine as we know the range exactly. IMO kstrndup()
> here would be overkill. I'd leave it for now.
> 
> > > +                     if (!tmp)
> > > +                             return -ENOMEM;

> > > +                     tmp[diff] = '\0';

This line will gone with kstrndup(). I think we will benefit from it.

...

> > > +     int i = 0;
> >
> > Why signed? And in all this kind of case, I would split assignment...

(1)

> > > +     memset(properties, 0, sizeof(properties));
> > > +
> > > +     num_ids = list_count_nodes(&dev->lookup_list);
> > > +     char **ids __free(kfree) = kcalloc(num_ids + 1, sizeof(*ids),
> > > +                                        GFP_KERNEL);
> > > +     if (!ids)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> >
> > To be here, that the reader will see immediately (close enough) what is the
> > initial values. Moreover this code will be robuse against changes in between
> > (if i become reusable).
> 
> Sorry, I can't parse it.

I meant to see here

	i = 0;

instead of the above (1).

> > > +     list_for_each_entry(lookup, &dev->lookup_list, siblings)
> > > +             ids[i++] = lookup->con_id;

-- 
With Best Regards,
Andy Shevchenko



