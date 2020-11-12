Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5F32B070F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 14:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgKLNzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 08:55:09 -0500
Received: from mga09.intel.com ([134.134.136.24]:12921 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728270AbgKLNzI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 08:55:08 -0500
IronPort-SDR: a5lCxksy8+CtpcfRlMitGjHF8IpLh+vFWuYLKag9me/SmJBOo2sMWC1DNoD2pip4zeD/iwnegC
 41eqifom+Lxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="170475323"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="170475323"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 05:55:06 -0800
IronPort-SDR: 0CzfydfOw1SAqyfHHyYQlnZ4IXG502VF0I0h4YFdD5kICGAtu9xnA+YLyxomarLBSP8AynOr/E
 X4ApygVrp2Pw==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; 
   d="scan'208";a="532173226"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 05:55:04 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kdD54-006DXA-OF; Thu, 12 Nov 2020 15:56:06 +0200
Date:   Thu, 12 Nov 2020 15:56:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Divagar Mohandass <divagar.mohandass@intel.com>
Subject: Re: [PATCH v1] pinctrl: jasperlake: Unhide SPI group of pins
Message-ID: <20201112135606.GD4077@smile.fi.intel.com>
References: <20201110195923.14516-1-andriy.shevchenko@linux.intel.com>
 <20201111073533.GM2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111073533.GM2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 09:35:33AM +0200, Mika Westerberg wrote:
> On Tue, Nov 10, 2020 at 09:59:23PM +0200, Andy Shevchenko wrote:
> > If the group of pins is hidden in the pin list it affects
> > the register offset calculation despite fixed GPIO base.
> > Hence, the offsets of all pins after the hidden group
> > are broken. Instead we have to unhide the group and use a flag
> > to exclude it from GPIO number space.
> > 
> > Fixes: e278dcb7048b ("pinctrl: intel: Add Intel Jasper Lake pin controller support")
> > Reported-by: Divagar Mohandass <divagar.mohandass@intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


