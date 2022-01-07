Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD2F6487AAC
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 17:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348308AbiAGQrZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 11:47:25 -0500
Received: from mga03.intel.com ([134.134.136.65]:7696 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348327AbiAGQrZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Jan 2022 11:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641574045; x=1673110045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xibyZItjIhk0374LqSqBfj8XhzdduTcTPpuWA/JGubE=;
  b=AgmgJfM8aIzH/8Y4oe4PukPU2wNrsZSxEw0D2nxdFiiSlG9veKkwN7mL
   tI7k4EOFWd9hJ8ZV+U/sRVJ3h8N4tG0Ls6ghfPFzV4JKFPnjmzELKT9i/
   bt6afQVmd2S/D3cTQI0i0rZleFMyYs5cokmue0a8O/EvTLtQTrj56rsug
   bh+p1kUlQpD42A+0AQRbVMTqSZnTu26zyjpxJUJfBDTpcGnIdHRMIkOHO
   MLQ2TaXzo2saj5zv/gcZy2RJA3RBqguMK2WdH3PjkKwDl9SylJrYBozCJ
   +Hiyt9wH/jrBSirNgarHCnWbyxEo1MXKjtShVhLfWPD5YlAArgBiRI7j6
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="242846992"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="242846992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 08:47:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="689839155"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 08:47:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1n5sNT-007T2u-MH;
        Fri, 07 Jan 2022 18:46:07 +0200
Date:   Fri, 7 Jan 2022 18:46:07 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Message-ID: <YdhuTzrh2cRKT5Sj@smile.fi.intel.com>
References: <20220107142343.38560-1-hdegoede@redhat.com>
 <YdhtOrVjyx7k9nt4@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdhtOrVjyx7k9nt4@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 07, 2022 at 06:41:30PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 07, 2022 at 03:23:43PM +0100, Hans de Goede wrote:

...

> > +static bool byt_direct_irq_sanity_check(struct intel_pinctrl *vg, int pin, u32 value)
> > +{
> > +	void __iomem *reg;
> > +	int i, j;
> > +
> > +	if (!(value & (BYT_TRIG_POS | BYT_TRIG_NEG))) {
> > +		dev_warn(vg->dev,
> > +			 FW_BUG "pin %i: direct_irq_en set without trigger, clearing\n", pin);
> > +		return false;
> > +	}
> > +
> > +	reg = vg->communities->pad_regs + BYT_DIRECT_IRQ_REG;
> 
> > +	for (i = 0; i < 16; i += 4) {
> > +		value = readl(reg + i);
> > +		for (j = 0; j < 4; j++) {
> > +			if (((value >> j * 8) & 0xff) == pin) {
> 
> Can it be like
> 
> 	u32 direct_irq[16];
> 	void __iomem *reg;
> 	void *match;
> 
> 
> 	memcpy_fromio(...);
> 	match = memchr(...);
> 	if (match)
> 		dev_dbg();
> 	else
> 		dev_warn();
> 
> 	return !!match;
> 
> ?
> 
> > +				dev_dbg(vg->dev, "Pin %i: uses direct IRQ %d (APIC %d)\n",

> > +					pin, i + j, 0x43 + i + j);

Why 0x43 is hard coded?

> > +				return true;
> > +			}
> > +		}
> > +	}
> > +
> > +	dev_warn(vg->dev,
> > +		 FW_BUG "pin %i: direct_irq_en set but no IRQ assigned, clearing\n", pin);
> > +	return false;
> > +}

-- 
With Best Regards,
Andy Shevchenko


