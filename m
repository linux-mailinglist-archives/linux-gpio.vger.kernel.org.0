Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E38E248D53
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 19:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbgHRRiU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 13:38:20 -0400
Received: from mga12.intel.com ([192.55.52.136]:59414 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727913AbgHRRiT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 13:38:19 -0400
IronPort-SDR: n1DqBHA568dXsfot63d0IEHRilyZJNr543VZKUd/guzhtwhiKuiLO6btQmZ4C0T9vEQ4ktcAA1
 qF7lNcW6jD0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="134485378"
X-IronPort-AV: E=Sophos;i="5.76,328,1592895600"; 
   d="scan'208";a="134485378"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 10:38:19 -0700
IronPort-SDR: BxFlAam+9m+wEOuZ5i924HqVmxUAbikIasnEWIHE8aEOK2RLGxEd3H5gtFES7kjnbBQF9vxmnh
 Cjh8FcyulJYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,328,1592895600"; 
   d="scan'208";a="326805221"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 18 Aug 2020 10:38:17 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1k85Wo-009hv3-4c; Tue, 18 Aug 2020 20:36:06 +0300
Date:   Tue, 18 Aug 2020 20:36:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Update header block to reflect direct
 dependencies
Message-ID: <20200818173606.GV1891694@smile.fi.intel.com>
References: <20200818142353.34083-1-andriy.shevchenko@linux.intel.com>
 <20200818144727.GU1375436@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818144727.GU1375436@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 18, 2020 at 05:47:27PM +0300, Mika Westerberg wrote:
> On Tue, Aug 18, 2020 at 05:23:53PM +0300, Andy Shevchenko wrote:
> > Update header inclusion block to reflect all direct dependencies
> > that are being involved in pinctrl-intel.h.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


