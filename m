Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB225278EE3
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 18:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729561AbgIYQlH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 12:41:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:28196 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726990AbgIYQlH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 25 Sep 2020 12:41:07 -0400
IronPort-SDR: 4tYFPzOYUsW/q5LT2sKGDoHb+6pRK5WtgzU9McIKBXZKE2//9ZNRH6s+n+eFxbqhTBBwCdvvg5
 ANakS9crxHPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="161667547"
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="161667547"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 09:41:06 -0700
IronPort-SDR: NzOnULLjjtadOZgBjjeoL4UErQg+tVTLHrrNRTTaakimhjOfWOSfVeVwSPj+ibb/rnOqh3gxvB
 B9rhpk/2i6uw==
X-IronPort-AV: E=Sophos;i="5.77,302,1596524400"; 
   d="scan'208";a="292811695"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 09:41:04 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kLmrQ-001uuf-NO; Fri, 25 Sep 2020 15:30:00 +0300
Date:   Fri, 25 Sep 2020 15:30:00 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/9] gpio: mockup: use the generic 'gpio-line-names'
 property
Message-ID: <20200925123000.GD3956970@smile.fi.intel.com>
References: <20200924113842.11670-1-brgl@bgdev.pl>
 <20200924113842.11670-9-brgl@bgdev.pl>
 <20200925090329.GZ3956970@smile.fi.intel.com>
 <CAMpxmJWBSwofFy94mHZWB2mdvHGStYp5oLDZp2M+wO57t40HSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJWBSwofFy94mHZWB2mdvHGStYp5oLDZp2M+wO57t40HSQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 01:40:10PM +0200, Bartosz Golaszewski wrote:
> On Fri, Sep 25, 2020 at 11:03 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Sep 24, 2020 at 01:38:41PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > GPIO line names are currently created by the driver from the chip label.
> > > We'll want to support custom formats for line names (for instance: to
> > > name all lines the same) for user-space tests so create them in the
> > > module init function and pass them to the driver using the standard
> > > 'gpio-line-names' property.
> >
> > ...
> >
> > > +             if (gpio_mockup_named_lines) {
> > > +                     line_names = gpio_mockup_make_line_names(chip_label,
> > > +                                                              ngpio);
> > > +                     if (!line_names) {
> > > +                             platform_driver_unregister(&gpio_mockup_driver);
> > > +                             gpio_mockup_unregister_pdevs();
> > > +                             return -ENOMEM;
> > > +                     }
> >
> > > +                     properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
> > > +                                             "gpio-line-names",
> > > +                                             line_names, ngpio);
> >
> > Forgot to update GPIO_MOCKUP_MAX_PROP?
> >
> 
> No, there are still three properties: chip-label, nr-gpios and
> gpio-line-names. Same answer to patch 8/9.
> 
> > > +             }
> >
> > ...
> >
> > > +             kfree_strarray(line_names, line_names ? ngpio : 0);
> >
> > Perhaps you may check for NULL pointer in the kfree_strarray() and drop ternary
> > here?
> >
> 
> I did in the previous series and you told me to not to. :)

Hmm... What was my argument? What was wrong with me? free() should be NULL-aware.

-- 
With Best Regards,
Andy Shevchenko


