Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEF527B1C2
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 18:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgI1QYO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 12:24:14 -0400
Received: from mga07.intel.com ([134.134.136.100]:26427 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgI1QYO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 12:24:14 -0400
IronPort-SDR: /b3EE+MJB2UD3+d2b0O0V4p0F1iuMN/+fsSfhW6I77tJVJXVusuj5t45FB8HzLCBSnc+IS754t
 Wsbh99yzlQjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="226169915"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="226169915"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 09:24:12 -0700
IronPort-SDR: UWC5swLRYcwvyNE1x5Xtq9sjY7ApeNZwKb/hsWRS8RjEuhcJnIwGJ+g+46QPLJwaKD6NGt5N03
 +ENZvI0CzxYQ==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="513499506"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 09:24:09 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kMvwa-002c2q-H4; Mon, 28 Sep 2020 19:24:04 +0300
Date:   Mon, 28 Sep 2020 19:24:04 +0300
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
Message-ID: <20200928162404.GW3956970@smile.fi.intel.com>
References: <20200928104155.7385-1-brgl@bgdev.pl>
 <20200928104155.7385-8-brgl@bgdev.pl>
 <20200928130023.GJ3956970@smile.fi.intel.com>
 <CAMpxmJVGAe224JaXL4EmeEFV4Qv7ohjgn_W_CwPjC4MHgP4gTA@mail.gmail.com>
 <20200928140028.GO3956970@smile.fi.intel.com>
 <CAMpxmJUMMia+b6DQ1KoZ70XPUzhutg1tnWF5PCvfaRF5-XQnVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJUMMia+b6DQ1KoZ70XPUzhutg1tnWF5PCvfaRF5-XQnVg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 04:52:25PM +0200, Bartosz Golaszewski wrote:
> On Mon, Sep 28, 2020 at 4:00 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Sep 28, 2020 at 03:13:53PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Sep 28, 2020 at 3:00 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Sep 28, 2020 at 12:41:53PM +0200, Bartosz Golaszewski wrote:

...

> > > > how do you avoid overflow?
> > >
> > > I renamed the property, the previous "chip-name" is no longer used. In
> > > fact it was never used but was accounted for in GPIO_MOCKUP_MAX_PROP.
> >
> > Either I'm missing something or...
> >
> > Current code in linux-next has 3 properties to be possible
> >
> > PROPERTY_ENTRY_U32("gpio-base", base);
> > PROPERTY_ENTRY_U16("nr-gpios", ngpio);
> > PROPERTY_ENTRY_BOOL("named-gpio-lines");
> >
> > You adding here
> > PROPERTY_ENTRY_STRING("chip-label", chip_label);
> >
> > Altogether after this patch is 4 which is maximum, but since array is passed by
> > a solely pointer, the terminator is a must.
> >
> 
> Thanks for explaining my code to me. Yes you're right and I'm not sure
> why I missed this. :)
> 
> I'll fix this in v3.
> 
> Actually this means the code is wrong even before this series - it's
> just that we don't use the "chip-name" property.

Right, you patch just exposed it.

-- 
With Best Regards,
Andy Shevchenko


