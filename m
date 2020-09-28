Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA1E27AF8C
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 16:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgI1OAh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 10:00:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:24872 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbgI1OAg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 10:00:36 -0400
IronPort-SDR: jSeUvsbFEYcAhIO1tNRw3IdWScXeUnzd+zuEDF1fBcJxErukwvB5ya46rchtiqOHeuzp6V4G9f
 vNoMSp2UXTHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="223590527"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="223590527"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 07:00:35 -0700
IronPort-SDR: 5jLQCLLh3KcK8aGFbbCzqv3iW/C+MB5YBdG/iR3D1c6+5eZbnDiuDhyTO3Vkhz9rR/d4V2RYPY
 BavmS1IsEnfA==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="338193646"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 07:00:33 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kMthc-002ZfX-De; Mon, 28 Sep 2020 17:00:28 +0300
Date:   Mon, 28 Sep 2020 17:00:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/9] gpio: mockup: pass the chip label as device
 property
Message-ID: <20200928140028.GO3956970@smile.fi.intel.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
 <20200928104155.7385-8-brgl@bgdev.pl>
 <20200928130023.GJ3956970@smile.fi.intel.com>
 <CAMpxmJVGAe224JaXL4EmeEFV4Qv7ohjgn_W_CwPjC4MHgP4gTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVGAe224JaXL4EmeEFV4Qv7ohjgn_W_CwPjC4MHgP4gTA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 03:13:53PM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 28, 2020 at 3:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Sep 28, 2020 at 12:41:53PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > While we do check the "chip-name" property in probe(), we never actually
> > > use it. Let's pass the chip label to the driver using device properties
> > > as we'll want to allow users to define their own once dynamically
> > > created chips are supported.
> > >
> > > The property is renamed to "chip-label" to not cause any confusion with
> > > the actual chip name which is of the form: "gpiochipX".
> > >
> 
> ^^^ here, see below
> 
> > > If the "chip-label" property is missing, let's do what most devices in
> > > drivers/gpio/ do and use dev_name().
> >
> > ...
> >
> > > +             snprintf(chip_label, sizeof(chip_label),
> > > +                      "gpio-mockup-%c", i + 'A');
> > > +             properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
> > > +                                                        chip_label);
> >
> > You added new property, now count is up to 4. But at the same time
> >
> >         #define GPIO_MOCKUP_MAX_PROP  4
> >
> > how do you avoid overflow?
> >
> 
> I renamed the property, the previous "chip-name" is no longer used. In
> fact it was never used but was accounted for in GPIO_MOCKUP_MAX_PROP.

Either I'm missing something or...

Current code in linux-next has 3 properties to be possible

PROPERTY_ENTRY_U32("gpio-base", base);
PROPERTY_ENTRY_U16("nr-gpios", ngpio);
PROPERTY_ENTRY_BOOL("named-gpio-lines");

You adding here
PROPERTY_ENTRY_STRING("chip-label", chip_label);

Altogether after this patch is 4 which is maximum, but since array is passed by
a solely pointer, the terminator is a must.

-- 
With Best Regards,
Andy Shevchenko


