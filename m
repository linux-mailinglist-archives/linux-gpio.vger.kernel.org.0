Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A367D209703
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 01:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbgFXXQT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 19:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgFXXQS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 19:16:18 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351CCC061573;
        Wed, 24 Jun 2020 16:16:18 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x8so923588plm.10;
        Wed, 24 Jun 2020 16:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=J7Jgfpk0v913z31scet/MSjYO35DmH+ex3A+IPMV7fo=;
        b=R+zT8czCoPco4eqdKUg7r//uSAx4PF4r+xr7DiUoQj3vaoQDl96ppaP14nUDjZAvLI
         j7zqnLg5UaxrCkwWmMjEdMEHXen40Oc1YISAHUExtdOYCg70NjKdVeyLy3xoUhXDNxDl
         gCBVxJYx7qxKt7/v4tqsVovAoIn0LM+cj/eVh9xzRmWzjVOSFwtoHHtFCO2pQ9gkslhV
         Fxh+1ujRIbF2Ly3ZV2c+jvuKfTZwRnFeSZjdmSh3cPQmapLkRHgz8n6o/uXP+UoMBiDx
         XYLhfGHhy5fN8PjFv34tvL6u4mkbKsvkIBQKNG4nUAmKjkYBSoF/mZ7wIKMS3YTyL3L0
         +yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=J7Jgfpk0v913z31scet/MSjYO35DmH+ex3A+IPMV7fo=;
        b=OazD1vYisS1dC9fXLAWJIRqEsIaJY1lHqOKNvDWrwNVW+dk3isvoxJeIiVwieFck1a
         2NwVX0jite0+JjobAqZrO+ydiwRM3E3NqHGZhxE9W84g14I/em6ej4lkQufZF4a1SWPf
         XtCrOWU3U3cOqmf0mQZhkYM2C7RP+yNiFP4dvK2J0tn4jowtbSH8fQ3+PIALOZ36LdsH
         4XlR18Bk/wzNHwnu9j8iC3ap1oN+TTqE5PmX2e6OxsC3J3fBitT5OTXmMj0ewMUQBnlc
         5SZ7zToon+FzcdPY6prpsKqIREwM/g+i/GW+DwVbVxG545bpPuRFo1CV/uD9JCXmxqVP
         phKQ==
X-Gm-Message-State: AOAM5321zj7cpFppBRNVkbafJAFMhZG62huGrBNaJbbG5ZX8vnqnb7D3
        qq0GxxwnPwtojyj++YKfhNY=
X-Google-Smtp-Source: ABdhPJzExJ/D4yjyy69/+V/pqc43DyAgQxfe4Wi7aYkhwVa4l25RXDKHSX5vFbYxOIqwq4xVf9LSVA==
X-Received: by 2002:a17:90b:1b06:: with SMTP id nu6mr169446pjb.106.1593040577621;
        Wed, 24 Jun 2020 16:16:17 -0700 (PDT)
Received: from sol (220-235-99-174.dyn.iinet.net.au. [220.235.99.174])
        by smtp.gmail.com with ESMTPSA id v13sm6451332pjd.9.2020.06.24.16.16.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 16:16:16 -0700 (PDT)
Date:   Thu, 25 Jun 2020 07:16:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 09/22] gpiolib: cdev: rename priv to gcdev
Message-ID: <20200624231611.GA6751@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-10-warthog618@gmail.com>
 <CAMpxmJUWZGhB3eeSquOJZQegTAwyb7yyKzBSeOjG7FSzq=BAkg@mail.gmail.com>
 <20200624141912.GB7569@sol>
 <CAMpxmJVsPjOhHymkd=8OsNJZDZUXpU83=m1M4+winaUE0RO2sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVsPjOhHymkd=8OsNJZDZUXpU83=m1M4+winaUE0RO2sg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 24, 2020 at 04:20:49PM +0200, Bartosz Golaszewski wrote:
> śr., 24 cze 2020 o 16:19 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Wed, Jun 24, 2020 at 04:04:09PM +0200, Bartosz Golaszewski wrote:
> > > wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisał(a):
> > > >
> > > > Rename priv to gcdev to improve readability.
> > > >
> > > > The name "priv" indicates that the object is pointed to by
> > > > file->private_data, not what the object is actually is.
> > > > It is always used to point to a struct gpio_chardev_data so renaming
> > > > it to gcdev seemed as good as anything, and certainly clearer than "priv".
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > >
> > >
> > > Ugh now it's gcdev and gdev everywhere and it doesn't really make it
> > > more readable. Maybe chardev_data or cdev_data?
> > >
> >
> > Agreed, it isn't ideal visually, but is at least more unique than priv.
> > Linus was going for short names recently (e.g. gc for gpiochip), so I was
> > going for something short.
> >
> > And I try avoid names ending in _data or _state or similar where they
> > don't really add anything.
> >
> > Would chardev or gchardev work for you?
> >
> 
> Yes, chardev is fine. Even cdev is fine for me: gdev vs gcdev is
> confusing but gdev vs cdev looks better IMO.
> 

OK, I was avoiding cdev to try to make the name more likely to be
globally unique, hence the leading "g".

To try to keep it short, how about attacking it from the other end and
reducing it to gcd?
That would also be in keeping with the naming convention I use in later
patches, e.g. glv for gpioline_values.
So gcd for gpio_chardev_data. Hmmm, or maybe gcdd?

Why is it that naming things is always the hardest part ;-)?

Cheers,
Kent.
