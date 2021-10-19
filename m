Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFD143366D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 14:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJSM5G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 08:57:06 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:41870 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235752AbhJSM5E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 08:57:04 -0400
Received: by mail-ua1-f45.google.com with SMTP id r17so7769644uaf.8;
        Tue, 19 Oct 2021 05:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JvoSpxbgmuSGONsknYaeD8ot8h+9x3xQBXz+/ENCpyM=;
        b=Yp3s19uUuGnvUNZQmHUesVsFGktjBQtYuf5WSvza1DeSqdcNEjedf6arbzPBKOX8E0
         KmmkVrzVs7XmBP/WHGOMyO62mWZpDx3P1cUYNs3peVDEXkXGYcQIrXZ1wuFflhPW1AJ9
         3SJoHEmP4TyYnHZKVegTFf2wAhRFmi7d9bxgEASuJU9R6j+FCBLwFNF/WPcDvZKc+Kio
         o9OnfUXmnbbNamg01UOXrR1/BQC0XGv2smq1VsvEv5R0779Jz0tFZGYQ76a9VfY70oo2
         kCseBFfw8MsJ9eSb9U2yhzRCEWQLlSiT9N+TSXQVsc2qbXMPrDh9ejNRp2dsQZwe5Lcx
         ipTQ==
X-Gm-Message-State: AOAM5337YUpQvxNVKJa63BTyYlvfDmaqWnYRuZRPOvOy0MDjBpVlj1H1
        fSLv+6WiGJfUWHKwhHUKPLUlONY70+UNAQ==
X-Google-Smtp-Source: ABdhPJwXOEF23Js68UeSUBsN8FseHwxkq5rytN5ZebvXddk61OZuR77EClBil2xVmHVM/yDXX80XZQ==
X-Received: by 2002:a9f:2429:: with SMTP id 38mr32421236uaq.109.1634648091524;
        Tue, 19 Oct 2021 05:54:51 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id u22sm10673726vkp.41.2021.10.19.05.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 05:54:51 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id i22so3593706ual.10;
        Tue, 19 Oct 2021 05:54:50 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:: with SMTP id cz12mr34800626vsb.35.1634648090758;
 Tue, 19 Oct 2021 05:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <2188ede78110c64b8a3bfbfa794a085dac0e4cd2.1634645735.git.geert+renesas@glider.be>
 <20211019124315.5dg5pfaas2qmm7lx@uno.localdomain>
In-Reply-To: <20211019124315.5dg5pfaas2qmm7lx@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 19 Oct 2021 14:54:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6OO19+pgxUYATT9AZ5BuXXMzRCPbtn7aZC_Lc6pt96g@mail.gmail.com>
Message-ID: <CAMuHMdX6OO19+pgxUYATT9AZ5BuXXMzRCPbtn7aZC_Lc6pt96g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rza1: Fix kerneldoc function names
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jacopo,

On Tue, Oct 19, 2021 at 2:42 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Tue, Oct 19, 2021 at 02:34:22PM +0200, Geert Uytterhoeven wrote:
> > make W=1:
> >
> >     drivers/pinctrl/renesas/pinctrl-rza1.c:770: warning: expecting prototype for rza1_gpio_disable_free(). Prototype was for rza1_gpio_free() instead
> >     drivers/pinctrl/renesas/pinctrl-rza1.c:889: warning: expecting prototype for rza1_parse_pmx_function(). Prototype was for rza1_parse_pinmux_node() instead
> >
> > Fixes: 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks, looking at the driver now it seems I was really eager to write
> comments at the time I wrote it! :)
>
> Probably all kernel-doc comments should be demoted to regular
> comments, as they're only internal driver functions.

;-)

> > --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
> > @@ -757,7 +757,7 @@ static int rza1_gpio_request(struct gpio_chip *chip, unsigned int gpio)
> >  }
> >
> >  /**
> > - * rza1_gpio_disable_free() - reset a pin
> > + * rza1_gpio_free() - reset a pin
> >   *
> >   * Surprisingly, disable_free a gpio, is equivalent to request it.
>
> s/disable_free/free ?

Yup, will fix while applying to:

    disabling a gpio is equivalent to requesting it

> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
