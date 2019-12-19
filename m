Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 024AE1268CC
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 19:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfLSSRm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 13:17:42 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42801 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726797AbfLSSRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 13:17:42 -0500
Received: by mail-pl1-f193.google.com with SMTP id p9so2915105plk.9;
        Thu, 19 Dec 2019 10:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9IKeSaeLtm7vPfFfV60fys8+o5Vf9VVG4sSrLcJnbLg=;
        b=ULrs0SvPCsPJ5z5H89BVhXo7MrrDMFIkP63mnmmlS56bvmxK+d4QpMwoN2KuVUfUiM
         FW46oiskYuu2Hul4HrnBnoGlYy61FUuBVHchaiXhiX+IElTcFgbYpMCBYBO77uh22FO5
         P93uiGBePY/B8Ybui6ZqIMLmHuoqoow/+b4KW8hXPIZASLJXALkXw32xAJI9WFQcxqGP
         tMRiY2o1C659lso2yKuKsQpvjSoZA7xaCjKy5sp75AkCvonnXBSl+U504BNP3pIzFW9n
         KjTr+tB0wgTR6RxEY5F4UygnFjgbqeoGMBw1wbmjxQn7m4HZp7GM3UfmZtZAPG30Tfqm
         Lsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9IKeSaeLtm7vPfFfV60fys8+o5Vf9VVG4sSrLcJnbLg=;
        b=Z5mWQhvu687rU9hbYuttKYT0ljfFe8z+aByl0aljCm3yMnXVlVvwTNva6n+mU/4Cnv
         bU2tw133SICd4ebHrhCeXbVofePosw7r3F6jrTqqZbJa/3O7v1Hjg7AUmEm9XvbxGNMN
         ZV19QKt1N9z5kMRkNpBF3lMdxz4SSw17xb1Mnp/9IKbZ3tkuxL7IRJ98iGhg1Pm4orXO
         vNL64sBn63ciq91R7V/1t/w0aME9ORL1OhVVbcuoIakFi1Sxj0j+wxd+WgXHjjkJ0cqF
         mg5vLRig0vFxsRYO3AqKpjdCRbFA6vbmiwe0BT6ybaPB8gZdExUPt2imynbLdhkPk2MV
         ciyQ==
X-Gm-Message-State: APjAAAWwzRPG5BEZ34yB/NQti6xrppkESaNPsctTXGgFT42RB0ALPKA8
        dVKcyWQw0lv5g72SQXv/f8owieqF+X+qSTlbb2c=
X-Google-Smtp-Source: APXvYqzcXkkqagyH0g8XYQkQ9Y2lDsGqL/gdoDGeJQzPxj6M0FYmIA9X7SN+kb2C52A9m6TauzrezHBi54ouUcHGkQw=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr11076004pjb.30.1576779461595;
 Thu, 19 Dec 2019 10:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20191219171528.6348-1-brgl@bgdev.pl> <20191219171528.6348-13-brgl@bgdev.pl>
In-Reply-To: <20191219171528.6348-13-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Dec 2019 20:17:30 +0200
Message-ID: <CAHp75VeMEngXiFmvTrsW7UZMz0ppR-W-J4D1xU+qKGfLXkG3kg@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] gpiolib: add new ioctl() for monitoring changes
 in line info
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2019 at 7:17 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Currently there is no way for user-space to be informed about changes
> in status of GPIO lines e.g. when someone else requests the line or its
> config changes. We can only periodically re-read the line-info. This
> is fine for simple one-off user-space tools, but any daemon that provides
> a centralized access to GPIO chips would benefit hugely from an event
> driven line info synchronization.
>
> This patch adds a new ioctl() that allows user-space processes to reuse
> the file descriptor associated with the character device for watching
> any changes in line properties. Every such event contains the updated
> line information.
>
> Currently the events are generated on three types of status changes: when
> a line is requested, when it's released and when its config is changed.
> The first two are self-explanatory. For the third one: this will only
> happen when another user-space process calls the new SET_CONFIG ioctl()
> as any changes that can happen from within the kernel (i.e.
> set_transitory() or set_debounce()) are of no interest to user-space.

> -       } else if (cmd == GPIO_GET_LINEINFO_IOCTL) {
> +       } else if (cmd == GPIO_GET_LINEINFO_IOCTL ||
> +                  cmd == GPIO_GET_LINEINFO_WATCH_IOCTL) {

Wouldn't be better for maintenance to have them separated from the day 1?

...

> +       if (test_bit(desc_to_gpio(desc), priv->watched_lines)) {

if (!test_bit(...))
  return NOTIFY_DONE;

?

> +                       pr_debug_ratelimited(
> +                               "%s: lineinfo event FIFO is full - event dropped\n",

> +                               __func__);

This is in 99.9% cases redundant in *_dbg() calls.

> +               ret = NOTIFY_OK;
> +       }
> +
> +       return ret;

return NOTIFY_OK;
?

> +}

...

> @@ -3111,6 +3285,7 @@ static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
>                 if (ret != -ENOTSUPP)
>                         return ret;
>         }
> +
>         return 0;
>  }
>

This hunk doesn't belong to this patch.

...

> +/**
> + * struct gpioline_info_changed - Information about a change in status
> + * of a GPIO line
> + * @info: updated line information
> + * @timestamp: estimate of time of status change occurrence, in nanoseconds
> + * and GPIOLINE_CHANGED_CONFIG
> + * @event_type: one of GPIOLINE_CHANGED_REQUESTED, GPIOLINE_CHANGED_RELEASED
> + */
> +struct gpioline_info_changed {

> +       struct gpioline_info info;

Is this guaranteed to be always 8 byte aligned?
I'm expecting to see some comments there and / or here about it.

> +       __u64 timestamp;
> +       __u32 event_type;
> +       __u32 padding[5]; /* for future use */
> +};

-- 
With Best Regards,
Andy Shevchenko
