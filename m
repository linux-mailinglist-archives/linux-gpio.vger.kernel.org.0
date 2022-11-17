Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C09A62DB08
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 13:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240232AbiKQMhR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 07:37:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbiKQMg5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 07:36:57 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE1F364577
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 04:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668688616; x=1700224616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Eybqcy4TgfVifD6DMKEAl1n/PCCJd0517KdlgttQhQ4=;
  b=OOvQIypxnKKXKYbdHjq8odwrT5d07llj0sgWSnCzm/0pyYq1e38GQ0ap
   NeGpwLHAMAqV5zUxt8wlA/GRwshF/M7Gnr+oUXwuM0DC6tlq9Jd0h7/ih
   HYsHBNH0+BS0JpQR7pIusbDI3czPQk0xe2AajDJvzhH51AotIcQMcFOHx
   GpnbX90XyEDUszRrBsqGimgIPJsqUO81lUbS7eOrAJUYxBRvx4CXguvPo
   eDs9YzRtInJTAdMZlTr0m0OeHbgFDEpn6F7N/vFb0X5zo09N3fkm9mH4Y
   To0NOJLpOz6oDqWz9a+QBFkz8gSvN/RMIM/DEYiWHQhBFQw5t/OLLBuvn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="399126607"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="399126607"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 04:36:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="764744991"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="764744991"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 17 Nov 2022 04:36:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ove8M-00DZS1-2F;
        Thu, 17 Nov 2022 14:36:46 +0200
Date:   Thu, 17 Nov 2022 14:36:46 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org
Subject: Re: [PATCH RFC v2 2/3] pinconf-generic: clarify pull up and pull
 down config values
Message-ID: <Y3Yq3uLZBKBX49Uv@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <20221115175415.650690-3-niyas.sait@linaro.org>
 <CACRpkdarFa3GYprA98Q2zq5nepe_naY4mZJ0q+HVvz-MBqWEMw@mail.gmail.com>
 <Y3YO+F03Hgu7KVRU@smile.fi.intel.com>
 <Y3YPYT8HkEFF1hJw@smile.fi.intel.com>
 <209115e5-c448-6a8d-37a3-c1e1f15ed02b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <209115e5-c448-6a8d-37a3-c1e1f15ed02b@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 17, 2022 at 11:53:55AM +0000, Niyas Sait wrote:
> Sorry for the newbie issues. Somehow I missed the space vs tab issue on that
> patch.

No problem.

> I will send a patch to fix the two issues.

One more newbie thing you should address in your replies is stop top-posting.

> On 17/11/2022 10:39, Andy Shevchenko wrote:
> > On Thu, Nov 17, 2022 at 12:37:44PM +0200, Andy Shevchenko wrote:
> > > On Thu, Nov 17, 2022 at 10:30:37AM +0100, Linus Walleij wrote:
> > > > On Tue, Nov 15, 2022 at 6:54 PM Niyas Sait <niyas.sait@linaro.org> wrote:
> > > > 
> > > > > PIN_CONFIG_BIAS_PULL_DOWN and PIN_CONFIG_BIAS_PULL_UP values can
> > > > > be custom or an SI unit such as ohms
> > > > > 
> > > > > Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
> > > > 
> > > > This patch is good as-is so I just applied it. No need to resend with
> > > > the ACPI series.
> > > 
> > > Is it? I think it's visible that it has TAB vs. space issue...
> > 
> > To be more clear, the "such as ohms" have been indented with spaces, while
> > everything else with TABs. On top of that I would use proper capitalization
> > for unit, i.e. Ohms. But the latter is minor.

-- 
With Best Regards,
Andy Shevchenko


