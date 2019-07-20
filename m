Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 921976F07F
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 21:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbfGTTmt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 15:42:49 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37312 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfGTTmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 15:42:49 -0400
Received: by mail-lf1-f68.google.com with SMTP id c9so23906154lfh.4
        for <linux-gpio@vger.kernel.org>; Sat, 20 Jul 2019 12:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5wxLUVMBR/zhPyqgOSmQfeegjBCW9DpO2ol/hRExeoQ=;
        b=gga+VS+/u4EJm3VE+yHZ/TZ41uutwb0+J7wKN8gvePC+CHASnf9pDhrvZdZbD5TTrJ
         WVNHjjZKeFCguiclD3qTqWYiepIWMQ5kg9JuPIubTCKZmBZkNT71WZtDC6Y6PqvJfYLN
         s8Cqpq0OPQjWc7oRw+Ifz7NUCkbTbMUmfoGGViavce88mr+Menx4D4esiV8ZJduVS+j8
         9ENR+9OURsTwZHU7ShFmLFZCQmmtpA7xxWYyWyd/XgEkNBBzB9VUkLodf+YWn23bn5tJ
         WDXaunkcd3m7jiyGoEnXZDIvowo34gSOMtB5pDSh0XQRPTPREUdKaoDeO6DzfloYIl4t
         CvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5wxLUVMBR/zhPyqgOSmQfeegjBCW9DpO2ol/hRExeoQ=;
        b=LHhDRnnUki8NiTofjKdeYgaVWXDjoG/aYCDDxfAKvYWcVg0Ntp3DElzABaBaY/Wpwn
         BnS6GWYlsK950SrEOw2G4m6rb8uWjSH7EsHYt3aMoXqgcRUI3io2RptvHTgXBrGoi5gU
         lxlCzS9WjydUG3VyCtdx74/Anvak3TwSm45lyt42AhcLSDqrZPMSjuVj8HdPyDE/+rE3
         5Zb9txx2A+1I2FqjGKARHyyN5V0pvye9RlJP2fuFbdL8lhphuGydTDbv2dt19KE+LEA0
         UayHxwP/cg3aHP8oODeW8aZEj3KgaqSROxYQ1c19lOY8OXisl5sfA6fFeeJlKzn73LMo
         Xcng==
X-Gm-Message-State: APjAAAVx80goAZ/MXHvNCTeGxn4HQ+076iE58GWV+B63xOJdW6FpKT4u
        Hvf6tXIqssWQbhsnzJ1l/enGR4Hx0rN7RJnRdicXkw==
X-Google-Smtp-Source: APXvYqxhKMOSxFcygiS5NRhp2xvFkULQyeB73rsH2wirHwD2+UVba03mszT4vFMFEDoInQytDxULE9PvROzPcvLys+k=
X-Received: by 2002:a19:e006:: with SMTP id x6mr26678689lfg.165.1563651767021;
 Sat, 20 Jul 2019 12:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190720113155.12276-1-tomasz.motyl@se.com>
In-Reply-To: <20190720113155.12276-1-tomasz.motyl@se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 20 Jul 2019 21:42:35 +0200
Message-ID: <CACRpkdaUpfnWkqK4jCrV3SCPtZk07Q=FydhvM2COye7QRCvEZA@mail.gmail.com>
Subject: Re: [PATCH] Record interrupt status when an IRQ is masked
To:     Tomasz Kazimierz Motyl <tomasz.motyl666@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        butterfly_tm666@yahoo.com,
        Tomasz Kazimierz Motyl <tomasz.motyl@se.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Looping in some experts on PCA953xx by top posting, sorry.

Linus Walleij

On Sat, Jul 20, 2019 at 1:32 PM Tomasz Kazimierz Motyl
<tomasz.motyl666@gmail.com> wrote:
>
>  When one changes the state of any input pins of a PCA9555 chip before
>  setting up the IRQ mask through i.e. SysFS e.g. echo "both" >
>  /sys/class/gpio/gpioXYZ/edge the epoll_wait shall not exit on the subsequent
>  change of the GPIO state. The reason behind it is that the IRQ status is not
>  being saved when the IRQ is masked.
>
> ---
>  drivers/gpio/gpio-pca953x.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 7e76830b3368..088bef902156 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -716,13 +716,16 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
>                 trigger[i] = (cur_stat[i] ^ old_stat[i]) & chip->irq_mask[i];
>                 if (trigger[i])
>                         trigger_seen = true;
> +
> +    /* We want the current status recorded in the chip->irq stat regardless the
> +     * chip->irq_mask setting in order to have a change detected when the interrupt
> +     * mask gets changed i.e. echo "both" > /sys/class/gpioXYZ/edge */
> +    chip->irq_stat[i] = cur_stat[i];
>         }
>
>         if (!trigger_seen)
>                 return false;
>
> -       memcpy(chip->irq_stat, cur_stat, NBANK(chip));
> -
>         for (i = 0; i < NBANK(chip); i++) {
>                 pending[i] = (old_stat[i] & chip->irq_trig_fall[i]) |
>                         (cur_stat[i] & chip->irq_trig_raise[i]);
> --
> 2.17.1
>
