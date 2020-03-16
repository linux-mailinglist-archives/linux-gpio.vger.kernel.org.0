Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C09D186FE3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 17:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732052AbgCPQVH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 12:21:07 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36672 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731875AbgCPQVH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Mar 2020 12:21:07 -0400
Received: by mail-ot1-f65.google.com with SMTP id 39so3022028otu.3;
        Mon, 16 Mar 2020 09:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJifg6Ktp1NK1uHmjwaX7dp/t9zxCzEVMxQ0Jij2Or4=;
        b=XZ1JbYHRwlMT88Qn2gbAVBymt+OEEUCWbmoA3mL/QvXfZAJlaYLSP6MPYkOmWJxdke
         jxUgQdElJw1eIud6VxSCgUHMKjkA/HyJPx2WFTm5hefloixigyYvLwuR6CizH4iTZXLI
         tCS1wyeNksBHvlY6XSXlrsx+0F1+1LU5R5U24I1ML5SxZVmCVWNvd54VhRnBHRm7pr7Y
         gNqkP8EECIeXedDIrPEZc15ZKVH0cAFkyct3THs0ZmixYeNSM0ymnawN7YOXwDa0xvbF
         xRXy/7Nn3Ymo+dyFHZXkoFVMhuK2wqclq0fhYdnHhx1BL3iWBifJafc/oj5fzpSJx1LQ
         /Bzw==
X-Gm-Message-State: ANhLgQ0L2ToQsDxYX6rI7vR+ltvMxqdu3o/S+mDL7ckdxK4QAY3iJz2b
        SKsQm3n+3V6BvQi9hIY60E6Fdwg2Cv6evGyq4D5Z0EQh
X-Google-Smtp-Source: ADFU+vsh2R6+fVy5SdGy4MQXtSg6SAr17XAlHFOULaDGUiHv7RDiKl+xwnZvb/vrmq7HKN+kAoSeKV+RZDTKGCRCEHE=
X-Received: by 2002:a9d:1708:: with SMTP id i8mr79567ota.250.1584375665600;
 Mon, 16 Mar 2020 09:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200211091937.29558-1-brgl@bgdev.pl> <20200211091937.29558-6-brgl@bgdev.pl>
In-Reply-To: <20200211091937.29558-6-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Mar 2020 17:20:54 +0100
Message-ID: <CAMuHMdUc9Vwh=B5nA2tW66DwYr3AE6g2Jvd_o0W-oShDs+QQEg@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 5/7] gpiolib: provide a dedicated function for
 setting lineinfo
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Tue, Feb 11, 2020 at 10:21 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> We'll soon be filling out the gpioline_info structure in multiple
> places. Add a separate function that given a gpio_desc sets all relevant
> fields.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This is now commit d2ac25798208fb85 ("gpiolib: provide a dedicated
function for setting lineinfo") in gpio/for-next.

> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1147,6 +1147,60 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
>         return ret;
>  }
>
> +static void gpio_desc_to_lineinfo(struct gpio_desc *desc,
> +                                 struct gpioline_info *info)
> +{
> +       struct gpio_chip *chip = desc->gdev->chip;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gpio_lock, flags);

spinlock taken

> +
> +       if (desc->name) {
> +               strncpy(info->name, desc->name, sizeof(info->name));
> +               info->name[sizeof(info->name) - 1] = '\0';
> +       } else {
> +               info->name[0] = '\0';
> +       }
> +
> +       if (desc->label) {
> +               strncpy(info->consumer, desc->label, sizeof(info->consumer));
> +               info->consumer[sizeof(info->consumer) - 1] = '\0';
> +       } else {
> +               info->consumer[0] = '\0';
> +       }
> +
> +       /*
> +        * Userspace only need to know that the kernel is using this GPIO so
> +        * it can't use it.
> +        */
> +       info->flags = 0;
> +       if (test_bit(FLAG_REQUESTED, &desc->flags) ||
> +           test_bit(FLAG_IS_HOGGED, &desc->flags) ||
> +           test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
> +           test_bit(FLAG_EXPORT, &desc->flags) ||
> +           test_bit(FLAG_SYSFS, &desc->flags) ||
> +           !pinctrl_gpio_can_use_line(chip->base + info->line_offset))

pinctrl_gpio_can_use_line(), and pinctrl_get_device_gpio_range() called
from it, call mutex_lock():

    BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:281
    in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 652, name: lsgpio
    CPU: 1 PID: 652 Comm: lsgpio Not tainted
5.6.0-rc1-koelsch-00008-gd2ac25798208fb85 #755
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    [<c020e3f0>] (unwind_backtrace) from [<c020a5b8>] (show_stack+0x10/0x14)
    [<c020a5b8>] (show_stack) from [<c07d31b4>] (dump_stack+0x88/0xa8)
    [<c07d31b4>] (dump_stack) from [<c0241318>] (___might_sleep+0xf8/0x168)
    [<c0241318>] (___might_sleep) from [<c07ec13c>] (mutex_lock+0x24/0x7c)
    [<c07ec13c>] (mutex_lock) from [<c046f47c>]
(pinctrl_get_device_gpio_range+0x1c/0xb4)
    [<c046f47c>] (pinctrl_get_device_gpio_range) from [<c046f5e8>]
(pinctrl_gpio_can_use_line+0x24/0x88)
    [<c046f5e8>] (pinctrl_gpio_can_use_line) from [<c0478bd0>]
(gpio_ioctl+0x270/0x584)
    [<c0478bd0>] (gpio_ioctl) from [<c03194c0>] (vfs_ioctl+0x20/0x38)

Reproducer is "lsgpio" with CONFIG_DEBUG_ATOMIC_SLEEP=y.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
