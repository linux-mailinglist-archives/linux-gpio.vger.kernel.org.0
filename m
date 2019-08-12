Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B855189E68
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 14:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfHLMcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 08:32:07 -0400
Received: from mga02.intel.com ([134.134.136.20]:8796 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726649AbfHLMcH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Aug 2019 08:32:07 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Aug 2019 05:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; 
   d="scan'208";a="204700956"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga002.fm.intel.com with ESMTP; 12 Aug 2019 05:31:39 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hx9U9-0006M1-Ev; Mon, 12 Aug 2019 15:31:37 +0300
Date:   Mon, 12 Aug 2019 15:31:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stefan Roese <sr@denx.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
Message-ID: <20190812123137.GG30120@smile.fi.intel.com>
References: <20190808132543.26274-1-sr@denx.de>
 <20190808132543.26274-2-sr@denx.de>
 <CAMuHMdUzry6f_AqcjevgSRgJ2Q8Nqr_kEyYz+1QEVft6BTrC2g@mail.gmail.com>
 <ad77e973-912f-5ff3-9dd4-610695ec57eb@denx.de>
 <CAMuHMdXs=AdURCgB1GWRT=huKbXX7rGn6=upi1MMuFDHhKqX0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXs=AdURCgB1GWRT=huKbXX7rGn6=upi1MMuFDHhKqX0g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 02:11:42PM +0200, Geert Uytterhoeven wrote:
> On Mon, Aug 12, 2019 at 1:54 PM Stefan Roese <sr@denx.de> wrote:
> > On 12.08.19 13:17, Geert Uytterhoeven wrote:

> > If we all agree, that only the documented "-gpios" variant needs to
> > be supported, then we can drop this patch.
> 
> BTW, I'm still wondering if d99482673f950817 ("serial: mctrl_gpio: Check
> if GPIO property exisits before requesting it") is the right fix.
> This is a place where we rely explicitly on named GPIOs being present, so
> IMHO the ACPI code should not return a random GPIO instead.

ACPI is not taking it to consideration for now. That is, there is no support of
mctrl gpio for ACPI.

-- 
With Best Regards,
Andy Shevchenko


