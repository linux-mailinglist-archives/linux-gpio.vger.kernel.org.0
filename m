Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF21331259
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 16:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhCHPgM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 10:36:12 -0500
Received: from mga11.intel.com ([192.55.52.93]:46195 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbhCHPgI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 10:36:08 -0500
IronPort-SDR: T/jzm5ekm7G7kb3w/vWln+K79bRWAuJ9dLiTl9RDAZm7JHywFwQjbAiU6A4neujWWMWBGG7xW9
 l9Cme0P2TW+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="184687237"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="184687237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 07:36:04 -0800
IronPort-SDR: H+LKcMc4tq8UM/ho9ms7idR2V26uKk6ASKgTiCHCT7PAcnMYF6Rv7fcI62aO0obnCvQ+u0HbvE
 f4bkWLH/JMzQ==
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="508960716"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 07:36:01 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lJHvL-00Aqdb-DP; Mon, 08 Mar 2021 17:35:59 +0200
Date:   Mon, 8 Mar 2021 17:35:59 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "pinctrl: intel: Split
 intel_pinctrl_add_padgroups() for better maintenance"
Message-ID: <YEZEX+BCw21O6rmT@smile.fi.intel.com>
References: <20210308152505.3762055-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308152505.3762055-1-luzmaximilian@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 08, 2021 at 04:25:05PM +0100, Maximilian Luz wrote:
> Following commit 036e126c72eb ("pinctrl: intel: Split
> intel_pinctrl_add_padgroups() for better maintenance"),
> gpiochip_get_desc() is broken on some Kaby Lake R devices (specifically
> a Microsoft Surface Book 2), returning -EINVAL for GPIOs that in reality
> should be there (they are defined in ACPI and have been accessible
> previously). Due to this, gpiod_get() fails with -ENOENT.
> 
> Reverting this commit fixes that issue and the GPIOs in question are
> accessible again.

I would like to have more information.
Can you enable PINCTRL and GPIO debug options in the kernel, and show dmesg
output (when kernel command line has 'ignore_loglevel' option) for both working
and non-working cases?

Also if it's possible to have DSDT.dsl of the device in question along with
output of `grep -H 15 /sys/bus/acpi/devices/*/status`.

> There is probably a better option than straight up reverting this, so
> consider this more of a bug-report.

Indeed.

-- 
With Best Regards,
Andy Shevchenko


