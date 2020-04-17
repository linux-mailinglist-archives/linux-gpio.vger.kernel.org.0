Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A061ADB4A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 12:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728997AbgDQKmr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 06:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728868AbgDQKmr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 06:42:47 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA1B2C061A0C
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 03:42:46 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x23so1431857lfq.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 03:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YxN2yxW874P8A7hETIl8EsG5Owkh3VbSAfnlbnPQFMg=;
        b=u355q6QTnYTq05Y9/zb4PLporI/eqbgtLb5hQlUlpbqDsLGwuGGYxRUZ4mGOH6UJxu
         /W2Gp0JwtTPcy3ZDDmgX81ZMayylSYYF9h8yr1Cmf+vZGIQtaVnyjoOdj1sMp8wyM+cx
         LRR6wYcAPb9TLOb+vo+vM/gWZlMf7GlehVD/8F93ohNED8E55K2tgJ/P8GtcSUV538pb
         zTFlegd/6aXQjGtzYOFrUI9PFPIRQu4KNcSsBH93PrhBt1pzJt6KFs3FVWPPE7XLiotW
         IScrUIpk/VdNUTKfig53N/skrPoKj8ouuSrxsPQpBsE/lHN8kJqqoySfS4LN7BSlo/3q
         nICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YxN2yxW874P8A7hETIl8EsG5Owkh3VbSAfnlbnPQFMg=;
        b=nTJQz65Q110hatlpIXHmGX/g1r2RdOtx/p4eqzLi6D78u/D3EMpQkuKIu2C3+nJE9Y
         rsc/UliRrAIsGClTNL0Nz4g6FMjj7kaSrJ6a0qorsd12t00ST++A9d3LKFyn5mI3736Z
         apbnSIvUYR6F1WMQhvQirToDOL9IQ6PWQU1YqgN8u8zxs4SCWC07gXXCACMw6jcI/DVc
         Qp1bLp1Jbm7En4e2qNfPY+j4a6GDTD9OGpMJaN08qG0QpAyAtTu820acwlpOM/lFlG60
         NdvCQKZp0O6leBMSoL+UQa/hzwZA1WRBbGR8V8M2SSYBKhYTuAh5+c1d2uMyFzSmUh21
         DM6Q==
X-Gm-Message-State: AGi0PuYiWlu6XMZPmQSkGg4Oy1Pjxl8Pos5Kk4DLsERHw08zR+Fk8Vjh
        ixHSA6SmFZKVwwHwHduYfw3bttfSs8xm7TQWT+6/Jw==
X-Google-Smtp-Source: APiQypKFBSuCwC7maRKJqpnX+T3xsz+RBuJC3RScwHzukTePXKuTbwAz0wvhNpVnDKfiz65FTFucZehoFupDb1ZyGqU=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr1676270lfg.21.1587120165164;
 Fri, 17 Apr 2020 03:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-14-andriy.shevchenko@linux.intel.com>
 <20200415163710.e26czil5abouujzu@mobilestation> <CACRpkdaO8GMXOOMomzmzfhDqYfgdhjTq8XvQHXuGRmnrfk7bOw@mail.gmail.com>
 <20200416134805.r5qp4o34rpxr2h2d@mobilestation>
In-Reply-To: <20200416134805.r5qp4o34rpxr2h2d@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Apr 2020 12:42:33 +0200
Message-ID: <CACRpkdYCOHQ-e8sswUqv=exuKEasanWKUjPOjsvGDQC5sV4C4g@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] gpio: dwapb: Use positive conditional in dwapb_configure_irqs()
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 3:48 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Thu, Apr 16, 2020 at 01:53:25PM +0200, Linus Walleij wrote:
> > On Wed, Apr 15, 2020 at 6:37 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > On Wed, Apr 15, 2020 at 05:15:33PM +0300, Andy Shevchenko wrote:
> > > > The negative conditionals are harder to parse by reader.
> > > > Switch to positive one in dwapb_configure_irqs().
> > >
> > > Sorry as for me this modification is redundant. Yes, I know that if-else
> > > statement in some cases better to start with positive expression to make it
> > > a bit more clear, but in this case I'd leave it as is. First this rule is
> > > applicable if both branches are more or less equal, but here I see the most
> > > normal case of using the dt-based generic device, which doesn't declare the
> > > IRQs as shared seeing it is selected by far more devices at the moment.
> > > Second the non-shared IRQs case also covers a combined and multiple-lined
> > > GPIO IRQs (chained cascaded GPIO irqchip), while the irq_shared clause have
> > > only a single IRQ source supported. Finally If the code was like you
> > > suggested from the very beginning I wouldn't say a word, but this patch seems
> > > to me at least just moving the code around with gaining less than we have at
> > > the moment.
> > >
> > > Linus, Bartosz and other GPIO-ers may think differently though. Lets see their
> > > opinion.
> >
> > I think I already applied all patches with the batch application tool b4,
> > without properly checking which patches you reviewed and not, sorry :(
> >
> > However if any change is controversial I can revert or pull the patch out.
>
> In this case it's up to you to decide.

I backed out the last two patches now and kept the rest except 13 and 14.

Yours,
Linus Walleij
