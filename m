Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE63276BA5
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 10:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgIXIVW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 04:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgIXIVW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 04:21:22 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38D35C0613CE;
        Thu, 24 Sep 2020 01:21:22 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f18so1424178pfa.10;
        Thu, 24 Sep 2020 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VO01aPvv6o2F0ohQhM7R7JSvS2/mQohZpzTORu6AGCM=;
        b=FBRgvwf3Wh3XkFCl1mjhpdBImQZ7kMvcltRVcxPbIAenTrteEgAtijkthTcdX8tGbp
         +BxQQldJ9dhPM3EIpiSOjXDwriGZ1quKWGI02MH2LgY/LIT793PME0ia0FypQq2KbGQG
         8eJY1eJBbF+VYYYgdK3a8OKlXD7DjuRSNolsLXFN8iyWOzun5TsfjBSt2zkc+PusDrnh
         Frj+X6GfRRE+lW2rFRitn3awfyYYYCzFChoG4tj86wo+Q2niccoRAvx2fg1vFgLz4Blj
         OZKa1xe1x2o6ggTo9FjkFjTcoGvDvALdI9VuFjQ+o+gJo8KScNX88ZaTeI1468W6RsMg
         roAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VO01aPvv6o2F0ohQhM7R7JSvS2/mQohZpzTORu6AGCM=;
        b=TyZGd87WOopMD7EF/ICqovprZaegQqYa1v0NyQ+GQdvJ6keXNjkA5nvLnYSuztJkXE
         YfTqj5dPVOXEM4GzPSWPSpAc281mc9QDoq4kY1XfqiMIO960k8uaaieAtiq19cAN66ua
         ODn0jHA5BapjlmJZqmg51hcJqqptQybfJeJqXvfW5npCgp4DYQ3pK4NAMfW27brkSz0a
         QHGD2HAq0AGJ1EY6uEa/6ac15I47EiCf5eN7e8V/zTyJ+pVHFq6jLsOECtwO+N/TpGO+
         XiD00v0dbdADHteG7Ppk1z88xLrdJGE8FrGxUWmhTSlYFDDNJP1ud6O7TLpppXh1RZuk
         NIzw==
X-Gm-Message-State: AOAM530G9MsKTzxOKOMAiGc7tArQeqAhi4f/hZhqvSLv6T8mLegnsFou
        K5IE2qTfPC1F5Ozf5XDpxanpuKJ36rn7dS/oAB0=
X-Google-Smtp-Source: ABdhPJytgvRm8C+YCvueLyggzBk5fR0qrXWF9wjtUfUutPtFXcrRtmyPwxsNoVcSBVC5yqfc0w5k36e/p3oE5T1C4vw=
X-Received: by 2002:a63:d648:: with SMTP id d8mr3050034pgj.4.1600935681578;
 Thu, 24 Sep 2020 01:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-12-warthog618@gmail.com>
 <CAHp75Vd6tb09n+okJmoPse992DeoPkJQHReNBo20FQNz1V2c5w@mail.gmail.com> <20200924073248.GA17562@sol>
In-Reply-To: <20200924073248.GA17562@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Sep 2020 11:21:05 +0300
Message-ID: <CAHp75Vd1=EFsT9pKunDYbXzf0D8cMvU3_n-AsD1CXpOPSa+5pw@mail.gmail.com>
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

On Thu, Sep 24, 2020 at 10:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Sep 23, 2020 at 07:18:08PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.
> >
> > > +static long linereq_set_values_unlocked(struct linereq *lr,
> > > +                                       struct gpio_v2_line_values *lv)
> > > +{
> > > +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> > > +       struct gpio_desc **descs;
> > > +       unsigned int i, didx, num_set;
> > > +       int ret;
> > > +
> > > +       bitmap_zero(vals, GPIO_V2_LINES_MAX);
> > > +       for (num_set = 0, i = 0; i < lr->num_lines; i++) {
> > > +               if (lv->mask & BIT_ULL(i)) {
> >
> > Similar idea
> >
> > DECLARE_BITMAP(mask, 64) = BITMAP_FROM_U64(lv->mask);
> >
> > num_set = bitmap_weight();
> >
>
> I had played with this option, but bitmap_weight() counts all
> the bits set in the mask - which considers bits >= lr->num_lines.

Does it mean we have a bug in the code and no test case covered it?
Because from the API I see the parameter nbits which should prevent
this.

> So you would need to mask lv->mask before converting it to a bitmap.
> (I'm ok with ignoring those bits in case userspace wants to be lazy and
> use an all 1s mask.)

Can you confirm a bug in bitmap API? If it's so it's a serious one.

> But since we're looping over the bitmap anyway we may as well just
> count as we go.
>
> > for_each_set_bit(i, mask, lr->num_lines)
> >
>
> Yeah, that should work.  I vaguely recall trying this and finding it
> generated larger object code, but I'll give it another try and if it
> works out then include it in v10.


-- 
With Best Regards,
Andy Shevchenko
