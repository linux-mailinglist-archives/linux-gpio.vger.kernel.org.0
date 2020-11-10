Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFDF2AD8D1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgKJOaX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730070AbgKJOaX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:30:23 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61862C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:30:23 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id t9so9543157edq.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9UIQJmL6CczJN1YVw46FpLH86rortdNWMolvQmvlA0w=;
        b=Nkf0L0dAG4Pd2L2ZUyEuEzLkoXrXSEwkYNAeeyVifS3VQCjRF5fUejF+TVuxZ/Rcen
         KdNe0TudgmM4epxXQDbhPupra6eTM8pt4qqJtU/k4ekQugs0YCtCB7dijJMsIvUZZJBZ
         SJevEiBW5nTC6/F5rZ5FD5+6QfoUJ/PHK5fHvtKG2S40SdrEG5j72qMBSdfQssS604Nx
         UdNac0knHgVxwEaxcTZfo9UL1iwz2tPLus6WyeDc40yHiaaIxw0uwXVGBs8uh5KGyAfg
         P9QKfAdm+vGWyjVDQw3WRD4pyJCvcbs/hX7MGXZEGClwqZNoLYck9Z2M8NRf0FWyulkG
         lT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UIQJmL6CczJN1YVw46FpLH86rortdNWMolvQmvlA0w=;
        b=aTedU0mCsAIJZzq97lcnH0kLuO7kLIbZxAK6BhldVCcJsIRw/h7Fhmr0uQBdX+G6nI
         BRjDemHiCrTeWJoq4+gw/hPPhSFIMhjZULv+8NtgsWqBeCJgEcl91fCQsSJxxgvlzQTj
         nZwApaTLuWS9s/I2HZDDnLbik8xXLA78tT7ztmf+cQJzkKUDNr30xlFQCCpt7gXCSa+4
         7RNyvdE3KGtEOAilK07a/g+XnVtDONPFozA3eyOMonvjSZvjWjXeyh/GLG0iQYjjGyle
         KmraBBHgZlK1gEbjAAyumvIm3YAvpk6nytZ766zYN1EXyynBCtIwhqulVPNIS/16LIN0
         Od7A==
X-Gm-Message-State: AOAM531pUHrDZk5gAv2hsyqNJcBpyN9pu7smbF4h9OJ2vLCjH4NYXwfv
        J4fTDSJY0SPUSNGn0KlMIltryaX/aSl/yRzoQ8n2yg==
X-Google-Smtp-Source: ABdhPJz6xO1+lM+CtQTxVBKrJk5kCsE9pzYWKXBFPpph7mZWBiWcSltCMAQWErj7UoyQdvIx+FOy7WoQ/E5a6gZTmdU=
X-Received: by 2002:a50:ab15:: with SMTP id s21mr21074123edc.88.1605018621972;
 Tue, 10 Nov 2020 06:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20201110123406.3261-1-brgl@bgdev.pl> <20201110123406.3261-7-brgl@bgdev.pl>
 <20201110142624.GT4077@smile.fi.intel.com> <20201110142750.GU4077@smile.fi.intel.com>
In-Reply-To: <20201110142750.GU4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 10 Nov 2020 15:30:10 +0100
Message-ID: <CAMpxmJUQ3t02q-Chd-WE+pYRAsOOEnbQ0jB+G_uAGv+sJBK1tg@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] gpio: exar: switch to using regmap
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 3:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 10, 2020 at 04:26:24PM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 10, 2020 at 01:34:05PM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > We can simplify the code in gpio-exar by using regmap. This allows us to
> > > drop the mutex (regmap provides its own locking) and we can also reuse
> > > regmap's bit operations instead of implementing our own update function.
> >
> > ...
> >
> > > +   /*
> > > +    * We don't need to check the return values of mmio regmap operations (unless
> > > +    * the regmap has a clock attached which is not the case here).
> > > +    */
> > > +   exar_gpio->regs = devm_regmap_init_mmio(dev, p, &exar_regmap_config);
> > > +   if (IS_ERR(exar_gpio->regs))
> > > +           return PTR_ERR(exar_gpio->regs);
> > >
> > >     index = ida_alloc(&ida_index, GFP_KERNEL);
> > > -   if (index < 0) {
> > > -           ret = index;
> > > -           goto err_mutex_destroy;
> > > -   }
> > > +   if (index < 0)
> > > +           return index;
> >
> > And below you effectively use p as regmap!
> > That's what renaming of variable regs -> regmap or map can easily reveal.
> >
> >       exar_gpio->regs = p;
>
> Jan, if you remove this line, does it help?
>

Ha! I guess you were right saying that keeping the name is asking for
trouble then. :)

I think that may be it but address width should still be changed to 16.

Bartosz
