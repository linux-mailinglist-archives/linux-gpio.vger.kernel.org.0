Return-Path: <linux-gpio+bounces-7308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F0902292
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 15:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34837B2190B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 13:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1593E82495;
	Mon, 10 Jun 2024 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AQJ+XQHv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243DA4501B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718025768; cv=none; b=G5STox6h4ZQmdjRSF9wCJhbOAfMTai+NmJgNC/kSsBt3CpmiC49aYpZM923vymC+Vxy8Zmjm6EK/btJjC3rj5ynTt2qhcRypDH8BRKWM3FF6FQw6eNIB80s75iqhLum838W/M22To337awucLLZpWTiccnfJKV5vZq7Q8ZSSI+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718025768; c=relaxed/simple;
	bh=3zxDvZfoCHjIOe7+CivGyqkxzMSwrk36DBZc9O6iUrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iw5kklTXNmW3r3rudOOIXillQnadEjFZXi8VHWgUIDoRgepLEwx8H0V7jdxbFIboxQIQcqY0X0DjX7mseKd+gUMXIEsT8Erm/8HFhuJSNluLnkCQLt+EN0inCykacHQcfq4H1UuFET++XgJCv/g10DtUjQc/isKAKhbSPy2jwE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AQJ+XQHv; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso2155541fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718025764; x=1718630564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA+vYg4P0V6sJBcGS394N0Wxfh4PJKIL5HOhR9NkxaQ=;
        b=AQJ+XQHvQdEFrdSL57PC30TD0x4CEZNVde7JP27BtW2ki9mUfI+g4w/duTO9wm3q6y
         hDgm1Df9DokGXXkB3l6zjLWCsElmvFW8zt1ptc17c/jO9gX1Ao9XnREnihlUvNFObRIy
         VYAh9mx4J5ANSBWWypbQ6OIdFXnUC4jcit0/ZoWyoQySVzizu4BicgK8krxyWDXAr+NW
         IgcJVNKaRWg+lqsI+zOdif5Zwz52/ilGvjj04PuBP8ZQoFXgM1dFX+2VqOqXdr92JXdj
         qIIKlw7NHfG/ReYmXw/jTgDiTTeeU/OBUYUzr8E7v0glOf0I5JQr58n/rWe5bdXlV3Qh
         lHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718025764; x=1718630564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA+vYg4P0V6sJBcGS394N0Wxfh4PJKIL5HOhR9NkxaQ=;
        b=VhfKnJybYJm26aH/FtMkguU9l8xuSTRv2n9jGRhwyRAbyWWeHz3hwcsg/S1s4bKYVZ
         n4dIQ7b7L662h1TT1SouxYbZD0aj8c6EcbTfMPh7Sj9qIPSvFeZAPDOSVmyRnTRJlhdb
         J2HfIHsrkRQh0u3+ePleLl/Vxs2Py9KSp179y5HRDzZGgYCuDzZGjlSOrqodS1JIkRB4
         /9n+/Vy5xCDUtnYLyd/+huYxbjiflEtUDxf/iHr6X02Sx5qJtAlElkrKMtL9BhtxiAB4
         gF8yN2sg7/6jH6LSVsakc6M84QSZL7/S0itAHmctQfCrorWsHe2Xk1c4uSg33XLDoko2
         M9wA==
X-Forwarded-Encrypted: i=1; AJvYcCVK/U/FXTWu5P1G0PC4JHRS1dhDpkWgZ4/ERnvqG+zyWet6/KhQn/6//ASY0rV5UkydQkfr7i6DrWres5J2a6Km2bYIdDtD3NYwvw==
X-Gm-Message-State: AOJu0YxFIX6NWDeX65tH3tFV7iR1uNpxNXEVi6cKzQB35l6VgQKtq0Ye
	/H5rHZido2ydY9BYyhXyZmASL0HHz03WVNJSX4Ywjrt7ZhvLbGFCF+2/Jw8ZH0qC4Tfu5B/46Ww
	cTlMNLkioEemjwVibdjbu+n9uHHh+xZ/r5wbl2Q==
X-Google-Smtp-Source: AGHT+IGZeTZP/KiFC/N87nT0K52/bW2siphyHnmdxL8WzK6Juv5TfarMNOlRNB9Z4BHXu2xmkOCUvOjN4Vf0dp5DuoM=
X-Received: by 2002:a05:651c:2126:b0:2eb:d95f:10bc with SMTP id
 38308e7fff4ca-2ebd95f1469mr49141991fa.10.1718025763857; Mon, 10 Jun 2024
 06:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527144054.155503-1-brgl@bgdev.pl> <ZleXc6tLbiWQ59i-@surfacebook.localdomain>
In-Reply-To: <ZleXc6tLbiWQ59i-@surfacebook.localdomain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Jun 2024 15:22:32 +0200
Message-ID: <CAMRc=MftW0y7GicBy4vwABomUYuMndsJBUTdsQzZijDtgX1ohQ@mail.gmail.com>
Subject: Re: [PATCH v7] gpio: virtuser: new virtual driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:00=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Mon, May 27, 2024 at 04:40:54PM +0200, Bartosz Golaszewski kirjoitti:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The GPIO subsystem used to have a serious problem with undefined behavi=
or
> > and use-after-free bugs on hot-unplug of GPIO chips. This can be
> > considered a corner-case by some as most GPIO controllers are enabled
> > early in the boot process and live until the system goes down but most
> > GPIO drivers do allow unbind over sysfs, many are loadable modules that
> > can be (force) unloaded and there are also GPIO devices that can be
> > dynamically detached, for instance CP2112 which is a USB GPIO expender.
> >
> > Bugs can be triggered both from user-space as well as by in-kernel user=
s.
> > We have the means of testing it from user-space via the character devic=
e
> > but the issues manifest themselves differently in the kernel.
> >
> > This is a proposition of adding a new virtual driver - a configurable
> > GPIO consumer that can be configured over configfs (similarly to
> > gpio-sim) or described on the device-tree.
> >
> > This driver is aimed as a helper in spotting any regressions in
> > hot-unplug handling in GPIOLIB.
>
> ...
>
> > User must pass exactly the number of values that the array contains
>
> Can't we assume non-active values for the rest if less than needed were
> provided? For more than that, why do we care?
>

Honestly, what good would it do? It would just be more confusing IMO.

> ...
>
> > +#include <linux/atomic.h>
> > +#include <linux/bitmap.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/completion.h>
> > +#include <linux/configfs.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/machine.h>
>
> > +#include <linux/idr.h>
>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq_work.h>
>
> > +#include <linux/kernel.h>
>
> Do you need this?

ARRAY_SIZE() used to live here when I first wrote this but it was
since moved. I'll drop this.

>
> > +#include <linux/limits.h>
> > +#include <linux/list.h>
> > +#include <linux/lockdep.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/notifier.h>
> > +#include <linux/of.h>
> > +#include <linux/overflow.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/printk.h>
> > +#include <linux/property.h>
> > +#include <linux/slab.h>
>
> > +#include <linux/string.h>
>
> Implied by string_helpers.h
>

Yeah, but we still use symbols directly from string.h, we shouldn't
depend on implicit includes.

> > +#include <linux/string_helpers.h>
> > +#include <linux/sysfs.h>
> > +#include <linux/types.h>
>
> ...
>
> > +struct gpio_virtuser_line_array_data {
> > +     struct gpio_descs *descs;
> > +     struct kobject *kobj;
> > +     struct attribute_group *attr_group;
> > +};
> > +
> > +struct gpio_virtuser_line_data {
> > +     struct gpio_desc *desc;
> > +     struct kobject *kobj;
> > +     struct attribute_group *attr_group;
> > +     char consumer[GPIO_CONSUMER_NAME_MAX_LEN];
> > +     struct mutex consumer_lock;
> > +     unsigned int debounce;
> > +     atomic_t irq;
> > +     atomic_t irq_count;
> > +};
>
> Maybe
>
> struct gpio_virtuser_sysfs_data {
>         union {
>                 struct gpio_desc *desc;
>                 struct gpio_descs *descs;
>         };
>         struct kobject *kobj;
>         struct attribute_group *attr_group;
> };
>
> struct gpio_virtuser_line_array_data {
>         struct gpio_virtuser_sysfs_data sd;
> };
>
> struct gpio_virtuser_line_data {
>         struct gpio_virtuser_sysfs_data sd;
>         char consumer[GPIO_CONSUMER_NAME_MAX_LEN];
>         struct mutex consumer_lock;
>         unsigned int debounce;
>         atomic_t irq;
>         atomic_t irq_count;
> };
>
> ?
>
> ...
>
> > +struct gpio_virtuser_attr_ctx {
> > +     struct device_attribute dev_attr;
> > +     void *data;
> > +};
>
> struct dev_ext_attribute ?
>

Sounds good, I'll rework this.

> ...
>
> > +struct gpio_virtuser_attr_descr {
> > +     const char *name;
> > +     ssize_t (*show)(struct device *, struct device_attribute *, char =
*);
> > +     ssize_t (*store)(struct device *, struct device_attribute *,
> > +                      const char *, size_t);
> > +};
>
> struct device_attribute ? (Yes, I know that that one is a bit bigger but
> benefit is that we have some code that you may reuse)
>

Not sure what you mean here, these are callbacks for sysfs.

> ...
>
> > +static ssize_t gpio_virtuser_sysfs_emit_value_array(char *buf,
> > +                                                 unsigned long *values=
,
> > +                                                 size_t num_values)
> > +{
> > +     ssize_t len =3D 0;
> > +     size_t i;
> > +
> > +     for (i =3D 0; i < num_values; i++)
> > +             len +=3D sysfs_emit_at(buf, len, "%d",
> > +                                  test_bit(i, values) ? 1 : 0);
> > +     return len + sysfs_emit_at(buf, len, "\n");
>
> Why not use %pb?
>

Because it outputs hex? I want to output binary, can I do it?

> > +}
>
> ...
>
> > +static int gpio_virtuser_sysfs_parse_value_array(const char *buf, size=
_t len,
> > +                                              unsigned long *values)
> > +{
> > +     size_t i;
> > +
> > +     for (i =3D 0; i < len; i++) {
>
> Perhaps
>
>                 bool val;
>                 int ret;
>
>                 ret =3D kstrtobool(...);

kstrtobool() accepts values we don't want here like [Tt]rue and [Ff]alse.

>                 if (ret)
>                         return ret;
>
>                 assign_bit(...); // btw, why atomic?
>
> > +             if (buf[i] =3D=3D '0')
> > +                     clear_bit(i, values);
> > +             else if (buf[i] =3D=3D '1')
> > +                     set_bit(i, values);
> > +             else
> > +                     return -EINVAL;
>
> > +     }
>
> BUT, why not bitmap_parse()?
>

Because it parses hex, not binary.

> > +     return 0;
> > +}
>
> ...
>
> > +     unsigned long *values __free(bitmap) =3D bitmap_alloc(descs->ndes=
cs,
> > +                                                         GFP_KERNEL);
>
> Perhaps
>
>         unsigned long *values __free(bitmap) =3D
>                  bitmap_alloc(descs->ndescs, GFP_KERNEL);
>
> ...
>
> > +     unsigned long *values __free(bitmap) =3D bitmap_zalloc(descs->nde=
scs,
> > +                                                          GFP_KERNEL);
>
> In the similar way?
>
> ...
>
> > +     unsigned long *values __free(bitmap) =3D bitmap_zalloc(descs->nde=
scs,
> > +                                                          GFP_KERNEL);
>
> Ditto.
>
> ...
>
> > +{
> > +     return sysfs_emit(buf, "%s\n",
> > +                       dir =3D=3D GPIO_LINE_DIRECTION_IN ? "input" : "=
output");
>
> I think this maybe transformed to something like str_input_output() in
> string_choices.h (and you don't even need to include that as it's implied=
 by
> string_helpers.h)
>

These helpers take bool as argument. Hard to tell whether input or
output should correspond to true. I'd leave it as is.

> > +}
>
> ...
>
> > +static int gpio_virtuser_parse_direction(const char *buf, int *dir, in=
t *val)
> > +{
> > +     if (sysfs_streq(buf, "input")) {
> > +             *dir =3D GPIO_LINE_DIRECTION_IN;
> > +             return 0;
> > +     }
> > +
> > +     if (sysfs_streq(buf, "output-high"))
> > +             *val =3D 1;
> > +     else if (sysfs_streq(buf, "output-low"))
> > +             *val =3D 0;
> > +     else
> > +             return -EINVAL;
> > +
> > +     *dir =3D GPIO_LINE_DIRECTION_OUT;
>
> This can be transformed to use sysfs_match_string() with
>
> static const char * const dirs[] =3D { "output-low", "output-high", "inpu=
t" };
>
>         int ret;
>
>         ret =3D sysfs_match_string(...);
>         if (ret < 0)
>                 return ret;
>
>         *val =3D ret;
>         *dir =3D ret =3D=3D 2 ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECT=
ION_OUT;
>
> And with this approach it even not clear why do you need dir and val to b=
e
> separated here (esp. if we add a enum like
>

We do want them to be separated not for better UX but to be able to
test all kernel APIs (gpiod_direction_input|output() and
gpiod_set_value()).

>         GPIO_VIRTUSER_OUT_LOW,
>         GPIO_VIRTUSER_OUT_HIGH,
>         GPIO_VIRTUSER_IN,
>
> (with it the string array can also be indexed).
>
> > +     return 0;
> > +}
>
> ...
>
> > +static int gpio_virtuser_parse_value(const char *buf)
> > +{
> > +     int value, ret;
> > +
> > +     value =3D sysfs_match_string(gpio_virtuser_sysfs_value_strings, b=
uf);
> > +     if (value < 0) {
> > +             /* Can be 0 or 1 too. */
> > +             ret =3D kstrtoint(buf, 0, &value);
> > +             if (ret)
> > +                     return ret;
>
> > +             if (value !=3D 0 && value !=3D 1)
> > +                     return -EINVAL;
>
> Why not kstrtobool()?
>

I don't want to accept all the other strings kstrtobool() is fine with.

> > +     }
> > +
> > +     return value;
> > +}
>
> ...
>
> > +     ret =3D kstrtouint(buf, 10, &debounce);
>
> Why restrict to decimal?
>

Not sure what you gain from passing a period in hex?


> > +     if (ret)
> > +             return ret;
>
> ...
>
> > +static ssize_t
> > +gpio_virtuser_sysfs_consumer_store(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                const char *buf, size_t len)
> > +{
> > +     struct gpio_virtuser_line_data *data =3D to_gpio_virtuser_data(at=
tr);
> > +     int ret;
>
> > +     if (strlen(buf) > GPIO_CONSUMER_NAME_MAX_LEN)
> > +             return -EINVAL;
>
> You don't need this if you use strscpy() below and check its returned val=
ue.
>

Ok.

> > +     guard(mutex)(&data->consumer_lock);
> > +
> > +     ret =3D gpiod_set_consumer_name(data->desc, buf);
> > +     if (ret)
> > +             return ret;
> > +
> > +     sprintf(data->consumer, buf);
> > +
> > +     return len;
> > +}
>
> ...
>
> > +     data->attr_group->name =3D devm_kasprintf(dev, GFP_KERNEL,
> > +                                             "gpiod:%s", id);
>
> Why two lines?
>

It's not even longer than previously with the new struct layout so it
warrants a break.

> > +     if (!data->attr_group->name)
> > +             return -ENOMEM;
>
> ...
>
> > +     ret =3D devm_add_action_or_reset(dev, gpio_virtuser_mutex_destroy=
,
> > +                                    &data->consumer_lock);
>
> Don't we have devm_mutex_init() (`git tag --contains` shows v6.10-rc1 to =
me)
>

Ah we do now. This code dates back from early 2023 I think. I'll use it.

> > +             return ret;
>
> ...
>
> > +static int gpio_virtuser_prop_is_gpio(struct property *prop)
> > +{
> > +     char *dash =3D strpbrk(prop->name, "-");
>
> Why not strrchr() ?
>

Ok.

> > +     return dash && strcmp(dash, "-gpios") =3D=3D 0;
>
> Can't we reuse the suffix from the array from the gpiolib internal header=
?
> Also I don't like the form of '-' in the line. "gpios" is good and chance
> that linker deduplicates the same string if it occurs somewhere else in t=
he
> binary (in case this goes with =3Dy in .config).
>

I'm not sure I follow what you're saying here. Please rephrase.

> > +}
>
> ...
>
> > +/*
> > + * If this is an OF-based system, then we iterate over properties and =
consider
> > + * all whose names end in "-gpios". For configfs we expect an addition=
al string
> > + * array property - "gpio-virtuser,ids" - containing the list of all G=
PIO IDs
> > + * to request.
>
> Why not any other system? What's wrong for having this available for ACPI=
, for
> example? Okay, I see that this is probably due to absence of API.
>
> OTOH the last call in the function assumes non-OF cases. Why can't we hav=
e the
> same approach in both?
>

Again: I have no idea what you mean. We support device-tree and
configfs as sources of configuration for these virtual consumers. If
you want to add something more, be my guest once it's upstream.

The reason to use a different approach is to not require the
"gpio-virtuser,ids" property in device-tree.

> > + */
> > +static int gpio_virtuser_count_ids(struct device *dev)
> > +{
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>
> Why? This function is mostly OF one, make it simpler.
>
>         struct device_node *np =3D dev_of_node(dev);
>
> > +     struct property *prop;
> > +     int ret =3D 0;
>
> > +     if (is_of_node(fwnode)) {
>
> Instead of this check...
>
>         if (np) {
>
> ...can be used.
>

Ok.

>
> > +             for_each_property_of_node(to_of_node(fwnode), prop) {
>
>         for_each_property_of_node(np, prop) {
>
> > +                     if (gpio_virtuser_prop_is_gpio(prop))
> > +                             ++ret;
>
> Why pre-increment?

Why not?

>
> > +             }
>
> > +             return ret;
> > +     }
>
> > +     return device_property_string_array_count(dev, "gpio-virtuser,ids=
");
> > +}
>
> ...
>
> > +static int gpio_virtuser_get_ids(struct device *dev, const char **ids,
> > +                              int num_ids)
> > +{
> > +     struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> > +     struct property *prop;
> > +     size_t pos =3D 0, diff;
> > +     char *dash, *tmp;
> > +
> > +     if (is_of_node(fwnode)) {
> > +             for_each_property_of_node(to_of_node(fwnode), prop) {
>
> As per above function.
>

Ok

> > +                     if (!gpio_virtuser_prop_is_gpio(prop))
> > +                             continue;
> > +
> > +                     dash =3D strpbrk(prop->name, "-");
> > +                     diff =3D dash - prop->name;
> > +
> > +                     tmp =3D devm_kmemdup(dev, prop->name, diff + 1,
> > +                                        GFP_KERNEL);
>
> devm_kstrndup() is not okay? Okay, we don't have it (yet?), but at least =
I
> would rather expect wrapped kstrndup() than this.
>

Meh, this logic is fine as we know the range exactly. IMO kstrndup()
here would be overkill. I'd leave it for now.

> > +                     if (!tmp)
> > +                             return -ENOMEM;
> > +
> > +                     tmp[diff] =3D '\0';
> > +                     ids[pos++] =3D tmp;
> > +             }
> > +
> > +             return 0;
> > +     }
> > +
> > +     return device_property_read_string_array(dev, "gpio-virtuser,ids"=
,
> > +                                              ids, num_ids);
> > +}
>
> ...
>
> > +static int gpio_virtuser_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct gpio_descs *descs;
> > +     int ret, num_ids =3D 0, i;
> > +     const char **ids;
> > +     unsigned int j;
> > +
> > +     num_ids =3D gpio_virtuser_count_ids(dev);
> > +     if (num_ids < 0)
> > +             return dev_err_probe(dev, num_ids,
> > +                                  "Failed to get the number of GPIOs t=
o request\n");
> > +
> > +     if (num_ids =3D=3D 0) {
> > +             dev_err(dev, "No GPIO IDs specified\n");
> > +             return -EINVAL;
>
> It's okay to
>
>                 return dev_err_probe(...);
>
> with know error code.
>

Ok.

> > +     }
> > +
> > +     ids =3D devm_kcalloc(dev, num_ids, sizeof(*ids), GFP_KERNEL);
> > +     if (!ids)
> > +             return -ENOMEM;
> > +
> > +     ret =3D gpio_virtuser_get_ids(dev, ids, num_ids);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret,
> > +                                  "Failed to get the IDs of GPIOs to r=
equest\n");
> > +
> > +     for (i =3D 0; i < num_ids; i++) {
> > +             descs =3D devm_gpiod_get_array(dev, ids[i], GPIOD_ASIS);
> > +             if (IS_ERR(descs))
> > +                     return dev_err_probe(dev, PTR_ERR(descs),
> > +                                          "Failed to request the '%s' =
GPIOs\n",
> > +                                          ids[i]);
> > +
> > +             ret =3D gpio_virtuser_sysfs_init_line_array_attrs(dev, de=
scs,
> > +                                                             ids[i]);
> > +             if (ret)
> > +                     return dev_err_probe(dev, ret,
> > +                                          "Failed to setup the sysfs a=
rray interface for the '%s' GPIOs\n",
> > +                                          ids[i]);
> > +
> > +             for (j =3D 0; j < descs->ndescs; j++) {
> > +                     ret =3D gpio_virtuser_sysfs_init_line_attrs(dev,
> > +                                                     descs->desc[j],
> > +                                                     ids[i], j);
> > +                     if (ret)
> > +                             return dev_err_probe(dev, ret,
> > +                                                  "Failed to setup the=
 sysfs line interface for the '%s' GPIOs\n",
> > +                                                  ids[i]);
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static int gpio_virtuser_bus_notifier_call(struct notifier_block *nb,
> > +                                        unsigned long action, void *da=
ta)
> > +{
> > +     struct gpio_virtuser_device *vdev;
> > +     struct device *dev =3D data;
> > +     char devname[32];
> > +
> > +     vdev =3D container_of(nb, struct gpio_virtuser_device, bus_notifi=
er);
> > +     snprintf(devname, sizeof(devname), "gpio-virtuser.%d", vdev->id);
> > +
> > +     if (strcmp(dev_name(dev), devname))
>
>         if (!device_match_name(...))
>

Ok

> > +             return NOTIFY_DONE;
> > +
> > +     switch (action) {
> > +     case BUS_NOTIFY_BOUND_DRIVER:
> > +             vdev->driver_bound =3D true;
> > +             break;
> > +     case BUS_NOTIFY_DRIVER_NOT_BOUND:
> > +             vdev->driver_bound =3D false;
> > +             break;
> > +     default:
> > +             return NOTIFY_DONE;
> > +     }
> > +
> > +     complete(&vdev->probe_completion);
> > +     return NOTIFY_OK;
> > +}
>
> ...
>
> > +static ssize_t
> > +gpio_virtuser_lookup_entry_config_key_store(struct config_item *item,
> > +                                         const char *page, size_t coun=
t)
> > +{
> > +     struct gpio_virtuser_lookup_entry *entry =3D
> > +                                     to_gpio_virtuser_lookup_entry(ite=
m);
> > +     struct gpio_virtuser_device *dev =3D entry->parent->parent;
> > +
> > +     char *key =3D kstrndup(skip_spaces(page), count, GFP_KERNEL);
>
> Missing __free() ?
>

Right.

> > +     if (!key)
> > +             return -ENOMEM;
>
> > +     strim(key);
>
> > +     guard(mutex)(&dev->lock);
> > +
> > +     if (gpio_virtuser_device_is_live(dev))
> > +             return -EBUSY;
> > +
> > +     kfree(entry->key);
> > +     entry->key =3D no_free_ptr(key);
> > +
> > +     return count;
> > +}
>
> ...
>
> > +     if (sysfs_streq(page, "pull-up")) {
> > +             entry->flags &=3D ~(GPIO_PULL_DOWN | GPIO_PULL_DISABLE);
> > +             entry->flags |=3D GPIO_PULL_UP;
> > +     } else if (sysfs_streq(page, "pull-down")) {
> > +             entry->flags &=3D ~(GPIO_PULL_UP | GPIO_PULL_DISABLE);
> > +             entry->flags |=3D GPIO_PULL_DOWN;
> > +     } else if (sysfs_streq(page, "pull-disabled")) {
> > +             entry->flags &=3D ~(GPIO_PULL_UP | GPIO_PULL_DOWN);
> > +             entry->flags |=3D GPIO_PULL_DISABLE;
> > +     } else if (sysfs_streq(page, "as-is")) {
> > +             entry->flags &=3D ~(GPIO_PULL_UP | GPIO_PULL_DOWN |
> > +                               GPIO_PULL_DISABLE);
> > +     } else {
> > +             count =3D -EINVAL;
>
>                 return -EINVAL won't (ab)use count semantics.
> > +     }
> > +
> > +     return count;
>
> ...
>
> > +     return sprintf(page, "%s\n", flags & GPIO_ACTIVE_LOW ? "1" : "0")=
;
>
> Somewhere above you used %d for very similar situation, why %s here?
> Or why "5d" there?
>

No reason, I'll unify it.

> ...
>
> > +     return sprintf(page, "%s\n", flags & GPIO_TRANSITORY ? "1" : "0")=
;
>
> Ditto.
>
> ...
>
> > +     return sprintf(page, "%c\n", live ? '1' : '0');
>
> Wow! Third type of the same.
>
> ...
>
> > +     struct gpiod_lookup_table *table __free(kfree) =3D
> > +             kzalloc(struct_size(table, table, num_entries + 1), GFP_K=
ERNEL);
> > +     if (!table)
> > +             return -ENOMEM;
>
> > +     table->dev_id =3D kasprintf(GFP_KERNEL, "gpio-virtuser.%d",
> > +                               dev->id);
>
> Perfectly one line in comparison with the few lines above).
>

Ok

> > +     if (!table->dev_id)
> > +             return -ENOMEM;
>
> ...
>
> > +                     curr->chip_hwnum =3D entry->offset < 0
> > +                                             ? U16_MAX : entry->offset=
;
>
> Can we leave ? on the previous line?
>
> ...
>
> > +                     ++i;
>
> Why pre-increment?
>
> ...
>
> > +static struct fwnode_handle *
> > +gpio_virtuser_make_device_swnode(struct gpio_virtuser_device *dev)
> > +{
> > +     struct property_entry properties[2];
> > +     struct gpio_virtuser_lookup *lookup;
> > +     size_t num_ids;
> > +     int i =3D 0;
>
> Why signed? And in all this kind of case, I would split assignment...
>
> > +     memset(properties, 0, sizeof(properties));
> > +
> > +     num_ids =3D list_count_nodes(&dev->lookup_list);
> > +     char **ids __free(kfree) =3D kcalloc(num_ids + 1, sizeof(*ids),
> > +                                        GFP_KERNEL);
> > +     if (!ids)
> > +             return ERR_PTR(-ENOMEM);
> > +
>
> To be here, that the reader will see immediately (close enough) what is t=
he
> initial values. Moreover this code will be robuse against changes in betw=
een
> (if i become reusable).
>

Sorry, I can't parse it.

> > +     list_for_each_entry(lookup, &dev->lookup_list, siblings)
> > +             ids[i++] =3D lookup->con_id;
> > +
> > +     properties[0] =3D PROPERTY_ENTRY_STRING_ARRAY_LEN("gpio-virtuser,=
ids",
> > +                                                     ids, num_ids);
> > +
> > +     return fwnode_create_software_node(properties, NULL);
> > +}
>
> ...
>
> > +     guard(mutex)(&dev->lock);
> > +
> > +     if (live =3D=3D gpio_virtuser_device_is_live(dev))
> > +             ret =3D -EPERM;
>
> With guard in place, just return directly, ...
>
> > +     else if (live)
>
> ...drop 'else'...
>
> > +             ret =3D gpio_virtuser_device_activate(dev);
> > +     else
>
> ...ditto...
>
> > +             gpio_virtuser_device_deactivate(dev);
> > +
> > +     return ret ?: count;
>
> ...and simply return count here.
>

Ok.

>
> ...
>
> > +     struct gpio_virtuser_device *dev __free(kfree) =3D kzalloc(sizeof=
(*dev),
> > +                                                              GFP_KERN=
EL);
>
>         struct gpio_virtuser_device *dev __free(kfree) =3D
>                 kzalloc(sizeof(*dev), GFP_KERNEL);
>
> > +     if (!dev)
> > +             return ERR_PTR(-ENOMEM);
>
> ...
>
> > +     ret =3D platform_driver_register(&gpio_virtuser_driver);
> > +     if (ret) {
>
> > +             pr_err("Failed to register the platform driver: %d\n",
> > +                    ret);
>
> I would keep one line.
>

Ok.

> > +             return ret;
> > +     }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thanks for the review!
Bart

