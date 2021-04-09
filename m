Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF175359AF1
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 12:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233846AbhDIKHE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 06:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234366AbhDIKGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 06:06:05 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10838C061763
        for <linux-gpio@vger.kernel.org>; Fri,  9 Apr 2021 03:05:04 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id g18-20020a7bc4d20000b0290116042cfdd8so4417602wmk.4
        for <linux-gpio@vger.kernel.org>; Fri, 09 Apr 2021 03:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P88VtW8jrwemR6nWNOnkRyeqoWX7xwJZBD4Bm9OKNe4=;
        b=JggcRlqG1TxIOgB+6wN5M26WqSIjScZMkhNeKA9GTQXVjLZ8QtVu5tICLCsuK/1E8J
         WMEHEbAQbOZJWbZHsAjuox1f4wv9rXLeeIYsd0sleUvK4vFyO+5Kx1I0xijoPQZd7jKt
         u8UfO9uNgbA065vy8JkRtIiSCzA7D+G08KE1oworiOZKmMqlxt4xVtEYXXjAfBo/s/BD
         EElcJKsCYPODzbD7GQomEFlHBUMjgppIhx7Wa41+/k+ObbFz2sVoeLsWHFSB4sJrUlp+
         gOG9+d+2zx9T2KlQ1SjjVM/V+ItlQwOxAOjciYuCjl4AWlqfETjMnmM04ykpnZnyOEft
         BpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P88VtW8jrwemR6nWNOnkRyeqoWX7xwJZBD4Bm9OKNe4=;
        b=UG+uU8CqdNJFyMgkZeMDScwK0Qko8f+Hya9jL40P3sSr3Dlj5lGyawp82CBs40v2Jo
         wE655rTuHrP4NGrkIW/8P38lbn3yxux60NGhO3+tMdAyyYh5wcLEIBkfaj8wjBDLpVFF
         CFjBjIoFSc2fZHKxPmBTbZMZHvO4utSR5a5heMfwbFPPVcefXrwGOURWm8NweLS9IjYM
         k0LrnpuhCylgWvuaek2JfD8SWUAHanPp+fvgRjsii/PxTIuAtbUccAX5GEF/b7pVG1t1
         udLG2XoaqVaoaQ16lPMlNR0ZSxOS9EwVrGDJuyJeHdxegla4OpUtz3eDYjHjzQURjp0y
         2SIA==
X-Gm-Message-State: AOAM533mjYPz7ABmzmjq83MbBUIQq+K5aNOxpTB1AtWOoDxn8WVPUFNd
        B3g6W26CWd6l505U6t4weV3Kni7I4al+drQHfu6ECDrzuz8=
X-Google-Smtp-Source: ABdhPJycj08rHm3ljtaNcliVekF0EMFMqAUWuCitg7V3H1EZgW8B43ZTG82NFSB19DEmAfefiEJxLDa3oOP4f1o4MW8=
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr13079745wmc.3.1617962702830;
 Fri, 09 Apr 2021 03:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <1617693639-49182-1-git-send-email-jiapeng.chong@linux.alibaba.com>
 <20210406083549.GR25703@kw.sim.vm.gnt>
In-Reply-To: <20210406083549.GR25703@kw.sim.vm.gnt>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 9 Apr 2021 12:04:51 +0200
Message-ID: <CAMpxmJXRqMuNSvojF3KK1g4b1XWkc57qLKK1LhGNbb=WkWppfQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-it87: remove unused code
To:     Simon Guinot <simon.guinot@sequanux.org>
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 6, 2021 at 10:35 AM Simon Guinot <simon.guinot@sequanux.org> wrote:
>
> On Tue, Apr 06, 2021 at 03:20:39PM +0800, Jiapeng Chong wrote:
> > Fix the following clang warning:
> >
> > drivers/gpio/gpio-it87.c:128:20: warning: unused function 'superio_outw'
> > [-Wunused-function].
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>
> Acked-by: Simon Guinot <simon.guinot@sequanux.org>
>
> > ---
> >  drivers/gpio/gpio-it87.c | 8 --------
> >  1 file changed, 8 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
> > index 8f1be34..f332341 100644
> > --- a/drivers/gpio/gpio-it87.c
> > +++ b/drivers/gpio/gpio-it87.c
> > @@ -125,14 +125,6 @@ static inline int superio_inw(int reg)
> >       return val;
> >  }
> >
> > -static inline void superio_outw(int val, int reg)
> > -{
> > -     outb(reg++, REG);
> > -     outb(val >> 8, VAL);
> > -     outb(reg, REG);
> > -     outb(val, VAL);
> > -}
> > -
> >  static inline void superio_set_mask(int mask, int reg)
> >  {
> >       u8 curr_val = superio_inb(reg);
> > --
> > 1.8.3.1

Patch applied, thanks!

Bartosz
