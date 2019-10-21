Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA087DEC20
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 14:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfJUMZh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 08:25:37 -0400
Received: from mga07.intel.com ([134.134.136.100]:17402 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727392AbfJUMZh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Oct 2019 08:25:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Oct 2019 05:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,323,1566889200"; 
   d="scan'208";a="209434374"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 21 Oct 2019 05:25:32 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Oct 2019 15:25:32 +0300
Date:   Mon, 21 Oct 2019 15:25:32 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 2/3] pinctrl: intel: Introduce intel_restore_hostown()
 helper
Message-ID: <20191021122532.GD2819@lahna.fi.intel.com>
References: <20191014084348.42489-1-andriy.shevchenko@linux.intel.com>
 <20191014084348.42489-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014084348.42489-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 14, 2019 at 11:43:47AM +0300, Andy Shevchenko wrote:
> Refactor restoring HOSTSW_OWN registers by using an introduced helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 38 +++++++++++++++------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 18467e2efe99..e59ac31921e7 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1588,6 +1588,25 @@ intel_gpio_update_pad_mode(void __iomem *hostown, u32 mask, u32 value)
>  	return curr;
>  }
>  
> +static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
> +				  void __iomem *base, unsigned int gpp, u32 saved)
> +{
> +	struct intel_community *community = &pctrl->communities[c];

const?
