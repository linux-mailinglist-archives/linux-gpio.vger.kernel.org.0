Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CBF64EF03
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 17:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbiLPQ0n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 11:26:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiLPQ0W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 11:26:22 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5856A32BAB;
        Fri, 16 Dec 2022 08:26:21 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="320173184"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="320173184"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 08:26:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="895291130"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="895291130"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2022 08:26:16 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6DXK-00AvoX-0k;
        Fri, 16 Dec 2022 18:26:14 +0200
Date:   Fri, 16 Dec 2022 18:26:13 +0200
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
Subject: Re: [PATCH v3 07/11] platform/x86: int3472/discrete: Refactor GPIO
 to sensor mapping
Message-ID: <Y5ycJZKyWerR6R/d@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-8-hdegoede@redhat.com>
 <Y5x5XmIa9nsi8raY@smile.fi.intel.com>
 <233166c0-eb2d-8b41-68f3-d9613218fc16@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <233166c0-eb2d-8b41-68f3-d9613218fc16@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 05:15:14PM +0100, Hans de Goede wrote:
> On 12/16/22 14:57, Andy Shevchenko wrote:
> > On Fri, Dec 16, 2022 at 12:30:09PM +0100, Hans de Goede wrote:

...

> >> +static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polarity)
> > 
> > I find a bit strange not making this a function that returns func:
> > 
> > static const char *int3472_get_func_and_polarity(u8 type, u32 *polarity)
> 
> Why make it return func and not polarity ?

Because of name "func" and "polarity". And as you read a prototype from left to
right it exactly follows that.

> Since there are 2 values to return it makes sense to be
> consistent and return both by reference.

But this is unneeded complication, no?

> Also this sort of comments really get into the territory
> of bikeshedding which is not helpful IMHO.

I find helpful to have a prototype shorter and the switch-case shorter due to
return vs break. Of course you can think it's unhelpful, but I have another
opinion. All by all you are the maintainer there, your call.

-- 
With Best Regards,
Andy Shevchenko


