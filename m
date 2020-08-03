Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B817E23A7E6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 15:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgHCNud (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 09:50:33 -0400
Received: from mga03.intel.com ([134.134.136.65]:5063 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726785AbgHCNud (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Aug 2020 09:50:33 -0400
IronPort-SDR: vxp283VIE2ln1FI3F8n2flyvc6KjyhH94iByTzDzRI1OoDByxn0XmaF9Eimy/wB/0qKSBCcHyK
 j7VCk3BncODw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="152068940"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="152068940"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 06:50:32 -0700
IronPort-SDR: fbvBRE1t8DcfW/cjd+Jl55BHuUWsdbv6MT7a3tV71DLNJnKE7cG3oZDI0wxKTNMrPQvIJDNer3
 M6TA83SngK/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="324077066"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2020 06:50:31 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k2arH-005xPq-CY; Mon, 03 Aug 2020 16:50:31 +0300
Date:   Mon, 3 Aug 2020 16:50:31 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Extract
 intel_pinctrl_get_soc_data() helper for wider use
Message-ID: <20200803135031.GI3703480@smile.fi.intel.com>
References: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
 <20200803123318.GR1375436@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803123318.GR1375436@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 03, 2020 at 03:33:18PM +0300, Mika Westerberg wrote:
> On Wed, Jul 29, 2020 at 02:57:06PM +0300, Andy Shevchenko wrote:
> > intel_pinctrl_get_soc_data() helper can be used in few driver instead of
> > open-coded variants. Thus, extract it as a standalone API.

...

> > +const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)
> 
> Can we make this take const parameter as well?

You mean

const struct intel_pinctrl_soc_data *
intel_pinctrl_get_soc_data(const struct platform_device *pdev)

?

Sure, I can do it for v2.

-- 
With Best Regards,
Andy Shevchenko


