Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206B9294AD2
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 11:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441546AbgJUJyD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 05:54:03 -0400
Received: from mga06.intel.com ([134.134.136.31]:58741 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2441545AbgJUJyC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 05:54:02 -0400
IronPort-SDR: c7CTpq8I6VOb3AyqcxrQujdY7xx12RZXwd0KD1BYV7wLmpNlsA6RrfeVvC3Eks4UztZ31K6YNN
 lVTKQfTQL77w==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="228967259"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="228967259"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:54:00 -0700
IronPort-SDR: MefIALYdM/TDSR+jO1AAcwrRK3YBtCLuhdXidGZAVwBoA1e+cvlD7D+Q68hgNy+HYWJG4TGU1N
 /ZLHJCu05DWQ==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="348247441"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:53:58 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 21 Oct 2020 12:51:44 +0300
Date:   Wed, 21 Oct 2020 12:51:44 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jamie McClymont <jamie@kwiius.com>
Subject: Re: [PATCH v1 1/2] pinctrl: intel: Fix 2 kOhm bias which is 833 Ohm
Message-ID: <20201021095144.GT2495@lahna.fi.intel.com>
References: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 01:46:37PM +0300, Andy Shevchenko wrote:
> 2 kOhm bias was never an option in Intel GPIO hardware, the available
> matrix is:
> 
> 	000	none
> 	001	1 kOhm (if available)
> 	010	5 kOhm
> 	100	20 kOhm
> 
> As easy to get the 3 resistors are gated separately and according to
> parallel circuits calculations we may get combinations of the above where
> the result is always strictly less than minimal resistance. Hence,
> additional values can be:
> 
> 	011	~833.3 Ohm
> 	101	~952.4 Ohm
> 	110	~4 kOhm
> 	111	~800 Ohm
> 
> That said, convert TERM definitions to be the bit masks to reflect the above.
> 
> While at it, enable the same setting for pull down case.
> 
> Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
> Cc: Jamie McClymont <jamie@kwiius.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
