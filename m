Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CC52AEA39
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 08:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgKKHfn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 02:35:43 -0500
Received: from mga07.intel.com ([134.134.136.100]:51470 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgKKHfk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 02:35:40 -0500
IronPort-SDR: PUHx8az0zZ2C/N1vEjAXdCVQnBAL5bHIbJQkIeUft190qGq4lqe7F0p0aTzaJkOA58/c9L88Z+
 duKqQ/V4JKpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="234275505"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="234275505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 23:35:38 -0800
IronPort-SDR: aXhr6lrzJc6PynPzrdFfsI7dW2+QoahA6gRWi7nyb9V+fQmCeYd+WBTR8Rc/kDrSNl6n5YS2Lk
 m41hmcCsSZlw==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="473757115"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 23:35:36 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 09:35:33 +0200
Date:   Wed, 11 Nov 2020 09:35:33 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Divagar Mohandass <divagar.mohandass@intel.com>
Subject: Re: [PATCH v1] pinctrl: jasperlake: Unhide SPI group of pins
Message-ID: <20201111073533.GM2495@lahna.fi.intel.com>
References: <20201110195923.14516-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110195923.14516-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 09:59:23PM +0200, Andy Shevchenko wrote:
> If the group of pins is hidden in the pin list it affects
> the register offset calculation despite fixed GPIO base.
> Hence, the offsets of all pins after the hidden group
> are broken. Instead we have to unhide the group and use a flag
> to exclude it from GPIO number space.
> 
> Fixes: e278dcb7048b ("pinctrl: intel: Add Intel Jasper Lake pin controller support")
> Reported-by: Divagar Mohandass <divagar.mohandass@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
