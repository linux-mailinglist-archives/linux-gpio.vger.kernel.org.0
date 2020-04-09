Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD21E1A369C
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2020 17:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgDIPJU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Apr 2020 11:09:20 -0400
Received: from mga14.intel.com ([192.55.52.115]:62510 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727771AbgDIPJU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 11:09:20 -0400
IronPort-SDR: xuU9B5lBpiWx9CE4L4NZj5zxbuKA0byzMUllD1nAU+J31WiujBkvDfe2S46XmtvNZsO3KyJhid
 W+tY/qrkPDBQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 08:09:20 -0700
IronPort-SDR: M89jiThFQINU6DWzKPdPNrOmNEB2aqQD2vnjzk/L6qHnht3UQhAGF/vdAy6iMESnEJQqR0X+bS
 ZJvky2B7s3Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="453191541"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 09 Apr 2020 08:09:19 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jMYnx-00Gzzl-U7; Thu, 09 Apr 2020 18:09:21 +0300
Date:   Thu, 9 Apr 2020 18:09:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: pch: Use BIT() and GENMASK() where it's
 appropriate
Message-ID: <20200409150921.GG3676135@smile.fi.intel.com>
References: <20200402201859.35832-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJVxQFUBkvQ8aDiybRab_xk+xy2GBgz0g=A6TVEDanRTfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJVxQFUBkvQ8aDiybRab_xk+xy2GBgz0g=A6TVEDanRTfw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 06, 2020 at 09:23:30AM +0200, Bartosz Golaszewski wrote:
> czw., 2 kwi 2020 o 22:19 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> >
> > Use BIT() and GENMASK() where it's appropriate.
> > At the same time drop it where it's not appropriate.

Thanks for review, my comments below.

...

> >  #define PCH_EDGE_FALLING       0
> > -#define PCH_EDGE_RISING                BIT(0)
> > -#define PCH_LEVEL_L            BIT(1)
> > -#define PCH_LEVEL_H            (BIT(0) | BIT(1))
> > +#define PCH_EDGE_RISING                1
> > +#define PCH_LEVEL_L            2
> > +#define PCH_LEVEL_H            3
> 
> If these define bitmask values for some fields in registers, then I'd
> suggest to write it as hex numbers. I find it much more readable this
> way.

You meant
 0x0
 0x1
 0x2
 0x3
?

But what the benefit comes out of it? There are sliding 3 bits (3 bits
per each GPIO line), so this numbers in hex, in my opinion, will add
a confusion: "Are they always in position 2..0 or not?"

That said, I'm not against the change, but I would like to be sure
what is the benefit.

-- 
With Best Regards,
Andy Shevchenko


