Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE5466AB21
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Jan 2023 12:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjANLQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Jan 2023 06:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjANLQt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Jan 2023 06:16:49 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF955B83
        for <linux-gpio@vger.kernel.org>; Sat, 14 Jan 2023 03:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673695008; x=1705231008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AtkgXgt5j16NKe0K+x8e8+yyT45kTDI1lTzq4iI1vL0=;
  b=YOvzdWvM/QrFGy5OI8PhIUIvjdnjx2ywEC9gm0l5Wjk6t6Of8DD3VJo2
   rqqzvy5v9OBtRUfBWrTztlR4SulXJfn3bJzeVbt6xAA6X6MVA5yDEje/B
   at/LZLnkWbaPS/sXHLUSNJ4NE/i6yteB7txq9q2zTUrG30mq/JEQD+FPf
   R+Xbi/RWX5U/D70GIFlEJVlKFtXGgn7Pl4Ko+Yn/H1rvXmVdReu6d9aUz
   DTZBFmG1zZX1FRWj2KJxafsvyJeIPwtI/OqjnZCsDrcwKtHBumXATwToe
   j8t8mg0xyESdgp4sXtvnSXiQ658T35LX6X/bcyNrYMnXIFpoRwx5Hl7AZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="303881619"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="303881619"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2023 03:16:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="800881902"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="800881902"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2023 03:16:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pGeWj-0097hv-0I;
        Sat, 14 Jan 2023 13:16:45 +0200
Date:   Sat, 14 Jan 2023 13:16:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 02/16] tests: avoid shadowing local variables
 with common names in macros
Message-ID: <Y8KPHOfUvvbI1Qll@smile.fi.intel.com>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-3-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2023 at 10:51:56PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The name 'ret' if very common for local variables so change it to _ret
> in test helper macros to avoid potential shadowing.

Makes sense!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  tests/gpiod-test-helpers.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/gpiod-test-helpers.h b/tests/gpiod-test-helpers.h
> index 2d86345..b40b820 100644
> --- a/tests/gpiod-test-helpers.h
> +++ b/tests/gpiod-test-helpers.h
> @@ -118,11 +118,11 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
>  #define gpiod_test_line_config_add_line_settings_or_fail(_line_cfg, _offsets, \
>  						_num_offsets, _settings) \
>  	do { \
> -		gint ret = gpiod_line_config_add_line_settings(_line_cfg, \
> -							       _offsets,  \
> -							       _num_offsets, \
> -							       _settings); \
> -		g_assert_cmpint(ret, ==, 0); \
> +		gint _ret = gpiod_line_config_add_line_settings(_line_cfg, \
> +								_offsets,  \
> +								_num_offsets, \
> +								_settings); \
> +		g_assert_cmpint(_ret, ==, 0); \
>  		gpiod_test_return_if_failed(); \
>  	} while (0)
>  
> @@ -147,9 +147,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(struct_gpiod_edge_event_buffer,
>  
>  #define gpiod_test_reconfigure_lines_or_fail(_request, _line_cfg) \
>  	do { \
> -		gint ret = gpiod_line_request_reconfigure_lines(_request, \
> -								_line_cfg); \
> -		g_assert_cmpint(ret, ==, 0); \
> +		gint _ret = gpiod_line_request_reconfigure_lines(_request, \
> +								 _line_cfg); \
> +		g_assert_cmpint(_ret, ==, 0); \
>  		gpiod_test_return_if_failed(); \
>  	} while (0)
>  
> -- 
> 2.37.2
> 

-- 
With Best Regards,
Andy Shevchenko


