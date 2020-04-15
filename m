Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A8A1A9EC9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 14:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S368144AbgDOMBQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 08:01:16 -0400
Received: from mga18.intel.com ([134.134.136.126]:9040 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S368133AbgDOMBI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 08:01:08 -0400
IronPort-SDR: NxKGzfr/fFlwfkjBKjoxfF8Qj7g2SpFW0zPhdhlIYZ0hsSYfjZe5Kpk9hT5KPprUx7sDoGb9lh
 efQ3iYMH2sQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 05:01:07 -0700
IronPort-SDR: iTA49YLgM0TGQAjv+v8Tppokn/pFZLg21WgIcOT5RRAaIEjLCE//5ZFjhkY5RuSpeqC8neuSwu
 /gETDxZ3Xdrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="271705157"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 15 Apr 2020 05:01:06 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOgj6-000mCt-UA; Wed, 15 Apr 2020 15:01:08 +0300
Date:   Wed, 15 Apr 2020 15:01:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: pch: Use BIT() and GENMASK() where it's
 appropriate
Message-ID: <20200415120108.GY34613@smile.fi.intel.com>
References: <20200402201859.35832-1-andriy.shevchenko@linux.intel.com>
 <CAMpxmJVxQFUBkvQ8aDiybRab_xk+xy2GBgz0g=A6TVEDanRTfw@mail.gmail.com>
 <20200409150921.GG3676135@smile.fi.intel.com>
 <CAMpxmJWvkC0_c8ehrYbbALOXQrtx5GcCX0FuDmBCRObhkzy7dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJWvkC0_c8ehrYbbALOXQrtx5GcCX0FuDmBCRObhkzy7dg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 01:17:41PM +0200, Bartosz Golaszewski wrote:
> czw., 9 kwi 2020 o 17:09 Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> napisał(a):
> > On Mon, Apr 06, 2020 at 09:23:30AM +0200, Bartosz Golaszewski wrote:
> > > czw., 2 kwi 2020 o 22:19 Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> napisał(a):

...

> > That said, I'm not against the change, but I would like to be sure
> > what is the benefit.
> >
> 
> Frankly this is just my personal preference. I think it's consistent
> with the majority of codebase in the kernel but I won't block this
> patch for that reason. Feel free to leave it like it is if you prefer
> it.

Thank you, I prefer to see plain (decimal) numbers there.

I sent v2 since it has more patches and one more BIT removal here.

-- 
With Best Regards,
Andy Shevchenko


