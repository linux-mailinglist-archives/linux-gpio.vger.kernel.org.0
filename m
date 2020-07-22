Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3579622971D
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 13:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgGVLFx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 07:05:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:42637 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgGVLFx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Jul 2020 07:05:53 -0400
IronPort-SDR: Idz8V1mJcC6GLuXI70t184fptTS0TgxbZkUzFJBOBFsBwtzucwTGzt/paiQgB8Em0tj5UOOtlW
 gctbeJldRt2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="129874731"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="129874731"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2020 04:05:35 -0700
IronPort-SDR: UASi1QKyxazfPEkqbxSaAPccLBXSP0eQQALKaBjQ3Hi48xU0xZXcxGkXSeRO+VhGCBOwdmEBiW
 zTnmckCrAoAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; 
   d="scan'208";a="362676832"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 22 Jul 2020 04:05:34 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jyCZ4-003FBG-CL; Wed, 22 Jul 2020 14:05:34 +0300
Date:   Wed, 22 Jul 2020 14:05:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Emmitsburg pin controller
 support
Message-ID: <20200722110534.GX3703480@smile.fi.intel.com>
References: <20200716124244.50797-1-andriy.shevchenko@linux.intel.com>
 <20200720121923.GI5180@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720121923.GI5180@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 20, 2020 at 03:19:23PM +0300, Mika Westerberg wrote:
> On Thu, Jul 16, 2020 at 03:42:44PM +0300, Andy Shevchenko wrote:
> > This driver adds pinctrl/GPIO support for Intel Emmitsburg PCH. The
> > GPIO controller is based on the next generation GPIO hardware but still
> > compatible with the one supported by the Intel core pinctrl/GPIO driver.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied!

-- 
With Best Regards,
Andy Shevchenko


