Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC8B64EE95
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Dec 2022 17:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbiLPQIk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Dec 2022 11:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiLPQII (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Dec 2022 11:08:08 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F74E42F41;
        Fri, 16 Dec 2022 08:07:24 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="320882406"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="320882406"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 08:07:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="649872664"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="649872664"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 16 Dec 2022 08:07:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p6DEy-00AvUt-3A;
        Fri, 16 Dec 2022 18:07:16 +0200
Date:   Fri, 16 Dec 2022 18:07:16 +0200
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
Subject: Re: [PATCH v3 05/11] leds: led-class: Add generic [devm_]led_get()
Message-ID: <Y5yXtIhhMTkPLpeA@smile.fi.intel.com>
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-6-hdegoede@redhat.com>
 <Y5x17PKiPnMLMfMg@smile.fi.intel.com>
 <d329fa91-a913-a0ab-a7a9-50069c1c834c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d329fa91-a913-a0ab-a7a9-50069c1c834c@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 16, 2022 at 04:54:59PM +0100, Hans de Goede wrote:
> On 12/16/22 14:43, Andy Shevchenko wrote:
> > On Fri, Dec 16, 2022 at 12:30:07PM +0100, Hans de Goede wrote:

...

> >> +EXPORT_SYMBOL_GPL(led_add_lookup);
> > 
> >> +EXPORT_SYMBOL_GPL(led_remove_lookup);
> > 
> > Wondering why we can't make at least those two to be namespaced from day 1,
> 
> switching the LED subsystem code to use module namespaces is
> a RFE which is independent of / orthogonal to this patchset.

Adding new unnamespaced APIs only delays and increases a burden of the work.
We can start already for the logically separated subset of API, no? That's why
I asked about this.

-- 
With Best Regards,
Andy Shevchenko


