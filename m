Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F405662437
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 12:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbjAILbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 06:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbjAILae (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 06:30:34 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E427186FB
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 03:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673263833; x=1704799833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hR/T0atKpYHFL9STSk8XB/uMnDh3gNZjZSbQwJEN3AY=;
  b=Oc4vzpWEn2r9AmkICgMGfjuqSNDd6lzTZFucjmecesIB2GA3vSWkbohq
   qQGZGbYixzQttRkL4xKFIgh6xk1gudaV/MqPEuorBF+CXnPTGjSDSuWSy
   7TE3iQOOWY+dBsLg9yqGuuGddCuvUVlwLSLka04XgMk05x8qkj7+bOQk1
   LAcNeL8GHWoHFLFidRW/buaIR7gZ8XfBC5V6epWs3zay/WT3kGOMtcenw
   Mgjz/Vtazjq1sdqCXkuIa3povqTh0XW1WfeioM7vPUsAM/aSDK24+45Kt
   YhKMSxGweAUi60VybXaHvIYXJwq4ErCH86FlOnElRl0NYwv5Y4hGItcqM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="306370628"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="306370628"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 03:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="606579780"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="606579780"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 09 Jan 2023 03:30:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pEqMH-006MiC-0k;
        Mon, 09 Jan 2023 13:30:29 +0200
Date:   Mon, 9 Jan 2023 13:30:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] core: make the library NULL-aware
Message-ID: <Y7v61HBtu1cPOS2D@smile.fi.intel.com>
References: <20230106115129.393007-1-brgl@bgdev.pl>
 <Y7v6oWaNVgltjC8V@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7v6oWaNVgltjC8V@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 09, 2023 at 01:29:37PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 06, 2023 at 12:51:29PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

...

> >  GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
> >  {
> > +	if (!config)
> > +		return;
> > +
> >  	free_refs(config);
> >  	free(config);
> >  }
> 
> At least this is redundant. free() is NULL-aware itself.

And if free_refs() is not, it's better to make it explicit or fix that function
if possible.

-- 
With Best Regards,
Andy Shevchenko


