Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575BA25FA01
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 13:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729004AbgIGL6Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 07:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729172AbgIGL6B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Sep 2020 07:58:01 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDDBC061755
        for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2020 04:58:00 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id r7so4523771ejs.11
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2020 04:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wuNizNJ6r33hGWcPZZ5Js9EvkLS7jqpgkks6hNUFhPA=;
        b=hmebUBbhYKYjFws6DyXQmTbngYhFOaYQZwILguT9XWAVUF34AkgUhucL2X83PWUz3B
         O1WILkR2ETVUXAQHnmzJ3T9TOE+BkUDSmBuGiSgS6Sp5sXm97ReIQwhxpvCiXKPYPxwl
         KmYDUbghifyxlWCuz0FXLZhOP8/WaaBorOGjV0OaPvsg96+OJ9dsVtYXdMjZspZn4Z+G
         WnnS+fADtLeE8tiSTQ84zNr/1dJ4qnng0gSHl9HGGeZ9NF0QDxScyDw1+vyr5LVHsdpY
         BHAzbAA6yL4HFjfbQwk6s5dWCoCOvVuf2PpqzV88RAQnteHZ8G9AZHlHpHrnxdKi5Hax
         Gnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wuNizNJ6r33hGWcPZZ5Js9EvkLS7jqpgkks6hNUFhPA=;
        b=QI2S6oCJ0I2iwEPS0l7rEnFj9CKnBdo0ZrmGOuY23lzBxLDP3kITbKOUhfG9bg5YGd
         Xlfv9iGNcYJcMU7O9k1nZtcjC8imUvca7FJgZDUCHjum5UJ/R7sA/GfmMiyQcsYWF4u5
         hGVeWLaAiCaSG9e0uHUAv0ZFah3eHN8LUVU0VhUrxKBmfBUPd9Oqn7i3TNOWVNfg2MLN
         kD7zEZaEcwD3ofPtxpX1qc40SARoIe+ygndernL7SAb1hoy80hvhdAlZ/I3aopVFe2LL
         6eRC/I8a2ih0OpxjBoz5lQT/Y3b9N1JLqnvDkk1bSr+f5iVSwF2xt7I3f/QJV6X3Ikgm
         j8sg==
X-Gm-Message-State: AOAM533A2hY+scANB0/Xvg709S2KfwCRKbF8EP7kIQrr1IJ+bT2Ti3gM
        Hu5Jt2fDHum5Y4IbpyF9KncBO9R94EJgspgKs75QCQ==
X-Google-Smtp-Source: ABdhPJy6SVnws0uCzDJjVt4W73YHn0MvifY/aOZ9PPy9nsKFI6ForeXnVBcXyVqA8gP/QTrekOcYQwHkOSe341Q0TzI=
X-Received: by 2002:a17:906:174e:: with SMTP id d14mr3022559eje.225.1599479879319;
 Mon, 07 Sep 2020 04:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200904154547.3836-1-brgl@bgdev.pl> <20200904154547.3836-4-brgl@bgdev.pl>
 <20200904163517.GW1891694@smile.fi.intel.com> <CAMpxmJWQsgV5WZrdPW3UUOVTEy1L6Y_rb7ThQK1QTRinmHSqWA@mail.gmail.com>
 <CAHp75VdOWdwT-e5ufsZ8MEH=YtdBgm1=TDKn3f8fJxXY4YKh9A@mail.gmail.com>
 <CAMpxmJXmY8oBpPue5v0wBvmjHkFGaUmzHScHoV-1pNEQ59am4w@mail.gmail.com> <20200907114551.GV1891694@smile.fi.intel.com>
In-Reply-To: <20200907114551.GV1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Sep 2020 13:57:48 +0200
Message-ID: <CAMpxmJWOSvCr8XthVn46qw=dqwG4cSS00z05XXbTYMOJBnjkkQ@mail.gmail.com>
Subject: Re: [PATCH 03/23] lib: uaccess: provide getline_from_user()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 1:45 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 07, 2020 at 12:28:05PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Sep 7, 2020 at 12:19 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Mon, Sep 7, 2020 at 1:05 PM Bartosz Golaszewski
> > > <bgolaszewski@baylibre.com> wrote:
> > > > On Fri, Sep 4, 2020 at 6:35 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Fri, Sep 04, 2020 at 05:45:27PM +0200, Bartosz Golaszewski wrote:
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > > > Doesn't mm/util.c provides us something like this?
> > > > > strndup_user()?
> > > > >
> > > >
> > > > Yes, there's both strndup_user() as well as strncpy_from_user(). The
> > > > problem is that they rely on the strings being NULL-terminated. This
> > > > is not guaranteed for debugfs file_operations write callbacks. We need
> > > > some helper that takes the minimum of bytes provided by userspace and
> > > > the buffer size and figure out how many bytes to actually copy IMO.
> > >
> > > Wouldn't this [1] approach work?
> > >
> > > [1]: https://elixir.bootlin.com/linux/v5.9-rc3/source/arch/x86/kernel/cpu/mtrr/if.c#L93
> > >
> >
> > Sure, but this is pretty much what I do in getline_from_user(). If
> > anything we should port mtrr_write() to using getline_from_user() once
> > it's available upstream, no?
>
> But you may provide getline_from_user() as inline in the same header where
> strncpy_from_user() is declared. It will be like 3 LOCs?
>

May be more than that. I'll see what I can do.

Bart
