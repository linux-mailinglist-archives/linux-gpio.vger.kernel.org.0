Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088151A657F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 13:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgDMLNF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 07:13:05 -0400
Received: from mga07.intel.com ([134.134.136.100]:38182 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728716AbgDMLNF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Apr 2020 07:13:05 -0400
IronPort-SDR: AgK49uGSJi0vG8hoyz7oZlaOKIBjAY2rADIRfZf0Lg2mv4s7z3myLL3cb2EWJMA7P9+Pa9L538
 onIdNllJZdtw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 04:13:05 -0700
IronPort-SDR: 1ugm057ly/YGUzR8ofahUklB934/Z4H8Uo1mVOUIzoSDoGscaJZnmzXkOGs6Dr9or2A84gAcUc
 Opw1VBnFxegw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,378,1580803200"; 
   d="scan'208";a="252843764"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 13 Apr 2020 04:13:03 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jNx1W-000HBV-Hf; Mon, 13 Apr 2020 14:13:06 +0300
Date:   Mon, 13 Apr 2020 14:13:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 2/2] pinctrl: cherryview: Use GENMASK() consistently
Message-ID: <20200413111306.GD34613@smile.fi.intel.com>
References: <20200401173502.27626-1-andriy.shevchenko@linux.intel.com>
 <20200401173502.27626-2-andriy.shevchenko@linux.intel.com>
 <20200402073445.GJ2564@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402073445.GJ2564@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 02, 2020 at 10:34:45AM +0300, Mika Westerberg wrote:
> On Wed, Apr 01, 2020 at 08:35:02PM +0300, Andy Shevchenko wrote:
> > Use GENMASK() macro for all definitions where it's appropriate.
> > No functional change intended.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Both had been pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


