Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26F8C113777
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 23:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbfLDWSa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 17:18:30 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44759 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfLDWSa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 17:18:30 -0500
Received: by mail-pg1-f196.google.com with SMTP id x7so522664pgl.11;
        Wed, 04 Dec 2019 14:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BSs1JgftpIbcW3GJF8MWlTcMQiwQH0E/9HSLGnuUhZY=;
        b=IoH+UrM7+WlqqruX7C3JJpgZEijV/IOSpHF34r9wCRyFh/u5/f2LYJJDbEMDggvUjJ
         bLZV3olTZQYouAz+GOHum6mi26NljoRLEhDo8bWQ3Z86HZCgoytSbSkY0sFbESM17xOf
         4nb95E6NyUUqPevaG492AcKSuK7nGs7cGlmKo8jOLm6p9SUzEOTIW0h5uJ8jc43cT1jF
         2aA5bnqvwjIpCA9HqdodgjHv9GtyhtSs1NEWlN7+Xlp5OYadzlg6LFzk/+8gHO/e519j
         JNu9nfckYM5lP6RIL4v6Q/web4bYPLru538uVGnfusKimDGfrMPeWSeKoL1mJHat5EYm
         bQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BSs1JgftpIbcW3GJF8MWlTcMQiwQH0E/9HSLGnuUhZY=;
        b=du5tUswdx7FLzGOv4slkh6d6Q3VMbGjupwmq/jdi9VkeAVxAQrfnNAPOLKLK6+mBLr
         z+UjbwSJ+yP1uvaqM+ywhkMMTZCM8mNU03iL2ZLGG/Q4/fumuA6S6zE5saoR27SzY+4+
         d6/F4ffjpgOTuh7hVmLgOPZdJ/CTmgklbhptHoTPgmR+uFQQuIeFWfgMFj4Ri6IBGsLB
         +/EHHnN4BsjyTYM8v7/wxxiihB9YUuyWBsVlG/q+AkQB1xupfAWGJv7Np03jC6lItMxu
         dqhMCuz+H+o8qqI5nTOsTcmGjy2BbC+RJkTRAvOVUxfuj4hrR0/MJpa/BswZhwsF7/v3
         7aOg==
X-Gm-Message-State: APjAAAXZv7UiSOTkyaBiY4cgdWEQtipTVLgVlRJl7JUEsamnX7fL8ce4
        yC1AQoHWqFjoF1lpEP8N7MhK7wVAithXRnjtNvY=
X-Google-Smtp-Source: APXvYqz0nBw+DVMCl9QmTd7VL0k2dyqyeLEhkcx2mruad872LLyUvgCc37FbvQ/MDuf7ADSYnqCNZDLv56msCKEe04g=
X-Received: by 2002:a63:941:: with SMTP id 62mr6094824pgj.203.1575497909458;
 Wed, 04 Dec 2019 14:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20191204155912.17590-1-brgl@bgdev.pl> <20191204155912.17590-2-brgl@bgdev.pl>
In-Reply-To: <20191204155912.17590-2-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 00:18:17 +0200
Message-ID: <CAHp75Vfzk3FgZLLyNv7+sj8r-QFW57juBQV9O2VP01=c04AdKQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] gpiolib: use 'unsigned int' instead of
 'unsigned' in gpio_set_config()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 6:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Checkpatch complains about using 'unsigned' instead of 'unsigned int'.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 21b02a0064f8..a31797fe78fa 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -3042,7 +3042,7 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
>   * rely on gpio_request() having been called beforehand.
>   */
>
> -static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
> +static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
>                            enum pin_config_param mode)
>  {
>         unsigned long config;
> --
> 2.23.0
>


-- 
With Best Regards,
Andy Shevchenko
