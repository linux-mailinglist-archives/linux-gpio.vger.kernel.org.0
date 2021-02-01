Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903F630A55A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 11:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbhBAKaq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 05:30:46 -0500
Received: from mga17.intel.com ([192.55.52.151]:18699 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233111AbhBAKal (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Feb 2021 05:30:41 -0500
IronPort-SDR: N96PxczB/xvaorRrl2kmiwfq0W2EsFn6uv1M1qntQiNDxWd3j1kkSGUcWWjoIcWBzTrrTIi/Yp
 FaZ/nCB/hvrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="160431215"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="160431215"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 02:28:54 -0800
IronPort-SDR: J9R3ax7MyC7rExwiEqkb+Wt6vqctsjzO7ltEF90QLwtAnN26ZUjP7j/QgSdYCViQbwKaaNaIFb
 s0LHX6Y8MR0A==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="432282604"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 02:28:51 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l6WRs-0016HE-0L; Mon, 01 Feb 2021 12:28:48 +0200
Date:   Mon, 1 Feb 2021 12:28:47 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 8/8] gpio: sim: new testing module
Message-ID: <YBfX38JBa0psBizQ@smile.fi.intel.com>
References: <20210129134624.9247-1-brgl@bgdev.pl>
 <20210129134624.9247-9-brgl@bgdev.pl>
 <YBQwUkQz3LrG5G4i@smile.fi.intel.com>
 <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeSy4zWOAGxfoBih62WxAXuOLtkK3ROyt+4LuqLvDxtaQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 30, 2021 at 09:37:55PM +0100, Bartosz Golaszewski wrote:
> On Fri, Jan 29, 2021 at 4:57 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Jan 29, 2021 at 02:46:24PM +0100, Bartosz Golaszewski wrote:

...

> > > +static int gpio_sim_set_config(struct gpio_chip *gc,
> > > +                               unsigned int offset, unsigned long config)
> > > +{
> > > +     struct gpio_sim_chip *chip = gpiochip_get_data(gc);
> > > +
> > > +     switch (pinconf_to_config_param(config)) {
> >
> > > +     case PIN_CONFIG_BIAS_PULL_UP:
> > > +             return gpio_sim_apply_pull(chip, offset, 1);
> > > +     case PIN_CONFIG_BIAS_PULL_DOWN:
> > > +             return gpio_sim_apply_pull(chip, offset, 0);
> >
> > But aren't we got a parameter (1 or 0) from config? And hence
> >
> >         case PIN_CONFIG_BIAS_PULL_UP:
> >         case PIN_CONFIG_BIAS_PULL_DOWN:
> >                 return gpio_sim_apply_pull(chip, offset, <param>);
> >
> > ?
> 
> I believe this is more explicit and so easier to read if you don't
> know the GPIO and pinctrl internals.


If we ever go to change meanings of the values in param, it will require to fix
this occurrence which seems to me suboptimal.

> > > +     default:
> > > +             break;
> > > +     }
> > > +
> > > +     return -ENOTSUPP;
> > > +}

...

> > > +static ssize_t gpio_sim_sysfs_line_store(struct device *dev,
> > > +                                      struct device_attribute *attr,
> > > +                                      const char *buf, size_t len)
> > > +{
> > > +     struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
> > > +     struct gpio_sim_chip *chip = dev_get_drvdata(dev);
> > > +     int ret, val;
> >
> > > +     ret = kstrtoint(buf, 0, &val);
> > > +     if (ret)
> > > +             return ret;
> > > +     if (val != 0 && val != 1)
> > > +             return -EINVAL;
> >
> > kstrtobool() ?
> >
> 
> No, we really only want 0 or 1, no yes, Y etc.

Side note: But you allow 0x00001, for example...

Then why not to use unsigned type from the first place and add a comment?

> > > +     ret = gpio_sim_apply_pull(chip, line_attr->offset, val);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     return len;
> > > +}

...

> > > +struct gpio_sim_chip_config {
> > > +     struct config_item item;
> > > +
> > > +     /*
> > > +      * If pdev is NULL, the item is 'pending' (waiting for configuration).
> > > +      * Once the pointer is assigned, the device has been created and the
> > > +      * item is 'live'.
> > > +      */
> > > +     struct platform_device *pdev;
> >
> > Are you sure
> >
> >         struct device *dev;
> >
> > is not sufficient?
> >
> 
> It may be but I really prefer those simulated devices to be on the platform bus.

My point here is that there is no need to keep specific bus devices type,
because you may easily derive it from the struct device pointer. Basically if
you are almost using struct device in your code (seems to me the case), you
won't need to carry bus specific one and dereference it each time.

> > > +     /*
> > > +      * Each configfs filesystem operation is protected with the subsystem
> > > +      * mutex. Each separate attribute is protected with the buffer mutex.
> > > +      * This structure however can be modified by callbacks of different
> > > +      * attributes so we need another lock.
> > > +      */
> > > +     struct mutex lock;
> > > +
> > > +     char label[32];
> > > +     unsigned int num_lines;
> > > +     char **line_names;
> > > +     unsigned int num_line_names;
> > > +};

...

> > Honestly, I don't like the idea of Yet Another (custom) Parser in the kernel.
> >
> > Have you investigated existing parsers? We have cmdline.c, gpio-aggregator.c,
> > etc. Besides the fact of test cases which are absent here. And who knows what
> > we allow to be entered.
> >
> 
> Yes, I looked all around the kernel to find something I could reuse
> but failed to find anything useful for this particular purpose. If you
> have something you could point me towards, I'm open to alternatives.
> 
> Once we agree on the form of the module, I'll port self-tests to using
> it instead of gpio-mockup, so we'll have some tests in the tree.

I will look again when you send a new version, so I might give some hints.

-- 
With Best Regards,
Andy Shevchenko


