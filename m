Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D94287464
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 10:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfHIIkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 04:40:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:24673 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726178AbfHIIkX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Aug 2019 04:40:23 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Aug 2019 01:40:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; 
   d="scan'208";a="193348959"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 09 Aug 2019 01:40:21 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 09 Aug 2019 11:40:20 +0300
Date:   Fri, 9 Aug 2019 11:40:20 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: intel: Allow to request locked pads
Message-ID: <20190809084020.GO2716@lahna.fi.intel.com>
References: <20190808132128.13359-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808132128.13359-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 08, 2019 at 04:21:28PM +0300, Andy Shevchenko wrote:
> Some firmwares would like to protect pads from being modified by OS
> and at the same time provide them to OS as a resource. So, the driver
> in such circumstances may request pad and may not change its state.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> in v2:
> - amended comment in intel_pad_locked() respectively to the change (Mika)
> - described enum values (Linus)
> - lowered case for locking flavour in debugfs for better looking
>  drivers/pinctrl/intel/pinctrl-intel.c | 67 ++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index c949df07cbdf..b84a5579beee 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -220,47 +220,69 @@ static bool intel_pad_acpi_mode(struct intel_pinctrl *pctrl, unsigned int pin)
>  	return !(readl(hostown) & BIT(gpp_offset));
>  }
>  
> -static bool intel_pad_locked(struct intel_pinctrl *pctrl, unsigned int pin)
> +/*

This should be /**

> + * PAD_UNLOCKED:	pad is fully controlled by the configuration registers

These should have @ prefix, I think.

Otherwise looks good.
