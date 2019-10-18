Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3867BDC0BF
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 11:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731125AbfJRJVJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 05:21:09 -0400
Received: from mga07.intel.com ([134.134.136.100]:36374 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727593AbfJRJVJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 18 Oct 2019 05:21:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Oct 2019 02:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,311,1566889200"; 
   d="scan'208";a="221682778"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2019 02:21:05 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iLORU-0000SA-SL; Fri, 18 Oct 2019 12:21:04 +0300
Date:   Fri, 18 Oct 2019 12:21:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH v1] gpio: pca953x: Convert to use bitmap API
Message-ID: <20191018092104.GU32742@smile.fi.intel.com>
References: <20191014161148.10543-1-andriy.shevchenko@linux.intel.com>
 <20191016210635.GB513122@icarus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191016210635.GB513122@icarus>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 16, 2019 at 05:06:35PM -0400, William Breathitt Gray wrote:
> On Mon, Oct 14, 2019 at 07:11:48PM +0300, Andy Shevchenko wrote:
> > Instead of customized approach convert the driver to use bitmap API.

> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> 
> I agree with the concept of this change, but there is one fix I would
> like made detailed inline below.

Thanks!

> > -	for_each_set_clump8(offset, bank_mask, mask, gc->ngpio) {
> > -		bank = offset / 8;
> > -		reg_val[bank] &= ~bank_mask;
> > -		reg_val[bank] |= bitmap_get_value8(bits, offset) & bank_mask;
> > -	}
> > +	bitmap_and(reg_val, bits, mask, gc->ngpio);
> 
> When using set_multiple, it's expected that only the GPIO lines
> requested to be set are actually set -- albeit if the hardware is
> capable of that sort of control.
> 
> This bitmap_and operation is ignoring the existing state of reg_val and
> overwriting it with (bits & mask), so existing GPIO states are lost and
> all bits not masked are set to 0.
> 
> What you should do instead is something akin to this (but for bitmaps):
> 
>         regval &= ~mask;
>         regval |= bits & mask;
> 
> That should preserve the existing GPIO states in reg_val, while setting
> those requested by mask and supplied by bits.

Good catch! I suspected I did something wrong here, that's why I Cc'ed you,
and I wasn't mistaken — you helped me, thanks!

-- 
With Best Regards,
Andy Shevchenko


