Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EBF32D368
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 13:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCDMlV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 07:41:21 -0500
Received: from mga07.intel.com ([134.134.136.100]:47761 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231196AbhCDMlD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 07:41:03 -0500
IronPort-SDR: 0yhW5H8Y9440mYZWOeL2GGmOqFcwnBmZQrj4T9qtv8wOZoVWarr4k23UrA+Vl6GXBse1T/jRM0
 ykpbRKlUlwrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="251445631"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="251445631"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:40:22 -0800
IronPort-SDR: 3KzrXP9kNaS/V38g+74u4PsLGEFJM3J/rNRb8K20X7zLtv8c5PxTYPE0u+0rQ6h9iDUnv2D+CI
 2pqhR6m1UNMg==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="445717781"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 04:40:20 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lHnH8-009sQJ-8P; Thu, 04 Mar 2021 14:40:18 +0200
Date:   Thu, 4 Mar 2021 14:40:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YEDVMpHyCGbZOrmF@smile.fi.intel.com>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
 <YD+iWuLS/9knWLFb@builder.lan>
 <CACRpkdbZNJR5XaNaEWxwKdxED2mXnN_bN+mLjfPRMxyxVP3TVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbZNJR5XaNaEWxwKdxED2mXnN_bN+mLjfPRMxyxVP3TVw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 09:41:05AM +0100, Linus Walleij wrote:
> On Wed, Mar 3, 2021 at 3:51 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> 
> > I like the fact that this solves your gpio configuration issue, but I'm
> > uncertain if just adding support for configuring pins (in addition to
> > groups) in the driver is the right solution.
> >
> > @Linus, to summarize, the Qualcomm TLMM configures pingroups, but all
> > gpios are defined as a single pin. pinctrl_gpio_set_config() is invoked
> > based on the configuration provided in the ACPI tables, so Shawn's
> > proposal is to just implement "config by pin" as well.
> > Would this not be a problem shared with all pinctrl drivers that
> > configure gpios in groups?
> 
> It is done as Shawn does it in e.g. the Intel drivers.
> 
> This is a side effect of ACPI: ACPI thinks about the world mostly
> in term of GPIO pins, there was a pin ctrl draft at one point but I don't
> think it ever got off the ground. The standards committe just has not
> been able to think about the world in terms of pin control. Or they
> think the pin control abstraction is just wrong. Could be either.

Pin control has been though thru and implemented in the ACPICA, but we have no
time to fulfil this work to cover pin control subsystem in the Linux kernel.

> This means that on ACPI systems pin config will be done with
> this mechanism but on DT systems it will be done another way.
> The mechanisms are essentially orthogonal usecase-wise, it should
> work as long as there is some proper testing and concern
> for both cases.

-- 
With Best Regards,
Andy Shevchenko


