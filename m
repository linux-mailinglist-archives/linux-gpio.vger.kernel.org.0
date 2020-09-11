Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A55E265C12
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 10:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725613AbgIKI5e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 04:57:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:6078 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbgIKI51 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Sep 2020 04:57:27 -0400
IronPort-SDR: 03vgo1ud2kOf+HTtbV5CtEhCoLi5RubfyfL64dnhczHNA5P0ehqcn4TCJhBtp000bXXFSGBQhJ
 xUNR0Fkfiq1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="138237407"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="138237407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 01:57:26 -0700
IronPort-SDR: STzB4Z1f5k2Y17Kt6dqGvJ1/8TEUcasYpfdzYzf78CBHv0EzFQOGXNqFSOLaS/nQPn7BbHUO0I
 r35mZQkMgRHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="334451946"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 11 Sep 2020 01:57:24 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kGeSc-00Fu75-04; Fri, 11 Sep 2020 11:31:10 +0300
Date:   Fri, 11 Sep 2020 11:31:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200911083109.GF1891694@smile.fi.intel.com>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
 <20200911030539.GA574097@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911030539.GA574097@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 11, 2020 at 11:05:39AM +0800, Kent Gibson wrote:
> On Thu, Sep 10, 2020 at 01:19:34PM +0300, Andy Shevchenko wrote:
> > The introduced line even handling ABI in the commit
> > 
> 
> s/even/event/
> 
> >   61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > 
> > missed the fact that 64-bit kernel may serve for 32-bit applications.
> > In such case the very first check in the lineevent_read() will fail
> > due to alignment differences.
> > 
> > To workaround this introduce lineeven_to_user() helper which returns actual
> > size of the structure and copies its content to user if asked.
> > 
> 
> And again here.

Thanks!

...

> > +#ifdef __x86_64__
> > +	/* i386 has no padding after 'id' */
> > +	if (in_ia32_syscall()) {
> > +		struct compat_ge {
> > +			compat_u64	timestamp __packed;
> > +			u32		id;
> > +		} cge;
> > +
> > +		if (buf && ge) {
> > +			cge = (struct compat_ge){ ge->timestamp, ge->id };
> > +			if (copy_to_user(buf, &cge, sizeof(cge)))
> > +				return -EFAULT;
> > +		}
> > +
> > +		return sizeof(cge);
> > +	}
> > +#endif
> > +
> > +	if (buf && ge) {
> > +		if (copy_to_user(buf, ge, sizeof(*ge)))
> > +			return -EFAULT;
> > +	}
> > +
> > +	return sizeof(*ge);
> > +}
> >  
> 
> The dual-purpose nature of this function makes it more complicated than
> it needs to be.
> I was going to suggest splitting it into separate functions, but...
> 
> Given that struct compat_ge is a strict truncation of struct
> gpioevent_data, how about reducing this function to just determining the
> size of the event for user space, say lineevent_user_size(), and
> replacing sizeof(ge) with that calculcated size throughout
> lineevent_read()?

So you mean something like

	struct compat_gpioeevent_data {
		compat_u64	timestamp;
		u32		id;
	} __packed;

#ifdef __x86_64__
	/* i386 has no padding after 'id' */
	size_t ge_size = in_ia32_syscall() ? sizeof(struct compat_gpioevent_data) : sizeof(struct gpioevent_data);
#else
	size_t ge_size = sizeof(struct gpioevent_data) ;
#endif

?

...

> Is patch 2 in any way related to this patch?

No. It can be applied separately.

-- 
With Best Regards,
Andy Shevchenko


