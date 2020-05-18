Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0D51D7FA9
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 19:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgERRHi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 13:07:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:45717 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726958AbgERRHi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 13:07:38 -0400
IronPort-SDR: cDfsLBWp4JJNrym4HDBCocVEx2FWoBWXPhu6nn0tC94IwFBDabEiW0nTQa0ihqlTBMZajkrK+3
 48j/ZlDDLFUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 10:07:38 -0700
IronPort-SDR: z4pptz3rmQQc/sP3hJVTPRn++dpQ/rk59d3bv5xBCDWDhwQndN8Zd6+6pd84Z7CewMK3m+kC7H
 tW0u0HDXNolw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="253114929"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 18 May 2020 10:07:36 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jajEp-007TQ7-Pd; Mon, 18 May 2020 20:07:39 +0300
Date:   Mon, 18 May 2020 20:07:39 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 3/4] gpio: dwapb: Drop extra check to call
 acpi_gpiochip_request_interrupts()
Message-ID: <20200518170739.GN1634618@smile.fi.intel.com>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200512184513.86883-3-andriy.shevchenko@linux.intel.com>
 <20200517135521.tnz6uegenoh77bfl@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517135521.tnz6uegenoh77bfl@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 17, 2020 at 04:55:21PM +0300, Serge Semin wrote:
> On Tue, May 12, 2020 at 09:45:12PM +0300, Andy Shevchenko wrote:
> > There is no need to have an additional check to call
> > acpi_gpiochip_request_interrupts(). Even without any interrupts available
> > the registered ACPI Event handlers can be useful for debugging purposes.

...

> > -	if (pp->has_irq)
> > -		acpi_gpiochip_request_interrupts(&port->gc);
> > +	acpi_gpiochip_request_interrupts(&port->gc);
> 
> Hm, perhaps replacing it with:
> +	if (pp->idx == 0)
> +		acpi_gpiochip_request_interrupts(&port->gc);
> could be more appropriate seeing Port A only supports IRQs, which we'd point
> out by the (idx == 0) conditional statement. So we don't have to call
> the method at most four times for each available port. Though judging by the
> acpi_gpiochip_request_interrupts() function internals it will just ignore
> GPIO chips with no IRQ support. Andy, It's up to you to decide. I'm not against
> the change the way it is, but if you agree that signifying the IRQs affiliation
> would be better, then please fill free to add the conditional statement I
> suggested.

It's really harmless to call it for each port. It allows as a side effect see
issues with ACPI tables which may refer to a wrong port / device and thus
getting no certain event handled. I prefer to unconditionally call it.

-- 
With Best Regards,
Andy Shevchenko


