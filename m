Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2908331372
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCHQcP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:32:15 -0500
Received: from mga05.intel.com ([192.55.52.43]:33438 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhCHQbz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 11:31:55 -0500
IronPort-SDR: 1ce0V+Q2AHiFFQnu2w0Pb3p4PkpLzrXgYPR+SWBecR1hKNNqW3W1R4jdyfzyMExsTqn1Qove8s
 xvl3+eM6LWEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273088144"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="273088144"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:31:45 -0800
IronPort-SDR: FFkRJrRrrmmdp9w/IFmdmunuya4Dr+U70+lf896ro74basjMCreJ0dPxWJCmTUM0SsUGWa/Gt2
 YucmS4w4C+jw==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="402881389"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 08:31:43 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJInE-00ArC6-VL; Mon, 08 Mar 2021 18:31:40 +0200
Date:   Mon, 8 Mar 2021 18:31:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "pinctrl: intel: Split
 intel_pinctrl_add_padgroups() for better maintenance"
Message-ID: <YEZRbO3uJQmsCZO9@smile.fi.intel.com>
References: <20210308152505.3762055-1-luzmaximilian@gmail.com>
 <YEZEX+BCw21O6rmT@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEZEX+BCw21O6rmT@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 08, 2021 at 05:35:59PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 08, 2021 at 04:25:05PM +0100, Maximilian Luz wrote:
> > Following commit 036e126c72eb ("pinctrl: intel: Split
> > intel_pinctrl_add_padgroups() for better maintenance"),
> > gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
> > a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
> > should be there (they are defined in ACPI and have been accessible
> > previously). Due to this, gpiod_get() fails with -ENOENT.
> > 
> > Reverting this commit fixes that issue and the GPIOs in question are
> > accessible again.
> 
> I would like to have more information.
> Can you enable PINCTRL and GPIO debug options in the kernel, and show dmesg
> output (when kernel command line has 'ignore_loglevel' option) for both working
> and non-working cases?
> 
> Also if it's possible to have DSDT.dsl of the device in question along with
> output of `grep -H 15 /sys/bus/acpi/devices/*/status`.
> 
> > There is probably a better option than straight up reverting this, so
> > consider this more of a bug-report.
> 
> Indeed.


Can you test if the below helps (probably you have to apply it by editing
the file manually):

--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1392,6 +1392,7 @@ static int intel_pinctrl_add_padgroups_by_size(struct intel_pinctrl *pctrl,
 	gpps[i].size = min(gpp_size, npins);
 	npins -= gpps[i].size;
 
+	gpps[i].gpio_base = gpps[i].base;
 	gpps[i].padown_num = padown_num;
 


-- 
With Best Regards,
Andy Shevchenko


