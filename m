Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06E4013FB26
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jan 2020 22:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388555AbgAPVNP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jan 2020 16:13:15 -0500
Received: from mga04.intel.com ([192.55.52.120]:12723 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbgAPVNO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Jan 2020 16:13:14 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jan 2020 13:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; 
   d="scan'208";a="220508138"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jan 2020 13:13:13 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1isCS2-00041A-TI; Thu, 16 Jan 2020 23:13:14 +0200
Date:   Thu, 16 Jan 2020 23:13:14 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.5-3
Message-ID: <20200116211314.GO32742@smile.fi.intel.com>
References: <20200109111902.GA47863@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109111902.GA47863@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 09, 2020 at 01:19:02PM +0200, Andy Shevchenko wrote:
> Hi Linus,
> 
> One patch for current (v5.5!) cycle.
> 
> Thanks,

Linus, this is material for v5.5 (this) release cycle.
Do we need to do anything about this PR to be applied soon?

> 
> With Best Regards,
> Andy Shevchenko
> 
> The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:
> 
>   Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.5-3
> 
> for you to fetch changes up to 9608ea6c6613ced75b2c41703d99f44e6f8849f1:
> 
>   pinctrl: sunrisepoint: Add missing Interrupt Status register offset (2020-01-09 13:15:35 +0200)
> 
> ----------------------------------------------------------------
> intel-pinctrl for v5.5-3
> 
> * Fix Interrupt Status register offset for Intel Sunrisepoint PCH-H.
> 
> The following is an automated git shortlog grouped by driver:
> 
> sunrisepoint:
>  -  Add missing Interrupt Status register offset
> 
> ----------------------------------------------------------------
> Boyan Ding (1):
>       pinctrl: sunrisepoint: Add missing Interrupt Status register offset
> 
>  drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
With Best Regards,
Andy Shevchenko


