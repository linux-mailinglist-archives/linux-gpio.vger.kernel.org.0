Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69FC62D83A
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 11:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbiKQKjl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 05:39:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbiKQKjd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 05:39:33 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7901107
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668681572; x=1700217572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tJxuMUVM/HwbkUF71HvA2dnK9bh6hftfkfPPK+8fgL4=;
  b=VriYJgvAriSOw0GdsA1vF9e/EuE1SOCVl/YGMx3h5IZ2WwxvXTzZ5fr6
   Vy0s1cWvV9OqN4mu2z+Q7sfhR4W2h7mUHFrloVWi93EKY60cDFwCjc4FK
   aLXQ2FqDg3Vp7K2mlOcsCyYQg11z/CZckbQQV9ujiK6vE01MsLiK7nWwa
   oqfTsE05alzbFPHDPqxvdJ4Fqg286S9/sXVNdyzxSs14FjMEuMP04WfsU
   xNRcHT1n0wS0Zppb9Zy7mEYeqJM/q1Fy6N9fwkezBz8snMb3vQSlfYANA
   1b97zRNZ+7FJ/18bPfisCtICDnU5TwpTjjkfN9dSrK5tIPK6fHhF1KEGL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="399106270"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="399106270"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 02:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="968833553"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="968833553"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2022 02:39:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovcIr-00DXEF-1j;
        Thu, 17 Nov 2022 12:39:29 +0200
Date:   Thu, 17 Nov 2022 12:39:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Niyas Sait <niyas.sait@linaro.org>, linux-gpio@vger.kernel.org,
        mika.westerberg@linux.intel.com, rafael@kernel.org
Subject: Re: [PATCH RFC v2 2/3] pinconf-generic: clarify pull up and pull
 down config values
Message-ID: <Y3YPYT8HkEFF1hJw@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <20221115175415.650690-3-niyas.sait@linaro.org>
 <CACRpkdarFa3GYprA98Q2zq5nepe_naY4mZJ0q+HVvz-MBqWEMw@mail.gmail.com>
 <Y3YO+F03Hgu7KVRU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3YO+F03Hgu7KVRU@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 12:37:44PM +0200, Andy Shevchenko wrote:
> On Thu, Nov 17, 2022 at 10:30:37AM +0100, Linus Walleij wrote:
> > On Tue, Nov 15, 2022 at 6:54 PM Niyas Sait <niyas.sait@linaro.org> wrote:
> > 
> > > PIN_CONFIG_BIAS_PULL_DOWN and PIN_CONFIG_BIAS_PULL_UP values can
> > > be custom or an SI unit such as ohms
> > >
> > > Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
> > 
> > This patch is good as-is so I just applied it. No need to resend with
> > the ACPI series.
> 
> Is it? I think it's visible that it has TAB vs. space issue...

To be more clear, the "such as ohms" have been indented with spaces, while
everything else with TABs. On top of that I would use proper capitalization
for unit, i.e. Ohms. But the latter is minor.

-- 
With Best Regards,
Andy Shevchenko


