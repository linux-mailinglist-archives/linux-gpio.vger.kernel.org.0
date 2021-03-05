Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC42B32E5F7
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 11:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhCEKQS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 05:16:18 -0500
Received: from mga01.intel.com ([192.55.52.88]:34292 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhCEKP5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Mar 2021 05:15:57 -0500
IronPort-SDR: 3wj5ckNR7w0tAJBPEmy+8wJegF72IaIq2ivtptDDGBQ20blAQ0DvkwvCGZ1J3oZHUUTctWLiG9
 WkFvibN6QCpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="207350999"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="207350999"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 02:15:56 -0800
IronPort-SDR: 4JQ/n/U/IuvIlsol9GHIdnLW+MU3AqyT50k04T0YmbnTz7bzKYz/1OY7k13ZYYhBatUaWMLnzv
 hNQkMM9zcm/Q==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="507950970"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2021 02:15:54 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lI7Us-00A5yl-N6; Fri, 05 Mar 2021 12:15:50 +0200
Date:   Fri, 5 Mar 2021 12:15:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 09/12] gpio: sim: new testing module
Message-ID: <YEIE1nG8lZ4V2MXq@smile.fi.intel.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-10-brgl@bgdev.pl>
 <YEDdbfbM9abHJpIO@smile.fi.intel.com>
 <CAMRc=MdRxXzoZuyLs-24dXfOft=OQqDneTHa4-ZKqFE1kMBWcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdRxXzoZuyLs-24dXfOft=OQqDneTHa4-ZKqFE1kMBWcg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 09:15:29PM +0100, Bartosz Golaszewski wrote:
> On Thu, Mar 4, 2021 at 2:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Mar 04, 2021 at 11:24:49AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

> > > +
> > > +     /*
> > > +      * FIXME If anyone knows a better way to parse that - please let me
> > > +      * know.
> > > +      */
> >
> > If comma can be replaced with ' ' (space) then why not to use next_arg() from
> > cmdline.c? I.o.w. do you have strong opinion why should we use comma here?
> >
> 
> My opinion is not very strong but I wanted to make the list of names
> resemble what we pass to the gpio-line-names property in device tree.
> Doesn't next_arg() react differently to string of the form: "foo=bar"?

It's ambiguous here.

So, the strings '"foo=bar"' and 'foo=bar' (w/o single quotes!) are indeed
parsed differently, i.e.
	'"foo=bar"' -> 'foo=bar',
while
	"foo=bar" -> 'foo' + 'bar'.

...

> > > +     ida_free(&gpio_sim_ida, id);
> >
> > Isn't it atomic per se? I mean that IDA won't give the same ID until you free
> > it. I.o.w. why is it under the mutex?
> >
> 
> You're right but if we rapidly create and destroy chips we'll be left
> with holes in the numbering (because new devices would be created
> before the IDA numbers are freed, so the driver would take a larger
> number that's currently free). It doesn't hurt but it would look worse
> IMO. Do you have a strong opinion on this?

It's not strong per se, but I would rather follow the 2nd rule of locking:
don't protect something which doesn't need it.

-- 
With Best Regards,
Andy Shevchenko


