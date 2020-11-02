Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5AD2A303D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 17:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgKBQuf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 11:50:35 -0500
Received: from mga06.intel.com ([134.134.136.31]:17706 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727150AbgKBQue (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Nov 2020 11:50:34 -0500
IronPort-SDR: jOrDihpYXk+DapDX66BK4ctBV96zm//TwVM6UlWv8cN0E7jfPDCRQxRs01ws6HY0yhUqy2t2Lv
 nI0jR4efAtiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="230545713"
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="230545713"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 08:50:33 -0800
IronPort-SDR: wFNEZC1oxgGuE8oPQ4DjP0OpoDQ9BnWkVTK/7Wuulzj8lIR9MwtVtplre6eUcZR/p4mNXmiAAk
 +CUqMjUtO7bg==
X-IronPort-AV: E=Sophos;i="5.77,445,1596524400"; 
   d="scan'208";a="528080607"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2020 08:50:30 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kZd3M-003GMN-AI; Mon, 02 Nov 2020 18:51:32 +0200
Date:   Mon, 2 Nov 2020 18:51:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus@black.fi.intel.com, Walleij@black.fi.intel.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jamie McClymont <jamie@kwiius.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/3] gpiolib: acpi: Respect bias settings for
 GpioInt() resource
Message-ID: <20201102165132.GR4077@smile.fi.intel.com>
References: <20201022165847.56153-1-andriy.shevchenko@linux.intel.com>
 <20201022170319.GJ4077@smile.fi.intel.com>
 <CAHp75VfqQ97oLfRe03pkAbmoS6hq3P7ZScS7Jr1Y=ZAYgWmP7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfqQ97oLfRe03pkAbmoS6hq3P7ZScS7Jr1Y=ZAYgWmP7w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 04:41:14PM +0200, Andy Shevchenko wrote:
> On Thu, Oct 22, 2020 at 9:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 22, 2020 at 07:58:45PM +0300, Andy Shevchenko wrote:
> 
> > Missed comment as per v1:
> >
> > This one highly depends on Intel pin control driver changes (for now [1],
> > but might be more), so it's probably not supposed to be backported (at least
> > right now).
> >
> > [1]: https://lore.kernel.org/linux-gpio/20201014104638.84043-1-andriy.shevchenko@linux.intel.com/T/
> 
> I probably have to elaborate what above implies from integration p.o.v.
> 
> I think the best way is to collect tags from GPIO maintainers and I
> can incorporate this into our Intel pin control branch which I will
> share with you as PR against GPIO and pin control subsystems.
> 
> I'm also all ears for alternatives.

Linus, Bart, what do you think about this series?

(Linus, the patch 3/3 has been already applied by Bart as it's independent to ACPI anyway)

-- 
With Best Regards,
Andy Shevchenko


