Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F247B3DBFFD
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 22:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230316AbhG3UpU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 16:45:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:12737 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230217AbhG3UpU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 16:45:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="200337779"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; 
   d="scan'208";a="200337779"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 13:45:14 -0700
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; 
   d="scan'208";a="499746795"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 13:45:13 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1m9ZNS-003WK5-L4; Fri, 30 Jul 2021 23:45:06 +0300
Date:   Fri, 30 Jul 2021 23:45:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [RFC PATCH v2 1/1] misc: add sloppy logic analyzer using polling
Message-ID: <YQRk0vpo1V709z/Z@smile.fi.intel.com>
References: <20210519132528.4394-1-wsa+renesas@sang-engineering.com>
 <20210519132528.4394-2-wsa+renesas@sang-engineering.com>
 <YKUlbsWhT45l5Zm0@smile.fi.intel.com>
 <YQRZkFApESOIMRmv@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQRZkFApESOIMRmv@ninjato>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 09:57:04PM +0200, Wolfram Sang wrote:

...

> > 'For ACPI one may use PRP0001 approach with the following ASL excerpt example::
> > 
> >     Device (GSLA) {
> >         Name (_HID, "PRP0001")
> >         Name (_DDN, "GPIO sloppy logic analyzer")
> >         Name (_CRS, ResourceTemplate () {
> >             GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone,
> >                 "\\_SB.PCI0.GPIO", 0, ResourceConsumer, , ) { 13 }
> >             PinConfig(Exclusive, 0x07, 0, "\\_SB.PCI0.GPIO", 0, ResourceConsumer, ) { 7 }
> >             GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone,
> >                 "\\_SB.PCI0.GPIO", 0, ResourceConsumer, , ) { 12 }
> >             PinConfig(Exclusive, 0x07, 0, "\\_SB.PCI0.GPIO", 0, ResourceConsumer, ) { 6 }
> >         })
> > 
> >         Name (_DSD, Package () {
> >             ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> >             Package () {
> >                 Package () { "compatible", Package () { "gpio-sloppy-logic-analyzer" } },
> >                 Package () {
> >                     "probe-gpios", Package () {
> >                         ^GSLA, 0, 0, 0,
> >                         ^GSLA, 1, 0, 0,
> >                     },
> >                 Package () {
> >                     "probe-names", Package () {
> >                         "SCL",
> >                         "SDA",
> >                     },
> >             }
> >         })
> > 
> > Note, that pin configuration uses pin numbering space, while GPIO resources
> > are in GPIO numbering space, which may be different in ACPI. In other words,
> > there is no guarantee that GPIO and pins are mapped 1:1, that's why there are
> > two different pairs in the example, i.e. {13,12} GPIO vs. {7,6} pin.
> > 
> > Yet pin configuration support in Linux kernel is subject to implement.'
> 
> Have you tested this snippet?

Nope. Below is the compile-tested one:

    Device (GSLA) {
        Name (_HID, "PRP0001")
        Name (_DDN, "GPIO sloppy logic analyzer")
        Name (_CRS, ResourceTemplate () {
            GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone,
                "\\_SB.PCI0.GPIO", 0, ResourceConsumer, , ) { 13 }
            PinConfig(Exclusive, 0x07, 0, "\\_SB.PCI0.GPIO", 0, ResourceConsumer, ) { 7 }
            GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone,
                "\\_SB.PCI0.GPIO", 0, ResourceConsumer, , ) { 12 }
            PinConfig(Exclusive, 0x07, 0, "\\_SB.PCI0.GPIO", 0, ResourceConsumer, ) { 6 }
        })

        Name (_DSD, Package () {
            ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
            Package () {
                Package () { "compatible", Package () { "gpio-sloppy-logic-analyzer" } },
                Package () {
                    "probe-gpios", Package () {
                        ^GSLA, 0, 0, 0,
                        ^GSLA, 1, 0, 0,
                    },
                },
                Package () {
                    "probe-names", Package () {
                        "SCL",
                        "SDA",
                    },
                },
            }
        })
    }


> I am totally open to add ACPI but it
> should be tested, of course. Is there any on-going effort to add ACPI
> pin config?

Very slowly but yes, the pin configuration from ACPI to pin control is not
forgotten.

...

> > > +	unsigned int trig_len;
> > 
> > On 64-bit arch you may save 4 bytes by moving this to be together with u32
> > member above.
> 
> I don't want to save bytes here. I sorted the struct for cachelines,
> important members first.

Add a comment then.

...

> > > +static struct dentry *gpio_la_poll_debug_dir;
> > 
> > I have seen the idea of looking up the debugfs entry. That said, do we actually
> > need this global variable?
> 
> I don't understand the first sentence. And we still need it to clean up?

If you know the name of the folder, you may look up it, no need to keep a
variable for that.

...

> > > +		/* '10' is length of 'probe00=\n\0' */
> > > +		add_len = strlen(gpio_names[i]) + 10;
> > > +		meta = devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);
> > 
> > First of all, this realloc() pattern *) is bad. While it's tricky and has side
> > effects (i.e. it has no leaks) better not to use it to avoid confusion.
> > 
> > *) foo = realloc(foo, ...); is 101 mistake.
> 
> Because generally you lose the old pointer on error. But we don't here
> because we are using managed devices.
> 
> However, I see that all kernel users of devm_krealloc() are using a
> seperate variable and then update the old one. I can do this, too.

As I said, it is a nasty side effect that may provoke real bugs in the future
with simple realloc() cases.

...

> > > +	[ ! -d $CPUSETDIR ] && mkdir $CPUSETDIR
> > 
> > [ -d ... ] || ...
> 
> Will think about it. I think the former is a tad more readable.

Shell is nice when the script is a) short, b) readable. Neither I see in the
former, sorry. Ah, and there is subtle difference between two. You may easily
learn it if you start using -efu flags in shebang.

-- 
With Best Regards,
Andy Shevchenko


