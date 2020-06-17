Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422151FC746
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 09:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgFQH1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 03:27:01 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34907 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgFQH1A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 03:27:00 -0400
Received: by mail-oi1-f195.google.com with SMTP id k4so949246oik.2;
        Wed, 17 Jun 2020 00:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kxyFmibDG5zSWuXtIhnkYe3H38OpnFHk954/p0T/5F0=;
        b=L1RiL0nnX2c/NYlKiW5iz3AiMph1l9VRBoKIePm5qqptDOLYXDqPn5MMdix1GOKLW8
         B1QVGhVm3Zie27Mty60B5BVESniQJfLX7NZ5GOzgRmM5t7BlZjOjUYJYXBHkj9LzsdoB
         sVvF2OQBuDv8Kj/+tBor8qS/CafZUk1rLlKaGAocXbAiP/JVYP9JOX51MDbcB3Bo0NE1
         0DjTgRWL4A2XOwYUWWL0blm3RYLUKlHV7tP4SX4tP/Zw1hI5WVMKm7GCS7syr3Hqfe9+
         qlMIBvAXyd0GPQTreWucvnKHaeHvE+N0Kq5xKmqpm+yJ7Ruvom/zKACau4+DiJcBZQt9
         F+bA==
X-Gm-Message-State: AOAM533gPJoqyFc8YWCkqLjDdPcm6RawCZOmXEpZzQvhMkmfjdOF/ax2
        +Npa5u1Hx3RY3XwEsF7ktQK6rT4gNw/2Z/uAbzM=
X-Google-Smtp-Source: ABdhPJzo05G9Ws9f3MCK6JC8SiQnblUqmieP1YcvRAPGi0k/Moz8N8pFDuR5v0ZYCWq67OhTW6jbDP1dW5+bo2BUdhI=
X-Received: by 2002:a54:4006:: with SMTP id x6mr6155596oie.148.1592378818667;
 Wed, 17 Jun 2020 00:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200605024919.56177-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200605024919.56177-1-navid.emamdoost@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Jun 2020 09:26:47 +0200
Message-ID: <CAMuHMdXHT9y09L19j2K=oQ1W+7x=SE7MEyjj6r1i=DPcokvWzg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: handle pm_runtime_get_sync failure case
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Navid Emamdoost <emamd001@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Navid,

On Fri, Jun 5, 2020 at 4:50 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count. Call pm_runtime_put if
> pm_runtime_get_sync fails.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -250,8 +250,10 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
>         int error;
>
>         error = pm_runtime_get_sync(p->dev);
> -       if (error < 0)
> +       if (error < 0) {
> +               pm_runtime_put(p->dev);

As per [1], I would like to see a call to pm_runtime_put_noidle() instead.

[1] http://lore.kernel.org/r/CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ@mail.gmail.com

>                 return error;
> +       }
>
>         error = pinctrl_gpio_request(chip->base + offset);
>         if (error)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
