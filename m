Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8782411463C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2019 18:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729711AbfLERuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Dec 2019 12:50:01 -0500
Received: from mga04.intel.com ([192.55.52.120]:12488 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729396AbfLERuB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Dec 2019 12:50:01 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 09:50:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; 
   d="scan'208";a="214249189"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 05 Dec 2019 09:49:59 -0800
Received: from andy by smile with local (Exim 4.93-RC5)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1icvGJ-0002dr-6A; Thu, 05 Dec 2019 19:49:59 +0200
Date:   Thu, 5 Dec 2019 19:49:59 +0200
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     "Stanimir, Vasile-Laurentiu" 
        <Vasile-Laurentiu.Stanimir@windriver.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources
 based on pullup and polarity
Message-ID: <20191205174959.GW32742@smile.fi.intel.com>
References: <D4218E93E3D74741B4028993B2A8DBE0534BF84B@ALA-MBD.corp.ad.wrs.com>
 <20191202130553.GG32742@smile.fi.intel.com>
 <D4218E93E3D74741B4028993B2A8DBE0534BF86E@ALA-MBD.corp.ad.wrs.com>
 <20191202140804.GK32742@smile.fi.intel.com>
 <D4218E93E3D74741B4028993B2A8DBE0534C01E5@ALA-MBD.corp.ad.wrs.com>
 <20191204140834.GP32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204140834.GP32742@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 04, 2019 at 04:08:34PM +0200, andriy.shevchenko@linux.intel.com wrote:
> On Tue, Dec 03, 2019 at 03:24:57PM +0000, Stanimir, Vasile-Laurentiu wrote:
> > On Mon, Dec 02, 2019 at 01:44:04PM +0000, Stanimir, Vasile-Laurentiu wrote:
> > > On Mon, Dec 02, 2019 at 12:36:47PM +0000, Stanimir, Vasile-Laurentiu wrote:

> > The pin itself is a reset pin that must (as defined by rfc2119) be asserted during Linux boot (it controls
> >  the reset logic of a soc external device), the polarity is active low, which is why it's configured with a PullDown. 
> 
> And here is the issue AFAICS. The Active low should be configured with PullUp
> and set to whatever BIOS wants.

I stand corrected:
whatever -> active state

So, basically BIOS settings in ACPI and in hardware should be in align.
Otherwise it's badly created / configured BIOS.

> Correct me if I'm wrong, but code does the following in
> the properly configured DSDT:
> 
> 0/ (not OS) firmware prepares ACPI DSDT with parameters (see 2/) and sets pin
>    to active state - electrical low;
> 1/ we request GPIO via gpiod_get(..., GPIOD_ASIS);
> 2/ ACPI provides: IoOutput + Active Low + PullUp;
> 3/ above is translated to GPIO flags = GPIOD_OUT_HIGH and look up flags =
>    GPIO_PULL_UP | GPIO_ACTIVE_LOW;
> 4/ ...which calls gpiod_direction_output() with value = 1 and being inverted
>    to 0 due to Active Low in the descriptor flags;
> 5/ 0, i.e. electrically low signal, comes out from the SoC (compare
>    with 0/ above).
> 
> If it's not, we need to fix a root cause of it.
> 
> > Also we discussed here about using IoRestrictionNone/IoRestrictionNonePreserve as a potential solution to 
> > this problem, but this is a pure output pin, so that didn't seem right to us either.
> > 
> > In the end the main question, no matter the use case,  is how an active low pin, that's being 
> > asserted from BIOS, should be configured in the DSDT to be correctly represented by the code.
> > The patch was the result of not finding any solution to the problem above. Speaking strictly of the 
> > patch it should solve the problem of this case of active-low pins. 

> P.S. Before we are going further we need to see the dmesg when
> CONFIG_DEBUG_GPIO is set along with GpioIo() macro and corresponding
> _DSD() excerpts from DSDT.

You can send it privately if something is not okay to share (though I don't see
such in this case).

-- 
With Best Regards,
Andy Shevchenko


