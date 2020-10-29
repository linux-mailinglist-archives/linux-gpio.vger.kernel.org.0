Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4250629EE58
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 15:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727721AbgJ2Od2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 10:33:28 -0400
Received: from mga12.intel.com ([192.55.52.136]:25170 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727689AbgJ2Od1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 10:33:27 -0400
IronPort-SDR: 5ugrNcJ8GbAS4/ES7Zww6g/LrVLvTgWOBCJlvu/6ExwguKT4rBeArmrWQOd1myVFYzKEjRanZs
 9IB9ZflFv7ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="147722008"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="147722008"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 07:33:27 -0700
IronPort-SDR: KwEcGQiIR1Ufqf7HxgKS/CkKUAiprQSkC3/PAgqY9iRrDFyVApFuHtWFIie3lavF8p4aS8MJR3
 OpEGutQYXYCw==
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="469156816"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 07:33:26 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kY90X-001JCs-0p; Thu, 29 Oct 2020 16:34:29 +0200
Date:   Thu, 29 Oct 2020 16:34:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: intel: Add Intel Alder Lake-S pin controller
 support
Message-ID: <20201029143429.GY4077@smile.fi.intel.com>
References: <20201029111315.66602-1-andriy.shevchenko@linux.intel.com>
 <20201029123315.GV2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029123315.GV2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 02:33:15PM +0200, Mika Westerberg wrote:
> On Thu, Oct 29, 2020 at 01:13:15PM +0200, Andy Shevchenko wrote:
> > This driver adds pinctrl/GPIO support for Intel Alder Lake-S SoC. The
> > GPIO controller is based on the next generation GPIO hardware but still
> > compatible with the one supported by the Intel core pinctrl/GPIO driver.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


