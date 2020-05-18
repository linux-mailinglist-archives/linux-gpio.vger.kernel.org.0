Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7D61D7F8B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 19:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgERRDT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 13:03:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:45305 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727020AbgERRDT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 13:03:19 -0400
IronPort-SDR: TXnuLHf9fb8zF+8msAErspDLCd7TjA39B+PRV6Mxqx+3QKbLfB/uReVTP/cEqK+sS+5owsE4Xu
 FsvyG2F+d6OQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 10:03:18 -0700
IronPort-SDR: yNPsqGoEeGLDpP5EktzyDsi952tpDIpBA031n0+MLKWTaJgdTR9Pw08ynM+vMIkPaVN4d9t1Yt
 tazfbb3QotKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="288638009"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 18 May 2020 10:03:17 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jajAe-007TNf-Lc; Mon, 18 May 2020 20:03:20 +0300
Date:   Mon, 18 May 2020 20:03:20 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 3/4] gpio: dwapb: Drop extra check to call
 acpi_gpiochip_request_interrupts()
Message-ID: <20200518170320.GM1634618@smile.fi.intel.com>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200512184513.86883-3-andriy.shevchenko@linux.intel.com>
 <20200517135521.tnz6uegenoh77bfl@mobilestation>
 <20200517144737.zii4c22rbyzxckob@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517144737.zii4c22rbyzxckob@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 17, 2020 at 05:47:37PM +0300, Serge Semin wrote:
> On Sun, May 17, 2020 at 04:55:24PM +0300, Serge Semin wrote:
> > On Tue, May 12, 2020 at 09:45:12PM +0300, Andy Shevchenko wrote:

...

> > >  static void dwapb_gpio_unregister(struct dwapb_gpio *gpio)
> > >  {
> > >  	unsigned int m;
> > >  
> > > -	for (m = 0; m < gpio->nr_ports; ++m)
> > > -		if (gpio->ports[m].is_registered)
> > > -			gpiochip_remove(&gpio->ports[m].gc);
> > > +	for (m = 0; m < gpio->nr_ports; ++m) {
> > > +		struct dwapb_gpio_port *port = &gpio->ports[m];
> > > +
> > > +		if (!port->is_registered)
> > > +			continue;
> > > +
> > > +		acpi_gpiochip_free_interrupts(&port->gc);
> > > +		gpiochip_remove(&port->gc);
> > > +	}
> > >  }
> > 
> > Could you please move this change to a dedicated patch? It seems to me this
> > alteration might be appropriate to be ported to the stable kernels seeing it
> > fixes e6cb3486f5a1 ("gpio: dwapb: add gpio-signaled acpi event support").
> > Linus, what do you think?
> > 
> > -Sergey
> > 
> 
> BTW after moving the change with acpi_gpiochip_free_interrupts() into a
> dedicated patch, you can freely merge the rest of this patch into the
> last one of this series. So the has_irq flag cleanup would be performed in a
> single commit. Especially if you implement the comment I provided above regarding
> conditional (idx == 0) calling of the acpi_gpiochip_request_interrupts() method.

I was thinking about this split and came to the conclusion that it will be a
bit awkward to introduce additional check in the ->dwapb_gpio_unregister() for
freeing ACPI Event handling which will be removed by one of following patch
(even taking into consideration backporting).

What I propose here is an alternative, i.e. I make this patch as first in the
series and will focus / dedicate it as a fix rather than clean up.

> So your series will look like this:
> gpio: dwapb: avoid error message for optional IRQ
> gpio: dwapb: Don't use 0 as valid Linux interrupt number

> gpio: dwapb: Call acpi_gpiochip_free_interrupts() on GPIO chip de-registration (<= This commit can be moved to the head of the series as being marked by the
> Fixes tag)

Yes, something like this, but keeping this form of the patch.

Thanks for the suggestion!

> gpio: dwapb: Remove redundant has_irq flag support

-- 
With Best Regards,
Andy Shevchenko


