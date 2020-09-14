Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6601268D88
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 16:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgINO0Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Sep 2020 10:26:16 -0400
Received: from mga02.intel.com ([134.134.136.20]:47389 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgINO0P (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Sep 2020 10:26:15 -0400
IronPort-SDR: 9IA0BUsUJHSRH8ReUY7BBdZPvvRfRomYJwGNdtgLfbUSNW4Vyf7hkFlHlLXubWf9Sbr/Khl9Im
 nHdeiK+sQXWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="146774274"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="146774274"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2020 07:26:06 -0700
IronPort-SDR: VIzns/3TKYEjmBP+f30ScIjHdNhLKf94T88nPM36NUkimPUHRxoiBQ+dpUfPSAdfGbL8RfGy05
 fbGzTVeoHi1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
   d="scan'208";a="335300900"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 14 Sep 2020 07:26:04 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kHpQf-00GcPt-5w; Mon, 14 Sep 2020 17:26:01 +0300
Date:   Mon, 14 Sep 2020 17:26:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200914142601.GD3956970@smile.fi.intel.com>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
 <CAK8P3a30D-mU5eLV1xAdvAordvcBavPN6sfEBghLQrQXQ2wVfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a30D-mU5eLV1xAdvAordvcBavPN6sfEBghLQrQXQ2wVfw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 11, 2020 at 06:20:49PM +0200, Arnd Bergmann wrote:
> > +static ssize_t lineevent_to_user(char __user *buf, struct gpioevent_data *ge)
> > +{
> > +#ifdef __x86_64__
> 
> I would make this "#ifdef CONFIG_IA32_COMPAT" to clarify what this
> is actually checking for.

There is no such option available right now, I prefer to leave as is to make
backporting easier.

> In theory we could add support for
> CONFIG_OABI_COMPAT here as well, not sure if there is a point.
> I recently came across a couple of things that all need the same
> hacks for arm-oabi and x86-32 in principle.
> 
> > +       /* i386 has no padding after 'id' */
> > +       if (in_ia32_syscall()) {
> > +               struct compat_ge {
> > +                       compat_u64      timestamp __packed;
> 
> No need for marking this __packed, it already is.

Yeah, due to a special alignment for compat_u64. I blindly copied from your
proposal.

> > +                       u32             id;
> > +               } cge;
> > +
> > +               if (buf && ge) {
> 
> I think I'd leave out the 'if()' checks here, and require the function
> to be called with valid pointers. It seems odd otherwise to return
> sizeof(cge) from the read() function without having written data.
> 
> Note also that user space may pass a NULL pointer and should
> get back -EFAULT instead of 12 or 16.

OK!

> > -       if (count < sizeof(ge))
> > +       /* When argument is NULL it returns size of the structure in user space */
> > +       ge_size = lineevent_to_user(NULL, NULL);
> > +       if (count < ge_size)
> >                 return -EINVAL;
> 
> Right, I see this is how it's being used, and I'd tend to agree with Kent:
> if you just determine the size dynamically and add a good comment,
> then the rest of the code gets simpler and more logical.

Okay, I will re-do this.

-- 
With Best Regards,
Andy Shevchenko


