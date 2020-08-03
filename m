Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5804323A852
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 16:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgHCOXD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 10:23:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:20456 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726358AbgHCOXD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Aug 2020 10:23:03 -0400
IronPort-SDR: 9eUXjpvtXnKCnP2+925lzaCZOvHfQ/UTs5V3xaRuB3Lyc38ls1ac4hvX6s0S6r8u+baSza4QfN
 QCkTzdmPAb4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="132166669"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="132166669"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 07:23:02 -0700
IronPort-SDR: +ewJRo3Ox7Wuf0cRGdK3N4UuMSLXhoRL5whS9GXHHsEUgrpyPSJDQV2tc60kK1tGAxby65b7Ag
 c2XEHRlFVVyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="396081275"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 03 Aug 2020 07:23:00 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Aug 2020 17:22:59 +0300
Date:   Mon, 3 Aug 2020 17:22:59 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Extract
 intel_pinctrl_get_soc_data() helper for wider use
Message-ID: <20200803142259.GZ1375436@lahna.fi.intel.com>
References: <20200729115708.38112-1-andriy.shevchenko@linux.intel.com>
 <20200803123318.GR1375436@lahna.fi.intel.com>
 <20200803135031.GI3703480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803135031.GI3703480@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 03, 2020 at 04:50:31PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 03, 2020 at 03:33:18PM +0300, Mika Westerberg wrote:
> > On Wed, Jul 29, 2020 at 02:57:06PM +0300, Andy Shevchenko wrote:
> > > intel_pinctrl_get_soc_data() helper can be used in few driver instead of
> > > open-coded variants. Thus, extract it as a standalone API.
> 
> ...
> 
> > > +const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)
> > 
> > Can we make this take const parameter as well?
> 
> You mean
> 
> const struct intel_pinctrl_soc_data *
> intel_pinctrl_get_soc_data(const struct platform_device *pdev)
> 
> ?

Yes, exactly.

> Sure, I can do it for v2.

Thanks!
