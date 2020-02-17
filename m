Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967C7161CAD
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 22:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729450AbgBQVN3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 16:13:29 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37201 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729129AbgBQVN3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 16:13:29 -0500
Received: by mail-oi1-f195.google.com with SMTP id q84so18039485oic.4;
        Mon, 17 Feb 2020 13:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J0GeL7eRkd4dcjRk8OPC/BgFQWPRSyAiTzR79FFJ08w=;
        b=edLGcrO/fE8YyjGi1wWA+YfvUjp3i1WeBe0mUWSbYdeauEn4xhr3JHhfdcc57NXm3O
         Shkyyzr7VY2wixBpbB+9XIBWeBDfgald+E1XbcA7O6BYVOhs+cH2HpB8cz3VOvTf066P
         vz3aCkKhHigRrUXxKMO+O0fCbf33uIDhqt5WW9T1FSm9FKq1gjUOITclBxul6y2fp+Wj
         fBEEETGz/frDd+ZuoKRGMXNXv5F5Tq+jSl/yZ5EvrTlxab3X7JVXxTRl9pQ426A+h5mP
         CLupQISvBw8/HWkWRIrZV0SPfIKmk7jiIwCdBSdniDlWW0niobNcRkbUhjmAOtuPzC8X
         L0dw==
X-Gm-Message-State: APjAAAXCgouvJ79MnuaO7G3RJOwgwpCohcVcBwT1FptAl/XagiV10DCt
        z2usSwxcCtMZILg/0ZrcV0vgOidWukPLy/fPVgo=
X-Google-Smtp-Source: APXvYqzBFvEzrAd10p0gbPXLrf/9EGhkUDYU4iloFyY0FteD0Ccd2GSHPSxJEK0JA0JCiJ461I0pGkBcbq/mfy3VG14=
X-Received: by 2002:a54:4707:: with SMTP id k7mr562764oik.153.1581974008740;
 Mon, 17 Feb 2020 13:13:28 -0800 (PST)
MIME-Version: 1.0
References: <20200217195435.9309-1-brgl@bgdev.pl> <20200217195435.9309-7-brgl@bgdev.pl>
In-Reply-To: <20200217195435.9309-7-brgl@bgdev.pl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Feb 2020 22:13:17 +0100
Message-ID: <CAMuHMdWAxhUWPt06vcaHwD34=k=ihzVAxSTtFnO4r2bY7nAmjA@mail.gmail.com>
Subject: Re: [PATCH 6/6] nvmem: increase the reference count of a gpio passed
 over config
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Mon, Feb 17, 2020 at 8:56 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We can obtain the write-protect GPIO in nvmem_register() by requesting
> it ourselves or by storing the gpio_desc passed in nvmem_config. In the
> latter case we need to increase the reference count so that it gets
> freed correctly.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thanks for your patch!

> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -349,11 +349,13 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>                 return ERR_PTR(rval);
>         }
>
> -       if (config->wp_gpio)
> +       if (config->wp_gpio) {
>                 nvmem->wp_gpio = config->wp_gpio;
> -       else
> +               gpiod_ref(config->wp_gpio);

If gpiod_ref() would return the passed GPIO, or an error code, you could write

        nvmem->wp_gpio = gpiod_ref(config->wp_gpio);

> +       } else {
>                 nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
>                                                     GPIOD_OUT_HIGH);
> +       }
>         if (IS_ERR(nvmem->wp_gpio))
>                 goto err_ida_remove;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
