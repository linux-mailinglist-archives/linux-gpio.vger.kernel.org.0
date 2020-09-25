Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B67027841F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 11:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbgIYJgI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 05:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727905AbgIYJgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 05:36:08 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306B0C0613CE;
        Fri, 25 Sep 2020 02:36:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x16so1276440pgj.3;
        Fri, 25 Sep 2020 02:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ns13PUxn7mq09/qDn659qTFCR6+PeZDMeurMAYQbBks=;
        b=AQp4gKR0lEP5d9VGbN5TWT1dOl5kzKdcGTQ0+qsEmjqCvEXmDYbROORDHS6Ijszp9y
         DEBNpZfz6qx1OQlXHRAamec+NET7IqE0+NgVWEW/NLnoEtDzIlEm6Xj0vTokbG/7jX7s
         idVMPH/hHJyLeTXV3VCOtuQFU9PgQaxxlT7Z3JPjwyx7BVKJsKyqke9UIWZYZHvTr3pg
         xk3/fL2B4TGmj8Itm3/eQSety3VxtPeY7fMK2AK1jWSb4p/93v/bh3h+vRX2MNiV0ca5
         asVZK7G80gz7hJ81L0CgGQpcreqH3HEDiWHVa4eBuZo2Px9jDyWG04vffIlFwFLACP+6
         JsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ns13PUxn7mq09/qDn659qTFCR6+PeZDMeurMAYQbBks=;
        b=uOXpmnvwyR4rsNRerWmyj+dokjYDme1vTuLB//XrSWV7jiKGikN1T3Mon5KE5085I7
         HvXDALXn0N9oTXby2iLjQiGn50I/ptenJN0s5aij6Q47j8IaXBAlFWarKwFzPpjuZZnQ
         06qpBrJcH/GgUxTRtUHMk/TXW5F9qRhrbNmwRS7TJ07sA3sHkbzVTjliTmn9plXKOqGq
         0HU3NV+hEoN1BKN3K31t9vtV/otFjhVSiXT+98OaVa/x7HTnnB9CboShipmDXjn7FdJu
         mzicPMicMDHWdLpAaQNcQ+AFmHbj2c6XuDN7tKjGbyEObwi1jx2eS+iuaL4obh39A216
         AYvA==
X-Gm-Message-State: AOAM532NFeeep+P9E3tZdGHmV21WE73i0VJAGyBAwcvwO8FNd5yScjJn
        2d2BMdKzSokBtmzqZkyX4rDGEe5uEbWAhHhzhd40m44L1iiS9A==
X-Google-Smtp-Source: ABdhPJwItmiur2/HgOhjKzc87a29mAs9mR/VAjeOqYaLMwI7J/jg8aRxFGq8kE0pizINYfKaDvKTzt4alLvw56/FdpY=
X-Received: by 2002:a17:902:b7c7:b029:d1:cc21:9c38 with SMTP id
 v7-20020a170902b7c7b02900d1cc219c38mr3590898plz.21.1601026567512; Fri, 25 Sep
 2020 02:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-10-warthog618@gmail.com>
 <CAHp75VdyOodxqkJCgmrdmcppyjVkDTyHDB-fqjoKS1g-88-umQ@mail.gmail.com> <20200924030732.GB11575@sol>
In-Reply-To: <20200924030732.GB11575@sol>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Sep 2020 12:35:49 +0300
Message-ID: <CAHp75Vd7Bmy5FWSputDCAAwSheH6ugszMyCcu1HOgC7BPVEX-w@mail.gmail.com>
Subject: Re: [PATCH v9 09/20] gpiolib: cdev: support edge detection for uAPI v2
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

On Thu, Sep 24, 2020 at 6:07 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Wed, Sep 23, 2020 at 06:47:28PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:

...

> Also, this code is drawn from lineevent_irq_thread(), which is ordered
> this way.

Negative conditionals are slightly harder to read.

...

> > > +       if (!line->timestamp_ns) {
> > > +               le.timestamp_ns = ktime_get_ns();
> > > +               if (lr->num_lines != 1)
> > > +                       line->req_seqno = atomic_inc_return(&lr->seqno);
> > > +       } else {
> > > +               le.timestamp_ns = line->timestamp_ns;
> > > > +       }
> >
> > Ditto.
>
> Firstly, drawn from lineevent_irq_thread() which is structured this way.
>
> In this case the comment relates to the condition being true, so
> re-ordering the if/else would be confusing - unless the comment were
> moved into the corresponding body??

Yes.

...

> > > +       irq = gpiod_to_irq(line->desc);
> > > +       if (irq <= 0)
> > > +               return -ENODEV;
> >
> > So, you mean this is part of ABI. Can we return more appropriate code,
> > because getting no IRQ doesn't mean we don't have a device.
> > Also does 0 case have the same meaning?
>
> Firstly, this code is drawn from lineevent_create(), so any changes
> here should be considered for there as well - though this may
> constitute an ABI change??

For v1 probably, for v2 we are free to fix this.

> I agree ENODEV doesn't seem right here. Are you ok with ENXIO?

Yes.

> From gpiod_to_irq():
>
>                 /* Zero means NO_IRQ */
>                 if (!retirq)
>                         return -ENXIO;
>
> so it can't even return a 0 :-| - we're just being cautious.

I would drop = part then.

-- 
With Best Regards,
Andy Shevchenko
