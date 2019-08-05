Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9200E816F6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfHEKYs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:24:48 -0400
Received: from mga07.intel.com ([134.134.136.100]:34690 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbfHEKYs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Aug 2019 06:24:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Aug 2019 03:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; 
   d="scan'208";a="173842983"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga008.fm.intel.com with ESMTP; 05 Aug 2019 03:24:21 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1huaA7-0005hh-Jp; Mon, 05 Aug 2019 13:24:19 +0300
Date:   Mon, 5 Aug 2019 13:24:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] pinctrl: msm: Switch to use
 device_property_count_uXX()
Message-ID: <20190805102419.GI23480@smile.fi.intel.com>
References: <20190723192738.68486-1-andriy.shevchenko@linux.intel.com>
 <CACRpkda+0xQDcgkYg=x=d_Gk_EwvDE1iM+PKfo0sG7T-juQw6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda+0xQDcgkYg=x=d_Gk_EwvDE1iM+PKfo0sG7T-juQw6g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 05, 2019 at 12:01:11PM +0200, Linus Walleij wrote:
> On Tue, Jul 23, 2019 at 9:27 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Use use device_property_count_uXX() directly, that makes code neater.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> (...)
> >         /* The number of GPIOs in the ACPI tables */
> > -       len = ret = device_property_read_u16_array(pctrl->dev, "gpios", NULL,
> > -                                                  0);
> > +       len = ret = device_property_count_u16(pctrl->dev, "gpios");
> 
> Patch applied (makes the kernel a better place) but:

Thanks!

> Can't we just use: gpiod_count(pctrl->dev, NULL); ?

Perhaps. I have no hardware to test and the question probably better to be
addressed to author(s) of the driver.

My scope is to convert to new extension to device property API, so, anyone who
will look for examples will not use the old approach.

> It's more to the point when counting gpios I think.
> 
> However this driver is not includeing <linux/gpio/consumer.h>
> and is this "gpios" property really a consumer property? I think
> so but...

Sounds like this is an old driver and many questions to it applies.

-- 
With Best Regards,
Andy Shevchenko


