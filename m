Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD662C0C01
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 14:57:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729921AbgKWNgX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 08:36:23 -0500
Received: from mga12.intel.com ([192.55.52.136]:46498 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729668AbgKWNgX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Nov 2020 08:36:23 -0500
IronPort-SDR: 1pGNM4oYwuHWWP+SYRMkgSV4Cbd0SokWLwjTCYrGWZotA90DJM2/p0pHWUzRWskPHq3hvYbE+q
 1lDs3e7ITBfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="151024606"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="151024606"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 05:36:19 -0800
IronPort-SDR: nOpHYPE1Ps+sD//qvHZB+kOkzAf0ggyFf0zyMHjLnheTo8RlWRveCL12v6MiUVsjjx/JaamCRc
 COgZgumuPwaQ==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="342810712"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 05:36:17 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1khC1u-009ANP-VL; Mon, 23 Nov 2020 15:37:18 +0200
Date:   Mon, 23 Nov 2020 15:37:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Laight <David.Laight@aculab.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v5 0/7] gpio: exar: refactor the driver
Message-ID: <20201123133718.GD4077@smile.fi.intel.com>
References: <20201116104242.19907-1-brgl@bgdev.pl>
 <CAMRc=Mdkr+65Nu7ddjtMHTbedpNf22w1bE97vipKSdXBYm8=fw@mail.gmail.com>
 <86bf5fda-eeb5-5cb2-901f-a887af7584f6@siemens.com>
 <CAMRc=MeayB1-hUiNUgKoG5v+CFt-Kxx88s+b-12iZDBfMjvttw@mail.gmail.com>
 <fe36f3f9-fc33-c39a-1b6e-962fe2567bb8@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe36f3f9-fc33-c39a-1b6e-962fe2567bb8@siemens.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 23, 2020 at 01:57:07PM +0100, Jan Kiszka wrote:
> On 23.11.20 13:12, Bartosz Golaszewski wrote:
> > Thanks!On Mon, Nov 23, 2020 at 1:03 PM Jan Kiszka
> > <jan.kiszka@siemens.com> wrote:
> >>
> >> On 23.11.20 12:38, Bartosz Golaszewski wrote:
> >>> On Mon, Nov 16, 2020 at 11:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >>>>
> >>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>>
> >>>> I just wanted to convert the driver to using simpler IDA API but ended up
> >>>> quickly converting it to using regmap. Unfortunately I don't have the HW
> >>>> to test it so marking the patches that introduce functional change as RFT
> >>>> and Cc'ing the original author.
> >>>>
> >>>
> >>> Hi Jan!
> >>>
> >>> Could you give this last version a final spin before I merge it?
> >>>
> >>
> >> [   14.250117] exar_serial 0000:02:00.0: enabling device (0000 -> 0002)
> >> [   14.336622] 0000:02:00.0: ttyS2 at MMIO 0x90000000 (irq = 44, base_baud = 7812500) is a XR17V35X
> >> [   14.391588] 0000:02:00.0: ttyS3 at MMIO 0x90000400 (irq = 44, base_baud = 7812500) is a XR17V35X
> >> [   19.250510] gpio_exar: probe of gpio_exar.1.auto failed with error -22
> >>
> >> That's "new"...
> >>
> > 
> > And if you change reg_bits from 11 to 16?
> > 
> 
> 16 works. Didn't we have that already?

Yes, but it puzzles me what the idea behind it and don't we see the regmap
issue here.  In any case, I'm fine with 16 there, although it's not clear
to me why 11 is not working...

-- 
With Best Regards,
Andy Shevchenko


