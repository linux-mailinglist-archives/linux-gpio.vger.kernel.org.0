Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28D13B52DE
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 12:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhF0KyZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 06:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhF0KyY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 06:54:24 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044ACC061574;
        Sun, 27 Jun 2021 03:51:59 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id s14so10294166pfg.0;
        Sun, 27 Jun 2021 03:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=odbYzxWNNlBWNEmkbiW2x88ov2VmYu03Mtz+ozyCCyE=;
        b=QAOImcufoxH7Cv+ETatOX2gZNjmDO4AGxCael1lP1WXSnuKkrmLIcGoFbpq/v0krKI
         MTPwuy4kFYd27HyW+ijbFsiP5oge7Q6OnXIFtz0reBifBjL2rPhxoMpHHdIrcOYxvYOL
         bvWwVH+GD4BBBOKbjCKbr5h60Tlf0h083YcVg7lc06fBkfAFZYkCK1tgS1daQz3zSqSG
         0rREWKjZ20yGEIatZox64sb7bRoBkZYg7zYYHrTPiTVu/yJQpqACnmcurHQqKBpJ6/O7
         ptolcdgqMIeIpWBGK5EHDHoSOPHDjn0F94ox1tYTmmnaOQ5N0caVX4AoItxt22wJbVrt
         4XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=odbYzxWNNlBWNEmkbiW2x88ov2VmYu03Mtz+ozyCCyE=;
        b=UULsKQ2jt6yMDztTWFcR2+G1wiav8IzkURAGmLBF72fFglQ/QawrRFxlHnZkZS6nwl
         7BMoUrhZxj5GQTHRkKLU/PAbTPJoioAzYC2Ytdwu0QrdKlI0mkX1aNKJi3MaLs/EU/rA
         4QR1dOnIu6EfoajxXHGET8BK815jZhfGBhrSZgPHSTYDZMB7SRTofVacuC4myIKWvfhb
         w2AzKFUTwUxgx8Jd5XxWs88Jzks9Qq/++TSz9aj5gaUdBRUUmoA8mcSIlHTz7/v68+5y
         3dpNKD48/IRHKCFZ05tDx0HukaNOGoulAEW5bR0P4/DfzHDxhnhT+ZainXrGH4ymnmk5
         +m9w==
X-Gm-Message-State: AOAM532tAZdc6i7f5Gg1PbUpUcqjagf0YoWamVju7zqwGCazB4c91noE
        9obdR8xKoxPZIpUkgxgqZxzjW6o2mprw1S0kEaY=
X-Google-Smtp-Source: ABdhPJyYAeh9VcZJjEq+ZpoFR0Va1m2lyWhvc/UXFI/Z3CO4UJlJbgmX/7hYb+UsrpfhS24UO39VAWnQL4UUKS9+p94=
X-Received: by 2002:a63:df10:: with SMTP id u16mr18332313pgg.4.1624791118640;
 Sun, 27 Jun 2021 03:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210626161819.30508-1-sergio.paracuellos@gmail.com>
 <CAHp75VfM-35tQMRh98mtg2XmDOJFnmjdYRKZZoi9ADm=AT2xUw@mail.gmail.com> <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
In-Reply-To: <CAMhs-H_fcNDAOHm=tZB4ku9fzeea_7f4ZLg7w5KEmcNu+8wbQQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 27 Jun 2021 13:51:22 +0300
Message-ID: <CAHp75VeN+vww=Bj=g-nx9AT0FKSGAZ8CKQZn=ff2kfQWM+dxdw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: support gpio-line-names property
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        John Thomson <git@johnthomson.fastmail.com.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neil@brown.name>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 27, 2021 at 12:47 PM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Sun, Jun 27, 2021 at 11:33 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Sat, Jun 26, 2021 at 7:18 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > The default handling of the gpio-line-names property by the
> > > gpiolib-of implementation does not work with the multiple
> > > gpiochip banks per device structure used by the gpio-mt7621
> > > driver.
> > >
> > > This commit adds driver level support for the device tree
> > > property so that GPIO lines can be assigned friendly names.

> > > This driver has three gpiochips with 32 gpios each. Core implementation
> >
> > implementation
> >
> >
> > > got gpio's repeated along each gpio chip if chip.names is not assigned.
> > > To avoid this behaviour driver will set this names as empty or
> >
> > the driver
> > these names
> >
> > > with desired friendly line names. Consider the following sample with
> > > minimal entries for the first chip with this patch changes applied:
> >
> > The same comment as per v1:
> >
> > Any idea why it's not a duplicate of
> > https://elixir.bootlin.com/linux/v5.13-rc7/C/ident/devprop_gpiochip_set_names,
> > and why the latter is not called in your case?
>
> The core properly calls this function but not in the way expected.
> This driver implements three banks of 32 gpios each internally using
> one gpiochip per bank, all of them in the same device. So the core
> code you are pointing out here duplicates the same names along the
> three gpiochips which is not the expected behaviour. So implementing
> in this way and setting names at least reserved avoids the core code
> to be run and also avoids the duplication getting expected behaviour
> for all the banks and each line friendly name.

Isn't it the problem of how we supply fwnode in that case?
Another possibility is to fix DT (although I'm not sure it's now possible).

Have you considered the above?

-- 
With Best Regards,
Andy Shevchenko
