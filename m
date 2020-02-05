Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8679F1528AA
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2020 10:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbgBEJuV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Feb 2020 04:50:21 -0500
Received: from mga09.intel.com ([134.134.136.24]:54130 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727068AbgBEJuV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Feb 2020 04:50:21 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Feb 2020 01:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; 
   d="scan'208";a="378686508"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 05 Feb 2020 01:50:18 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1izHK8-0000R8-E9; Wed, 05 Feb 2020 11:50:20 +0200
Date:   Wed, 5 Feb 2020 11:50:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1] gpio: Avoid kernel.h inclusion where it's possible
Message-ID: <20200205095020.GU10400@smile.fi.intel.com>
References: <20200204190733.56783-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJXh_1kUGgW57H=YohR1nkP8fWdaCcrmuM-yhOy4wZ_WTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXh_1kUGgW57H=YohR1nkP8fWdaCcrmuM-yhOy4wZ_WTw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 05, 2020 at 10:34:06AM +0100, Bartosz Golaszewski wrote:
> wt., 4 lut 2020 o 20:07 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> >
> > Inclusion of kernel.h increases the mess with the header dependencies.
> > Avoid kernel.h inclusion where it's possible.
> >
> > Besides that, clean up a bit other inclusions inside GPIO subsystem headers.

> > -struct pinctrl_dev;
> 
> If this forward declaration is removed because it's no longer needed
> after removing the pinctrl include, then please mention it in the
> commit message. If it's unrelated then please put it in a different
> patch.

Will do, thanks for review!

-- 
With Best Regards,
Andy Shevchenko


