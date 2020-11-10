Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD412ADB59
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 17:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbgKJQLd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 11:11:33 -0500
Received: from mga02.intel.com ([134.134.136.20]:24495 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729909AbgKJQLd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 11:11:33 -0500
IronPort-SDR: yqYhsCwq5+HVBXsvatkYtE2uN9oeNsP83ay4KWM5urUMdtT9t/WdAXuvU4TrsrHst7dNNFSs6Y
 G5Nt6QqIHrXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157006055"
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="157006055"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 08:11:26 -0800
IronPort-SDR: 4f5UwOTPqlOXN9XV1HjKqugNQhhq8QLBa1BAq/DN26sSYgEhNn+QmlCJ4RL5s1GZ/lU6SOOGKD
 nntiptJNX6tQ==
X-IronPort-AV: E=Sophos;i="5.77,466,1596524400"; 
   d="scan'208";a="473480795"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 08:11:24 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcWFu-005WH1-05; Tue, 10 Nov 2020 18:12:26 +0200
Date:   Tue, 10 Nov 2020 18:12:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 6/7] gpio: exar: switch to using regmap
Message-ID: <20201110161225.GZ4077@smile.fi.intel.com>
References: <20201110145552.23024-1-brgl@bgdev.pl>
 <20201110145552.23024-7-brgl@bgdev.pl>
 <20201110150447.GW4077@smile.fi.intel.com>
 <20201110151022.GY4077@smile.fi.intel.com>
 <CAMRc=MfsLc_DKuCaOwq-xDjT0V8yk3rGt8buJ9qgbGNj25youA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfsLc_DKuCaOwq-xDjT0V8yk3rGt8buJ9qgbGNj25youA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 04:12:38PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 10, 2020 at 4:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Nov 10, 2020 at 05:04:47PM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 10, 2020 at 03:55:51PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > We can simplify the code in gpio-exar by using regmap. This allows us to
> > > > drop the mutex (regmap provides its own locking) and we can also reuse
> > > > regmap's bit operations instead of implementing our own update function.
> > >
> > > ...
> > >
> > > > +static const struct regmap_config exar_regmap_config = {
> > > > +   .name           = "exar-gpio",
> > > > +   .reg_bits       = 16,
> > >
> > > As per previous version comment.
> > >
> > > Hold on, the registers are 16-bit wide, but their halves are sparsed!
> > > So, I guess 8 and 8 with helpers to get hi and lo parts are essential.
> > >
> > >
> > > TABLE 5: DEVICE CONFIGURATION REGISTERS SHOWN IN BYTE ALIGNMENT
> > >
> > > > +   .val_bits       = 8,
> > > > +};
> > >
> > > This is basically represents two banks out of 6 8-bit registers each.
> >
> > ...which makes me wonder if gpio-regmap can be utilized here...
> >
> 
> But the address width won't affect the actuall accessing of 8 bits
> registers in an mmio regmap. Internally the mmio regmap does pretty
> much the same thing the previous driver did: call readb()/writeb() on
> 8-bit "chunks" of the banks.

It will affect reg dump in debugfs. I would really narrow down the register
address space in the config, otherwise that debugfs facility will screw up a
lot of things.

So, and to be on pedantic side...

"The Device Configuration Registers and the two individual UART Configuration
Registers of the XR17V352 occupy 2K of PCI bus memory address space."

11 seems the correct value for the address width.

-- 
With Best Regards,
Andy Shevchenko


