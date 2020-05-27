Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F901E3D48
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 11:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388376AbgE0JIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 05:08:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:19973 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388408AbgE0JIp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 05:08:45 -0400
IronPort-SDR: pfRj2ryNa7UqDRvoR6DUCC4cf7QuiBpsCXTWv7vYT4o8RWsUj5Xmu2H9tE1B4g1fIoc/R6IW6B
 UABIJHDMV6Kg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 02:08:44 -0700
IronPort-SDR: a0oMfH+ZzF96LyeH++dk+4s34Y17+iJdrFSCRnNgJT2kzWM1/+btpudNnKIpgkCt92yfXfZF/7
 0Mz6UYsbJZ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
   d="scan'208";a="291528194"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 27 May 2020 02:08:43 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jds3K-009BSC-7n; Wed, 27 May 2020 12:08:46 +0300
Date:   Wed, 27 May 2020 12:08:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
Message-ID: <20200527090846.GE1634618@smile.fi.intel.com>
References: <20200526171222.14835-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdY8yXJUcWBG2ACHPmu4-+h4fY7Fuvbn69sFny2uZNrQmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdY8yXJUcWBG2ACHPmu4-+h4fY7Fuvbn69sFny2uZNrQmw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 27, 2020 at 07:46:55AM +0200, Linus Walleij wrote:
> On Tue, May 26, 2020 at 7:12 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > +static int pca953x_acpi_get_irq(struct device *dev)
> > +{
> > +       int pin, ret;
> > +
> > +       pin = pca953x_acpi_find_pin(dev);
> > +       if (pin < 0)
> > +               return pin;
> > +
> > +       dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> > +
> > +       if (!gpio_is_valid(pin))
> > +               return -EINVAL;
> > +
> > +       ret = gpio_request(pin, "pca953x interrupt");
> > +       if (ret)
> > +               return ret;
> 
> So would it work to do
> gpiochip_request_own_desc() here in some form?

It would but it will be wrong. We don't request own pin, we request pin from
upper GPIO (IRQ) chip.

> I.e. can you figure out the hardware offset number?

That's what this quirk basically does, it takes it from ACPI.

-- 
With Best Regards,
Andy Shevchenko


