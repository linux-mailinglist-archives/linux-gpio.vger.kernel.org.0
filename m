Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A9F2A4440
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 12:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgKCL2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 06:28:34 -0500
Received: from mga14.intel.com ([192.55.52.115]:56023 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728350AbgKCL2e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Nov 2020 06:28:34 -0500
IronPort-SDR: JQrJffYHHHAQOWNmmFsKvarR3pXQfF9ZNV6b3qH03u4xVs5lvAtsviWZdVrcNuDKUXoKY0OL+u
 lg7itczpnwCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="168253934"
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="scan'208";a="168253934"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 03:28:34 -0800
IronPort-SDR: piyQK/uluTlW+jBoTesE0sgcLDi4OHjY4OiasFV7a3FeU3pZaNiG6WVG++uGC8N98xvGZdIj5Z
 a+UaQfMZQJag==
X-IronPort-AV: E=Sophos;i="5.77,447,1596524400"; 
   d="scan'208";a="320398075"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2020 03:28:32 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kZuVK-003T0Q-Uf; Tue, 03 Nov 2020 13:29:34 +0200
Date:   Tue, 3 Nov 2020 13:29:34 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Elkhart Lake pin controller
 support
Message-ID: <20201103112934.GB4077@smile.fi.intel.com>
References: <20201102122107.57687-1-andriy.shevchenko@linux.intel.com>
 <20201102163027.GV2495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102163027.GV2495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 02, 2020 at 06:30:27PM +0200, Mika Westerberg wrote:
> On Mon, Nov 02, 2020 at 02:21:07PM +0200, Andy Shevchenko wrote:
> > This driver adds pinctrl/GPIO support for Intel Elkhart Lake SoC. The
> > GPIO controller is based on the next generation GPIO hardware but still
> > compatible with the one supported by the Intel core pinctrl/GPIO driver.
> > 
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


