Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9353A275D1E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 18:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgIWQPK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 12:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgIWQPF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 12:15:05 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AD7C0613CE;
        Wed, 23 Sep 2020 09:15:05 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id r19so7125954pls.1;
        Wed, 23 Sep 2020 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x6iIQgJBK/hJQqgHIKT64599BO9JBAn8oS/j+kepF7o=;
        b=ExW7pkxkigfGvSnfeirvSmaDfI6eXFwyGfzA/me/HOmXjy2/2H8HGLhU0FCqhgxOR8
         Eec35pOvVzLcAz6fuuuIUKFZabtKpMFetjYYMTy1lLnV+4tO6T6KBDmNoKcbVZQi8wQ1
         fX3f76747FpFgZUahFvQTACtX0oJcUPLJBryghMLdVbEmEjsbhQJLJ22AO2jdSbyd8Cm
         jd1q4Z3mJNAJUhERw6P3O2DovjVWlAfdJunH+aDJoD9TAqwlXLUDUfqMgh2gFFcdg3yK
         sjBz2jIwRcUtucN1Wnkt2gD2nC69aO+ragJD8YEWkuIlEc1Mskiy2XIhYaSGZS1/1eyU
         RP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x6iIQgJBK/hJQqgHIKT64599BO9JBAn8oS/j+kepF7o=;
        b=mfVUxoU7wjBwuPVqkvg9neEFx2ekdO8FJupNWeMfulIDKG5K4Ha03uzujOENKbSSj0
         fYdrwZRnniuHMwUxMJiTG44qVJGxNJafAUO6eqWVKrIy1e4/6zsPiwDuQVmljcdbyAj3
         z6NRVjHcjyGLoVOzwgcvBf+4imrrPfi/hRnlxDJU0NvZ+HV3FPjPBvHhNPzAkFrfEk9i
         0sCFHrqB9/AW0v1LyNh/UOXPBVKFQ/iV3pP0vIO7oFNUPDNs81Ofzmruu+ewbFVyR1jM
         g2x8DDckA7dCZeB8ogTmxFFndAQoID90mR1xm7BWSiUay8LmdEoDH/llQ4cK234B9SGf
         zQFQ==
X-Gm-Message-State: AOAM530o1BcuhjG9yTfMLQb9KHKUQFz56I61EWojv/w9VlTUb94jPfI5
        6YanwYCnPkELX57uHcjGgSJpMMhd5iNvfAdsiTvEamvv0Vg3MA==
X-Google-Smtp-Source: ABdhPJwPeQSwLuXRdkYLF2gEQVkYzO1KYJC6Y6qqxX3Yt5NfifWO1YvqqXp4JH23ZiHytQb0PoP9z+uRy55+u2kJsRU=
X-Received: by 2002:a17:902:778b:b029:d1:bb21:513d with SMTP id
 o11-20020a170902778bb02900d1bb21513dmr525954pll.17.1600877704397; Wed, 23 Sep
 2020 09:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-11-warthog618@gmail.com>
In-Reply-To: <20200922023151.387447-11-warthog618@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Sep 2020 19:14:43 +0300
Message-ID: <CAHp75VdaPR+iihenPYos1mAGLbDhJPvCfDTtURpk_MBa=3wYEg@mail.gmail.com>
Subject: Re: [PATCH v9 10/20] gpiolib: cdev: support GPIO_V2_LINE_SET_CONFIG_IOCTL
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
> Add support for GPIO_V2_LINE_SET_CONFIG_IOCTL, the uAPI v2
> line set config ioctl.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 88 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index 145bda2151fb..debd3b277523 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -16,6 +16,7 @@
>  #include <linux/kernel.h>
>  #include <linux/kfifo.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/poll.h>
>  #include <linux/spinlock.h>
> @@ -444,6 +445,8 @@ struct line {
>   * @seqno: the sequence number for edge events generated on all lines in
>   * this line request.  Note that this is not used when @num_lines is 1, as
>   * the line_seqno is then the same and is cheaper to calculate.
> + * @config_mutex: mutex for serializing ioctl() calls to ensure consistency
> + * of configuration, particularly multi-step accesses to desc flags.
>   * @lines: the lines held by this line request, with @num_lines elements.
>   */
>  struct linereq {
> @@ -454,6 +457,7 @@ struct linereq {
>         u32 event_buffer_size;
>         DECLARE_KFIFO_PTR(events, struct gpio_v2_line_event);
>         atomic_t seqno;
> +       struct mutex config_mutex;
>         struct line lines[];
>  };
>
> @@ -573,6 +577,8 @@ static void edge_detector_stop(struct line *line)
>                 free_irq(line->irq, line);
>                 line->irq = 0;
>         }
> +
> +       line->eflags = 0;
>  }
>
>  static int edge_detector_setup(struct line *line,
> @@ -614,6 +620,17 @@ static int edge_detector_setup(struct line *line,
>         return 0;
>  }
>
> +static int edge_detector_update(struct line *line, u64 eflags,
> +                               bool polarity_change)
> +{
> +       if ((line->eflags == eflags) && !polarity_change)
> +               return 0;
> +
> +       edge_detector_stop(line);
> +
> +       return edge_detector_setup(line, eflags);
> +}
> +
>  static u64 gpio_v2_line_config_flags(struct gpio_v2_line_config *lc,
>                                      unsigned int line_idx)
>  {
> @@ -796,6 +813,74 @@ static long linereq_get_values(struct linereq *lr, void __user *ip)
>         return 0;
>  }
>
> +static long linereq_set_config_unlocked(struct linereq *lr,
> +                                       struct gpio_v2_line_config *lc)
> +{
> +       struct gpio_desc *desc;
> +       unsigned int i;
> +       u64 flags;
> +       bool polarity_change;
> +       int ret;
> +
> +       for (i = 0; i < lr->num_lines; i++) {
> +               desc = lr->lines[i].desc;
> +               flags = gpio_v2_line_config_flags(lc, i);

> +               polarity_change =
> +                       (test_bit(FLAG_ACTIVE_LOW, &desc->flags) !=
> +                        ((flags & GPIO_V2_LINE_FLAG_ACTIVE_LOW) != 0));

Comparison

> +
> +               gpio_v2_line_config_flags_to_desc_flags(flags, &desc->flags);
> +               /*
> +                * Lines have to be requested explicitly for input
> +                * or output, else the line will be treated "as is".
> +                */
> +               if (flags & GPIO_V2_LINE_FLAG_OUTPUT) {
> +                       int val = gpio_v2_line_config_output_value(lc, i);
> +
> +                       edge_detector_stop(&lr->lines[i]);
> +                       ret = gpiod_direction_output(desc, val);
> +                       if (ret)
> +                               return ret;
> +               } else if (flags & GPIO_V2_LINE_FLAG_INPUT) {
> +                       ret = gpiod_direction_input(desc);
> +                       if (ret)
> +                               return ret;
> +
> +                       ret = edge_detector_update(&lr->lines[i],
> +                                       flags & GPIO_V2_LINE_EDGE_FLAGS,
> +                                       polarity_change);
> +                       if (ret)
> +                               return ret;
> +               }
> +
> +               blocking_notifier_call_chain(&desc->gdev->notifier,
> +                                            GPIO_V2_LINE_CHANGED_CONFIG,
> +                                            desc);
> +       }
> +       return 0;
> +}
> +
> +static long linereq_set_config(struct linereq *lr, void __user *ip)
> +{
> +       struct gpio_v2_line_config lc;
> +       int ret;
> +
> +       if (copy_from_user(&lc, ip, sizeof(lc)))
> +               return -EFAULT;
> +
> +       ret = gpio_v2_line_config_validate(&lc, lr->num_lines);
> +       if (ret)
> +               return ret;
> +
> +       mutex_lock(&lr->config_mutex);
> +
> +       ret = linereq_set_config_unlocked(lr, &lc);
> +
> +       mutex_unlock(&lr->config_mutex);
> +
> +       return ret;
> +}
> +
>  static long linereq_ioctl(struct file *file, unsigned int cmd,
>                           unsigned long arg)
>  {
> @@ -804,6 +889,8 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
>
>         if (cmd == GPIO_V2_LINE_GET_VALUES_IOCTL)
>                 return linereq_get_values(lr, ip);
> +       else if (cmd == GPIO_V2_LINE_SET_CONFIG_IOCTL)
> +               return linereq_set_config(lr, ip);
>
>         return -EINVAL;
>  }
> @@ -964,6 +1051,7 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
>                 }
>         }
>
> +       mutex_init(&lr->config_mutex);
>         init_waitqueue_head(&lr->wait);
>         lr->event_buffer_size = ulr.event_buffer_size;
>         if (lr->event_buffer_size == 0)
> --
> 2.28.0
>


--
With Best Regards,
Andy Shevchenko
