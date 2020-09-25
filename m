Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F33278731
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 14:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgIYM07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 08:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgIYM07 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 08:26:59 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA93C0613CE;
        Fri, 25 Sep 2020 05:26:59 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k13so3038878pfg.1;
        Fri, 25 Sep 2020 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RoiAde1p6ZmKXc4tv5yOThyibmUIJZp91/MLEmdbNTg=;
        b=kHRduUcogysuAj/XjTDEPr7Z6lI82xo2KmMCMHhaliwBu8fDmzN5/ebY1h2jFxY5K/
         kK9w0fbHmRsBezY0Vy6twWptBFCaBoyl7c1SozQdBMI/NMSIT0lbtt2ckOk75dERMPKt
         yktAhIsW5+CnVulca+5OvM0lOEwTfn7OU55xiTnygs8QB0M3I2bqV9UprHA4Ci+3mlDD
         J11xCXkgYRrXuegoEcERztlzDXc0iwk4czO2PU4NpgQ4J6wZxaa2AU2tJOKS5UVekmUF
         LIizollp4YXmWdC1OKtx7BHB9tEV69A5jHwTH0+50NUFA0wlKB8vDkmRHf4wQjh5jSaQ
         6s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RoiAde1p6ZmKXc4tv5yOThyibmUIJZp91/MLEmdbNTg=;
        b=kLo3C+VrWkNKqLrnxkl6xJ7jlir34rmnfr3JGzozwmnuf4+0igu9niP1/zirYs/9y8
         N7jXu0nhS0cyDIgcbGdwZYoj+AtchZ/Vj9SilN7FVDQQzybqiNc/TDJJJAiVUuGaaOh5
         n9tRUisrTdvWxRnkuOtveoWlh6VUcbkERR8c/pW6C5Ym7QOMrCK6YU+b/8D7VoQHCMGZ
         UIexkvEEBDakjSo5ZDkIVE8npLyOj17klMPV/zIMo4SDbE9K7qMbtiRGBK3k67MDMhw2
         NGNEQUUnovkmtHwqJ5v0sJqKfBaODyt4XLYnqD1nALUs0jTVh4BnczwT/gelUTfCes7q
         XqEQ==
X-Gm-Message-State: AOAM532AYcGxsfrpOZuLoLhy1SPPPGHIQlq/zwW1yv8dhrZp4D1whxa7
        bhbbgp8dSn/6NKdsVyiieRg=
X-Google-Smtp-Source: ABdhPJwFS1lqN5QGpm8Bu6peD3GQYMRq7m+WfEhyMPGn9i99k8FroWA+ZhCw2Aqply8jG+8kI5HwQw==
X-Received: by 2002:a62:1850:0:b029:142:2501:35e8 with SMTP id 77-20020a6218500000b0290142250135e8mr3635546pfy.72.1601036817467;
        Fri, 25 Sep 2020 05:26:57 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id 75sm2305666pgg.22.2020.09.25.05.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 05:26:56 -0700 (PDT)
Date:   Fri, 25 Sep 2020 20:26:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 09/20] gpiolib: cdev: support edge detection for uAPI
 v2
Message-ID: <20200925122651.GA218809@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-10-warthog618@gmail.com>
 <CAHp75VdyOodxqkJCgmrdmcppyjVkDTyHDB-fqjoKS1g-88-umQ@mail.gmail.com>
 <20200924030732.GB11575@sol>
 <CAHp75Vd7Bmy5FWSputDCAAwSheH6ugszMyCcu1HOgC7BPVEX-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd7Bmy5FWSputDCAAwSheH6ugszMyCcu1HOgC7BPVEX-w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 12:35:49PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 24, 2020 at 6:07 AM Kent Gibson <warthog618@gmail.com> wrote:
> > On Wed, Sep 23, 2020 at 06:47:28PM +0300, Andy Shevchenko wrote:
> > > On Tue, Sep 22, 2020 at 5:35 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> ...
> 
> > Also, this code is drawn from lineevent_irq_thread(), which is ordered
> > this way.
> 
> Negative conditionals are slightly harder to read.
> 
> ...
> 
> > > > +       if (!line->timestamp_ns) {
> > > > +               le.timestamp_ns = ktime_get_ns();
> > > > +               if (lr->num_lines != 1)
> > > > +                       line->req_seqno = atomic_inc_return(&lr->seqno);
> > > > +       } else {
> > > > +               le.timestamp_ns = line->timestamp_ns;
> > > > > +       }
> > >
> > > Ditto.
> >
> > Firstly, drawn from lineevent_irq_thread() which is structured this way.
> >
> > In this case the comment relates to the condition being true, so
> > re-ordering the if/else would be confusing - unless the comment were
> > moved into the corresponding body??
> 
> Yes.
> 

Does that mean I should re-order and move the comment into the body?
That would work for me - the normal case is line->timestamp_ns being
set.

> ...
> 
> > > > +       irq = gpiod_to_irq(line->desc);
> > > > +       if (irq <= 0)
> > > > +               return -ENODEV;
> > >
> > > So, you mean this is part of ABI. Can we return more appropriate code,
> > > because getting no IRQ doesn't mean we don't have a device.
> > > Also does 0 case have the same meaning?
> >
> > Firstly, this code is drawn from lineevent_create(), so any changes
> > here should be considered for there as well - though this may
> > constitute an ABI change??
> 
> For v1 probably, for v2 we are free to fix this.
> 
> > I agree ENODEV doesn't seem right here. Are you ok with ENXIO?
> 
> Yes.
> 

Will do.  And in the debounce patch as well.

> > From gpiod_to_irq():
> >
> >                 /* Zero means NO_IRQ */
> >                 if (!retirq)
> >                         return -ENXIO;
> >
> > so it can't even return a 0 :-| - we're just being cautious.
> 
> I would drop = part then.
> 

ok, but you'd better not come after me in a subsequent review for not
checking the 0 case!

Cheers,
Kent.
