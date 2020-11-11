Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0642AF8F6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 20:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbgKKTXn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 14:23:43 -0500
Received: from mga05.intel.com ([192.55.52.43]:33522 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgKKTXn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 14:23:43 -0500
IronPort-SDR: iWxAyBWcmiMnH7bUSz2q9a30GqvDTXGJlWHQo+8tFrjL28ZP/tlhn2XP/DHt7inWED7vWvXOr8
 ldel4Uk97XCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="254910738"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="254910738"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 11:23:33 -0800
IronPort-SDR: BufQXdD8f0g3lvxYN4/I0+O3nU4KHowA5j7y1qOT5lh1ups1TVj06p5DKj7KWTOvxpXPDVcFwg
 hrpIMmlfD3Wg==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="328220945"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 11:23:32 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcvjO-005zFj-7P; Wed, 11 Nov 2020 21:24:34 +0200
Date:   Wed, 11 Nov 2020 21:24:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 04/17] gpiolib: Add temporary variable to
 gpiod_set_transitory() for cleaner code
Message-ID: <20201111192434.GR4077@smile.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-5-andriy.shevchenko@linux.intel.com>
 <20201111153231.GA2495@lahna.fi.intel.com>
 <CAHp75VeF8oDkFdyGoxA76QFxu0wuHRyRuwShrOZF8fvemLJO3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeF8oDkFdyGoxA76QFxu0wuHRyRuwShrOZF8fvemLJO3w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 05:40:16PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 11, 2020 at 5:33 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Mon, Nov 09, 2020 at 10:53:19PM +0200, Andy Shevchenko wrote:

...

> > To me this looks better and reads easier:
> >
> >         packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE, !transitory);
> >
> > But not insisting so if GPIO maintainers are fine then no objections :)

I have dropped this patch.

-- 
With Best Regards,
Andy Shevchenko


