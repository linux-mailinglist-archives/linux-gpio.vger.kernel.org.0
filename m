Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC42F62A124
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 19:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiKOSMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 13:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKOSMd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 13:12:33 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC46AB21
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 10:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668535952; x=1700071952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mrfKXd0ecfPREspRlNhHe0x3FUgZnnWmecyWZNDT91I=;
  b=F4O1Zn3GT+LpqxOZLOpizeXyCQA/21AFzp9e65NQSmKCWPK+ZDQm9LEK
   qbcJMx/oFx4A8DRJaCJhDZd7Nj/JSAgollr9rJLFjkQyuSlrqEkzrrqbP
   5O0ycHu6jgxW4EGIpkHcy6hbOSM4mZQQzWER2wx8Wl2yZHazOL1mkpQdj
   it1NWZW49alLcvVva1d0gFDYCtSViVY1grC9BB4CvGCmCYqg+ceSgewe8
   ymS7GGoCNIWumzzsFOL76wP503LHTMpSE3EnJY6tGaIIH2acBlANlz7Ft
   a+6w39BKWQXGJETOMtIdAZBsHMSnCfzckkzDD2vb2xEvLTAC7UWq3ObC9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="309956396"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="309956396"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2022 10:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="728051188"
X-IronPort-AV: E=Sophos;i="5.96,166,1665471600"; 
   d="scan'208";a="728051188"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2022 10:12:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ov0Q9-00CkRb-1f;
        Tue, 15 Nov 2022 20:12:29 +0200
Date:   Tue, 15 Nov 2022 20:12:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115175415.650690-1-niyas.sait@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 05:54:12PM +0000, Niyas Sait wrote:
> This is a proposal for adding ACPI support to pin controller.
> 
> The patch supports following resources introduced in ACPI from v6.2
> 
> - PinFunction
> - PinConfig
> - PinGroupFunction
> - PinGroupConfig
> - PinGroup
> 
> The patch has been tested on NXP I.MX8MP Plus platform with ACPI.

Cover letter doesn't point to the ASL code you are using.

I have some questions about that:
1) why do you need specific _DSD() for the pin mappings?
2) wgy you need vendor data for some of Pin*() resources?


-- 
With Best Regards,
Andy Shevchenko


