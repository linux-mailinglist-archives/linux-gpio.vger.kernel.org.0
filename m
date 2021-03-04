Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0859032D6E6
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:45:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbhCDPns (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:43:48 -0500
Received: from mga09.intel.com ([134.134.136.24]:31332 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235347AbhCDPng (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Mar 2021 10:43:36 -0500
IronPort-SDR: L+YvIEQo6IVN7SRUqnMazJ+7oV1cqcZ5a/lVYCpNC+O03NYWw4eQV4Uclm8Jd3YWns1bNGVgj6
 MAHU105Bmadw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187546777"
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="187546777"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 07:41:50 -0800
IronPort-SDR: gQH/rLO8VgxKvIU/P5wEfLdvQ+FOHXuGAafk93GTP3GD/Xbj1jh86gWrvQhhBV5HVhk7LSjSne
 CF1bONpvK+sA==
X-IronPort-AV: E=Sophos;i="5.81,222,1610438400"; 
   d="scan'208";a="445772520"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 07:41:48 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lHq6j-009uO4-DN; Thu, 04 Mar 2021 17:41:45 +0200
Date:   Thu, 4 Mar 2021 17:41:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] pinctrl: intel: No need to disable IRQs in the
 handler
Message-ID: <YED/uRFrllsgakCF@smile.fi.intel.com>
References: <20210304105432.36544-1-andriy.shevchenko@linux.intel.com>
 <20210304111809.GO2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304111809.GO2542@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 01:18:09PM +0200, Mika Westerberg wrote:
> On Thu, Mar 04, 2021 at 12:54:32PM +0200, Andy Shevchenko wrote:
> > In IRQ handler interrupts are already disabled, hence no need
> > to repeat it. Even in the threaded case, which is disabled here,
> > it is not a problem because IRQ framework serializes descriptor
> > handling. Remove disabling IRQ part in the handler.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


