Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689A1DEC19
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 14:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfJUMYE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 08:24:04 -0400
Received: from mga03.intel.com ([134.134.136.65]:30017 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727256AbfJUMYE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Oct 2019 08:24:04 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 05:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209434226"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 05:24:00 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 15:24:00 +0300
Date:   Mon, 21 Oct 2019 15:24:00 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 1/3] pinctrl: intel: Introduce intel_restore_padcfg()
 helper
Message-ID: <20191021122400.GC2819@lahna.fi.intel.com>
References: <20191014084348.42489-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014084348.42489-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 11:43:46AM +0300, Andy Shevchenko wrote:
> Deduplicate restoring PADCFGx registers by using a common helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 51 +++++++++++++--------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index bc013599a9a3..18467e2efe99 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1588,6 +1588,27 @@ intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
>  	return curr;
>  }
>  
> +static void intel_restore_padcfg(struct intel_pinctrl *pctrl, unsigned int pin,
> +				 unsigned int reg, u32 value)
> +{
> +	struct device *dev = pctrl->dev;
> +	unsigned int n = reg / sizeof(u32);
> +	void __iomem *padcfg;
> +	u32 mask = (reg == PADCFG0) ? PADCFG0_GPIORXSTATE : 0;
> +	u32 val;

Looks better if you order them like:

	u32 mask = (reg == PADCFG0) ? PADCFG0_GPIORXSTATE : 0;
	unsigned int n = reg / sizeof(u32);
	struct device *dev = pctrl->dev;
	void __iomem *padcfg;
	u32 val;
