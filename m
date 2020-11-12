Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD102B0389
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 12:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbgKLLI4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 06:08:56 -0500
Received: from mga02.intel.com ([134.134.136.20]:65147 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728091AbgKLLI3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 06:08:29 -0500
IronPort-SDR: IaLcQDnTdQ9tKbOUGUKA1ButdJtRNWm+MU1RFM0N9L92AURx1XW5urbdsZ/XDxmQTxnpBLCFBb
 WKHW0k6ic7Lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157309059"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="157309059"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 03:08:15 -0800
IronPort-SDR: clxqrCpu3QrfMTcmM8mR5mvPQ/9+L/Tx3611FDzcKdHTCwsNvx3RWhNWSwZeJjTQFLxraoBtnu
 a+Vq6cgchwWA==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="357054847"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 03:08:12 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 12 Nov 2020 13:06:01 +0200
Date:   Thu, 12 Nov 2020 13:06:01 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7 07/18] gpiolib: Introduce gpio_set_debounce_timeout()
 for internal use
Message-ID: <20201112110601.GA2495@lahna.fi.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <20201111222008.39993-8-andriy.shevchenko@linux.intel.com>
 <20201112081638.GV2495@lahna.fi.intel.com>
 <CAHp75Vehbo-Ai5SE8JX1g4wggrQvz9TpwjsiS6C0r5mztwSg6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vehbo-Ai5SE8JX1g4wggrQvz9TpwjsiS6C0r5mztwSg6A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:19:37PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 12, 2020 at 10:17 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Thu, Nov 12, 2020 at 12:19:57AM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > > +int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
> 
> > Sorry for commenting this late but I realized we have
> > gpiod_set_debounce() already. At least this new function should follow
> > the naming (gpiod as it takes descriptior):
> >
> > int gpiod_set_debounce_optional(struct gpio_desc *desc, unsigned int debounce);
> 
> Unfortunately it will be inconsistent with the naming schema. I
> explained the choice of name in the cover letter. I will elaborate a
> bit there.

OK, It seems that I was not CC'd cover letter of the last two versions,
or it got dropped somewhere.
