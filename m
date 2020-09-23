Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4261275C32
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 17:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgIWPmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 11:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgIWPmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 11:42:05 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EC4C0613CE;
        Wed, 23 Sep 2020 08:42:04 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bd2so7051764plb.7;
        Wed, 23 Sep 2020 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0k1KCAZR5DhvIR5z3hz4GdTFJhSRf4Ad+3keeUrIlU=;
        b=jvALaeF8jDsoxgRUcxSeOKBD8O+lWIufslRkhkUKQCU8NGBvz3jM5CZZqEE9tiBuUX
         KSbdEmscwqhFhxHz021iSi6RYWcMqF/5kxbNmqIe5QLb0WliHUrSC2GAGxuBvvGCkTzV
         GE/kdHSOC6kxfJ1hGlUvgJ91jR1VCatKStguS/eWTwSiUmuPvWnD3Ezjdz9LC3JHxO5i
         Lgvg7buMyfTK39IaryQlFjeMLzapsVATOfKQSYMDqprSkGeewsgwgGfZGD4lXW4tKzM3
         YAWZk86ZECk74sAlKpLWTNZqwLRgtMS+JNIkDvoHQrhd2Z32LGe1+uvf/M9+8rOOyc5R
         WnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0k1KCAZR5DhvIR5z3hz4GdTFJhSRf4Ad+3keeUrIlU=;
        b=IQzRfmDnVh1d5/O+uwUkimME45KLGHzw4lEZCjK57JoCcGYTYQnIYOQdDD4OKYqYSR
         KF3Tu2zOpxpv9RpZHPwiayud3hsq7lWCRYBfaEswwyJAshXaqh3wdrooHvZteWl9RFRT
         g+527ZPtwLl6+rxwO1bbrskwMHow4kuQpUnmGi2+jUcHku2a4FEONrcCVk4+zzvA5F19
         EKlny8yBwtq3tCvnJRRsl/S+LFeEpcVpaYzo7SLiWktcJbM25O1FgexVISvt+Jruwvkv
         DxehLWY1A46muyNDQzbxHsoEXyinOFfvUZ9ns3QRvr9G1uxW7nCqnQ4Oc0/0Gn/DEzXi
         Qc4A==
X-Gm-Message-State: AOAM532Pxb5MkKkDH4Td4rZadKTX+0x/5Yd9AS87dfMPneTBuylFUsBw
        UeOj0W8aF/gD559uCy4ME6aX21qLxoDzOgXkrJlHtUowRHeI2dhE
X-Google-Smtp-Source: ABdhPJwCF4M8cH03t7LBS48WDvsLpJipSzayDeoajg7DwKDPdFOY3aKZpNfh5//4CyEIZcuBaIzdPEWcyZTM+e2SjR4=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr13888pjb.129.1600875724307;
 Wed, 23 Sep 2020 08:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-9-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-9-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 18:41:45 +0300
Message-ID: <CAHp75Vc05P4-X_ZC6k-EWdDCAXOgPgAJhm4RxF3izvk=vW+X+g@mail.gmail.com>
Subject: Re: [PATCH v9 08/20] gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL
 and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for GPIO_V2_GET_LINEINFO_IOCTL and
> GPIO_V2_GET_LINEINFO_WATCH_IOCTL.
>
> The core of this change is the event kfifo switching to contain
> struct gpioline_info_changed_v2, instead of v1 as v2 is richer.
>
> The two uAPI versions are mostly independent - other than where they both
> provide line info changes via reads on the chip fd.  As the info change
> structs differ between v1 and v2, the infowatch implementation tracks which
> version of the infowatch ioctl, either GPIO_GET_LINEINFO_WATCH_IOCTL or
> GPIO_V2_GET_LINEINFO_WATCH_IOCTL, initiates the initial watch and returns
> the corresponding info change struct to the read.  The version supported
> on that fd locks to that version on the first watch request, so subsequent
> watches from that process must use the same uAPI version.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>
> Changes for v5:
>  - as per cover letter
>
> Changes for v4:
>  - replace strncpy with memcpy in gpio_v2_line_info_to_v1
>
>  drivers/gpio/gpiolib-cdev.c | 197 +++++++++++++++++++++++++++++++-----
>  1 file changed, 169 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 7a3ed2617f74..d3857113f58c 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -181,7 +181,8 @@ static long linehandle_set_config(struct linehandle_state *lh,
>                 }
>
>                 blocking_notifier_call_chain(&desc->gdev->notifier,
> -                                            GPIOLINE_CHANGED_CONFIG, desc);
> +                                            GPIO_V2_LINE_CHANGED_CONFIG,
> +                                            desc);
>         }
>         return 0;
>  }
> @@ -353,7 +354,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>                 }
>
>                 blocking_notifier_call_chain(&desc->gdev->notifier,
> -                                            GPIOLINE_CHANGED_REQUESTED, desc);
> +                                            GPIO_V2_LINE_CHANGED_REQUESTED, desc);
>
>                 dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
>                         offset);
> @@ -747,7 +748,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>                 }
>
>                 blocking_notifier_call_chain(&desc->gdev->notifier,
> -                                            GPIOLINE_CHANGED_REQUESTED, desc);
> +                                            GPIO_V2_LINE_CHANGED_REQUESTED, desc);
>
>                 dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
>                         offset);
> @@ -1094,7 +1095,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>                 goto out_free_le;
>
>         blocking_notifier_call_chain(&desc->gdev->notifier,
> -                                    GPIOLINE_CHANGED_REQUESTED, desc);
> +                                    GPIO_V2_LINE_CHANGED_REQUESTED, desc);
>
>         irq = gpiod_to_irq(desc);
>         if (irq <= 0) {
> @@ -1161,17 +1162,59 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>         return ret;
>  }
>
> +static void gpio_v2_line_info_to_v1(struct gpio_v2_line_info *info_v2,
> +                                   struct gpioline_info *info_v1)
> +{
> +       u64 flagsv2 = info_v2->flags;
> +
> +       memcpy(info_v1->name, info_v2->name, sizeof(info_v1->name));

> +       memcpy(info_v1->consumer, info_v2->consumer,
> +              sizeof(info_v1->consumer));

One line?

> +       info_v1->line_offset = info_v2->offset;
> +       info_v1->flags = 0;
> +
> +       if (flagsv2 & GPIO_V2_LINE_FLAG_USED)
> +               info_v1->flags |= GPIOLINE_FLAG_KERNEL;
> +
> +       if (flagsv2 & GPIO_V2_LINE_FLAG_OUTPUT)
> +               info_v1->flags |= GPIOLINE_FLAG_IS_OUT;
> +
> +       if (flagsv2 & GPIO_V2_LINE_FLAG_ACTIVE_LOW)
> +               info_v1->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
> +
> +       if (flagsv2 & GPIO_V2_LINE_FLAG_OPEN_DRAIN)
> +               info_v1->flags |= GPIOLINE_FLAG_OPEN_DRAIN;
> +       if (flagsv2 & GPIO_V2_LINE_FLAG_OPEN_SOURCE)
> +               info_v1->flags |= GPIOLINE_FLAG_OPEN_SOURCE;
> +
> +       if (flagsv2 & GPIO_V2_LINE_FLAG_BIAS_PULL_UP)
> +               info_v1->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
> +       if (flagsv2 & GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN)
> +               info_v1->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
> +       if (flagsv2 & GPIO_V2_LINE_FLAG_BIAS_DISABLED)
> +               info_v1->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
> +}
> +
> +static void gpio_v2_line_info_changed_to_v1(
> +               struct gpio_v2_line_info_changed *lic_v2,
> +               struct gpioline_info_changed *lic_v1)
> +{
> +       gpio_v2_line_info_to_v1(&lic_v2->info, &lic_v1->info);
> +       lic_v1->timestamp = lic_v2->timestamp_ns;
> +       lic_v1->event_type = lic_v2->event_type;
> +}
> +
>  #endif /* CONFIG_GPIO_CDEV_V1 */
>
>  static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
> -                                 struct gpioline_info *info)
> +                                 struct gpio_v2_line_info *info)
>  {
>         struct gpio_chip *gc = desc->gdev->chip;
>         bool ok_for_pinctrl;
>         unsigned long flags;
>
>         memset(info, 0, sizeof(*info));
> -       info->line_offset = gpio_chip_hwgpio(desc);
> +       info->offset = gpio_chip_hwgpio(desc);
>
>         /*
>          * This function takes a mutex so we must check this before taking
> @@ -1181,7 +1224,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>          * lock common to both frameworks?
>          */
>         ok_for_pinctrl =
> -               pinctrl_gpio_can_use_line(gc->base + info->line_offset);
> +               pinctrl_gpio_can_use_line(gc->base + info->offset);
>
>         spin_lock_irqsave(&gpio_lock, flags);
>
> @@ -1202,23 +1245,27 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>             test_bit(FLAG_EXPORT, &desc->flags) ||
>             test_bit(FLAG_SYSFS, &desc->flags) ||
>             !ok_for_pinctrl)
> -               info->flags |= GPIOLINE_FLAG_KERNEL;
> +               info->flags |= GPIO_V2_LINE_FLAG_USED;
> +
>         if (test_bit(FLAG_IS_OUT, &desc->flags))
> -               info->flags |= GPIOLINE_FLAG_IS_OUT;
> +               info->flags |= GPIO_V2_LINE_FLAG_OUTPUT;
> +       else
> +               info->flags |= GPIO_V2_LINE_FLAG_INPUT;
> +
>         if (test_bit(FLAG_ACTIVE_LOW, &desc->flags))
> -               info->flags |= GPIOLINE_FLAG_ACTIVE_LOW;
> +               info->flags |= GPIO_V2_LINE_FLAG_ACTIVE_LOW;
> +
>         if (test_bit(FLAG_OPEN_DRAIN, &desc->flags))
> -               info->flags |= (GPIOLINE_FLAG_OPEN_DRAIN |
> -                               GPIOLINE_FLAG_IS_OUT);
> +               info->flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
>         if (test_bit(FLAG_OPEN_SOURCE, &desc->flags))
> -               info->flags |= (GPIOLINE_FLAG_OPEN_SOURCE |
> -                               GPIOLINE_FLAG_IS_OUT);
> +               info->flags |= GPIO_V2_LINE_FLAG_OPEN_SOURCE;
> +
>         if (test_bit(FLAG_BIAS_DISABLE, &desc->flags))
> -               info->flags |= GPIOLINE_FLAG_BIAS_DISABLE;
> +               info->flags |= GPIO_V2_LINE_FLAG_BIAS_DISABLED;
>         if (test_bit(FLAG_PULL_DOWN, &desc->flags))
> -               info->flags |= GPIOLINE_FLAG_BIAS_PULL_DOWN;
> +               info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_DOWN;
>         if (test_bit(FLAG_PULL_UP, &desc->flags))
> -               info->flags |= GPIOLINE_FLAG_BIAS_PULL_UP;
> +               info->flags |= GPIO_V2_LINE_FLAG_BIAS_PULL_UP;
>
>         spin_unlock_irqrestore(&gpio_lock, flags);
>  }
> @@ -1226,11 +1273,65 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>  struct gpio_chardev_data {
>         struct gpio_device *gdev;
>         wait_queue_head_t wait;
> -       DECLARE_KFIFO(events, struct gpioline_info_changed, 32);
> +       DECLARE_KFIFO(events, struct gpio_v2_line_info_changed, 32);
>         struct notifier_block lineinfo_changed_nb;
>         unsigned long *watched_lines;
> +#ifdef CONFIG_GPIO_CDEV_V1
> +       atomic_t watch_abi_version;
> +#endif
>  };
>
> +#ifdef CONFIG_GPIO_CDEV_V1
> +static int lineinfo_ensure_abi_version(struct gpio_chardev_data *cdata,
> +                                      unsigned int version)
> +{

> +       int abiv = atomic_read(&cdata->watch_abi_version);
> +
> +       if (abiv == 0) {

> +               atomic_cmpxchg(&cdata->watch_abi_version, 0, version);
> +               abiv = atomic_read(&cdata->watch_abi_version);

atomic_cmpxchng() returns a value.
Also there are no barriers here...

> +       }
> +       if (abiv != version)
> +               return -EPERM;

I'm not sure I understand why this is atomic.

Also this seems to be racy if cdata changed in background.

Shouldn't be rather

if (atomic_cmpxchg() == 0) {
  if (atomic_read() != version)
    return ...;
}

But here is still the question: why do you expect the version to be
changed on background? And what about barriers?

> +       return 0;
> +}
> +#endif
> +
> +static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
> +                       bool watch)
> +{
> +       struct gpio_desc *desc;
> +       struct gpio_v2_line_info lineinfo;
> +
> +       if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
> +               return -EFAULT;
> +
> +       if (memchr_inv(lineinfo.padding, 0, sizeof(lineinfo.padding)))
> +               return -EINVAL;
> +
> +       desc = gpiochip_get_desc(cdev->gdev->chip, lineinfo.offset);
> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);
> +
> +       if (watch) {
> +#ifdef CONFIG_GPIO_CDEV_V1

> +               if (lineinfo_ensure_abi_version(cdev, 2))
> +                       return -EPERM;

Can't you propagate error code from the function?

> +#endif
> +               if (test_and_set_bit(lineinfo.offset, cdev->watched_lines))
> +                       return -EBUSY;
> +       }
> +       gpio_desc_to_lineinfo(desc, &lineinfo);
> +
> +       if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
> +               if (watch)
> +                       clear_bit(lineinfo.offset, cdev->watched_lines);
> +               return -EFAULT;
> +       }
> +
> +       return 0;
> +}
> +
>  /*
>   * gpio_ioctl() - ioctl handler for the GPIO chardev
>   */
> @@ -1240,7 +1341,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>         struct gpio_device *gdev = cdev->gdev;
>         struct gpio_chip *gc = gdev->chip;
>         void __user *ip = (void __user *)arg;
> -       struct gpio_desc *desc;
>         __u32 offset;
>
>         /* We fail any subsequent ioctl():s when the chip is gone */
> @@ -1263,7 +1363,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>                 return 0;
>  #ifdef CONFIG_GPIO_CDEV_V1
>         } else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
> +               struct gpio_desc *desc;
>                 struct gpioline_info lineinfo;
> +               struct gpio_v2_line_info lineinfo_v2;
>
>                 if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>                         return -EFAULT;
> @@ -1273,7 +1375,8 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>                 if (IS_ERR(desc))
>                         return PTR_ERR(desc);
>
> -               gpio_desc_to_lineinfo(desc, &lineinfo);
> +               gpio_desc_to_lineinfo(desc, &lineinfo_v2);
> +               gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
>
>                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>                         return -EFAULT;
> @@ -1283,7 +1386,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>         } else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
>                 return lineevent_create(gdev, ip);
>         } else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
> +               struct gpio_desc *desc;
>                 struct gpioline_info lineinfo;
> +               struct gpio_v2_line_info lineinfo_v2;
>
>                 if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>                         return -EFAULT;
> @@ -1293,10 +1398,14 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>                 if (IS_ERR(desc))
>                         return PTR_ERR(desc);
>
> +               if (lineinfo_ensure_abi_version(cdev, 1))
> +                       return -EPERM;
> +
>                 if (test_and_set_bit(lineinfo.line_offset, cdev->watched_lines))
>                         return -EBUSY;
>
> -               gpio_desc_to_lineinfo(desc, &lineinfo);
> +               gpio_desc_to_lineinfo(desc, &lineinfo_v2);
> +               gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
>
>                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
>                         clear_bit(lineinfo.line_offset, cdev->watched_lines);
> @@ -1305,6 +1414,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>
>                 return 0;
>  #endif /* CONFIG_GPIO_CDEV_V1 */
> +       } else if (cmd == GPIO_V2_GET_LINEINFO_IOCTL ||
> +                  cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL) {
> +               return lineinfo_get(cdev, ip,
> +                                   cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL);
>         } else if (cmd == GPIO_V2_GET_LINE_IOCTL) {
>                 return linereq_create(gdev, ip);
>         } else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
> @@ -1340,7 +1453,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
>                                    unsigned long action, void *data)
>  {
>         struct gpio_chardev_data *cdev = to_gpio_chardev_data(nb);
> -       struct gpioline_info_changed chg;
> +       struct gpio_v2_line_info_changed chg;
>         struct gpio_desc *desc = data;
>         int ret;
>
> @@ -1349,7 +1462,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
>
>         memset(&chg, 0, sizeof(chg));
>         chg.event_type = action;
> -       chg.timestamp = ktime_get_ns();
> +       chg.timestamp_ns = ktime_get_ns();
>         gpio_desc_to_lineinfo(desc, &chg.info);
>
>         ret = kfifo_in_spinlocked(&cdev->events, &chg, 1, &cdev->wait.lock);
> @@ -1380,12 +1493,16 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
>                                    size_t count, loff_t *off)
>  {
>         struct gpio_chardev_data *cdev = file->private_data;
> -       struct gpioline_info_changed event;
> +       struct gpio_v2_line_info_changed event;
>         ssize_t bytes_read = 0;
>         int ret;
> +       size_t event_size;
>
> -       if (count < sizeof(event))
> +#ifndef CONFIG_GPIO_CDEV_V1
> +       event_size = sizeof(struct gpio_v2_line_info_changed);
> +       if (count < event_size)
>                 return -EINVAL;
> +#endif
>
>         do {
>                 spin_lock(&cdev->wait.lock);
> @@ -1407,7 +1524,17 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
>                                 return ret;
>                         }
>                 }
> -
> +#ifdef CONFIG_GPIO_CDEV_V1
> +               /* must be after kfifo check so watch_abi_version is set */
> +               if (atomic_read(&cdev->watch_abi_version) == 2)
> +                       event_size = sizeof(struct gpio_v2_line_info_changed);
> +               else
> +                       event_size = sizeof(struct gpioline_info_changed);
> +               if (count < event_size) {
> +                       spin_unlock(&cdev->wait.lock);
> +                       return -EINVAL;
> +               }
> +#endif
>                 ret = kfifo_out(&cdev->events, &event, 1);
>                 spin_unlock(&cdev->wait.lock);
>                 if (ret != 1) {
> @@ -1416,9 +1543,23 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
>                         /* We should never get here. See lineevent_read(). */
>                 }
>
> -               if (copy_to_user(buf + bytes_read, &event, sizeof(event)))
> +#ifdef CONFIG_GPIO_CDEV_V1
> +               if (event_size == sizeof(struct gpio_v2_line_info_changed)) {
> +                       if (copy_to_user(buf + bytes_read, &event, event_size))
> +                               return -EFAULT;
> +               } else {
> +                       struct gpioline_info_changed event_v1;
> +
> +                       gpio_v2_line_info_changed_to_v1(&event, &event_v1);
> +                       if (copy_to_user(buf + bytes_read, &event_v1,
> +                                        event_size))
> +                               return -EFAULT;
> +               }
> +#else
> +               if (copy_to_user(buf + bytes_read, &event, event_size))
>                         return -EFAULT;
> -               bytes_read += sizeof(event);
> +#endif
> +               bytes_read += event_size;
>         } while (count >= bytes_read + sizeof(event));
>
>         return bytes_read;
> --
> 2.28.0
>


--
With Best Regards,
Andy Shevchenko
