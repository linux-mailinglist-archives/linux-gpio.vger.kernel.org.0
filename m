Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEAB31A2DF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 17:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhBLQiW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 11:38:22 -0500
Received: from mga12.intel.com ([192.55.52.136]:11413 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231148AbhBLQgW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 11:36:22 -0500
IronPort-SDR: UCTX9jDhevVkevjaxGJwzDlvuL86fZ1zW1mmtrgjJQUh0EbK8w6BxnAdcsFrKvatc+ZHdouuYE
 zMwvthw3J12Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="161582640"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="161582640"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 08:35:34 -0800
IronPort-SDR: Zq4zyQ4kr9ErHsWos0M8LH7kmvZ5TIQySNTnR5WxV1Kclk+Z0wcAXolAtMSegCVN/wkl+XN1x7
 4dbaQGfzR6+g==
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; 
   d="scan'208";a="491022722"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 08:35:32 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1lAbPm-004XUk-CZ; Fri, 12 Feb 2021 18:35:30 +0200
Date:   Fri, 12 Feb 2021 18:35:30 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Imre Deak <imre.deak@intel.com>
Subject: Replace raw_spin_lock_irqsave with raw_spin_lock
Message-ID: <YCauUncGVwYPfBfQ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Mika!

There is an interesting discussion [1] going on about necessity of the
_irqsave/_irqrestore variants of spin lock in the IRQ handler.

It appears that in our driver(s) we have also such variants of spin locks in
use. Do you have any idea why is it so?

A bonus question, why do we use _NO_THREAD flag explicitly as per Thomas [2]
this won't work well with RT kernels?

[1]: https://lore.kernel.org/linux-gpio/1612774577-55943-1-git-send-email-luojiaxing@huawei.com/T/#u
[2]: https://lore.kernel.org/linux-i2c/87zh2s8buh.fsf@nanos.tec.linutronix.de/

-- 
With Best Regards,
Andy Shevchenko


