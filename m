Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDD52AC20B
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 18:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730739AbgKIRVV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 12:21:21 -0500
Received: from mga11.intel.com ([192.55.52.93]:15903 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730706AbgKIRVV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Nov 2020 12:21:21 -0500
IronPort-SDR: ZW5IqiRoQEBW/rQ+fkBRMmWt8VniP4JJaanZ7aOI5tuz5vNfRdMXr7Ain1+XY/udlJASi6ereZ
 mvt7H1Y9SeqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="166329501"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="166329501"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 09:21:20 -0800
IronPort-SDR: A4eSjrjqpfJfkTizVTZkSMuHaiIfk/cCuliExX/anFiyOMtQtGl5XfEkTN0CFmOznpRKuBLyqf
 JMOZ8d3gfM7A==
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="530836851"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 09:21:18 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcAs0-005F7O-G2; Mon, 09 Nov 2020 19:22:20 +0200
Date:   Mon, 9 Nov 2020 19:22:20 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v12 4/4] gpio: xilinx: Utilize generic bitmap_get_value
 and _set_value
Message-ID: <20201109172220.GI4077@smile.fi.intel.com>
References: <cover.1603055402.git.syednwaris@gmail.com>
 <15a044d3ba23f00c31fd09437bdd3e5924bb91cd.1603055402.git.syednwaris@gmail.com>
 <CAK8P3a3f=fuq24QwNee3QgoMcSK5rcvLRpdTOWBZ9NJ4d-4bvA@mail.gmail.com>
 <20201101150033.GA68138@shinobu>
 <CAK8P3a0y7mh=ZDPefgpawY97gpYv79UXFLBzoGfu3ex2up2aDQ@mail.gmail.com>
 <20201109123411.GA19869@syed>
 <20201109134128.GA5596@shinobu>
 <CAK8P3a2FMkMc0K+hu0pnqC8wEMeapKPkZXaBm+HFYYPTes5NHA@mail.gmail.com>
 <20201109164529.GA28710@syed.domain.name>
 <20201109171140.GA14045@shinobu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109171140.GA14045@shinobu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 12:11:40PM -0500, William Breathitt Gray wrote:
> On Mon, Nov 09, 2020 at 10:15:29PM +0530, Syed Nayyar Waris wrote:
> > On Mon, Nov 09, 2020 at 03:41:53PM +0100, Arnd Bergmann wrote:

...

> >  static inline void bitmap_set_value(unsigned long *map,
> > -                                    unsigned long value,
> > +                                    unsigned long value, const size_t length,
> >                                      unsigned long start, unsigned long nbits)
> >  {
> >          const size_t index = BIT_WORD(start);
> > @@ -15,6 +15,10 @@ static inline void bitmap_set_value(unsigned long *map,
> >          } else {
> >                  map[index + 0] &= ~BITMAP_FIRST_WORD_MASK(start);
> >                  map[index + 0] |= value << offset;
> > +
> > +               if (index + 1 >= length)
> > +                       __builtin_unreachable();
> > +
> >                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> >                  map[index + 1] |= value >> space;
> >          }
> 
> Hi Syed,
> 
> Let's rename 'length' to 'nbits' as Arnd suggested, and rename 'nbits'
> to value_width.

length here is in longs. I guess this is the point of entire patch.

But to me sounds like it would be better to have simply bitmap_set_value64() /
bitmap_set_value32() with proper optimization done and forget about variadic
ones for now.

-- 
With Best Regards,
Andy Shevchenko


