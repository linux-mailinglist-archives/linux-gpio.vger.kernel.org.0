Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558AB12CEAE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 11:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfL3KUZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 05:20:25 -0500
Received: from mga05.intel.com ([192.55.52.43]:5937 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727320AbfL3KUZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Dec 2019 05:20:25 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 02:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,374,1571727600"; 
   d="scan'208";a="224203949"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 30 Dec 2019 02:20:21 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 30 Dec 2019 12:20:21 +0200
Date:   Mon, 30 Dec 2019 12:20:21 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Pass irqchip when adding gpiochip
Message-ID: <20191230102021.GF2628@lahna.fi.intel.com>
References: <20191229013059.495767-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191229013059.495767-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 29, 2019 at 02:30:59AM +0100, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> Set up the pin ranges using the new callback.

Maybe have this one split as a separate patch? Same what we do for
Baytrail and Cherryview.

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 61 +++++++++++++++------------
>  1 file changed, 35 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 4860bc9a4e48..ffacd77861f7 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -1160,8 +1160,8 @@ static irqreturn_t intel_gpio_irq(int irq, void *data)
>  	return ret;
>  }
>  
> -static int intel_gpio_add_pin_ranges(struct intel_pinctrl *pctrl,
> -				     const struct intel_community *community)
> +static int intel_gpio_add_community_ranges(struct intel_pinctrl *pctrl,
> +				const struct intel_community *community)
>  {
>  	int ret = 0, i;
>  
> @@ -1181,6 +1181,24 @@ static int intel_gpio_add_pin_ranges(struct intel_pinctrl *pctrl,
>  	return ret;
>  }
>  
> +static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
> +{
> +	struct intel_pinctrl *pctrl = gpiochip_get_data(gc);
> +	int ret, i;
> +
> +	for (i = 0; i < pctrl->ncommunities; i++) {
> +		struct intel_community *community = &pctrl->communities[i];
> +
> +		ret = intel_gpio_add_community_ranges(pctrl, community);
> +		if (ret) {
> +			dev_err(pctrl->dev, "failed to add GPIO pin range\n");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
>  {
>  	const struct intel_community *community;
> @@ -1205,7 +1223,8 @@ static unsigned int intel_gpio_ngpio(const struct intel_pinctrl *pctrl)
>  
>  static int intel_gpio_probe(struct intel_pinctrl *pctrl, int irq)
>  {
> -	int ret, i;
> +	int ret;
> +	struct gpio_irq_chip *girq;

Nit:

Can you order these in "reverse christmas tree" like,

	struct gpio_irq_chip *girq;
	int ret;

Otherwise looks good to me, thanks!
