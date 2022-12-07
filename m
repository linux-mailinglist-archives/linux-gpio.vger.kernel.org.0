Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4E1464584E
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Dec 2022 11:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiLGK5H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Dec 2022 05:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiLGK5H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Dec 2022 05:57:07 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14D72F037
        for <linux-gpio@vger.kernel.org>; Wed,  7 Dec 2022 02:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670410626; x=1701946626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2rsxH4ACzPvM+rJR86GFeCsgEYXdPBgFuOZ/NAQA0VU=;
  b=DKtGiK7UnAI6M5Un90CsXb4U8tPK1MBZmokiRsdxDF1/fvvTY+7QdO6H
   83GlDXTnOsuDlyWdOoVqJPlA9YjN4aH76zSDP/h/T4awq26NH9yZSrFZ2
   xvyQMvi/1T4hEn3gZxz1f/IhleoakGI/O17g5Oyx6LNK+ld7eOBSB2QJr
   hK3UlE06+GfebIR7Fn3CvmKiEaeyZxJPuDGc3IOafjAQVarAyeYDqSVs0
   rE19MjeHQQgr1woO3XCHQBU3r7PsRHfTMre/s90l5w1BBAvszzKIHC1P5
   YGA0s4o5YEuUvj4ueGHs71CKXMMxS1+VNNAcsU90SIGiO9Ysk9kLU+0zv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="304493305"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="304493305"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2022 02:57:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="771062216"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; 
   d="scan'208";a="771062216"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 07 Dec 2022 02:57:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p2s6o-005jDt-2a;
        Wed, 07 Dec 2022 12:57:02 +0200
Date:   Wed, 7 Dec 2022 12:57:02 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 2/2] bindings: python: tests: set the process
 name
Message-ID: <Y5Bxftq6b6ENKD2R@smile.fi.intel.com>
References: <20221207091413.61616-1-brgl@bgdev.pl>
 <20221207091413.61616-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207091413.61616-2-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 07, 2022 at 10:14:13AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> When we run the test suite by calling the __main__ function of the module,
> the name of the process as visible in the system becomes "python". Let's
> set it to "python-gpiod" before running the tests. This way gpiosim will
> name its configfs attributes appropriately.

Perhaps you can refer to the [1] to explain why it's needed in Python.
Also it can be done via ctype module [2][3] or via module [4], although
I haven't checked if most used distros pack it.

[1]: https://bugs.python.org/issue5672
[2]: https://stackoverflow.com/a/923034
[3]: https://stackoverflow.com/a/31134436
[4]: https://github.com/dvarrazzo/py-setproctitle

-- 
With Best Regards,
Andy Shevchenko


