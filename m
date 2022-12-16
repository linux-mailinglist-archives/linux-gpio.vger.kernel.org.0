Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B14664EE8B
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 17:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232330AbiLPQHn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 11:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230396AbiLPQHE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 11:07:04 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DAE12A8B;
        Fri, 16 Dec 2022 08:05:45 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="320168435"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="320168435"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 08:05:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="718402181"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="718402181"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2022 08:05:41 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6DDO-00AvT0-2R;
        Fri, 16 Dec 2022 18:05:38 +0200
Date:   Fri, 16 Dec 2022 18:05:38 +0200
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
Subject: Re: [PATCH v3 03/11] leds: led-class: Add __of_led_get() helper
Message-ID: <Y5yXUuzvLH6Ap94a@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-4-hdegoede@redhat.com>
 <Y5x3smYGNoIOkc+o@smile.fi.intel.com>
 <d2c93d0a-9c89-7b3f-4cd0-b49dc8fac911@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2c93d0a-9c89-7b3f-4cd0-b49dc8fac911@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 04:52:33PM +0100, Hans de Goede wrote:
> On 12/16/22 14:50, Andy Shevchenko wrote:
> > On Fri, Dec 16, 2022 at 12:30:05PM +0100, Hans de Goede wrote:

...

> >> +	/*
> >> +	 * For named LEDs, first look up the name in the "leds-names" property.
> >> +	 * If it cannot be found, then of_parse_phandle() will propagate the error.
> >> +	 */
> >> +	if (name)
> >> +		index = of_property_match_string(np, "leds-names", name);
> > 
> > I can't find this property anywhere in the kernel. Is it new?
> 
> Yes and no, adding a foo-names property for foo[] arrays to be
> able to get members by name is a standard template for devicetree
> bindings. See e.g. the clock bindings:
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/clock/clock.yaml
> 
> > If so, where is the bindings?
> 
> As for why not document this, there are currently no devicetree users
> and the devicetree maintainers have repeatedly let me know not to
> submit new bindings for fwnode x86 bindings ...

How above is related to fwnode as you put that? (I do see OF specific code
which is required to have a binding, right?)

> > And why entire code can't be converted
> > to use fwnode for this case?
> 
> This is a trivial change to allow the new functions to work
> with devicetree. Note this series does not introduce any devicetree
> users, hence no bindings. But it is good to have compatibility backed in
> from day 1.

AFAIU the OF properties must be documented from day 1.

> Converting to fwnode APIs would be more involved and I cannot test
> those changes.

-- 
With Best Regards,
Andy Shevchenko


