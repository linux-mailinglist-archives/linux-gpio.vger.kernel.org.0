Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94FB7276CD1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 11:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgIXJIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 05:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbgIXJIa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 05:08:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5768BC0613CE;
        Thu, 24 Sep 2020 02:08:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id s14so4012406pju.1;
        Thu, 24 Sep 2020 02:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/uafQO7Db3cLUaQDzRmZMFp1yFX5GHbGqeGmV2t1IAo=;
        b=GaUfL9Wmu8JrDLLQVrZc/ocZRBTG3S988/vz+zIXqhELxAjjsBZ1yEj7zvtoeY8Bn2
         wxIC+XbT13Gny9N+fQgcQyznF/eFKbgswYhBiLH53BDTPHbxTevpgs1KKMNl71ZlR57c
         0DKU2G+T/xj+AXdyBBT97JNOfC62XcB4szdKxscMnLA5ec2FzRDmi6t6pMcwiCXpwm1p
         ZOo2QhFIJ0/4BNXkB5J0YlL8RWaN2ZxMcbLSI6BaRAumLcRqAzGADmMpTyzwjvUbI9WA
         5EmU8j2Lpw0/6fnH+Y+fWwFrhjhQ0Zp8xMwewwe72LWKNyoxRoSHMsJxA2pqYwFH28BR
         7dbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/uafQO7Db3cLUaQDzRmZMFp1yFX5GHbGqeGmV2t1IAo=;
        b=sTnDxBPbBBN3JukOdBs2dfnUilyJnstFV9DFAM2nByMqeTMRysyns52LkEnJc6HBxn
         I0hj3+7m6PTPioPVqDc2StpZDhseqc7Zyq1Zr0e0PYQ8zGSsFZDDoNH6Af58gn0Z4PHZ
         Ouu0u4Zz237zXHVlcqCwJ8s4uUxsOHPsFznBRYykavT1h1yRFuWRD9b+VhPoSsyh9383
         tqWrUzxi7U20wqh5268gCjGz4qO4pfiepFDgZHIMgLN+rx81mpBmjsApbpz7QrYDHwWt
         IPOlbObVpUC10EzWT9uUyNLqFiqrA/Rr0GODXOwnbg6oVjobM+7MH3+mEouJdvf2q2WY
         sioQ==
X-Gm-Message-State: AOAM533AQ1P8MzYUO2DbJqniGclyc8rFNuIkGj2GctIrUmVv9jl9v+kW
        NaT+r1y2dDPOwL0FxEcGIco=
X-Google-Smtp-Source: ABdhPJzEk89GMGxChZmaaKD88g7j1D4iZb6eDHqcGVpsRo6W0gJ4M1QlA0hCF8SvrADdBazg7QEe8Q==
X-Received: by 2002:a17:90a:9ed:: with SMTP id 100mr3008129pjo.119.1600938509709;
        Thu, 24 Sep 2020 02:08:29 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id 84sm2118729pfw.14.2020.09.24.02.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 02:08:29 -0700 (PDT)
Date:   Thu, 24 Sep 2020 17:08:24 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 11/20] gpiolib: cdev: support
 GPIO_V2_LINE_SET_VALUES_IOCTL
Message-ID: <20200924090824.GA20188@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-12-warthog618@gmail.com>
 <CAHp75Vd6tb09n+okJmoPse992DeoPkJQHReNBo20FQNz1V2c5w@mail.gmail.com>
 <20200924073248.GA17562@sol>
 <CAHp75Vd1=EFsT9pKunDYbXzf0D8cMvU3_n-AsD1CXpOPSa+5pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd1=EFsT9pKunDYbXzf0D8cMvU3_n-AsD1CXpOPSa+5pw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 24, 2020 at 11:21:05AM +0300, Andy Shevchenko wrote:
> On Thu, Sep 24, 2020 at 10:32 AM Kent Gibson <warthog618@gmail.com> wrote:
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
> 
> Does it mean we have a bug in the code and no test case covered it?
> Because from the API I see the parameter nbits which should prevent
> this.
> 

Probably me being thick and using nbits as the size of the mask
rather than the number of bits of interest.

Cheers,
Kent.

> > So you would need to mask lv->mask before converting it to a bitmap.
> > (I'm ok with ignoring those bits in case userspace wants to be lazy and
> > use an all 1s mask.)
> 
> Can you confirm a bug in bitmap API? If it's so it's a serious one.
> 
> > But since we're looping over the bitmap anyway we may as well just
> > count as we go.
> >
> > > for_each_set_bit(i, mask, lr->num_lines)
> > >
> >
> > Yeah, that should work.  I vaguely recall trying this and finding it
> > generated larger object code, but I'll give it another try and if it
> > works out then include it in v10.
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
