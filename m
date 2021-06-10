Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460DB3A2E0F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 16:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbhFJO1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 10:27:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:11363 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230153AbhFJO1Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Jun 2021 10:27:24 -0400
IronPort-SDR: m3ke9AlduWM3gybvvkZdqqWTy4ZCOrwBBPUYA3bwgMYf0y/+kbJI9vWQXuZr6EuLC45AfzukQz
 BOazx+N7ts+w==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205267272"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="205267272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 07:25:08 -0700
IronPort-SDR: hCAbLj1fQwzqoL6BHxgCVeU2vNdluBm4WylVZkxZ976mLCh4TDFm/a1VI41LmrHJ6ULT+gAS0z
 qfq5yc61ZPCQ==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="402876746"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 07:25:06 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lrLcG-001AbZ-6U; Thu, 10 Jun 2021 17:25:04 +0300
Date:   Thu, 10 Jun 2021 17:25:04 +0300
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
Message-ID: <YMIgwORlAzz/gJcK@smile.fi.intel.com>
References: <20210609062722.9132-1-henning.schild@siemens.com>
 <YMCT+izizEg0gPLD@lahna.fi.intel.com>
 <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
 <20210609130816.3631f0aa@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609130816.3631f0aa@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 09, 2021 at 01:08:16PM +0200, Henning Schild wrote:
> Am Wed, 9 Jun 2021 13:33:34 +0300
> schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

...

> In order to use GPIO from the drivers i need to make sure
> "broxton-pinctrl" comes up even if p2sb is hidden.
> 
> Long story short, i thought the patch was simple enough to merge even
> taken out of my special context.
> 
> Currently intel_pinctl only works if "ps2b is not hidden by BIOS" or
> "ACPI tables are correct", lifting the ban on the hidden p2sb seems
> like a useful thing in general (i.e. sysfs gpio interface). And i was
> hoping Andy would take the lead on that. It is something my Siemens
> drivers would depend on, but really a generic thing as far as i
> understand it.

From p2sb series discussion it appears that this patch is not needed.
The case is when BIOS already provides an ACPI device.

So, the initial bug is in that series that needs to check if the ACPI device is
exposed and forbid platform device instantiation in that case.

-- 
With Best Regards,
Andy Shevchenko


