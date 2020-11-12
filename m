Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA862B0344
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 12:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgKLK77 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 05:59:59 -0500
Received: from mga07.intel.com ([134.134.136.100]:35965 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727981AbgKLK7v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 05:59:51 -0500
IronPort-SDR: EMukKchz8aw/lL86z6EdSsXVofYyLgnxSR2dL/NhXZReFzAxKmTa5v2Lm7ANJxCRsgtGRbjtE/
 MmhlSEqOsyXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="234454241"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="234454241"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 02:59:50 -0800
IronPort-SDR: l1ezP3AoGiv1XkW2HJKur7ONHBXtFg5N96coDGZ+Gp8K/Gwc1/A/qS4oeTRMIZu7S3f+7Kfx4o
 bgZlQwYNzJfQ==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="532108064"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 02:59:49 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kdALT-006BBN-G8; Thu, 12 Nov 2020 13:00:51 +0200
Date:   Thu, 12 Nov 2020 13:00:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 2/2] pinctrl: lynxpoint: Enable pin configuration
 setting for GPIO chip
Message-ID: <20201112110051.GY4077@smile.fi.intel.com>
References: <20201111113432.35641-1-andriy.shevchenko@linux.intel.com>
 <20201111113432.35641-2-andriy.shevchenko@linux.intel.com>
 <20201112080051.GS2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112080051.GS2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 10:00:51AM +0200, Mika Westerberg wrote:
> On Wed, Nov 11, 2020 at 01:34:32PM +0200, Andy Shevchenko wrote:
> > It appears that pin configuration for GPIO chip hasn't been enabled yet
> > due to absence of ->set_config() callback.
> > 
> > Enable it here for Intel Lynxpoint PCH.
> > 
> > Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


