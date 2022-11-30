Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D490263D7D6
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 15:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiK3OMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 09:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiK3OMW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 09:12:22 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFB984DFC
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 06:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669817425; x=1701353425;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aSFeg7UcANQqzW7ECtt+sZwsw5ug5yp+Uf3KKF/Hm9s=;
  b=TVBvFDq2dG7luqtS26xlCLIRti7qwi/2wttBQvSAV56NYFRVTdsWOoZI
   2D/mu6nWNAuOnBPgotwCKJuJjLa56eV9vQ7we8MxbXvUg7tY/CCwPhTb/
   KyYgIxrcX0hT96m1RXCpfQBXJNgy6G/ZVWvqusJ+rlGRMgYTsXDA9jou4
   EQpTxVPNGjzQucokkiIcbhG5nwlqTydlUfy2RHaJ0ghVQC5bAm0bqkVsc
   PYEc3il1vPOvyuhoolFZNYKKB4AqKY+M5ruQ3Mt1oJBSS9COZpg7HocpQ
   QKNpzjaDz/nLoNpihyADUyth1udfPG+W738sbeLev9D9dBGW6ITaC2829
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="314095058"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="314095058"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 06:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="768841959"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="768841959"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2022 06:09:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0NmC-002IO9-0T;
        Wed, 30 Nov 2022 16:09:28 +0200
Date:   Wed, 30 Nov 2022 16:09:27 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 11/11] bindings: python: extend setup.py
Message-ID: <Y4dkF3eyH8ZO2PDN@smile.fi.intel.com>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-12-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130124231.1054001-12-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 01:42:31PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add additional information to setup.py. This will be visible in the EGG
> file.

...

>      packages=find_packages(include=["gpiod"]),
>      ext_modules=extensions,
>      version=__version__,
> +    author="Bartosz Golaszewski",
> +    author_email="brgl@bgdev.pl",
> +    description="Python bindings for libgpiod",
> +    platforms=["linux"],

> +    license="LGPLv2.1",

Is it applicable to the bindings only? I am not familiar with the code base,
but one of the patches in this series makes me wonder if you are not going to
make same mistake by licensing tools, if any written in pure Python, with a
wrong license.

-- 
With Best Regards,
Andy Shevchenko


