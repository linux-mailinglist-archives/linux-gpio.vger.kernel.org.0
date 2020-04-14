Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE171A7825
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 12:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438156AbgDNKJH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 06:09:07 -0400
Received: from mga14.intel.com ([192.55.52.115]:27270 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438154AbgDNKJF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 06:09:05 -0400
IronPort-SDR: B1GiT1Zb1VOyzo4slrc6RhqYdz7yKr0GXLmDHXsJf5bJBo346CBszhLpvucXJn35m05uL62e/e
 hPkhFyVUQBiA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 03:09:04 -0700
IronPort-SDR: ox6VvGPouo8xylcxoQZ3gcjb1PusoPBmBl9vJ5nvuelf+t9Mmtr+xlgRnMh21KjcEALdEkBOzr
 kSpnAHmvAI6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; 
   d="scan'208";a="399907462"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 14 Apr 2020 03:09:03 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jOIV8-000UvO-8a; Tue, 14 Apr 2020 13:09:06 +0300
Date:   Tue, 14 Apr 2020 13:09:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 6/6] pinctrl: intel: Add Intel Jasper Lake pin
 controller support
Message-ID: <20200414100906.GL34613@smile.fi.intel.com>
References: <20200413111825.89866-1-andriy.shevchenko@linux.intel.com>
 <20200413111825.89866-6-andriy.shevchenko@linux.intel.com>
 <20200414095310.GK2567@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414095310.GK2567@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 14, 2020 at 12:53:10PM +0300, Mika Westerberg wrote:
> On Mon, Apr 13, 2020 at 02:18:25PM +0300, Andy Shevchenko wrote:
> > This driver adds pinctrl/GPIO support for Intel Jasper Lake SoC. The
> > GPIO controller is based on the next generation GPIO hardware but still
> > compatible with the one supported by the Intel core pinctrl/GPIO driver.
> > 
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

All 6 has been pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


