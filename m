Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B45F2484D7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 14:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgHRMgG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 08:36:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:38487 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726476AbgHRMgF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 08:36:05 -0400
IronPort-SDR: nXrc8U1+n+3YRZ50U1+Sd24BlkiiwrfU4ALcqfD33kDdpqX1AecLzFYtWlSjrLl7GOlOar6LHJ
 sGysNatG0Pnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="239715214"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="239715214"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 05:36:04 -0700
IronPort-SDR: XV9314jltUZiJx8jQIqIzV3AhoKVXr+Jo9+nl4Djg5TJc/8spXZR7u/YlXUPSPpoYMTkvrvrHG
 yLw3AdOMI5Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="400479900"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 18 Aug 2020 05:36:02 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 18 Aug 2020 15:36:02 +0300
Date:   Tue, 18 Aug 2020 15:36:02 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Extract
 intel_pinctrl_get_soc_data() helper for wider use
Message-ID: <20200818123602.GN1375436@lahna.fi.intel.com>
References: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
 <20200803123318.GR1375436@lahna.fi.intel.com>
 <20200803135031.GI3703480@smile.fi.intel.com>
 <20200818123459.GL1891694@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
> > > > intel_pinctrl_get_soc_data() helper can be used in few driver instead of
> > > > open-coded variants. Thus, extract it as a standalone API.
> > 
> > ...
> > 
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

OK

> Are you good with current version then?

Yes :)
