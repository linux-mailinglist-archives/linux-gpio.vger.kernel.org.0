Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE523F395A
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Aug 2021 09:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbhHUHjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 21 Aug 2021 03:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbhHUHjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 21 Aug 2021 03:39:19 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041B7C061756
        for <linux-gpio@vger.kernel.org>; Sat, 21 Aug 2021 00:38:41 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id w68so10637366pfd.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Aug 2021 00:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S5if0l/GBo8pSRDSllBTw6ibDxcL1nC216nNhyyQqFA=;
        b=gprDKGtfTe7FkvWOROE1HZdJusSxBMFUPNXyjQOUsMBFA/7TfyFmeKmsSULAbxDgWQ
         By3QFmNKZ91EUd9jmukfJh9tdJqHa5A9yZcwl2cuymYDkI9DTgsMzt0KqAMlpHIW9Dzy
         bnAvdkguEX8GIXaDNnVfl9DtIxIhLoW83+2FDWyiVTB7ecNofBLycEB98n+ooCTP4IP+
         tInflQdBUgPP/dAQ62CzReRmayF3hLppJOlu7vrcrdb/uow8GY7tsomIMb84Sm9jC9lL
         9C2jZD5sO5CRqiaPwJ3kL7AdAL2FtND9Ae6HZyISw9ow2V/nQ51jw/d2iYaQh9uHwhmQ
         3jNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S5if0l/GBo8pSRDSllBTw6ibDxcL1nC216nNhyyQqFA=;
        b=Np6wQM70M53qxA/syHlALu+uiJp3oMCFeIK5RZ8BOooHgyz0YsAKWOrhwsiQeGa/oQ
         NR5VwSjScDMBlghdmFL0JvCB08oxtSSAmcXoNYJqvMdk7eXk6GrgAGaq23VQvozMhwfz
         DU/DrwdZl7G+S4fLhSM31ggeFp8jPRvyEOsJKhzWRzFzLYeuWnjnvEURknY7Vs1aL34f
         PnZ7C1htPnVQLXfxILaBvrxvl6Mz21lTg/vCwcUCZYejxEkSMSd4pFhMdLRVe9eBI3AV
         X5XsfGeeMJ7u7DHuPLHVsLiS+ICjtkL6wkQuV1pH5nidZ/F+iiKCkA6TeFFvDr8TTgXJ
         ZUTQ==
X-Gm-Message-State: AOAM531WdMnSp335p8hF63naDuJYV2vNN7CEGIHiJ5rBYl9pGd8jyGMw
        VJCJR4HKanKvQa0782H9T2GMNsxc/viDowvvuXk=
X-Google-Smtp-Source: ABdhPJxpdMO78VzBWSs5ZQMNd89LkWrW/WstS6e5H541qCB72qzNUiOqWW99efd/E9N37X2eEZH1KxTYr2yFin9yOIc=
X-Received: by 2002:a05:6a00:d41:b0:3e1:3316:2ef with SMTP id
 n1-20020a056a000d4100b003e1331602efmr23842180pfv.40.1629531520456; Sat, 21
 Aug 2021 00:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210820222446.56747-1-linus.walleij@linaro.org>
In-Reply-To: <20210820222446.56747-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 21 Aug 2021 10:38:04 +0300
Message-ID: <CAHp75VcYv=jpf6SfJEE0=iH_Xrty5USobyR52N-10g4nVsuEWA@mail.gmail.com>
Subject: Re: [PATCH] gpio: ucb1400: Use proper header
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 21, 2021 at 1:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The UCB1400 implements a GPIO driver so it needs to include the
> <linux/gpio/driver.h> header, not the legacy <linux/gpio.h> header.
> Compile tested on pxa_defconfig.

...

>  #include <linux/module.h>
>  #include <linux/ucb1400.h>
> +#include <linux/gpio/driver.h>

Can you add it in an order?

...

> --- a/include/linux/ucb1400.h
> +++ b/include/linux/ucb1400.h
> @@ -23,7 +23,7 @@
>  #include <sound/ac97_codec.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>

Ditto (to some extent) and the question here, do you still need it
after adding to the C file?

-- 
With Best Regards,
Andy Shevchenko
