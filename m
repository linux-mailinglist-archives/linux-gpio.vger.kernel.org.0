Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C19B103E26
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 16:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbfKTPSr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 10:18:47 -0500
Received: from mga05.intel.com ([192.55.52.43]:3410 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728142AbfKTPSr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 10:18:47 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 07:18:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; 
   d="scan'208";a="215832332"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 20 Nov 2019 07:18:44 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 20 Nov 2019 17:18:44 +0200
Date:   Wed, 20 Nov 2019 17:18:43 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] pinctrl: lewisburg: Update pin list according to
 v1.1v6
Message-ID: <20191120151843.GI11621@lahna.fi.intel.com>
References: <20191120133739.54332-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191120133739.54332-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 03:37:39PM +0200, Andy Shevchenko wrote:
> Version 1.1v6 of pin list has some changes in pin names for Intel Lewisburg.
> 
> Update the driver accordingly.
> 
> Note, it reveals the bug in the driver that misses two pins in GPP_L and
> has rather two extra ones. That's why the ordering of some groups is changed.
> 
> Fixes: e480b745386e ("pinctrl: intel: Add Intel Lewisburg GPIO support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> ---
>  drivers/pinctrl/intel/pinctrl-lewisburg.c | 171 +++++++++++-----------
>  1 file changed, 86 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-lewisburg.c b/drivers/pinctrl/intel/pinctrl-lewisburg.c
> index 2e06fb1464ab..7fdf4257df1e 100644
> --- a/drivers/pinctrl/intel/pinctrl-lewisburg.c
> +++ b/drivers/pinctrl/intel/pinctrl-lewisburg.c
> @@ -33,6 +33,7 @@
>  		.npins = ((e) - (s) + 1),		\
>  	}
>  
> +/* Lewisburg */

This is pretty useless comment. ;-)
