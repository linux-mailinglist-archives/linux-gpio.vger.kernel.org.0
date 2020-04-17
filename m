Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C58991AE6FF
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 22:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgDQUxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 16:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726093AbgDQUxy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Apr 2020 16:53:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACC8C061A0C
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 13:53:54 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r7so3417414ljg.13
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gDUCAxJRtphv9D4Hcf/U44rKp9a6Ovlm9jb19yNSOzo=;
        b=KjHCG9nloGBgH+TklA3rPveUa+Yx7wcv8peNY/dXVEZyzL/dqP+AwmdmszRQaAY0um
         DBfXA7LeQ9tZWX5VvoBV+3pXYOhADCYzCqivPqw2nSNbqT1lRz7o9eweWxSlu8Mn1oZq
         KoO5BrrK8E3CvpHoYO3EcLhyAammnoo/c3c7YaGizEr+tk9jgM14XG+a6+Gi09nymWIF
         vexwxOK11gkOBp8QPlgvzKN51QbzILwlVmoawLCnAGmUNyiTyyDD9Lz8S81wixlPfGks
         hQFm4KEq3NfwZpanJ2RoWvy9kgNTgc9QPTC6tOKwh1PLAxMywM4StYIqbQmexY4Zrh0h
         EENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gDUCAxJRtphv9D4Hcf/U44rKp9a6Ovlm9jb19yNSOzo=;
        b=kiWXviPaQKsavx3asJKN8H9KpDCyNCgAYPKJZl3Eidjcj4qZuGD1KVv6em8OeCZt7l
         bjbJnH/9zyxERv0hvqsvXKiMV+ysATtrUAwDxxIiSJ9jbSSNQLrkuonuGe6j+CFI1CHd
         YGA/jiBiw8Qh+kxxUk9LFnO4p8hOPDGXBduQBv4Z24YY2g0lD3Jmbpr3hhFvIzqVCo7i
         MeFYFQA64I0nK6Or1Qybu6oBlRtPLwx1nK4DzC54DhKjwZFg8jxg/oW/RO0P/DyE79Cd
         UxijbbPLqlUSkgeJW16sZxOBVSLwlwJQE0Mbsl5wbCq4l/+SZ5K3Dw2NrH7u+44LB7Zr
         FVGg==
X-Gm-Message-State: AGi0PuYIIg1Zcs45UyKuf+lvne3G+Wiu4J2Z9ZTk6JNsu1e+6qKj1MFO
        DXGLYwrwFbg03bvDFGHoa7s=
X-Google-Smtp-Source: APiQypJXC7lQHfTf2jqEvRXFwkbRXZCTX3OQX50pU8GY0d9Roq93DdiMyfGT/vKfhFBXkeOYfwrS6A==
X-Received: by 2002:a05:651c:20a:: with SMTP id y10mr3165596ljn.69.1587156832763;
        Fri, 17 Apr 2020 13:53:52 -0700 (PDT)
Received: from mobilestation ([176.213.3.142])
        by smtp.gmail.com with ESMTPSA id j13sm18768094lfb.19.2020.04.17.13.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 13:53:52 -0700 (PDT)
Date:   Fri, 17 Apr 2020 23:53:49 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 13/14] gpio: dwapb: Use positive conditional in
 dwapb_configure_irqs()
Message-ID: <20200417205349.mv5y6tqwbxuoqnle@mobilestation>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-14-andriy.shevchenko@linux.intel.com>
 <20200415163710.e26czil5abouujzu@mobilestation>
 <CACRpkdaO8GMXOOMomzmzfhDqYfgdhjTq8XvQHXuGRmnrfk7bOw@mail.gmail.com>
 <20200416134805.r5qp4o34rpxr2h2d@mobilestation>
 <CACRpkdYCOHQ-e8sswUqv=exuKEasanWKUjPOjsvGDQC5sV4C4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYCOHQ-e8sswUqv=exuKEasanWKUjPOjsvGDQC5sV4C4g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 12:42:33PM +0200, Linus Walleij wrote:
> On Thu, Apr 16, 2020 at 3:48 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Thu, Apr 16, 2020 at 01:53:25PM +0200, Linus Walleij wrote:
> > > On Wed, Apr 15, 2020 at 6:37 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > > > On Wed, Apr 15, 2020 at 05:15:33PM +0300, Andy Shevchenko wrote:
> > > > > The negative conditionals are harder to parse by reader.
> > > > > Switch to positive one in dwapb_configure_irqs().
> > > >
> > > > Sorry as for me this modification is redundant. Yes, I know that if-else
> > > > statement in some cases better to start with positive expression to make it
> > > > a bit more clear, but in this case I'd leave it as is. First this rule is
> > > > applicable if both branches are more or less equal, but here I see the most
> > > > normal case of using the dt-based generic device, which doesn't declare the
> > > > IRQs as shared seeing it is selected by far more devices at the moment.
> > > > Second the non-shared IRQs case also covers a combined and multiple-lined
> > > > GPIO IRQs (chained cascaded GPIO irqchip), while the irq_shared clause have
> > > > only a single IRQ source supported. Finally If the code was like you
> > > > suggested from the very beginning I wouldn't say a word, but this patch seems
> > > > to me at least just moving the code around with gaining less than we have at
> > > > the moment.
> > > >
> > > > Linus, Bartosz and other GPIO-ers may think differently though. Lets see their
> > > > opinion.
> > >
> > > I think I already applied all patches with the batch application tool b4,
> > > without properly checking which patches you reviewed and not, sorry :(
> > >
> > > However if any change is controversial I can revert or pull the patch out.
> >
> > In this case it's up to you to decide.
> 
> I backed out the last two patches now and kept the rest except 13 and 14.

Ok. Thanks.

Regards,
-Sergey

> 
> Yours,
> Linus Walleij
