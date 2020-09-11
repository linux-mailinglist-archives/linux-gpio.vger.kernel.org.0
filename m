Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FDE265D08
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 11:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgIKJyE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 05:54:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:15645 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgIKJyB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Sep 2020 05:54:01 -0400
IronPort-SDR: CP7uQGWYw8S4k7FZMTd2BFtCT3X7UKUIh/mbHawCnUQ6m0HYAaIGEkPCprod1i7oNrsz3K5ib4
 xgSeOfyLkL2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="220281909"
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="220281909"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 02:54:01 -0700
IronPort-SDR: E5QEi/rw1bQiic/Vl1jyCDJE0TwWB5kUuDhpvSn4369YcKOC+TlUhtRhQHlDYxN0Hk4YkR2o9H
 KvyMCd6rEC3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,414,1592895600"; 
   d="scan'208";a="334467937"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 11 Sep 2020 02:53:58 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kGfki-00Fuxb-02; Fri, 11 Sep 2020 12:53:56 +0300
Date:   Fri, 11 Sep 2020 12:53:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 1/2] gpiolib: Fix line event handling in syscall
 compatible mode
Message-ID: <20200911095355.GG1891694@smile.fi.intel.com>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
 <20200911030539.GA574097@sol>
 <20200911083109.GF1891694@smile.fi.intel.com>
 <20200911091249.GA1874731@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911091249.GA1874731@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 11, 2020 at 05:12:49PM +0800, Kent Gibson wrote:
> On Fri, Sep 11, 2020 at 11:31:09AM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 11, 2020 at 11:05:39AM +0800, Kent Gibson wrote:
> > > On Thu, Sep 10, 2020 at 01:19:34PM +0300, Andy Shevchenko wrote:

...

> > > > +#ifdef __x86_64__
> > > > +	/* i386 has no padding after 'id' */
> > > > +	if (in_ia32_syscall()) {
> > > > +		struct compat_ge {
> > > > +			compat_u64	timestamp __packed;
> > > > +			u32		id;
> > > > +		} cge;
> > > > +
> > > > +		if (buf && ge) {
> > > > +			cge = (struct compat_ge){ ge->timestamp, ge->id };
> > > > +			if (copy_to_user(buf, &cge, sizeof(cge)))
> > > > +				return -EFAULT;
> > > > +		}
> > > > +
> > > > +		return sizeof(cge);
> > > > +	}
> > > > +#endif
> > > > +
> > > > +	if (buf && ge) {
> > > > +		if (copy_to_user(buf, ge, sizeof(*ge)))
> > > > +			return -EFAULT;
> > > > +	}
> > > > +
> > > > +	return sizeof(*ge);
> > > > +}
> > > 
> > > The dual-purpose nature of this function makes it more complicated than
> > > it needs to be.
> > > I was going to suggest splitting it into separate functions, but...
> > > 
> > > Given that struct compat_ge is a strict truncation of struct
> > > gpioevent_data, how about reducing this function to just determining the
> > > size of the event for user space, say lineevent_user_size(), and
> > > replacing sizeof(ge) with that calculcated size throughout
> > > lineevent_read()?
> > 
> > So you mean something like
> > 
> > 	struct compat_gpioeevent_data {
> > 		compat_u64	timestamp;
> > 		u32		id;
> > 	} __packed;
> > 
> > #ifdef __x86_64__
> > 	/* i386 has no padding after 'id' */
> > 	size_t ge_size = in_ia32_syscall() ? sizeof(struct compat_gpioevent_data) : sizeof(struct gpioevent_data);
> > #else
> > 	size_t ge_size = sizeof(struct gpioevent_data) ;
> > #endif
> > 
> > ?
> > 
> 
> Pretty much, though I was suggesting keeping it in a helper function,
> say lineevent_user_size(), not in lineevent_read() itself, to isolate
> all the ugliness in one small place.
> 
> So in lineevent_read() you would:
> 
>    size_t ge_size = lineevent_user_size();
> 
> and then use that to replace all the sizeof(ge) occurrences.

But in any case it makes code a bit hackish, no?

We calculate the size of one structure and by the fact *partially* copy
another one.

And actually if you look closer to the types, the compat_u64 is not the same as u64.
So, I'm not sure your solution would work in all cases.

-- 
With Best Regards,
Andy Shevchenko


