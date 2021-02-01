Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4894B30A60F
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 12:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbhBALBD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 06:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233338AbhBALAY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 06:00:24 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AFBC061574
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 02:59:43 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id l9so23677331ejx.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 02:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lx4W7u0ABpsM7eUPv7hFsdl/vMIH6Tgd275uM+E90PA=;
        b=CYaYjyJGWa9M5woKY7/2n3Stl/0XdwpBHtLmupB/ZGWB4aGiwXU5iH9Ob2XBKYqQaS
         vdx5TDUSMXGBCdc2VqARO0cau3yrkhtUyL2HutROj62M4gYYFGuCUTwOLKSgdP2f0qgP
         V6VG7RpOxTf4HTXGru7sG1HUp5vc+ZJRdWD/m0a9DaOCo4UdUvK7g64Alr3F4+4DVp/k
         iJaUIllZupaT44gFREQ8KC1Ak/mRYKDCizxYM66D5z//WHydmd3RM8vFhOzRFxaEcI5j
         iAaSMPfCbJ9ThaOBZO2dLNXhzgpI41Xd1Ah0C2K4fpipxM06pMwhzz5hSKILElSviv2B
         JeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lx4W7u0ABpsM7eUPv7hFsdl/vMIH6Tgd275uM+E90PA=;
        b=oKXqpV8IEP9SKmv4PE8klIwpm9cCTIFMDptlh+fa1DCPf9QCJ8GS/YnZRCy6aqMfOQ
         TNtW5c7HQ3mbxnjz7T47ABjwWgOJsPoSgTRq7USDsGGzVJQNPj66NwAs9vZqxYnS7XEy
         FktcRc028wORgCYDWJTvgP+rfqvaTIZbTauX2OB+14jSjBYiMVoe5De8u6cwPc7w6GkP
         aRWsFatVHSKfRbKKQowK+nVRwkbhT0ie64AEPlGCdiBLzKKnZ0rtktx2YTAdcA5jp1xq
         hNK6Le8IoNegefwhu44HV/Iiv5pJ7IBo2KIH+EhWFC8DdJBr1wZoBWKHkr3Gg6QgdAQz
         Vm1w==
X-Gm-Message-State: AOAM5311ZQnt5SnC0wzhJD8YEhm2gUXtfI8YSd+Mtjg+Retrhw0cVyJG
        ydsEJBIwaQV7f3ba1krACgby7U0qRUlQ4I7i0cDXSQ==
X-Google-Smtp-Source: ABdhPJwjRHR8jRfbLq1RCIKHxZhV2YMK/caZS3zW7teEVN9nXdPPVMMHewbZfPTd+X2XEDvLqIdDgSN14peEiWum+Qk=
X-Received: by 2002:a17:906:e03:: with SMTP id l3mr9190234eji.64.1612177182408;
 Mon, 01 Feb 2021 02:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20210129134624.9247-1-brgl@bgdev.pl> <20210129134624.9247-9-brgl@bgdev.pl>
 <YBQwUkQz3LrG5G4i@smile.fi.intel.com> <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
 <YBfX38JBa0psBizQ@smile.fi.intel.com>
In-Reply-To: <YBfX38JBa0psBizQ@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 1 Feb 2021 11:59:31 +0100
Message-ID: <CAMRc=Mfgw5oA-TA2PN-Z+ape0POAtLwVeDJnzH1iuzKw5wYQ5Q@mail.gmail.com>
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

On Mon, Feb 1, 2021 at 11:28 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sat, Jan 30, 2021 at 09:37:55PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Jan 29, 2021 at 4:57 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Jan 29, 2021 at 02:46:24PM +0100, Bartosz Golaszewski wrote:
>
> ...
>
> > > > +static int gpio_sim_set_config(struct gpio_chip *gc,
> > > > +                               unsigned int offset, unsigned long config)
> > > > +{
> > > > +     struct gpio_sim_chip *chip = gpiochip_get_data(gc);
> > > > +
> > > > +     switch (pinconf_to_config_param(config)) {
> > >
> > > > +     case PIN_CONFIG_BIAS_PULL_UP:
> > > > +             return gpio_sim_apply_pull(chip, offset, 1);
> > > > +     case PIN_CONFIG_BIAS_PULL_DOWN:
> > > > +             return gpio_sim_apply_pull(chip, offset, 0);
> > >
> > > But aren't we got a parameter (1 or 0) from config? And hence
> > >
> > >         case PIN_CONFIG_BIAS_PULL_UP:
> > >         case PIN_CONFIG_BIAS_PULL_DOWN:
> > >                 return gpio_sim_apply_pull(chip, offset, <param>);
> > >
> > > ?
> >
> > I believe this is more explicit and so easier to read if you don't
> > know the GPIO and pinctrl internals.
>
>
> If we ever go to change meanings of the values in param, it will require to fix
> this occurrence which seems to me suboptimal.
>

Why would we do it? This is internal to this driver.

> > > > +     default:
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     return -ENOTSUPP;
> > > > +}
>
> ...
>
> > > > +static ssize_t gpio_sim_sysfs_line_store(struct device *dev,
> > > > +                                      struct device_attribute *attr,
> > > > +                                      const char *buf, size_t len)
> > > > +{
> > > > +     struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
> > > > +     struct gpio_sim_chip *chip = dev_get_drvdata(dev);
> > > > +     int ret, val;
> > >
> > > > +     ret = kstrtoint(buf, 0, &val);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +     if (val != 0 && val != 1)
> > > > +             return -EINVAL;
> > >
> > > kstrtobool() ?
> > >
> >
> > No, we really only want 0 or 1, no yes, Y etc.
>
> Side note: But you allow 0x00001, for example...

Good point. In that case we should check if len > 2 and if buf[0] ==
'1' or '0' and that's all we allow.

>
> Then why not to use unsigned type from the first place and add a comment?
>
> > > > +     ret = gpio_sim_apply_pull(chip, line_attr->offset, val);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     return len;
> > > > +}
>
> ...
>
> > > > +struct gpio_sim_chip_config {
> > > > +     struct config_item item;
> > > > +
> > > > +     /*
> > > > +      * If pdev is NULL, the item is 'pending' (waiting for configuration).
> > > > +      * Once the pointer is assigned, the device has been created and the
> > > > +      * item is 'live'.
> > > > +      */
> > > > +     struct platform_device *pdev;
> > >
> > > Are you sure
> > >
> > >         struct device *dev;
> > >
> > > is not sufficient?
> > >
> >
> > It may be but I really prefer those simulated devices to be on the platform bus.
>
> My point here is that there is no need to keep specific bus devices type,
> because you may easily derive it from the struct device pointer. Basically if
> you are almost using struct device in your code (seems to me the case), you
> won't need to carry bus specific one and dereference it each time.
>

But don't we need a bus to even register a device? I haven't checked
in a long time but IIRC it's mandatory.

Let me give you a different argument - the platform device offers a
very simple API for registering devices with properties being
duplicated behind the scenes etc. It seems to me that registering a
bare struct device * would take more boiler-plate code for not much
gain.

Bartosz

> > > > +     /*
> > > > +      * Each configfs filesystem operation is protected with the subsystem
> > > > +      * mutex. Each separate attribute is protected with the buffer mutex.
> > > > +      * This structure however can be modified by callbacks of different
> > > > +      * attributes so we need another lock.
> > > > +      */
> > > > +     struct mutex lock;
> > > > +
> > > > +     char label[32];
> > > > +     unsigned int num_lines;
> > > > +     char **line_names;
> > > > +     unsigned int num_line_names;
> > > > +};
>
> ...
>
> > > Honestly, I don't like the idea of Yet Another (custom) Parser in the kernel.
> > >
> > > Have you investigated existing parsers? We have cmdline.c, gpio-aggregator.c,
> > > etc. Besides the fact of test cases which are absent here. And who knows what
> > > we allow to be entered.
> > >
> >
> > Yes, I looked all around the kernel to find something I could reuse
> > but failed to find anything useful for this particular purpose. If you
> > have something you could point me towards, I'm open to alternatives.
> >
> > Once we agree on the form of the module, I'll port self-tests to using
> > it instead of gpio-mockup, so we'll have some tests in the tree.
>
> I will look again when you send a new version, so I might give some hints.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
