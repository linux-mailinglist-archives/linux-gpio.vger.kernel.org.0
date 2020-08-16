Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03802245783
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Aug 2020 14:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgHPMDz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 08:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgHPMDj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 08:03:39 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F877C061385
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2020 05:03:38 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id x12so10361243qtp.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2020 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z1rsi8WsVUKVDpkJ9JmIUoAwOPwcweYdvfl3r/ZQYZY=;
        b=LFZlkWX9opM+iOkcgNov0sQywWHfhEriFZ0Tu6MyO3BrHul8vEo46dyIFCdT+h/Zle
         RloMJTp8IraBHzWPo5NWBkgin9CVbtlspqiytghavNl8PctZLyBXdHMsfv1AuFH73eld
         NEcCTBMT1Ai2Lap2YVaDhWSTr3tRIFpSOf6Spjb8aWhjmI64+H6BwSTj8HCW4r+eudGg
         1FgUR2trKsi8Mi5R5mtW0M29+5/QO6ix7vGZ5jafk36AQ1Vh4o+FAYXJhtC/oTtITA8w
         f8gALuMn2ma86/2c7UrSc4TEh1SIZT7Rcz8MMTRXJq6nPxmoauN3RX6xEd06wdUcY6ka
         wkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z1rsi8WsVUKVDpkJ9JmIUoAwOPwcweYdvfl3r/ZQYZY=;
        b=s3xB0ur1K0VapWX5Sh3oz0QfT/ANYA3Iyj2lXwVg8X+pZo93ym6CKyE7zEfQ3QLH/v
         r0L90mkRg6TlB8DIwgPjnS1bPX+5KEa3v0mip3Po3/t43BWq+/GKLGl/Hj1R6D9dPd5G
         8v+YJaYb2fGUfErCKrA8uTLe7HOVSCwjNDB+8Vbu4Vxsee8jLZUygtssZ2ZjBIdCysFg
         ucTG9aYMQkeUaXdnlTpkeOetNAZ9zU9Dgu/XhbobtpwPI1NIm0UXG3VdU9kbT6fgxagw
         /+CWHRIKJygIit1tweTQmXRlGErfXMkacjgsM5MD6t8/sUO8iXSzhoKvJ6pf+wPceD9S
         1ELA==
X-Gm-Message-State: AOAM533xN3Hh0GEv5q+7EW1FvK8hsPr73un46DjPP5HBuw67cPuIj0F1
        7GJwzaTTInIVaF9pY2LYmvqVhHP0axbx21XyxVshDg==
X-Google-Smtp-Source: ABdhPJxF6R3rRd4OUY2NnUT3bog0/hXcFBJ8w9wNWHo9AedVxZfyiqtorb0O4QaqUM+atWE6klqqBpjocEuXCiiUq0c=
X-Received: by 2002:ac8:1488:: with SMTP id l8mr9387459qtj.131.1597579417022;
 Sun, 16 Aug 2020 05:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200814030257.135463-1-warthog618@gmail.com> <20200814030257.135463-9-warthog618@gmail.com>
In-Reply-To: <20200814030257.135463-9-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 16 Aug 2020 14:03:26 +0200
Message-ID: <CAMpxmJU6LcHCT-k_MUZv0EQ_GzGQ+gRqURF1i1MCiYWLQwb6Dg@mail.gmail.com>
Subject: Re: [PATCH v4 08/20] gpiolib: cdev: support GPIO_V2_GET_LINEINFO_IOCTL
 and GPIO_V2_GET_LINEINFO_WATCH_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 14, 2020 at 5:04 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for GPIO_V2_GET_LINEINFO_IOCTL and
> GPIO_V2_GET_LINEINFO_WATCH_IOCTL.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
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
> Changes for v4:
>  - replace strncpy with memcpy in gpio_v2_line_info_to_v1
>
>  drivers/gpio/gpiolib-cdev.c | 194 +++++++++++++++++++++++++++++++-----
>  1 file changed, 167 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 8671e04ff989..28273f3105d3 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -162,7 +162,8 @@ static long linehandle_set_config(struct linehandle_state *lh,
>                 }
>
>                 blocking_notifier_call_chain(&desc->gdev->notifier,
> -                                            GPIOLINE_CHANGED_CONFIG, desc);
> +                                            GPIO_V2_LINE_CHANGED_CONFIG,
> +                                            desc);
>         }
>         return 0;
>  }
> @@ -334,7 +335,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>                 }
>
>                 blocking_notifier_call_chain(&desc->gdev->notifier,
> -                                            GPIOLINE_CHANGED_REQUESTED, desc);
> +                                            GPIO_V2_LINE_CHANGED_REQUESTED, desc);
>
>                 dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
>                         offset);
> @@ -716,7 +717,7 @@ static int line_create(struct gpio_device *gdev, void __user *ip)
>                 }
>
>                 blocking_notifier_call_chain(&desc->gdev->notifier,
> -                                            GPIOLINE_CHANGED_REQUESTED, desc);
> +                                            GPIO_V2_LINE_CHANGED_REQUESTED, desc);
>
>                 dev_dbg(&gdev->dev, "registered chardev handle for line %d\n",
>                         offset);
> @@ -1065,7 +1066,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>                 goto out_free_le;
>
>         blocking_notifier_call_chain(&desc->gdev->notifier,
> -                                    GPIOLINE_CHANGED_REQUESTED, desc);
> +                                    GPIO_V2_LINE_CHANGED_REQUESTED, desc);
>
>         irq = gpiod_to_irq(desc);
>         if (irq <= 0) {
> @@ -1132,17 +1133,59 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>         return ret;
>  }
>
> +static void gpio_v2_line_info_to_v1(struct gpio_v2_line_info *info_v2,
> +                                   struct gpioline_info *info_v1)
> +{
> +       int flagsv2 = info_v2->flags;
> +
> +       memcpy(info_v1->name, info_v2->name, sizeof(info_v1->name));
> +       memcpy(info_v1->consumer, info_v2->consumer,
> +              sizeof(info_v1->consumer));
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
> +       lic_v1->timestamp = lic_v2->timestamp;
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
>         /*
>          * This function takes a mutex so we must check this before taking
>          * the spinlock.
> @@ -1151,7 +1194,7 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
>          * lock common to both frameworks?
>          */
>         ok_for_pinctrl =
> -               pinctrl_gpio_can_use_line(gc->base + info->line_offset);
> +               pinctrl_gpio_can_use_line(gc->base + info->offset);
>
>         spin_lock_irqsave(&gpio_lock, flags);
>
> @@ -1172,23 +1215,27 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
> @@ -1196,11 +1243,65 @@ static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
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
> +       }
> +       if (abiv != version)
> +               return -EPERM;
> +       return 0;
> +}
> +#endif
> +
> +static int lineinfo_get(struct gpio_chardev_data *cdev, void __user *ip,
> +                       unsigned int cmd)

I don't have many comments on this patch, it looks good. I'd only
prefer that the cmd argument be converted to 'bool watch' because this
is the only information we need here.

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
> +       if (cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL) {
> +#ifdef CONFIG_GPIO_CDEV_V1
> +               if (lineinfo_ensure_abi_version(cdev, 2))
> +                       return -EPERM;
> +#endif
> +               if (test_and_set_bit(lineinfo.offset, cdev->watched_lines))
> +                       return -EBUSY;
> +       }
> +       gpio_desc_to_lineinfo(desc, &lineinfo);
> +
> +       if (copy_to_user(ip, &lineinfo, sizeof(lineinfo))) {
> +               if (cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL)
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
> @@ -1210,7 +1311,6 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>         struct gpio_device *gdev = cdev->gdev;
>         struct gpio_chip *gc = gdev->chip;
>         void __user *ip = (void __user *)arg;
> -       struct gpio_desc *desc;
>         __u32 offset;
>
>         /* We fail any subsequent ioctl():s when the chip is gone */
> @@ -1233,7 +1333,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>                 return 0;
>  #ifdef CONFIG_GPIO_CDEV_V1
>         } else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
> +               struct gpio_desc *desc;
>                 struct gpioline_info lineinfo;
> +               struct gpio_v2_line_info lineinfo_v2;
>
>                 if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>                         return -EFAULT;
> @@ -1243,7 +1345,8 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>                 if (IS_ERR(desc))
>                         return PTR_ERR(desc);
>
> -               gpio_desc_to_lineinfo(desc, &lineinfo);
> +               gpio_desc_to_lineinfo(desc, &lineinfo_v2);
> +               gpio_v2_line_info_to_v1(&lineinfo_v2, &lineinfo);
>
>                 if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
>                         return -EFAULT;
> @@ -1253,7 +1356,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>         } else if (cmd == GPIO_GET_LINEEVENT_IOCTL) {
>                 return lineevent_create(gdev, ip);
>         } else if (cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {
> +               struct gpio_desc *desc;
>                 struct gpioline_info lineinfo;
> +               struct gpio_v2_line_info lineinfo_v2;
>
>                 if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
>                         return -EFAULT;
> @@ -1263,10 +1368,14 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
> @@ -1275,6 +1384,9 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>
>                 return 0;
>  #endif /* CONFIG_GPIO_CDEV_V1 */
> +       } else if (cmd == GPIO_V2_GET_LINEINFO_IOCTL ||
> +                  cmd == GPIO_V2_GET_LINEINFO_WATCH_IOCTL) {
> +               return lineinfo_get(cdev, ip, cmd);

... and then here it could be return lineinfo_get(cdev, ip, cmd ==
GPIO_V2_GET_LINEINFO_WATCH_IOCTL);

>         } else if (cmd == GPIO_V2_GET_LINE_IOCTL) {
>                 return line_create(gdev, ip);
>         } else if (cmd == GPIO_GET_LINEINFO_UNWATCH_IOCTL) {
> @@ -1310,7 +1422,7 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
>                                    unsigned long action, void *data)
>  {
>         struct gpio_chardev_data *cdev = to_gpio_chardev_data(nb);
> -       struct gpioline_info_changed chg;
> +       struct gpio_v2_line_info_changed chg;
>         struct gpio_desc *desc = data;
>         int ret;
>
> @@ -1350,12 +1462,16 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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
> @@ -1377,7 +1493,17 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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
> @@ -1386,9 +1512,23 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
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

Bart
