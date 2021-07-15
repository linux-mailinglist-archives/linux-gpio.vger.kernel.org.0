Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16DFD3CAEA9
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 23:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhGOVjq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 17:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhGOVjp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 17:39:45 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AF1C06175F;
        Thu, 15 Jul 2021 14:36:52 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id y4so7855454pgl.10;
        Thu, 15 Jul 2021 14:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUT3BjBpFrMnzwekbW4hJQmcBSwFAN435ggGnFZPrzQ=;
        b=rEUlMnAesd4+FZg5AmXrIFesdnA5Z2NCElMCjCED4saDaoNwrjGF6+Ps2/FGf+RAVk
         z43fWujFQe4FEyQBsBVERqslDnrTIYoxITmWGxP3vxIC3+vRagNC4gJ+rcnlnTeUUOsV
         CBvXlgHWSK/6/C1fmIF7HhHjNhFhlmy9LHugyDFajsOeb06NbcNbjvcVfUi012M49/B3
         VVzK3jAaRyVTXJZbwJSle3OUdyxeqVD59cvHwkAQ6SZRKh9+NgtwokU5J38IVHHNttQo
         SfbqgXCprcsqbWfh1w9i+3f2V1MQaFMuyJRTioMgjWOcCEWoAQz+VyNPtwtk51n/7WfL
         YDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUT3BjBpFrMnzwekbW4hJQmcBSwFAN435ggGnFZPrzQ=;
        b=FkUXVxqEnXZ1Jw5zJ4rpXoIAu2qpfpq+bf6NvTMiyz5IFc0joWTl3qLQ+U6Wn5GkLz
         rwnmuQUCq6nDwm98AQEDBJdCZc3KHEcIkMdW+wN4yAysO6+yNxCFQ8lIZW0QbqaqOpOY
         lKwTHvF9KLHGln8HIvrLWR9r+LZTK36m37ej46aeOzAR8HBHVaMpG/uKa/TTq0+EFj2I
         lcwzAiHzRJG55RlSKm3Ww9LNQU3fdhvAauvtKpIAUzeMzboIweg4sJCWeMWahFvnq9Bk
         f9HCPLoeQfE+veumotxQRxTx823Ca/30p8DsdXj8Mqyy7PYQohGHC5EmM7F55VLUUCbf
         hJJw==
X-Gm-Message-State: AOAM5335q7M1yzt/aNXMEHXD+YXYV1oLoDKqusTpn8Aj/CUHgV444l8u
        YWpstmDjOdob+v69AUfZI0MTpuovMWuTFWOOCSA=
X-Google-Smtp-Source: ABdhPJz5pdzy00r4wIwE4o5cfHcjizfOUbebDuelwJmCUWQPsIGRXS6nu3XGGDzWDux8/hnommPz+symYQn4hqxAez0=
X-Received: by 2002:aa7:800b:0:b029:330:455f:57a8 with SMTP id
 j11-20020aa7800b0000b0290330455f57a8mr6438104pfi.7.1626385011604; Thu, 15 Jul
 2021 14:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210715190606.429251-1-linus.walleij@linaro.org>
In-Reply-To: <20210715190606.429251-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Jul 2021 00:36:15 +0300
Message-ID: <CAHp75Vfrs4rVYTUH6O4toGoWHgx+qfVS1PGYaWPm_TFJqvEOHA@mail.gmail.com>
Subject: Re: [PATCH] extcon: usb-gpio: Use the right includes
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 15, 2021 at 10:35 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The USB GPIO extcon driver does not use any of the legacy
> includes <linux/gpio.h> or <linux/of_gpio.h> but
> exploits the fact that this brings in <linux/mod_device_table.h>.
> Fix this up by using the right includes.

I like it!
Only one comment below, after addressing,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/extcon/extcon-usb-gpio.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index f06be6d4e2a9..0cb440bdd5cb 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -7,18 +7,17 @@
>   */
>
>  #include <linux/extcon-provider.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>  #include <linux/pinctrl/consumer.h>

> +#include <linux/mod_devicetable.h>

Can it be squeezed more or less in an ordered manner?
(before module.h I suppose)

>
>  #define USB_GPIO_DEBOUNCE_MS   20      /* ms */
>
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
