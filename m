Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F17681A25B4
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2020 17:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgDHPlp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Apr 2020 11:41:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:7790 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727933AbgDHPlp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Apr 2020 11:41:45 -0400
IronPort-SDR: aCmnKh5MuU/zgkHM967lZK6bArQb3vuQDphZDlWnCUgUAx3FmQFoPpGTbofJ52CybPXS9xO6/B
 y6zLX1fXFMTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 08:41:44 -0700
IronPort-SDR: YRw2mDPqm3cnHZLGMAQRoz6W+Yg54WyrmZATumB/JxQQASmJcW551QrIOkzlyRXUOsvR7lCXA5
 b0dtj+57GI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; 
   d="scan'208";a="398237784"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004.jf.intel.com with ESMTP; 08 Apr 2020 08:41:43 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jMCpm-00GjYx-00; Wed, 08 Apr 2020 18:41:46 +0300
Date:   Wed, 8 Apr 2020 18:41:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/2] gpio: merrifield: Switch over to MSI interrupts
Message-ID: <20200408154145.GF3676135@smile.fi.intel.com>
References: <20200408152346.59718-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200408152346.59718-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 08, 2020 at 06:23:45PM +0300, Andy Shevchenko wrote:
> Some devices may support MSI interrupts. Let's at least try to use them
> in platforms that provide MSI capability.

This is wrong patch, please ignore.
I'll send v2 soon.

-- 
With Best Regards,
Andy Shevchenko


