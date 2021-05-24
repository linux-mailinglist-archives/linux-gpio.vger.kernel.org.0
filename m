Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E5338E6E4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 14:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbhEXMtd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 08:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbhEXMtc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 08:49:32 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAF0C061574;
        Mon, 24 May 2021 05:48:03 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id g18so19092218pfr.2;
        Mon, 24 May 2021 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNATQPXCHqo6W4bfJlq6Weg8Cm+bnIyKUInS/JSGSD4=;
        b=pc/qu/BkCRzgodJu5jz5PuyodDFdWvuGyD+UCZSpVRBhzwClgBPCJKnUGI1wPv7Qel
         68cm5mM1fFSfBOkUfeN1OCYLj0O2iKwVdavJnU84Dp9Z6dN6UTDk0FnRdPJTwHzy+VKS
         FXhEbaUxi3J4xYMdvgaPKtr5Q5xzPHWRXuRQSXSOmofQxscpnF5v9t2AIzlXFMoi5Yzd
         o98g5LqXSvCv2jxyod3wqdlcBwNnIyICL1G2Sy14+l/qmA/VNRhQeFYwGQONCE0gbz9x
         cA39If1DVwY+12SS/jmVGh8nu0WtPS1uQzZcW3zHYBeb7fdbrY7bnKkg8Y2U/ooxwwyL
         KSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNATQPXCHqo6W4bfJlq6Weg8Cm+bnIyKUInS/JSGSD4=;
        b=dVbAyugZRrGa023hLTGrMeLXkq0ORP2keGqPGjawRktEYO8NnKMRckyM/ixuc6DGpv
         kBQS6ZHxEVtkUTqy0iuoBspIM+pVWJ7gC9gg86hJeQXbHi6Z1dN/c9xbIXztvWtYIEoW
         CxHrXvYa6NfuRE/4Piy70cBbWjzDx0fU/I6GYg9KHf+JdRIYlGD64UrwKMnSmmfXSnyy
         yFXkKaHBEFwrfq6ck2+O3UJZ4rc/gZGe8FyfapshWIa9ec4VYo8TrF/IbTn1UgpQD/t3
         btipPZg0b9nVVgHGsw+mh9JeneQbt3a2ODTI82r1mVu8BMb8JB+7WBc4dO489yFzs4o/
         NCDQ==
X-Gm-Message-State: AOAM530Ni+WeCe5N2m++IrppBm2pHSCm/X8pz4k9mczOzO9jkgrb/7uu
        gqpoHAX3/HPkqLvsXJBnNb1fN0sqgDyuFVXDOhM=
X-Google-Smtp-Source: ABdhPJzWplVZVVHOiJEAAS61tTN++D2R0EqzKEkFqB224r/OOVXTz3cs88eBTzYTf5+Z2EKbRy/M1PHbZ4Ix5rAwV3o=
X-Received: by 2002:a63:b507:: with SMTP id y7mr5986931pge.74.1621860483387;
 Mon, 24 May 2021 05:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621809029.git.sander@svanheule.net> <213ab7580a1d3229d32f7aac67bf4e828612153a.1621809029.git.sander@svanheule.net>
 <CAHp75VdoSfO3Y9Lf+fcoG2=Rb+SBJKq+B0tG+gS7TaHUmN-iYg@mail.gmail.com> <08375439546c04d32b158c20fb59446c3bbafb46.camel@svanheule.net>
In-Reply-To: <08375439546c04d32b158c20fb59446c3bbafb46.camel@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 15:47:47 +0300
Message-ID: <CAHp75VfbdmHPsscHOAnH-WjGyWF-8V_00FjQu1PD+xFLcUytig@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] leds: Add support for RTL8231 LED scan matrix
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 3:04 PM Sander Vanheule <sander@svanheule.net> wrote:
> On Mon, 2021-05-24 at 13:24 +0300, Andy Shevchenko wrote:
> > On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net> wrote:

...

> > > +       if (ret != 2)
> > > +               return -ENODEV;
> >
> > I would say -EINVAL, but -ENODEV is similarly okay.
>
> Any specific reason you think EINVAL is more appropriate than ENODEV?

My logic is that the initial values (from resource provider) are incorrect.
But as I said, I'm fine with either.

...

> > > +       int err;
> >
> > ret or err? Be consistent across a single driver.
>
> I had first used 'err' for both fwnode_property_count_u32() and
> fwnode_property_read_u32_array(). The former returns "actual count or error
> code", while the latter is only "error code". And I found it weird to read the
> code as "does error code equal 2", if I used 'err' as variable name.
>
> I've split this up:
>  * addr_count for fwnode_property_count_u32's result
>  * err for fwnode_property_read_u32_array's result
>
> Since addr_count is only used before err is touched, I guess the compiler will
> optimize this out anyway?

Usually we do this pattern (and it seems you missed the point, name of
variable is ret in some functions and err in the rest):

err /* ret */ = foo();
if (err < 0)
  return err;
count = err;

-- 
With Best Regards,
Andy Shevchenko
