Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6CA463F2E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Nov 2021 21:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343656AbhK3U3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Nov 2021 15:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240172AbhK3U3H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Nov 2021 15:29:07 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591E0C061746
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 12:25:47 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id w1so92143206edc.6
        for <linux-gpio@vger.kernel.org>; Tue, 30 Nov 2021 12:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xpYmBvvU2DPI7NcOwAcZSrIaZbaadaJOsW8BtQ8JfsY=;
        b=QOBsF9hzrVRWPXdCFhpZuR4jsOgv/PbGcdPPNYZUt5DG4/iBezYWX1WZDgA0tgfEA6
         OJIt8S7xtfNk+N/5dUYLKcc+MPrpL4mbHNtrWzrYpoSX6/2sSaTo4TzRwoWopP/XEX5Y
         sYJaXyyAkU5FYlgR8ZFpsDSNPBLvzws/JfxDL9pxUKWpiAEk47HJv8aujeGTvQIwd88j
         KDjgQvpFeLu4jcjvLZVPg7UrlqB+0bKiX6IsFny5BNdfMP6Hgy8feP3IspXF53NG4CYE
         AQYb1Wm10vNq40KNQdLZCU5P05vBv003hxJr5usGB/BdtBz1ZhFHO3pZ9xSUw3SufWRN
         7CFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xpYmBvvU2DPI7NcOwAcZSrIaZbaadaJOsW8BtQ8JfsY=;
        b=p3Fp3Aaf4sWHRgDmnWKdCWBJ+PfyXboJoL+y63zV9M5yWqMz3AW6SrLiWjTetzUHZF
         NCKOZvfYBrBOshR+QLLbktB9va/TEcP4VicLTCcd6TIYsgYFLUGDsYJ2vQIOYdoO4fA1
         6BKEF1jIDAQuUfaOQW3oReGg13Y7yueZK5w0aiU15Zm9XckE4CE090ygrFTfF8Wd0JUq
         JRsJfwBvNNzqchrkU1aCOeXArtJ3ljRVM77uVRC4FCYolFNGAhTHd6NflA3fHMno2N7x
         jzTgMqyTnnUF1K9cB6u/QgLdG3bMgTBKXyLwXr7u1iaQO9lfIKZGXQQ1GudbhrebVArl
         5Bqw==
X-Gm-Message-State: AOAM530WDud+00Tuzx99r+6a8/O28c68BhUPQM6QkKBi1GUMn/5rbU9U
        uuHY3HcL0sjruk1IEIdIqiQCs2J0oOL3515yxMd8tg==
X-Google-Smtp-Source: ABdhPJwpOHyPwU//D02mvaCTvO/t1OLrgHo0CeWbUJpEeGnRI0W9ae13A12b4shvOogyxUNSpXpEEiT0kISG5r5dZdU=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr1567072ejc.77.1638303945785;
 Tue, 30 Nov 2021 12:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20211130154127.12272-1-brgl@bgdev.pl> <20211130154127.12272-3-brgl@bgdev.pl>
 <YaZNyMV5gX5cZpar@smile.fi.intel.com>
In-Reply-To: <YaZNyMV5gX5cZpar@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 30 Nov 2021 21:25:35 +0100
Message-ID: <CAMRc=Mf5d1i34eBez+pOYjjdyfRL9N_ha_==Cn1rANr=2CB9aQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/6] gpiolib: allow to specify the firmware node in
 struct gpio_chip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 30, 2021 at 5:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 30, 2021 at 04:41:23PM +0100, Bartosz Golaszewski wrote:
> > Software nodes allow us to represent hierarchies for device components
> > that don't have their struct device representation yet - for instance:
> > banks of GPIOs under a common GPIO expander. The core gpiolib core
>
> core .. core ?!
>
> > however doesn't offer any way of passing this information from the
> > drivers.
> >
> > This extends struct gpio_chip with a pointer to fwnode that can be set
> > by the driver and used to pass device properties for child nodes.
> >
> > This is similar to how we handle device-tree sub-nodes with
> > CONFIG_OF_GPIO enabled.
>
> Not sure I understand the proposal. Can you provide couple of (simplest)
> examples?
>
> And also it sounds like reinventing a wheel. What problem do you have that you
> need to solve this way?
>
> ...
>
> > +#if IS_ENABLED(CONFIG_OF_GPIO)
> > +     if (gc->of_node && gc->fwnode) {
> > +             pr_err("%s: tried to set both the of_node and fwnode in gpio_chip\n",
> > +                    __func__);
> > +             return -EINVAL;
> > +     }
> > +#endif /* CONFIG_OF_GPIO */
>
> I don't like this. It seems like a hack right now.
>
> Is it possible to convert all GPIO controller drivers to provide an fwnode
> rather than doing this? (I believe in most of the drivers we can drop
> completely the of_node assignment).
>

Yes, it's definitely a good idea but I would be careful with just
dropping the of_node assignments as callbacks may depend on them
later. Also it's not just about the gpio_chip of_node assignment -
drivers also use a bunch of OF APIs all around the place. I would
prefer that it be done one by one and every modified driver be tested.

Bart
