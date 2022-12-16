Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56BF564F040
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 18:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiLPRUL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 12:20:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbiLPRUJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 12:20:09 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701126F4B7;
        Fri, 16 Dec 2022 09:20:08 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="320899548"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="320899548"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 09:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="649897867"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="649897867"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 16 Dec 2022 09:20:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6ENM-00AwrZ-1n;
        Fri, 16 Dec 2022 19:20:00 +0200
Date:   Fri, 16 Dec 2022 19:20:00 +0200
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
Subject: Re: [PATCH v3 11/11] platform/x86: int3472/discrete: Get the
 polarity from the _DSM entry
Message-ID: <Y5yowBsDmgTX1nYO@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-12-hdegoede@redhat.com>
 <Y5yHPvXG/4pWivEG@smile.fi.intel.com>
 <ce764e02-0832-9b2b-c787-0e1c73748fe0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce764e02-0832-9b2b-c787-0e1c73748fe0@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 05:42:08PM +0100, Hans de Goede wrote:
> On 12/16/22 15:57, Andy Shevchenko wrote:
> > On Fri, Dec 16, 2022 at 12:30:13PM +0100, Hans de Goede wrote:

...

> >> +	/* If bits 31-24 of the _DSM entry are all 0 then the signal is inverted */
> > 
> >> +	active_value = obj->integer.value >> 24;
> >> +	if (!active_value)
> > 
> > Not sure why you need a temporary variable for this. Just use
> > GENMASK()/GENMASK_ULL()?
> > 
> > 	if (obj->integer.value & GENMASK(31, 24));
> > 
> > In this case you even don't need to repeat bit numbers in the comment.
> 
> These bits contain the value to which the pin should be set when the
> sensor is active (on), the active_value helper variable IMHO makes this
> a lot more clear then directly checking the mask.

Mask makes much more clear to understand what bits you are really use without
looking at the type of a temporary variable. (IIUC the value is u64.)

Maybe

	active_value = (obj->integer.value & GENMASK(31, 24)) >> 24;

But yes, this is on the edge of bikeshedding.

> >> +		polarity ^= GPIO_ACTIVE_LOW;

-- 
With Best Regards,
Andy Shevchenko


