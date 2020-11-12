Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDF22B00D8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 09:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgKLIG5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 03:06:57 -0500
Received: from mga04.intel.com ([192.55.52.120]:39225 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgKLIG4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 03:06:56 -0500
IronPort-SDR: tRBRueyFhjEwp7gcQY7wge68/38q4/jfhGkE4j8lzxkFkaqnHFs9IYAKBdYqXbyw35VtT0zaim
 kKMloNSr0Aow==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="167691338"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="167691338"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:06:55 -0800
IronPort-SDR: 5aR+1JmDzV60a44GgLNvMiIIhWHttd5kY6oyLr/gJmLtTLQ45IpLEtoCe3BDqp0azL+3bVxy72
 P0U+nqmFlMIA==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="542164001"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:06:53 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 12 Nov 2020 10:06:50 +0200
Date:   Thu, 12 Nov 2020 10:06:50 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: merrifield: Set default bias in case no
 particular value given
Message-ID: <20201112080650.GU2495@lahna.fi.intel.com>
References: <20201111120605.50881-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111120605.50881-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 02:06:05PM +0200, Andy Shevchenko wrote:
> When GPIO library asks pin control to set the bias, it doesn't pass
> any value of it and argument is considered boolean (and this is true
> for ACPI GpioIo() / GpioInt() resources, by the way). Thus, individual
> drivers must behave well, when they got the resistance value of 1 Ohm,
> i.e. transforming it to sane default.
> 
> In case of Intel Merrifield pin control hardware the 20 kOhm sounds plausible
> because it gives a good trade off between weakness and minimization of leakage
> current (will be only 50 uA with the above choice).
> 
> Fixes: 4e80c8f50574 ("pinctrl: intel: Add Intel Merrifield pin controller support")
> Depends-on: 2956b5d94a76 ("pinctrl / gpio: Introduce .set_config() callback for GPIO chips")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
