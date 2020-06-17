Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33FD81FC7AE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 09:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgFQHly (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 03:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQHlx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Jun 2020 03:41:53 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BB7C061573;
        Wed, 17 Jun 2020 00:41:53 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id r77so1688610ior.3;
        Wed, 17 Jun 2020 00:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3uy57yL2IrwciWHLP013hfH1P9FBradhgD4nYowMof4=;
        b=TQdUrcNHS4HHlvOI0eBrN/euXFcK0YBQJWY2mPBB1l+DSKRuFdIz4LNhQTBU9wvoDw
         98IRLBi5M3oPSwN/E9Y0KW+qLJJEoKZzI3A1QCzzNQZD+NW2BYFj/Asum+jOHzArZzAR
         l1fmdLYK2HAzyCXhICKj85baDDhk3AZaUi6jzIewZG2caEVe6GCIveuW2tX+Kuht1cmi
         7NE/a8fRD3SZYw+ZF2Mtrf4YqEtfN0JSwtRq50EO29JrtnhKPsuts5GT0QfVPYQ8ND1j
         QkOIeeskgO1BAXKSgUgczo3w68mFvfptr5dCNRFkrL60ETlgMoTqNRHWz1cGZDZt2hKO
         1O2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3uy57yL2IrwciWHLP013hfH1P9FBradhgD4nYowMof4=;
        b=aVsvX0p4uf4gfCKLhy6xiO1DML/OavaxU2IdhtQeK28ofuTmNQI6SnozosopnCnFIi
         8Uedfo9b8DDZ/uxtomZhqqKZZEODn3DOwRcI4hcmLozY0Bn3lJpdHvyAVvUySVNFrFUW
         AHAvKAwZ1gy1c8I/0DdLb9d8LSAkd6VzNgmI17ZZgbL8UA4U5VwDv3FSCPGBELr5kQ98
         UrUrqeFDYbJuVzA6cpgqi99jQSY3G6vwt+FtAF1yntRmwdUUdGul7creFpebI3ncvFG6
         nB7OJbLDGS3KWi6WkMgoDBkvuT/KxfvexfyBFx2aZQ2PhCmCWC58cc3DIls4qjXtFPuP
         ti8g==
X-Gm-Message-State: AOAM531/IjaM+dLNd/ckjzm1sDDmDeqJNqjS0j1GiqLPJtqAvE5tKZ2a
        RAuZXygss5XgnUAIrU70z7uXV7waEo6iYJ9AaVo=
X-Google-Smtp-Source: ABdhPJwhKDhyx77Do3VQCA27DLr3vTfygmt3xKaYaqQ+jqw8WFYH/jMie3NMjJkA5rbVSpAcnNDjLgmt1tPraQHWZ74=
X-Received: by 2002:a05:6602:2d95:: with SMTP id k21mr6872828iow.59.1592379712500;
 Wed, 17 Jun 2020 00:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200605024919.56177-1-navid.emamdoost@gmail.com> <CAMuHMdXHT9y09L19j2K=oQ1W+7x=SE7MEyjj6r1i=DPcokvWzg@mail.gmail.com>
In-Reply-To: <CAMuHMdXHT9y09L19j2K=oQ1W+7x=SE7MEyjj6r1i=DPcokvWzg@mail.gmail.com>
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
Date:   Wed, 17 Jun 2020 02:41:41 -0500
Message-ID: <CAEkB2ERLsPcT4amjoH_4-FzLi75epRAm+Wfb9g9EB_xWWrnXHg@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: handle pm_runtime_get_sync failure case
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Wed, Jun 17, 2020 at 2:26 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Navid,
>
> On Fri, Jun 5, 2020 at 4:50 AM Navid Emamdoost
> <navid.emamdoost@gmail.com> wrote:
> > Calling pm_runtime_get_sync increments the counter even in case of
> > failure, causing incorrect ref count. Call pm_runtime_put if
> > pm_runtime_get_sync fails.
> >
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpio/gpio-rcar.c
> > +++ b/drivers/gpio/gpio-rcar.c
> > @@ -250,8 +250,10 @@ static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
> >         int error;
> >
> >         error = pm_runtime_get_sync(p->dev);
> > -       if (error < 0)
> > +       if (error < 0) {
> > +               pm_runtime_put(p->dev);
>
> As per [1], I would like to see a call to pm_runtime_put_noidle() instead.

V2 was sent per your suggestion, thanks.

>
> [1] http://lore.kernel.org/r/CAJZ5v0i87NGcy9+kxubScdPDyByr8ypQWcGgBFn+V-wDd69BHQ@mail.gmail.com
>
> >                 return error;
> > +       }
> >
> >         error = pinctrl_gpio_request(chip->base + offset);
> >         if (error)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Navid.
