Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2AB48CD37
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 21:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357723AbiALUpw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 15:45:52 -0500
Received: from mga02.intel.com ([134.134.136.20]:10621 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357719AbiALUpt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 15:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642020349; x=1673556349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3bd0+kvppXqt1g9WkYwL2BkeZvx2WQ/v4buHeuWib6I=;
  b=jqSXabtG2eiTkS9U5ZCcgS+CE/VL4zV2mUfF3Lw2tZBtuv3BwZTKQx3P
   mjalyMOudNK7xxNm1+Iy4djtyePD8ZOwWMpITZ7X/LsEGczzoRPoFimja
   xsoVUDse1wPrTUgIDSvA3vt7aHbpR1rJbf6hLposc6bTntNDhwX9kYQWn
   fj3Ltqtq4tLWE+lmZrRU9kQ1Vi4KkNlXixF60zNkTMmPW1l/5rZKgkKMG
   wbz9PAcv8ExHvAwQ7RjKdFWVkKGTlqyAKJyhVkNbD12ePdSl6MIt4thdy
   mPyG+SE8tyQUqpuZWT2ShUmgGJGVNimBzSBva9ktIC9h+Vjbz2e5XX6QJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="231192853"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="231192853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:45:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="691533858"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 12:45:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n7kTx-009vDY-L5;
        Wed, 12 Jan 2022 22:44:33 +0200
Date:   Wed, 12 Jan 2022 22:44:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     kernel test robot <lkp@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <Yd89sQz8L/KJ4BXA@smile.fi.intel.com>
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <202201090203.kgCw6bSd-lkp@intel.com>
 <eb4ef470-cfaf-13be-cb66-ca38c1a85a23@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb4ef470-cfaf-13be-cb66-ca38c1a85a23@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 12, 2022 at 08:58:00PM +0100, Hans de Goede wrote:
> On 1/8/22 19:54, kernel test robot wrote:

> >>> drivers/pinctrl/intel/pinctrl-baytrail.c:1483:58: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
> >                    dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
> >                                                              ~~~          ^~~~~~~~~~~~~~~~~~
> >                                                              %d
> >    include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
> >                    dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
> >                                                        ~~~     ^~~~~~~~~~~
> >    include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
> >                    _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
> >                                            ~~~    ^~~~~~~~~~~
> >    1 warning generated.
> 
> Hmm, ok. so x86_64 needs a %ld for the pointer arithmic result on i386 needs a %d
> without the 'l' what fun. I'll just store it in a temp int variable in the next
> version.

Why not to use uintptr_t and corresponding specifier (or ptrdiff_t)?

-- 
With Best Regards,
Andy Shevchenko


