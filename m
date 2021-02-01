Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DBB830A814
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 13:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhBAMyY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 07:54:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhBAMyI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 07:54:08 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C0FC061756
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 04:53:27 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id s5so5820530edw.8
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 04:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3eIFLO6gcTC+HOEchhTJlK1X6uQRhm8SR5Gz1o+7PJc=;
        b=tEV1HKdpNY7Eq/+mVI5QcQLUaQpUlNIn0lcn/RWb61XXd+iq8KpJjI8FTdehbKwYhH
         sEjYCkuyQj4OpGr1BZdo4wBDtAmB1NuaV0D5DIPlBsFuzDno1bfxD3TJC6vtU37m1teM
         kDJ2fnmpsn5iVMeBLQcOXxY105x2NoBLvE/M9BEJN9D1YSTMAyMAd/LLjpuobb+KIFkr
         naSzBv2q5FuqcrO1ZiKQJ69YGZRvrgcb+fGrGDKxXPgyBVgfMal8gUBpKll4mo2bMsgn
         s39eFKTd3LA/KVVMBBXTICWehhGn/LAgZx/RybQUcXddkxzZp4pIzleTjv7xbvHE5odE
         wxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3eIFLO6gcTC+HOEchhTJlK1X6uQRhm8SR5Gz1o+7PJc=;
        b=PWBWwyu4sLcI2TYDWSCIzJkOZyq4TMgPB/+/Ic2nLTjsY2NlPTk2yL3/7x1F9Gz7WZ
         vwZMIn1kYxW/ZW0qGZ8TTTJnnJ1bHXTt7Jdv1Z+ik33qZ5Wpm/iyqiKeWb+1r/CR9h7g
         1Wb7UU8Ci827bMavdAgRYFHxB97QzJImwzmse4yBsPJy3JH+l40bs4HOXseuaJWAI4Hb
         5jTOXgmw+EO4beHt8Eu31uM2D8aXFi8vviSUFlREgkGGJSbmmHpwXepNt8mBOTrG+PX4
         Z+P2UNfjD9O+2VQ5mppOqIucAXXKp/uqVrHHWAsz/w1t2410O9bP3AMEGEshtCfUcdW7
         btaQ==
X-Gm-Message-State: AOAM531FHiYsSwAkocnJZscfV3fWdzxvX5xrujMgJorlAJe7qc3lkVLD
        BNUI4RddFJi21hZM/4KrWJLaDUYogPp9T9WhBhSK/vNJ9vU=
X-Google-Smtp-Source: ABdhPJwxyb3S+6e9z093dJCYq8ljq+qOT8B6hL0Gqe2E2UepQSwywkelqYNhgz0ydJSg0g2aGxGQYWVM6c92Pgf2Ubw=
X-Received: by 2002:aa7:db1a:: with SMTP id t26mr19333773eds.25.1612184006707;
 Mon, 01 Feb 2021 04:53:26 -0800 (PST)
MIME-Version: 1.0
References: <20210129134624.9247-1-brgl@bgdev.pl> <20210129134624.9247-9-brgl@bgdev.pl>
 <YBQwUkQz3LrG5G4i@smile.fi.intel.com> <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
 <YBfX38JBa0psBizQ@smile.fi.intel.com> <CAMRc=Mfgw5oA-TA2PN-Z+ape0POAtLwVeDJnzH1iuzKw5wYQ5Q@mail.gmail.com>
 <YBf4zjo7JJaw5iu1@smile.fi.intel.com>
In-Reply-To: <YBf4zjo7JJaw5iu1@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 1 Feb 2021 13:53:16 +0100
Message-ID: <CAMRc=MfzxmE-+SSOp6HoV1i7hZ3dNgGgrQCeDjUUkbeXJFOhzw@mail.gmail.com>
Subject: Re: [PATCH 8/8] gpio: sim: new testing module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 1, 2021 at 1:49 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 01, 2021 at 11:59:31AM +0100, Bartosz Golaszewski wrote:
> > On Mon, Feb 1, 2021 at 11:28 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sat, Jan 30, 2021 at 09:37:55PM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Jan 29, 2021 at 4:57 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Fri, Jan 29, 2021 at 02:46:24PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > > +static int gpio_sim_set_config(struct gpio_chip *gc,
> > > > > > +                               unsigned int offset, unsigned long config)
> > > > > > +{
> > > > > > +     struct gpio_sim_chip *chip = gpiochip_get_data(gc);
> > > > > > +
> > > > > > +     switch (pinconf_to_config_param(config)) {
> > > > >
> > > > > > +     case PIN_CONFIG_BIAS_PULL_UP:
> > > > > > +             return gpio_sim_apply_pull(chip, offset, 1);
> > > > > > +     case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > > > +             return gpio_sim_apply_pull(chip, offset, 0);
> > > > >
> > > > > But aren't we got a parameter (1 or 0) from config? And hence
> > > > >
> > > > >         case PIN_CONFIG_BIAS_PULL_UP:
> > > > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > >                 return gpio_sim_apply_pull(chip, offset, <param>);
> > > > >
> > > > > ?
> > > >
> > > > I believe this is more explicit and so easier to read if you don't
> > > > know the GPIO and pinctrl internals.
> > >
> > > If we ever go to change meanings of the values in param, it will require to fix
> > > this occurrence which seems to me suboptimal.
> > >
> >
> > Why would we do it? This is internal to this driver.
> >
> > > > > > +     default:
> > > > > > +             break;
> > > > > > +     }
> > > > > > +
> > > > > > +     return -ENOTSUPP;
> > > > > > +}
>
> Up to you.
> My personal vote for using the embedded param, because it makes code consistent
> and if anybody takes this driver as an example for something, it will be better
> example in such case..
>
> ...
>
> > > > > > +static ssize_t gpio_sim_sysfs_line_store(struct device *dev,
> > > > > > +                                      struct device_attribute *attr,
> > > > > > +                                      const char *buf, size_t len)
> > > > > > +{
> > > > > > +     struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
> > > > > > +     struct gpio_sim_chip *chip = dev_get_drvdata(dev);
> > > > > > +     int ret, val;
> > > > >
> > > > > > +     ret = kstrtoint(buf, 0, &val);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +     if (val != 0 && val != 1)
> > > > > > +             return -EINVAL;
> > > > >
> > > > > kstrtobool() ?
> > > > >
> > > >
> > > > No, we really only want 0 or 1, no yes, Y etc.
> > >
> > > Side note: But you allow 0x00001, for example...
> >
> > Good point. In that case we should check if len > 2 and if buf[0] ==
> > '1' or '0' and that's all we allow.
>
> Up to you also. I don't like such a strictness. OTOH we can relax afterwards if
> needed.
>
> > > Then why not to use unsigned type from the first place and add a comment?
> > >
> > > > > > +     ret = gpio_sim_apply_pull(chip, line_attr->offset, val);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > > +     return len;
> > > > > > +}
>
> ...
>
> > > > > > +struct gpio_sim_chip_config {
> > > > > > +     struct config_item item;
> > > > > > +
> > > > > > +     /*
> > > > > > +      * If pdev is NULL, the item is 'pending' (waiting for configuration).
> > > > > > +      * Once the pointer is assigned, the device has been created and the
> > > > > > +      * item is 'live'.
> > > > > > +      */
> > > > > > +     struct platform_device *pdev;
> > > > >
> > > > > Are you sure
> > > > >
> > > > >         struct device *dev;
> > > > >
> > > > > is not sufficient?
> > > > >
> > > >
> > > > It may be but I really prefer those simulated devices to be on the platform bus.
> > >
> > > My point here is that there is no need to keep specific bus devices type,
> > > because you may easily derive it from the struct device pointer. Basically if
> > > you are almost using struct device in your code (seems to me the case), you
> > > won't need to carry bus specific one and dereference it each time.
> >
> > But don't we need a bus to even register a device? I haven't checked
> > in a long time but IIRC it's mandatory.
> >
> > Let me give you a different argument - the platform device offers a
> > very simple API for registering devices with properties being
> > duplicated behind the scenes etc. It seems to me that registering a
> > bare struct device * would take more boiler-plate code for not much
> > gain.
>
> Yes, I'm not objecting the platform bus choice. I'm objecting the keeping of
> the pointer to the bus specific structure.
>
> There are helpers like to_platform_device() which make the bus specific
> pointers go away from the structures and easier code when you use exactly
> pointer to struct device rather than bus specific one.
>

Ok I get it. We almost never dereference it though. We do it in probe,
but there's no way around it. In sysfs callbacks we already get a
pointer to struct device. And when unregistering the platform device,
we need to pass it as struct platform_device anyway. I don't see any
gain from that and would prefer to keep it as is.

Bart
