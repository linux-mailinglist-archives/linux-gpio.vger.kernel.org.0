Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A2F6BB57E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 15:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjCOOFM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 10:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbjCOOEu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 10:04:50 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A24730B35
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 07:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678889089; x=1710425089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5bt60qeq2ktbfBlnHnqv3iyv4paZC9vH5QiOeWwHUT8=;
  b=agAJokHl1KwUMWO8apPznBuuGZPfHFMukP5sgvYdnTrMVOcIlVcKKlgn
   q2Beusn3HGThsWHGll2HzoninMwgUWveWOJ4o1QJ7M0TcqlKcsvOHSht0
   C4HUgJ41+f3OYRb7Jm7hSwO0ZAV3eAhkYuJRf4hbnu3Qib4PXXpg4XZPX
   Pgh7369I4wiTFU+Ru5xgbM87w5Fholv1nWZrXvWTP3uOuTpLlzWB/whsF
   vXYusa4LoBEtkxDovGKhGsGOgXpWWl1djfbVOJvDdVqXHNh0YajNK+yj6
   O2JJWIQlsmU7S6y+R1v4EoXUTQRT3RlN8fKbIgUNRYSB/nuKs6pRNSCYY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335199134"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="335199134"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 07:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="711923784"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="711923784"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 15 Mar 2023 07:04:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pcRjj-003rIh-1r;
        Wed, 15 Mar 2023 16:04:15 +0200
Date:   Wed, 15 Mar 2023 16:04:14 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Wes Tarro <wes.tarro@azuresummit.com>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: fix setting event clock type
Message-ID: <ZBHQXj4Us03RV+iW@smile.fi.intel.com>
References: <20230315083456.27590-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315083456.27590-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2023 at 09:34:56AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Fix an inverted logic bug when parsing event clock type in gpiomon.

Oh, oh. Good catch and fix!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 8ffb6489286f ("tools: line name focussed rework")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reported-by: Wes Tarro <wes.tarro@azuresummit.com>
> ---
>  tools/gpiomon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/gpiomon.c b/tools/gpiomon.c
> index ec177df..c2684c2 100644
> --- a/tools/gpiomon.c
> +++ b/tools/gpiomon.c
> @@ -99,7 +99,7 @@ static int parse_event_clock_or_die(const char *option)
>  {
>  	if (strcmp(option, "realtime") == 0)
>  		return GPIOD_LINE_CLOCK_REALTIME;
> -	if (strcmp(option, "hte") != 0)
> +	if (strcmp(option, "hte") == 0)
>  		return GPIOD_LINE_CLOCK_HTE;
>  	if (strcmp(option, "monotonic") != 0)
>  		die("invalid event clock: %s", option);
> -- 
> 2.37.2
> 

-- 
With Best Regards,
Andy Shevchenko


