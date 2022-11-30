Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A9863D789
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 15:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiK3OFj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 09:05:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiK3OFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 09:05:36 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27794B74F
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 06:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669817132; x=1701353132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Jsv03cH4HEYQqbz4YCpBDtpOgrIGQCtUzR68qaPjzk=;
  b=W6LO6x+heSJlZwLSckt2e1xQgjseCLxSSniVTdXX6lB8M9Kl7TLGNW7D
   f9wm1AcXcUae2We4v85kygb29Gq16e5iQb4SWKdstBBkQE2P05a9h/GEp
   WhLoCghRfX0ehVFuz5lT7szjEBYm6EB4a2cydNhCT81+lHfkZy4djG2Qx
   K4aecLpHfaLDbrWC73jsp5zCyml+ItUcDwso6Z7P2dz8F+d3XXRYfMGOm
   sCF3iL9O5iACWMRgX0asp3EEA2WO7P0KgqAQiZD8NdItBVm+cqBGK4G2f
   ZeljRcRwRRlqfhsywMY5GHptoATsX91zGIET9ffpBA686NqFUDTUPl07K
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="342322931"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="342322931"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 06:05:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="768840705"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="768840705"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2022 06:05:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0NiL-002IIN-0A;
        Wed, 30 Nov 2022 16:05:29 +0200
Date:   Wed, 30 Nov 2022 16:05:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 07/11] bindings: rust: make reuse happy
Message-ID: <Y4djKAW2Y1RQb98Z@smile.fi.intel.com>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130124231.1054001-8-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 01:42:27PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add missing license text files and use the CC0-1.0 license for the
> rust-specific .gitignore file.

...

> diff --git a/bindings/rust/.gitignore b/bindings/rust/.gitignore
> index 95054d9..6fe7bde 100644
> --- a/bindings/rust/.gitignore
> +++ b/bindings/rust/.gitignore
> @@ -1,4 +1,6 @@

> -# Added by cargo

Seems like automatically generated, which means that next time something comes
here may well screw up the below.

> +# SPDX-License-Identifier: CC0-1.0
> +# SPDX-FileCopyrightText: 2022 Linaro Ltd.
> +# SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>

-- 
With Best Regards,
Andy Shevchenko


