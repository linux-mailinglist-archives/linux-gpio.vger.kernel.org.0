Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83532A443E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 12:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgKCL2M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 06:28:12 -0500
Received: from mga17.intel.com ([192.55.52.151]:17350 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728350AbgKCL2M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Nov 2020 06:28:12 -0500
IronPort-SDR: PONamcvv3W4MeiCwinxvBUxGvx029J+/IuGcKZkpqboPPs0KHe9Rce3ysholaPT0LWzrj7sFrU
 5jL1THK3d6EQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="148891492"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="scan'208";a="148891492"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 03:28:12 -0800
IronPort-SDR: 8o5JGDkVi7Hhk2oRap7Y+wlrLO25dtsRXKQ7fQQBXS8D3ieTKFe959PAXZHwNc4Wluk4W+T8PJ
 VR5bjV6YxvUw==
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="scan'208";a="528422260"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 03:28:10 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kZuUz-003T06-GA; Tue, 03 Nov 2020 13:29:13 +0200
Date:   Tue, 3 Nov 2020 13:29:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: lynxpoint: Unify initcall location in the
 code
Message-ID: <20201103112913.GA4077@smile.fi.intel.com>
References: <20201102123911.58337-1-andriy.shevchenko@linux.intel.com>
 <20201102163120.GW2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102163120.GW2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 02, 2020 at 06:31:20PM +0200, Mika Westerberg wrote:
> On Mon, Nov 02, 2020 at 02:39:11PM +0200, Andy Shevchenko wrote:
> > Like in the other Intel pin control drivers, attach initcalls
> > to the corresponding functions. No functional change intended.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


