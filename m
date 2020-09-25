Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73312786CD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 14:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgIYMQZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 08:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgIYMQY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 08:16:24 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A700C0613CE;
        Fri, 25 Sep 2020 05:16:24 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b17so1681729pji.1;
        Fri, 25 Sep 2020 05:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o6lkhb2U4emmUU7qiA5TpI4n8CQy0i2Q0cjjZnlPIBA=;
        b=IeRyoUPUFpIXSkQPOSKe2Lm/BO8n8NtDgQnBBz/0qUc2z8GzJjqB3LB9HNWhdC1XGH
         Q1M00EUDsZ5+VlIyxUKCB2j07wy6r9WNSBgLgii939zeGZ5YPhMT/WDF0VFF2f8wJJo8
         6lW6iK7kYBx1cfN7xzlqtm7w3vLCCjQpcREOczd6p1a5+ZI/rbyAX54fRPQ/DNEKOvFZ
         GrNtwUPzeX41nun83ouL4hhh32x41z3siFL1b41iNS3QUoQBRxecORbGgUuq0xEmFOR1
         4Z8yIDNYDoW1maj/46HnPGWeir0ciNutpo0i2/IPInGzLT5lJm4/Idahy/SJkcTp28hu
         9OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o6lkhb2U4emmUU7qiA5TpI4n8CQy0i2Q0cjjZnlPIBA=;
        b=QBWq8m0A5NyTjaSE2MlUKSfEe2pd+diXDcvBN840MfEuH/WiwjNhITvFHo8nVXuL0w
         Nhqsp14ZZ6ooPAamUcFEacqTNMqTbOLHqCqpT1UN7PTTtL85xyZBMhRSy003jDrLA6FS
         K5un9GO/doB+hc8E38RwrKT5ZqKtvDzcECovx0aLyh9UjVcUdfDJ+Ox7a1CT3j0+iiWX
         5BHj+BUKmjdsBy3NDawWkjGgU11WzScthuN4i1RziDWQhtSqHH625nlrKQyeQc35UzCo
         GtbK6Yk5DNxQFht887vpkU26inZk6AoprsiiEx4fu92b4QB1lQnWjiqBU/oPy+q5BPZ6
         +TVw==
X-Gm-Message-State: AOAM531ISyfiGKHf0JkzeOHQ7s5AXX6Bid3317FFodidP0qTqfKf+Xca
        gud/O2Lh9NlBuWBp32/m06U7iQYar1FFCg==
X-Google-Smtp-Source: ABdhPJxg9XP0zdFwzMMUHoVovmB0IuHNHrUdrMpzTSDlLyXPB5qkXCzhT8OYcxwb7OhARd0yygGmYg==
X-Received: by 2002:a17:90a:5292:: with SMTP id w18mr87458pjh.72.1601036183988;
        Fri, 25 Sep 2020 05:16:23 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id br22sm1969573pjb.35.2020.09.25.05.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 05:16:23 -0700 (PDT)
Date:   Fri, 25 Sep 2020 20:16:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 11/20] gpiolib: cdev: support
 GPIO_V2_LINE_SET_VALUES_IOCTL
Message-ID: <20200925121618.GA218526@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-12-warthog618@gmail.com>
 <CAHp75Vd6tb09n+okJmoPse992DeoPkJQHReNBo20FQNz1V2c5w@mail.gmail.com>
 <20200924073248.GA17562@sol>
 <20200924124604.GA227073@sol>
 <CAHp75VegFMMmVx42gWk3cWa4jc3zuBzD_01Kqes1gq-68y3XgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VegFMMmVx42gWk3cWa4jc3zuBzD_01Kqes1gq-68y3XgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 12:57:59PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 24, 2020 at 3:46 PM Kent Gibson <warthog618@gmail.com> wrote:
> > On Thu, Sep 24, 2020 at 03:32:48PM +0800, Kent Gibson wrote:
> > > On Wed, Sep 23, 2020 at 07:18:08PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > > > Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.
> > > >
> > > > > +static long linereq_set_values_unlocked(struct linereq *lr,
> > > > > +                                       struct gpio_v2_line_values *lv)
> > > > > +{
> > > > > +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> > > > > +       struct gpio_desc **descs;
> > > > > +       unsigned int i, didx, num_set;
> > > > > +       int ret;
> > > > > +
> > > > > +       bitmap_zero(vals, GPIO_V2_LINES_MAX);
> > > > > +       for (num_set = 0, i = 0; i < lr->num_lines; i++) {
> > > > > +               if (lv->mask & BIT_ULL(i)) {
> > > >
> > > > Similar idea
> > > >
> > > > DECLARE_BITMAP(mask, 64) = BITMAP_FROM_U64(lv->mask);
> > > >
> > > > num_set = bitmap_weight();
> > > >
> > >
> > > I had played with this option, but bitmap_weight() counts all
> > > the bits set in the mask - which considers bits >= lr->num_lines.
> > > So you would need to mask lv->mask before converting it to a bitmap.
> > > (I'm ok with ignoring those bits in case userspace wants to be lazy and
> > > use an all 1s mask.)
> > >
> > > But since we're looping over the bitmap anyway we may as well just
> > > count as we go.
> > >
> > > > for_each_set_bit(i, mask, lr->num_lines)
> > > >
> > >
> > > Yeah, that should work.  I vaguely recall trying this and finding it
> > > generated larger object code, but I'll give it another try and if it
> > > works out then include it in v10.
> > >
> >
> > Tried it again and, while it works, it does increase the size of
> > gpiolib-cdev.o as follows:
> >
> >           u64   ->   bitmap
> > x86_64   28360       28616
> > i386     22056       22100
> > aarch64  37392       37600
> > mips32   28008       28016
> 
> Yes, that's pity... See below.
> 
> > So for 64-bit platforms changing to bitmap generates larger code,
> > probably as we are forcing them to use 32-bit array semantics where
> > before they could use the native u64.  For 32-bit there is a much
> > smaller difference as they were already using 32-bit array semantics
> > to realise the u64.
> >
> > Those are for some of my test builds, so obviously YMMV.
> >
> > It is also only for changing linereq_get_values(), which has three
> > instances of the loop.  linereq_set_values_unlocked() has another two,
> > so you could expect another increase of ~2/3 of that seen here if we
> > change that as well.
> >
> > The sizeable increase in x86_64 was what made me revert this last time,
> > and I'm still satisfied with that choice.  Are you still eager to switch
> > to for_each_set_bit()?
> 
> I already asked once about short cut for for_each_set_bit in case of
> constant nbits parameter when it's <= BITS_PER_LONG, but here it seems
> we have variadic amount of lines, dunno if compiler can prove that
> it's smaller than long. In any case my point is that code readability
> has a preference vs. memory footprint (except hot paths) and if we are
> going to fix this it should be done in general. That said, if
> maintainers are okay with that I would prefer bitmap API over
> open-coded pieces.
> 

Agreed - if the bitmap ops made better use of the architecure then I'd
change to bitmap without question - it is more readable.

Bart and Linus - do you have any preference?

> Also note, that it will be easier to extend in the future if needed
> (if we want to have more than BITS_PER_LONG [64] lines to handle).
> 

Yeah, I think we can rule that one out - while I had initially written
the uAPI with the option of > 64 lines we decided on the hard limit to
keep things simple.  And any user that needs to request more than 64
lines in one request shouldn't be using the GPIO uAPI.

Cheers,
Kent.
