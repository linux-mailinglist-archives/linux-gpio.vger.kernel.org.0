Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561162B00B5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 09:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbgKLIA2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 03:00:28 -0500
Received: from mga06.intel.com ([134.134.136.31]:30398 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbgKLIAT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 03:00:19 -0500
IronPort-SDR: AG15wB6Lkg9f/VB6CsA0hXHFBkTDdPoCoCLTrLlVb0TXSgxbh37aycAKpRvrkctX5Thr0FppvG
 3V+IZwLGtmQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="231893744"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="231893744"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:00:17 -0800
IronPort-SDR: Id7aFsxmUTr/VL6dKsJtuUZEKk6DS+e7eftMWxXpwbqvKXwCU8vs/phgZZAvuutkrpq7FYUYKS
 iU8uT5y1l+bw==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="474181763"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:00:15 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 12 Nov 2020 10:00:12 +0200
Date:   Thu, 12 Nov 2020 10:00:12 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/2] pinctrl: lynxpoint: Use defined constant for
 disabled bias explicitly
Message-ID: <20201112080012.GR2495@lahna.fi.intel.com>
References: <20201111113432.35641-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111113432.35641-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 01:34:31PM +0200, Andy Shevchenko wrote:
> We have a specific constant to describe a disabled bias,
> i.e. GPIWP_NONE. Use it explicitly instead of making
> an assumption about its value.
> 
> While at it, move argument assignment to the switch-case
> in lp_pin_config_get().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
