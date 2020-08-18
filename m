Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C885E2484DD
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 14:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgHRMhE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 08:37:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:63832 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgHRMhB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 08:37:01 -0400
IronPort-SDR: FmnwTmBH+89UiwzNq3sdgKsP2AiwBJvPZpHGU1zvfVqJNoPRzVl/J5rA0b7tvEsjSzKg660hKu
 4QRribrDTZ5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="216415517"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="216415517"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 05:37:01 -0700
IronPort-SDR: EKYbIV+Ijfg97YrD06NqmTJj3TBrbrLLzndpVerAxzWc7NIHyBsi86EJ4QqCJ4oFiZ+PNJTzKS
 Z1lqmI4pajLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="326717409"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 18 Aug 2020 05:37:00 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k80rL-009e7J-1E; Tue, 18 Aug 2020 15:36:59 +0300
Date:   Tue, 18 Aug 2020 15:36:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Extract
 intel_pinctrl_get_soc_data() helper for wider use
Message-ID: <20200818123659.GM1891694@smile.fi.intel.com>
References: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
 <20200803123318.GR1375436@lahna.fi.intel.com>
 <20200803135031.GI3703480@smile.fi.intel.com>
 <20200818123459.GL1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200818123459.GL1891694@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 18, 2020 at 03:34:59PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 03, 2020 at 04:50:31PM +0300, Andy Shevchenko wrote:
> > On Mon, Aug 03, 2020 at 03:33:18PM +0300, Mika Westerberg wrote:
> > > On Wed, Jul 29, 2020 at 02:57:06PM +0300, Andy Shevchenko wrote:

...

> > > > +const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)
> > > 
> > > Can we make this take const parameter as well?
> > 
> > You mean
> > 
> > const struct intel_pinctrl_soc_data *
> > intel_pinctrl_get_soc_data(const struct platform_device *pdev)
> > 
> > ?
> > 
> > Sure, I can do it for v2.
> 
> Actually I can't. device_match_data() requires struct device * pointer and
> compiler is unable to compile with const qualifier.

pinctrl-intel.c: In function ‘intel_pinctrl_get_soc_data’:
pinctrl-intel.c:1533:45: warning: passing argument 1 of ‘device_get_match_data’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]


> Are you good with current version then?

-- 
With Best Regards,
Andy Shevchenko


