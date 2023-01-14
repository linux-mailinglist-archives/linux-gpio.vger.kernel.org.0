Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54B766AB20
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Jan 2023 12:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjANLPD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Jan 2023 06:15:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjANLPC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Jan 2023 06:15:02 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C19558F
        for <linux-gpio@vger.kernel.org>; Sat, 14 Jan 2023 03:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673694901; x=1705230901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MxHnOre7fPfOdFWaa9a14yxWMjc/j7aBw0LJAW15kQk=;
  b=YJlqzy8svinNyrf7gNIK+opcKHH6A/uVuYXmXkAk5SQx6hAHS2PFUB+1
   bMUXWmcXLDnPh4jXnyKfMA4S/InSvB5sFn1X0mvTH9pN+c5JA430Lu0ss
   bsUGFT2uJYnPIP/zsxCNCYWpcghGQLT1RxbhJwYRSVztlSPASP85naINm
   U2ryqvA8n8gE5nSabn6oo4EtgbjLDw0P2hsB2cL56tC317FKsJ5Fa0H8K
   XSLU4VENZG5V+ylZkkL2B2XVfCWtlzZlenRtl46ajh1aPwQpXT468wYNE
   epV4lZ8/WWLDJSiLLTpgdO7764pMDwJGB/R04mfcGHf6ZcVKdFZK6r3kH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="325439003"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="325439003"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2023 03:15:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="658480217"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="658480217"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 14 Jan 2023 03:14:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pGeUz-0097fL-1w;
        Sat, 14 Jan 2023 13:14:57 +0200
Date:   Sat, 14 Jan 2023 13:14:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 01/16] README: update for libgpiod v2
Message-ID: <Y8KOsSRQ2EUa+vjE@smile.fi.intel.com>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-2-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-2-brgl@bgdev.pl>
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

On Fri, Jan 13, 2023 at 10:51:55PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Certain parts of the README file still refer to concepts removed from
> libgpiod v2. Update whatever needs updating.

...

>  The minimum kernel version required to run the tests can be checked in the
>  tests/gpiod-test.c source file (it's subject to change if new features are
> -added to the kernel). The tests work together with the gpio-mockup kernel
> -module which must be enabled. NOTE: the module must not be built-in. A helper
> -library - libgpiomockup - is included to enable straightforward interaction
> -with the module.
> +added to the kernel). The tests work together with the gpio-sim kernel which

Mistakenly removed word 'module' ?

> +must either be built-in or available for loading using kmod. A helper
> +library - libgpiosim - is included to enable straightforward interaction with
> +the module.

...

> -Both C++ and Python bindings also include their own test-suites. Both reuse the
> -libgpiomockup library to avoid code duplication when interacting with
> -gpio-mockup.
> +C++, Rust and Python bindings also include their own test-suites. Both reuse the

"Both" out of three?

> +libgpiosim library to avoid code duplication when interacting with gpio-sim.

-- 
With Best Regards,
Andy Shevchenko


