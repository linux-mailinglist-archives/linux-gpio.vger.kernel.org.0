Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1DC9EFCEC
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 13:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfKEMFU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Nov 2019 07:05:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:22679 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbfKEMFU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Nov 2019 07:05:20 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 04:05:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="200772941"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga007.fm.intel.com with ESMTP; 05 Nov 2019 04:05:15 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1iRxaE-0002I2-MO; Tue, 05 Nov 2019 14:05:14 +0200
Date:   Tue, 5 Nov 2019 14:05:14 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, qi-ming.wu@intel.com,
        yixin.zhu@linux.intel.com, cheol.yong.kim@intel.com
Subject: Re: [PATCH v3 1/2] pinctrl: Add pinmux & GPIO controller driver for
 a new SoC
Message-ID: <20191105120514.GN32742@smile.fi.intel.com>
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
 <02558966005c0483144785ed069b144f81d209a9.1572926608.git.rahul.tanwar@linux.intel.com>
 <20191105094917.GK32742@smile.fi.intel.com>
 <61e076de-7b24-b71d-dd79-c1c506a0f1bf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61e076de-7b24-b71d-dd79-c1c506a0f1bf@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 05, 2019 at 06:52:52PM +0800, Tanwar, Rahul wrote:
> On 5/11/2019 5:49 PM, Andy Shevchenko wrote:
> > On Tue, Nov 05, 2019 at 02:49:42PM +0800, Rahul Tanwar wrote:

> >> +static void eqbr_set_val(void __iomem *addr, u32 offset,
> >> +			 u32 mask, u32 set, raw_spinlock_t *lock)
> > This lock parameter is quite unusual. Can't you supply a pointer to a data
> > structure which has lock along with MMIO address?
> 
> On second thoughts, i realize that this function can be totally avoided
> since it just has two callers which can be further reduced to one caller.
> I will remove this function and instead do reg update in the caller function
> itself.

Good.

> >> +static int gpiochip_setup(struct device *dev, struct eqbr_gpio_desc *desc)
> >> +{
> >> +	struct gpio_irq_chip *girq;
> >> +	struct gpio_chip *gc;
> >> +#if defined(CONFIG_OF_GPIO)
> >> +	gc->of_node = desc->node;
> >> +#endif
> > Isn't it what GPIO library does for everybody?
> 
> We have 4 different of_node's for 4 different gpio_chips/banks. GPIO library
> handles like below:
> 
>         if (chip->parent) {
>                 gdev->dev.parent = chip->parent;
>                 gdev->dev.of_node = chip->parent->of_node;
>         }
> 
> #ifdef CONFIG_OF_GPIO
>         /* If the gpiochip has an assigned OF node this takes precedence */
>         if (chip->of_node)
>                 gdev->dev.of_node = chip->of_node;
>         else
>                 chip->of_node = gdev->dev.of_node;
> #endif
> 
> So i think we need to assign 4 of_node's to gpio_chip's in the driver.

OK!

> >> +	if (!of_property_read_bool(desc->node, "interrupt-controller")) {
> >> +		dev_info(dev, "gc %s: doesn't act as interrupt controller!\n",
> >> +			 desc->name);
> > Is it fatal or non-fatal?
> 
> It is not fatal. But i am totally missing your point. Is it about
> dev_info() ? Can you please elaborate more ?
> 
> 
> >> +		return 0;
> > Ditto.

> >> +	}

If it's fatal, you have to use dev_err() and return an appropriate error code,
if it's not fatal, switch to dev_warn() in case user has to know that behaviour
may be quite different, while seems to work in general or dev_dbg() if it's
only for the developer. dev_info() with return 0 is quite confusing.

> >> +}

> >> +static int eqbr_pinmux_set_mux(struct pinctrl_dev *pctldev,
> >> +			       unsigned int selector, unsigned int group)
> >> +{
> >> +	struct eqbr_pinctrl_drv_data *pctl = pinctrl_dev_get_drvdata(pctldev);
> >> +	struct function_desc *func;
> >> +	struct group_desc *grp;
> >> +	unsigned int *pinmux;
> >> +	int i;
> >
> >> +	pinmux = grp->data;
> >> +	for (i = 0; i < grp->num_pins; i++)
> >> +		eqbr_set_pin_mux(pctl, pinmux[i], grp->pins[i]);
> > Shouldn't be this part serialized?
> >
> > Same Q to all similar places. I guess I already mentioned this in previous
> > review.
> 
> From serialization, you mean locking..rt ? Yes, there is one writel()
> statement inthis flow. I will add lock for that statement. Rechecked
> the code again, i do notfind any other similar places.

You need to clarify what exactly you are serializing.
When you figure this out, the locking should be done accordingly.

> >> +	return 0;
> >> +}

> >> +			if (of_property_read_string(np, "function",
> >> +						    &fn_name)) {

> > It's perfectly one line. Perhaps you may need to configure your text editor.
> 
> I am following strict 80 chars limit. This goes on to 81 chars. It's a bit
> confusing on when to adhere to 80 chars limit and when to bypass it :)

I have checked again, it's exactly 80 characters.

> >> +			}

-- 
With Best Regards,
Andy Shevchenko


