Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 220DE92093
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 11:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfHSJnV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 05:43:21 -0400
Received: from mga02.intel.com ([134.134.136.20]:39689 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbfHSJnV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Aug 2019 05:43:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Aug 2019 02:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; 
   d="scan'208";a="172076242"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga008.jf.intel.com with ESMTP; 19 Aug 2019 02:42:54 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hzeBg-0003JP-Aa; Mon, 19 Aug 2019 12:42:52 +0300
Date:   Mon, 19 Aug 2019 12:42:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Chris Chiu <chiu@endlessm.com>, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessm.com
Subject: Re: [PATCH] pinctrl: intel: remap the pin number to gpio offset for
 irq enabled pin
Message-ID: <20190819094252.GW30120@smile.fi.intel.com>
References: <20190816093838.81461-1-chiu@endlessm.com>
 <20190819071413.GI19908@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819071413.GI19908@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 19, 2019 at 10:14:13AM +0300, Mika Westerberg wrote:
> On Fri, Aug 16, 2019 at 05:38:38PM +0800, Chris Chiu wrote:
> > On Asus X571GT, GPIO 297 is configured as an interrupt and serves
> > for the touchpad. The touchpad will report input events much less
> > than expected after S3 suspend/resume, which results in extremely
> > slow cursor movement. However, the number of interrupts observed
> > from /proc/interrupts increases much more than expected even no
> > touching touchpad.
> > 
> > This is due to the value of PADCFG0 of PIN 225 for the interrupt
> > has been changed from 0x80800102 to 0x80100102. The GPIROUTIOXAPIC
> > is toggled on which results in the spurious interrupts. The PADCFG0
> > of PIN 225 is expected to be saved during suspend, but the 297 is
> > saved instead because the gpiochip_line_is_irq() expect the GPIO
> > offset but what's really passed to it is PIN number. In this case,
> > the /sys/kernel/debug/pinctrl/INT3450:00/gpio-ranges shows
> > 
> > 288: INT3450:00 GPIOS [436 - 459] PINS [216 - 239]
> > 
> > So gpiochip_line_is_irq() returns true for GPIO offset 297, the
> > suspend routine spuriously saves the content for PIN 297 which
> > we expect to save for PIN 225.
> 
> Nice work nailing the issue!
> 
> > This commit maps the PIN number to GPIO offset first in the
> > intel_pinctrl_should_save() to make sure the values for the
> > specific PINs can be correctly saved and then restored.
> > 
> > Signed-off-by: Chris Chiu <chiu@endlessm.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> I think this should also have:
> 
> Fixes: c538b9436751 ("pinctrl: intel: Only restore pins that are used by the driver")

Pushed to my review and testing queue, thanks!

P.S. I have added Fixes tag.

-- 
With Best Regards,
Andy Shevchenko


