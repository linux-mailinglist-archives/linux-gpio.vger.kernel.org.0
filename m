Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D194A3002AA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 13:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbhAVMPo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 07:15:44 -0500
Received: from mga14.intel.com ([192.55.52.115]:28368 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbhAVMNp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 07:13:45 -0500
IronPort-SDR: DrVBVwVs0Fke6+AQMTfWIGq2+Upv95dYxFlOtgFFy5SfDNkyak/SHIFXI/RZWJD3ICRDHOh5/q
 nP2dJwAm8VyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="178659002"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="178659002"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:11:59 -0800
IronPort-SDR: wZ0mPuw78pMB+nVSwqVzIFpYVLQ6Sv6T6gu59YiRIofF6f/PuCUGw+p3T/1yfs8p50PvVuTFgj
 3B57l7SRtr7Q==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="357003268"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 04:11:58 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2vJE-008qlA-Ph; Fri, 22 Jan 2021 14:13:00 +0200
Date:   Fri, 22 Jan 2021 14:13:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 3/5] lib/cmdline: Allow get_options() to take 0 to
 validate the input
Message-ID: <YArBTIQw2YIfeCKM@smile.fi.intel.com>
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com>
 <20210120214547.89770-3-andriy.shevchenko@linux.intel.com>
 <CAMpxmJXDDeHKD9Zo32R4WD0q_3Ky40F5hkajFvyWPVzkq73khg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXDDeHKD9Zo32R4WD0q_3Ky40F5hkajFvyWPVzkq73khg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 12:15:20PM +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:

...

> > + *     When @nints is 0, the function just validates the given @str and
> > + *     returns amount of parseable integers as described below.
> 
> I'm not a native English speaker but it sounds like this should be
> "returns the amount".

Sounds reasonable. Fixed for v3.

...

> > +       bool validate = nints == 0;
> 
> bool validate = (nints == 0) would be clearer IMO.

I don't see the benefit, but I have changed.

...

> Same as the other patch - just put the formatting strings into the messages.

Okay, I changed.


Thanks for review!

-- 
With Best Regards,
Andy Shevchenko


