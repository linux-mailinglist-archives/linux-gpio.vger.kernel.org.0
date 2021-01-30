Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2DD309848
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Jan 2021 21:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhA3Uit (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Jan 2021 15:38:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbhA3Uir (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Jan 2021 15:38:47 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C227C061756
        for <linux-gpio@vger.kernel.org>; Sat, 30 Jan 2021 12:38:07 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id i8so1758195ejc.7
        for <linux-gpio@vger.kernel.org>; Sat, 30 Jan 2021 12:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hoP/oNWFPNlfcd1GZPExofUOydp7Qlv1TYVniodX+To=;
        b=0+GVKdDOrfNL5y+IV+GZtDKMgpSvo30OEulJR7PJcAxMpcleeFHEjO4kp7nqcFSYSZ
         ODGfLqHH19o3OupNfNNPpKejEYGNE7YQ7OEwp1FyDWmXc0faJgNdVpTXVcpMxLp3sNzE
         T+XVp9JoHC+PUrUBSEOUk8yssFkK/2mGomUpbv1I8bRd5PYGd2s5CtBEM2jTpwKonqb9
         baFZJVl9zDJjrN5hITtqRbZcFr7nLNUaAMC5C2Ys5QfJUbhnpc0YLau3E6QgkcDQOV9F
         JAYjdgKyhCIx0cfF/pgyqTJir+N/T3as/KmtZncybaMR27KogtBwQM+SPor6P6vvVAWO
         dCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hoP/oNWFPNlfcd1GZPExofUOydp7Qlv1TYVniodX+To=;
        b=sF1NuCNN6Oc7earao+9pktDaY8Uim6r31EpxiIye5RJlDAIOgpKuyMNp/A2EtBahZ0
         RNA+3p5yLIEyg6IS8px7v1P6wqy4Y566d7227ra3IREevNG+gWz8XQPxg2aCMBZw/OEb
         g4aC5d61iK3fZTQtpYQcLfltntu0c0N4Tb/Y1pQvsCBVX52nEhES58o4y+C0X6zmgAmv
         kkL7b/MGxbctfBVDyeCMsE2/tUdtOFu9i3flmR6NXTLG5DJiyvm1RUW1Omcxb6VKpGCD
         sC8cyBSPTUxwlBy/iCWU3sPR3cXFQexA8qlSTYTiFhHydEiyGy/g2MTY8cp8I5U8tmSX
         wHvA==
X-Gm-Message-State: AOAM532OyeHYp26uUnhuFCYXgk1un7d7rpohiKvUTeV08pI2AkmXNVTT
        7GPNpRV3QZkZUY1J3jzSWJn/hu5OVA3j7s4+U9ndy+tcikw=
X-Google-Smtp-Source: ABdhPJzi0LHBQaTe91DHzx2uOINRO1+an0tZSNqQQz3sNd37Vy9wJXrJJum5UBKayapxT6I2Eir+RhqqnXcYd1UFKuU=
X-Received: by 2002:a17:906:5f9a:: with SMTP id a26mr10964154eju.87.1612039085911;
 Sat, 30 Jan 2021 12:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20210129134624.9247-1-brgl@bgdev.pl> <20210129134624.9247-9-brgl@bgdev.pl>
 <YBQwUkQz3LrG5G4i@smile.fi.intel.com>
In-Reply-To: <YBQwUkQz3LrG5G4i@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 30 Jan 2021 21:37:55 +0100
Message-ID: <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] gpio: sim: new testing module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 29, 2021 at 4:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jan 29, 2021 at 02:46:24PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Implement a new, modern GPIO testing module controlled by configfs
> > attributes instead of module parameters. The goal of this driver is
> > to provide a replacement for gpio-mockup that will be easily extensible
> > with new features and doesn't require reloading the module to change
> > the setup.
>
> ...
>
> > +In order to destroy a simulated chip, it has to be moved back to pending first
> > +and then removed using rmdir().
> > +
> > +Currently supported configuration attributes are:
> > +
> > +  num_lines - an unsigned integer value defining the number of GPIO lines to
> > +              export
> > +
> > +  label - a string defining the label for the GPIO chip
> > +
> > +  line_names - a list of GPIO line names in the form of quoted strings
> > +               separated by commas, e.g.: '"foo", "bar", "", "foobar". The
>
> Unmatched ' (single quote).
>
> > +               number of strings doesn't have to be equal to the value set in
> > +               the num_lines attribute. If it's lower than the number of lines,
> > +               the remaining lines are unnamed. If it's larger, the superfluous
> > +               lines are ignored. A name of the form: '""' means the line
> > +               should be unnamed.
>
> ...
>
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> > +#include <linux/bitmap.h>
> > +#include <linux/configfs.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/idr.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irq_sim.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/slab.h>
> > +#include <linux/string.h>
> > +#include <linux/string_helpers.h>
> > +#include <linux/sysfs.h>
>
> ...
>
> > +static int gpio_sim_apply_pull(struct gpio_sim_chip *chip,
> > +                            unsigned int offset, int value)
> > +{
> > +     int curr_val, irq, irq_type, ret;
> > +     struct gpio_desc *desc;
> > +     struct gpio_chip *gc;
> > +
> > +     gc = &chip->gc;
> > +     desc = &gc->gpiodev->descs[offset];
> > +
> > +     mutex_lock(&chip->lock);
> > +
> > +     if (test_bit(FLAG_REQUESTED, &desc->flags) &&
> > +         !test_bit(FLAG_IS_OUT, &desc->flags)) {
>
> > +             curr_val = test_bit(offset, chip->values);
> > +             if (curr_val == value)
> > +                     goto set_pull;
>
> Theoretically (I haven't checked all of the arch code) test_bit() may return
> any value, hence, shouldn't you rather do something like
>
>                 if (!!curr_val == !!value)
>
> ?
>
> > +             /*
> > +              * This is fine - it just means, nobody is listening
> > +              * for interrupts on this line, otherwise
> > +              * irq_create_mapping() would have been called from
> > +              * the to_irq() callback.
> > +              */
> > +             irq = irq_find_mapping(chip->irq_sim, offset);
> > +             if (!irq)
> > +                     goto set_value;
> > +
> > +             irq_type = irq_get_trigger_type(irq);
> > +
> > +             if ((value && (irq_type & IRQ_TYPE_EDGE_RISING)) ||
> > +                 (value == 0 && (irq_type & IRQ_TYPE_EDGE_FALLING))) {
>
> !value ?
>
> > +                     ret = irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING,
> > +                                                 true);
> > +                     if (ret)
> > +                             goto set_pull;
> > +             }
> > +     }
> > +
> > +set_value:
> > +     /* Change the value unless we're actively driving the line. */
> > +     if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
> > +         !test_bit(FLAG_IS_OUT, &desc->flags))
> > +             __assign_bit(offset, chip->values, value);
> > +
> > +set_pull:
> > +     __assign_bit(offset, chip->pulls, value);
> > +     mutex_unlock(&chip->lock);
> > +     return 0;
> > +}
>
> ...
>
> > +static int gpio_sim_get_multiple(struct gpio_chip *gc,
> > +                              unsigned long *mask, unsigned long *bits)
> > +{
> > +     struct gpio_sim_chip *chip = gpiochip_get_data(gc);
> > +     unsigned int bit;
> > +
> > +     mutex_lock(&chip->lock);
>
> > +     for_each_set_bit(bit, mask, gc->ngpio)
> > +             __assign_bit(bit, bits, test_bit(bit, chip->values));
>
> I tried to understand the logic here and why it's different to bitmap_copy().
> Any hints?
>
> > +     mutex_unlock(&chip->lock);
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static void gpio_sim_set_multiple(struct gpio_chip *gc,
> > +                               unsigned long *mask, unsigned long *bits)
> > +{
> > +     struct gpio_sim_chip *chip = gpiochip_get_data(gc);
> > +     unsigned int bit;
> > +
> > +     mutex_lock(&chip->lock);
> > +     for_each_set_bit(bit, mask, gc->ngpio)
> > +             __assign_bit(bit, chip->values, test_bit(bit, bits));
>
> Ditto.
>
> > +     mutex_unlock(&chip->lock);
> > +}
>
> ...
>
> > +static int gpio_sim_set_config(struct gpio_chip *gc,
> > +                               unsigned int offset, unsigned long config)
> > +{
> > +     struct gpio_sim_chip *chip = gpiochip_get_data(gc);
> > +
> > +     switch (pinconf_to_config_param(config)) {
>
> > +     case PIN_CONFIG_BIAS_PULL_UP:
> > +             return gpio_sim_apply_pull(chip, offset, 1);
> > +     case PIN_CONFIG_BIAS_PULL_DOWN:
> > +             return gpio_sim_apply_pull(chip, offset, 0);
>
> But aren't we got a parameter (1 or 0) from config? And hence
>
>         case PIN_CONFIG_BIAS_PULL_UP:
>         case PIN_CONFIG_BIAS_PULL_DOWN:
>                 return gpio_sim_apply_pull(chip, offset, <param>);
>
> ?

I believe this is more explicit and so easier to read if you don't
know the GPIO and pinctrl internals.

>
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return -ENOTSUPP;
> > +}
>
> ...
>
> > +static ssize_t gpio_sim_sysfs_line_store(struct device *dev,
> > +                                      struct device_attribute *attr,
> > +                                      const char *buf, size_t len)
> > +{
> > +     struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
> > +     struct gpio_sim_chip *chip = dev_get_drvdata(dev);
> > +     int ret, val;
>
> > +     ret = kstrtoint(buf, 0, &val);
> > +     if (ret)
> > +             return ret;
> > +     if (val != 0 && val != 1)
> > +             return -EINVAL;
>
> kstrtobool() ?
>

No, we really only want 0 or 1, no yes, Y etc.

> > +     ret = gpio_sim_apply_pull(chip, line_attr->offset, val);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return len;
> > +}
>
> ...
>
> > +static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
> > +{
> > +     unsigned int i, num_lines = chip->gc.ngpio;
> > +     struct device *dev = chip->gc.parent;
> > +     struct gpio_sim_attribute *line_attr;
> > +     struct device_attribute *dev_attr;
> > +     struct attribute **attrs;
> > +     int ret;
> > +
> > +     attrs = devm_kcalloc(dev, sizeof(struct attribute *),
>
> sizeof(*attr) ?
>
> > +                          num_lines + 1, GFP_KERNEL);
>
> and hence one line?
>
> > +     if (!attrs)
> > +             return -ENOMEM;
> > +
> > +     for (i = 0; i < num_lines; i++) {
> > +             line_attr = devm_kzalloc(dev, sizeof(*line_attr), GFP_KERNEL);
> > +             if (!line_attr)
> > +                     return -ENOMEM;
> > +
> > +             line_attr->offset = i;
> > +
> > +             dev_attr = &line_attr->dev_attr;
> > +
> > +             dev_attr->attr.name = devm_kasprintf(dev, GFP_KERNEL,
> > +                                                  "gpio%u", i);
> > +             if (!dev_attr->attr.name)
> > +                     return -ENOMEM;
> > +
> > +             dev_attr->attr.mode = 0644;
> > +
> > +             dev_attr->show = gpio_sim_sysfs_line_show;
> > +             dev_attr->store = gpio_sim_sysfs_line_store;
> > +
> > +             attrs[i] = &dev_attr->attr;
> > +     }
> > +
> > +     chip->attr_group.name = "line-ctrl";
> > +     chip->attr_group.attrs = attrs;
> > +
> > +     ret = sysfs_create_group(&dev->kobj, &chip->attr_group);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return devm_add_action_or_reset(dev, gpio_sim_sysfs_remove, chip);
> > +}
>
> ...
>
> > +static int gpio_sim_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct gpio_sim_chip *chip;
> > +     struct gpio_chip *gc;
> > +     const char *label;
> > +     unsigned int bit;
> > +     u32 num_lines;
> > +     int ret;
> > +
> > +     ret = device_property_read_u32(dev, "gpio-sim,nr-gpios", &num_lines);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = device_property_read_string(dev, "gpio-sim,label", &label);
> > +     if (ret)
> > +             label = dev_name(dev);
> > +
> > +     chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> > +     if (!chip)
> > +             return -ENOMEM;
> > +
> > +     chip->directions = devm_bitmap_zalloc(dev, num_lines, GFP_KERNEL);
> > +     if (!chip->directions)
> > +             return -ENOMEM;
>
> > +     /* Default to input mode. */
> > +     for_each_clear_bit(bit, chip->directions, num_lines)
> > +             __set_bit(bit, chip->directions);
>
> Again, what's the difference to have it as
>
>         bitmap_fill(..., num_lines);
>
> ?
>
> > +     chip->values = devm_bitmap_zalloc(dev, num_lines, GFP_KERNEL);
> > +     if (!chip->values)
> > +             return -ENOMEM;
> > +
> > +     chip->pulls = devm_bitmap_zalloc(dev, num_lines, GFP_KERNEL);
> > +     if (!chip->pulls)
> > +             return -ENOMEM;
> > +
> > +     chip->irq_sim = devm_irq_domain_create_sim(dev, NULL, num_lines);
> > +     if (IS_ERR(chip->irq_sim))
> > +             return PTR_ERR(chip->irq_sim);
> > +
> > +     mutex_init(&chip->lock);
> > +     ret = devm_add_action_or_reset(dev, gpio_sim_mutex_destroy,
> > +                                    &chip->lock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     gc = &chip->gc;
> > +     gc->base = -1;
> > +     gc->ngpio = num_lines;
> > +     gc->label = label;
> > +     gc->owner = THIS_MODULE;
> > +     gc->parent = dev;
> > +     gc->get = gpio_sim_get;
> > +     gc->set = gpio_sim_set;
> > +     gc->get_multiple = gpio_sim_get_multiple;
> > +     gc->set_multiple = gpio_sim_set_multiple;
> > +     gc->direction_output = gpio_sim_direction_output;
> > +     gc->direction_input = gpio_sim_direction_input;
> > +     gc->get_direction = gpio_sim_get_direction;
> > +     gc->set_config = gpio_sim_set_config;
> > +     gc->to_irq = gpio_sim_to_irq;
> > +     gc->free = gpio_sim_free;
> > +
> > +     ret = devm_gpiochip_add_data(dev, gc, chip);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = gpio_sim_setup_sysfs(chip);
> > +     if (ret)
> > +             return ret;
>
> > +     /* For sysfs callbacks. */
> > +     dev_set_drvdata(dev, chip);
>
> Shouldn't it be set _before_ sysfs node registration?
>
> > +     return 0;
> > +}
>
> ...
>
> > +static const struct of_device_id gpio_sim_of_match[] = {
> > +     { .compatible = "gpio-simulator" },
> > +     { },
>
> No comma needed.
>
> > +};
>
> ...
>
> > +struct gpio_sim_chip_config {
> > +     struct config_item item;
> > +
> > +     /*
> > +      * If pdev is NULL, the item is 'pending' (waiting for configuration).
> > +      * Once the pointer is assigned, the device has been created and the
> > +      * item is 'live'.
> > +      */
> > +     struct platform_device *pdev;
>
> Are you sure
>
>         struct device *dev;
>
> is not sufficient?
>

It may be but I really prefer those simulated devices to be on the platform bus.

> > +     /*
> > +      * Each configfs filesystem operation is protected with the subsystem
> > +      * mutex. Each separate attribute is protected with the buffer mutex.
> > +      * This structure however can be modified by callbacks of different
> > +      * attributes so we need another lock.
> > +      */
> > +     struct mutex lock;
> > +
> > +     char label[32];
> > +     unsigned int num_lines;
> > +     char **line_names;
> > +     unsigned int num_line_names;
> > +};
>
> ...
>
> > +static ssize_t gpio_sim_config_label_store(struct config_item *item,
> > +                                        const char *page, size_t count)
> > +{
> > +     struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
> > +     char *dup, *trimmed;
> > +     int ret;
> > +
> > +     mutex_lock(&config->lock);
> > +
> > +     if (config->pdev) {
> > +             mutex_unlock(&config->lock);
> > +             return -EBUSY;
> > +     }
>
> > +     dup = kstrndup(page, count, GFP_KERNEL);
> > +     if (!dup) {
> > +             mutex_unlock(&config->lock);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     trimmed = strstrip(dup);
> > +     ret = snprintf(config->label, sizeof(config->label), "%s", trimmed);
> > +     kfree(dup);
>
> All these sounds like reinvention of kasprintf().
>

Except that we have a buffer already allocated that holds 32
characters and we just put the string there. The buffer corresponds
with the one the character device uses. Trimming whitespace is just so
that it doesn't use up the few characters we have. On the other hand -
since the kernel doesn't really limit the label to 32 chars (only uAPI
does) maybe I'll address this somehow.

> > +     if (ret < 0) {
> > +             mutex_unlock(&config->lock);
> > +             return ret;
> > +     }
> > +
> > +     mutex_unlock(&config->lock);
> > +     return count;
> > +}
>
> ...
>
> > +     for (i = 0; i < config->num_line_names; i++) {
> > +             ret = sprintf(page + written,
> > +                     i < config->num_line_names - 1 ?
> > +                             "\"%s\", " : "\"%s\"\n",
> > +                     config->line_names[i] ?: "");
> > +             if (ret < 0) {
> > +                     mutex_unlock(&config->lock);
> > +                     return ret;
> > +             }
> > +
> > +             written += ret;
> > +     }
> > +
> > +     written += ret;
>
> Hmm... twice for the last element, is it correct?
>

Indeed! Nice catch.

>
> ...
>
> Honestly, I don't like the idea of Yet Another (custom) Parser in the kernel.
>
> Have you investigated existing parsers? We have cmdline.c, gpio-aggregator.c,
> etc. Besides the fact of test cases which are absent here. And who knows what
> we allow to be entered.
>

Yes, I looked all around the kernel to find something I could reuse
but failed to find anything useful for this particular purpose. If you
have something you could point me towards, I'm open to alternatives.

Once we agree on the form of the module, I'll port self-tests to using
it instead of gpio-mockup, so we'll have some tests in the tree.

> > +     /*
> > +      * Line names are stored in a pointer array so that we can easily
> > +      * pass them down to the GPIO subsystem in a "gpio-line-names"
> > +      * property.
> > +      *
> > +      * Line names must be passed as a list of quoted names separated by
> > +      * commas, for example: '"foo", "bar", "foobar"'.
> > +      */
>
> ...
>
> > +static struct configfs_attribute *gpio_sim_config_attrs[] = {
> > +     &gpio_sim_config_attr_label,
> > +     &gpio_sim_config_attr_num_lines,
> > +     &gpio_sim_config_attr_line_names,
>
> > +     NULL,
>
> No need to have comma.
>
> > +};
>
> ...
>
> > +module_init(gpio_sim_init);
> > +module_exit(gpio_sim_exit);
>
> Perhaps each one closer to the function it refers to?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I'll address all issues I didn't comment on in v2. Thanks for the
thorough (as always) review!

Bartosz
