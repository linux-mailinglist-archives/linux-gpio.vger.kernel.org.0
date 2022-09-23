Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A22D25E785F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 12:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbiIWKbG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 06:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbiIWKap (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 06:30:45 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB1390190
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 03:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663929044; x=1695465044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qng2WhxHL19CATttr8AlZRDZO7/+8RRJv+sBlN6z2JE=;
  b=e74HvHzZs9v7ggXHPubat/2peK/kwX7z3s/b4gyjhAau1U2AIV/MgFHj
   h4izYEHxMyDx1TXqypB4O1qnFwJ6sG0SYvAxV8kEVsHvCuSH5AbKObQd5
   i8Jg/0xO2GcKz+gAWpH8qHCWoSZF1Qs1Wu8Il9AsMvYOMH7hzDlzMOvz6
   DdxX7k1Nav/DM945Ddain9iwXCnQET53lOZOkrp5BQkiCLx/A6uf12r3F
   wl4pLbi4zee1E1jWNY582zB2lEft07/QSgfhsl/qYPCohoqs1fzltqw/H
   Fc/o0SdKRWQVwAp4H1DULHS8DOVIYTgHWq0z9h5P6WRbdLB3A2cDxR+Ko
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280929556"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="280929556"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 03:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="745754615"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 23 Sep 2022 03:30:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1obfxB-006QAP-0H;
        Fri, 23 Sep 2022 13:30:41 +0300
Date:   Fri, 23 Sep 2022 13:30:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH] treewide: add support for hardware
 timestamp engine
Message-ID: <Yy2K0PaK2e3tMs9l@smile.fi.intel.com>
References: <20220923081223.25851-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923081223.25851-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 23, 2022 at 10:12:23AM +0200, Bartosz Golaszewski wrote:
> Since v5.19 the linux GPIO uAPI exposes a new request flag for making
> the hardware timestamp engine be the source of edge event timestamps.
> Add support for it to libgpiod.

...

>  	/**
>  	 * @brief Read the current event clock setting used for edge event
>  	 *        timestamps.
> -	 * @return Returns MONOTONIC or REALTIME.
> +	 * @return Returns MONOTONIC, REALTIME or HTE.

Is it possible to refer to these with % so doxygen (or whatever you are using)
make the links out of them?

Because HTE is way too cryptic TLA (the same concern was also during submission
of that framework into the Linux kernel).

>  	 */

...

>  	{ line::clock::MONOTONIC,	"MONOTONIC" },
> -	{ line::clock::REALTIME,	"REALTIME" }
> +	{ line::clock::REALTIME,	"REALTIME" },
> +	{ line::clock::HTE,		"HTE" }

Similar here and hey, have you got the idea of the trailing comma (or poor C++
forbids that?)?

-- 
With Best Regards,
Andy Shevchenko


