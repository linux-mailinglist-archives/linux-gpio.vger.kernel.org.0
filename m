Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF65278494
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbgIYJ6S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727346AbgIYJ6S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 05:58:18 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AB8C0613CE;
        Fri, 25 Sep 2020 02:58:18 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g29so2136125pgl.2;
        Fri, 25 Sep 2020 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/CnWh3FwsAoEkubFx1bglt/kjlK0HOFm0JwcblP3I1w=;
        b=TAsnTn7XljNpTIVdJ2+Q1bXhS1O7GMp9O2VeDCur2dxPCfgMRr0DX/qYMQgU5r8ZSB
         LjNwcOAHmXERcsjm41vlYVxyBiKnsZxJKLovSq7eDcxvXJ4//l4178dlRqdN7u+15RqA
         wvf6QBR6ofqbo2aELGFXJ8r/5kOi5KyspIWH7wqT9d8KgHnMHNhFMTFC9YxvbOo/dqme
         7OibwMyO0mS7rMGjkg20Mo0MxwybUwRuIbw5Flnw5b3zY95rKEVGL+mES2L9Yj7dpmC3
         Vt5vZHxMyPdA7BVJUBgvAW27uqKyfno4YTAH0IG5Um8XTaYXhwO0WCfir7TSUsbHrJJK
         iXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/CnWh3FwsAoEkubFx1bglt/kjlK0HOFm0JwcblP3I1w=;
        b=CpFSCTpHC7QZJ2oHY+61a1PrL6uu2O7zM/86eJqUm+LtCL0Gurmp+6XxPh29XZrbxt
         pfElemMoJTE42rZ3jqKpIiBsWFlOmMPm0CuOnperYYF8OfmLgCQJI/rEYsyR7nUz7UPi
         p3fQt6gCMhL4F+D9+TEGsUW/nccTfyCgsiOpaPZRgBEeUe6+1ke9pdxKl5kVQ868PTcX
         N9MjapRX+QLdxN4BpsaBr/sQFYaZoGWnmWwd5/vXOQMM6z1xamuEseJs5w/JTQLcc+3g
         RrFpMIOfojLu2dabxc+SZCXU6F2emrZM2KSJrcPb4rVvP1K85+Eu9EluL7RKI2MleeGx
         Epwg==
X-Gm-Message-State: AOAM532/edNJKm97HF79M39cVvZjJcl3kvXt4bzt4zcjYc+/T3ZyuJ56
        FLempFBVCuspQEZTI6DiqM4Qr7mH4t/7UKcUksMhBWZ2b0illg==
X-Google-Smtp-Source: ABdhPJyUzRY+ytLFAXWcikEJVYgWjBj0Q5FXstS4ogWOK31HjUjny8PIQBbAbga9ElJEoOibTY9u05QYsEgCPYhaSLk=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr3401125pfn.73.1601027897891; Fri, 25
 Sep 2020 02:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-12-warthog618@gmail.com>
 <CAHp75Vd6tb09n+okJmoPse992DeoPkJQHReNBo20FQNz1V2c5w@mail.gmail.com>
 <20200924073248.GA17562@sol> <20200924124604.GA227073@sol>
In-Reply-To: <20200924124604.GA227073@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 12:57:59 +0300
Message-ID: <CAHp75VegFMMmVx42gWk3cWa4jc3zuBzD_01Kqes1gq-68y3XgQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 3:46 PM Kent Gibson <warthog618@gmail.com> wrote:
> On Thu, Sep 24, 2020 at 03:32:48PM +0800, Kent Gibson wrote:
> > On Wed, Sep 23, 2020 at 07:18:08PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.
> > >
> > > > +static long linereq_set_values_unlocked(struct linereq *lr,
> > > > +                                       struct gpio_v2_line_values *lv)
> > > > +{
> > > > +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> > > > +       struct gpio_desc **descs;
> > > > +       unsigned int i, didx, num_set;
> > > > +       int ret;
> > > > +
> > > > +       bitmap_zero(vals, GPIO_V2_LINES_MAX);
> > > > +       for (num_set = 0, i = 0; i < lr->num_lines; i++) {
> > > > +               if (lv->mask & BIT_ULL(i)) {
> > >
> > > Similar idea
> > >
> > > DECLARE_BITMAP(mask, 64) = BITMAP_FROM_U64(lv->mask);
> > >
> > > num_set = bitmap_weight();
> > >
> >
> > I had played with this option, but bitmap_weight() counts all
> > the bits set in the mask - which considers bits >= lr->num_lines.
> > So you would need to mask lv->mask before converting it to a bitmap.
> > (I'm ok with ignoring those bits in case userspace wants to be lazy and
> > use an all 1s mask.)
> >
> > But since we're looping over the bitmap anyway we may as well just
> > count as we go.
> >
> > > for_each_set_bit(i, mask, lr->num_lines)
> > >
> >
> > Yeah, that should work.  I vaguely recall trying this and finding it
> > generated larger object code, but I'll give it another try and if it
> > works out then include it in v10.
> >
>
> Tried it again and, while it works, it does increase the size of
> gpiolib-cdev.o as follows:
>
>           u64   ->   bitmap
> x86_64   28360       28616
> i386     22056       22100
> aarch64  37392       37600
> mips32   28008       28016

Yes, that's pity... See below.

> So for 64-bit platforms changing to bitmap generates larger code,
> probably as we are forcing them to use 32-bit array semantics where
> before they could use the native u64.  For 32-bit there is a much
> smaller difference as they were already using 32-bit array semantics
> to realise the u64.
>
> Those are for some of my test builds, so obviously YMMV.
>
> It is also only for changing linereq_get_values(), which has three
> instances of the loop.  linereq_set_values_unlocked() has another two,
> so you could expect another increase of ~2/3 of that seen here if we
> change that as well.
>
> The sizeable increase in x86_64 was what made me revert this last time,
> and I'm still satisfied with that choice.  Are you still eager to switch
> to for_each_set_bit()?

I already asked once about short cut for for_each_set_bit in case of
constant nbits parameter when it's <= BITS_PER_LONG, but here it seems
we have variadic amount of lines, dunno if compiler can prove that
it's smaller than long. In any case my point is that code readability
has a preference vs. memory footprint (except hot paths) and if we are
going to fix this it should be done in general. That said, if
maintainers are okay with that I would prefer bitmap API over
open-coded pieces.

Also note, that it will be easier to extend in the future if needed
(if we want to have more than BITS_PER_LONG [64] lines to handle).

-- 
With Best Regards,
Andy Shevchenko
