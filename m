Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B259364F02C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 18:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbiLPRPc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 12:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbiLPRPZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 12:15:25 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C1DD70B82;
        Fri, 16 Dec 2022 09:15:22 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="405269112"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="405269112"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 09:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="600009715"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="600009715"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 16 Dec 2022 09:15:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6EIk-00AwnX-0n;
        Fri, 16 Dec 2022 19:15:14 +0200
Date:   Fri, 16 Dec 2022 19:15:13 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 09/11] platform/x86: int3472/discrete: Move GPIO
 request to skl_int3472_register_clock()
Message-ID: <Y5ynob/Zavw/Dcbi@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-10-hdegoede@redhat.com>
 <Y5x+oFAFNz05Trxn@smile.fi.intel.com>
 <e1dd47ef-51fd-b6b3-4649-4dc6781c5e35@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1dd47ef-51fd-b6b3-4649-4dc6781c5e35@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 05:35:51PM +0100, Hans de Goede wrote:
> On 12/16/22 15:20, Andy Shevchenko wrote:
> > On Fri, Dec 16, 2022 at 12:30:11PM +0100, Hans de Goede wrote:

...

> >> +	int3472->clock.ena_gpio = acpi_get_and_request_gpiod(path, agpio->pin_table[0],
> >> +							     "int3472,clk-enable");
> >> +	if (IS_ERR(int3472->clock.ena_gpio)) {
> > 
> > 	return dev_err_probe(...); ?
> 
> That would make the line longer then 100 chars.

Maybe I wasn't clear, the point is to get rid of ret assignment (the rest can
be resplit as you wish).

> >> +		ret = PTR_ERR(int3472->clock.ena_gpio);
> >> +		return dev_err_probe(int3472->dev, ret, "getting regulator GPIO\n");
> >> +	}

-- 
With Best Regards,
Andy Shevchenko


