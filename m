Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309D51E3D4C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 11:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388268AbgE0JK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 05:10:57 -0400
Received: from mga01.intel.com ([192.55.52.88]:55292 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388112AbgE0JK5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 05:10:57 -0400
IronPort-SDR: mzACSf3l1OpEp01vCSpK+sDzXKB1HTM7WCA/q1eJmUw/xVbSKLlE9BrfEdtv+xfv7PNdaefwUZ
 4X1zwUbjNF8A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 02:10:57 -0700
IronPort-SDR: Gqn1qQ0iCVY+z159GV2n2UsJ7gNhQ3hu3SFmLznfDugtrmw9WRgxuzmgHrcHJ02djS5A0K/710
 lc95NkPsu3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
   d="scan'208";a="345469550"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2020 02:10:55 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jds5S-009BU7-UY; Wed, 27 May 2020 12:10:58 +0300
Date:   Wed, 27 May 2020 12:10:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
Message-ID: <20200527091058.GF1634618@smile.fi.intel.com>
References: <20200525190845.60959-1-andriy.shevchenko@linux.intel.com>
 <20200526053101.GD247495@lahna.fi.intel.com>
 <20200526131119.GQ1634618@smile.fi.intel.com>
 <CACRpkdYL5TPx1pN4XSY+sV6NdugGtpxTwaYo_jyq1Rx=tSAPPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYL5TPx1pN4XSY+sV6NdugGtpxTwaYo_jyq1Rx=tSAPPQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 27, 2020 at 07:43:28AM +0200, Linus Walleij wrote:
> On Tue, May 26, 2020 at 3:11 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, May 26, 2020 at 08:31:01AM +0300, Mika Westerberg wrote:
> > > On Mon, May 25, 2020 at 10:08:45PM +0300, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > +   dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> > > > +   return gpiod_to_irq(gpio_to_desc(pin));
> > >
> > > You need to request the GPIO as well, I missed that from my example.
> >
> > How? I can't find a function to request GPIO by its descriptor in
> > include/linux/gpio/*.
> 
> If a gpiochip need to request one of its own GPIOs it should use
> gpiochip_request_own_desc()

It's not the case here.


-- 
With Best Regards,
Andy Shevchenko


