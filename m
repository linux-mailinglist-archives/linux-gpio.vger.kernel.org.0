Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629BC48CD34
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 21:43:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357712AbiALUne (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 15:43:34 -0500
Received: from mga02.intel.com ([134.134.136.20]:10497 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344640AbiALUnd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 15:43:33 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="231192613"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="231192613"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:43:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="490886076"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:43:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1n7kRk-009v7w-Ia;
        Wed, 12 Jan 2022 22:42:16 +0200
Date:   Wed, 12 Jan 2022 22:42:16 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <Yd89KCUIz9m4QBOt@smile.fi.intel.com>
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <CAHp75Vfgpm7sROw_Ay8+tK0bhu-kCbS=O_kwax+i_vaH7H4wXA@mail.gmail.com>
 <ba1e407a-76e4-5a81-1cf2-45766be35b2a@redhat.com>
 <7cda97fe-4af3-694d-7e16-a523a205ad9f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cda97fe-4af3-694d-7e16-a523a205ad9f@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 12, 2022 at 09:20:25PM +0100, Hans de Goede wrote:
> On 1/8/22 10:59, Hans de Goede wrote:
> > On 1/8/22 01:04, Andy Shevchenko wrote:
> >> On Saturday, January 8, 2022, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:

...

> >>     byt_gpio INT33FC:02: Pin 0: uses direct IRQ 0 (APIC 67)
> >>     byt_gpio INT33FC:02: Pin 15: uses direct IRQ 2 (APIC 69)
> >>
> >>
> >> Should be these updated?
> > 
> > Yes the " (APIC 6x)" part is gone now. I will fix this for v4.
> > 
> >>     This is useful to figure out the GPIO pin belonging to ACPI
> >>     resources like this one: "Interrupt () { 0x00000043 }" or
> >>     the other way around.
> >>
> >>     Suggested-by: Andy Shevchenko <andy@kernel.org <mailto:andy@kernel.org>>
> >>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
> >>     ---
> >>     Changes in v3:
> >>     - Rework code to check if the pin is assigned one of the 16 direct IRQs
> >>       (new code suggested-by Andy)
> >>     - Drop dev_dbg of the (likely?) APIC IRQ, only log the direct IRQ index
> >>
> >>
> >> Thinking about direct IRQ mappings I will look into the Datasheet next week.
> > 
> > Ok, I will wait for you to get back to me then before posting a v4.
> 
> Note I've found the direct IRQ to IO-APIC pin mappings now, they are
> described in: atom-e3800-family-datasheet.pdf, so I've re-added
> the APIC IRQ to the printed log msg for v4.

You mean below?

The 16 GPSCORE direct IRQs are mapped to IOAPIC_IRQ [66:51].
The 16 GPSSUS direct IRQs are mapped to IOAPIC_IRQ [82:67].

Ack!

-- 
With Best Regards,
Andy Shevchenko


