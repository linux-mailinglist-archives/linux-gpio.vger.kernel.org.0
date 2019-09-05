Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 765D7A9C99
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 10:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732228AbfIEII0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 04:08:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37773 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfIEII0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 04:08:26 -0400
Received: by mail-pl1-f195.google.com with SMTP id b10so922750plr.4;
        Thu, 05 Sep 2019 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p4cc3HD6wCgRlnUtcn0OOHFmBZxcsFw0lbNwPOQXaMs=;
        b=ldqIJr7rYiw3PfQqdQzuOi7dClRQkPVHQ78j0B22mJIViZA3bBPXpqOgqQfRYw477s
         HSy1oDmzKI7o2tp87ZoXVsuCMMg1FTgRrNOA125vjse2m5crWv6rqwXnRW/56VJ3R5Gl
         5lbkaq+trdJvu3B3FD95traiLrl5n0Frg1kDdyfgETxTIwvuH7fJ3Xbi+9rw6I0LpPyh
         9dEC67LHeKADIOu3uUCU5Ja1B30P0AB6ewmQ72l5j0LBBBQ7bK0tBlz8PBniTjaLAE0E
         RQEM8MjW7Get5PgLg3Azvc4wbNxm1078ev2AKbDiNFD7yruPq+HkHQUu0Q7SgZ/te7KX
         y1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p4cc3HD6wCgRlnUtcn0OOHFmBZxcsFw0lbNwPOQXaMs=;
        b=EYkkE0Owejf6lNjiB9gQCxhtZgMJpWkTugTEJZOZJ+psCFQCEwQIgfs57LUIvPnYba
         ALZ0Cz50FqZYnHBdEHXMvUOkODG+TQEeHrKQBaCQC841myb4h3I9QHtYzCIeRmwvjNip
         GJ4q1SxzBbyKSWWqecZCUmsjwFj0/ZTmHpvCsibUKDjgD+JHIxQikDkWtQoGL2bsXtp8
         2LKDbDF36lkUnawkqmoWSfwM688CDlfFaWAV4lvYZaE6NKL/zbO4aM1QDTo6fBlYxqz4
         HPIcjh2sagwumjqUZt+sbU+7t8iQ0PP4YhiclEEx6tRIHREi5Yv56WR8DkGXVkGzUHxE
         XMdg==
X-Gm-Message-State: APjAAAXIqN4OTT2Xo+Ue6qNUMJGhjIrA/TEXbQnyRUV52cgD8LcMZ0vR
        UYc8LAyp4HAeXlyilpD3Kgi/AhX1LC/r71xKTKI=
X-Google-Smtp-Source: APXvYqwWrgyUGsctjbz9xkNUlborGLECclh7l27G2fO9h6X4J9/miCFZcTmLyyj7sm/bNj1c3Gs23ePhQy3qAsUB81A=
X-Received: by 2002:a17:902:9348:: with SMTP id g8mr2103599plp.18.1567670905658;
 Thu, 05 Sep 2019 01:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com> <CAHp75Vd_6Rpt5=BjzV8YFCiFP7qsRrYHHo7+=gWwnZH-zT9jNw@mail.gmail.com>
 <dd62da5f10c06fae1823bf8338c2acc83fe40a40.camel@gmail.com>
In-Reply-To: <dd62da5f10c06fae1823bf8338c2acc83fe40a40.camel@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Sep 2019 11:08:13 +0300
Message-ID: <CAHp75VfbjRfCOzo2+95aiGDcmEUOAqUORY4epK+REJ=Y57XFFQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 5, 2019 at 2:17 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:
> On Wed, 2019-09-04 at 19:27 +0300, Andy Shevchenko wrote:
> > On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com>
> > wrote:

> > > -       banks = gpio->config->nr_gpios >> 5;
> > > +       banks = (gpio->config->nr_gpios >> 5) + 1;
> >
> > Shouldn't be rather DIV_ROUND_UP(nr_gpios, sizeof(u32)) ?
>
> I agree that DIV_ROUND_UP is the right thing to use here, but wouldn't
> it be DIV_ROUND_UP(nr_gpios, 32)?

Right. Either this or BITS_PER_TYPE(u32).

> > >         gpio->dcache = devm_kcalloc(&pdev->dev,
> > >                                     banks, sizeof(u32),
> > > GFP_KERNEL);

-- 
With Best Regards,
Andy Shevchenko
