Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1E066AB23
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Jan 2023 12:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjANLUV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 14 Jan 2023 06:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbjANLUU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 14 Jan 2023 06:20:20 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FC19D
        for <linux-gpio@vger.kernel.org>; Sat, 14 Jan 2023 03:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673695217; x=1705231217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ClOncuvbpI4fydrfg4PEzgCfy9sXaBnPdlTzKWAtMZA=;
  b=g3m6w/xnG1+gJ3f7Oxz6K2UAc8PovPZfO4LtL6GfjjD/td7AVkkHU4Ox
   mNykFeoG+iiYp68PUyM60xdFZNWGdXezOnT0acFUv7XVvAlp+Rx30f4ty
   XHOPclLI/RyHZo1bvCPDmzAZ2uTeA+HumLsHGCrm5MjsJdRIgRuYVWMwV
   etmwyFFnhE+YwTwrBdJ/0IkQiRbgFtZxiFuGYSLLclCsfddPdObSrbnZg
   1C2H4UmdtBCZZtQnfqh1U25pBWUvALFzaPtNEMMa6F9AVvw7qQyt2ZVh7
   lGBMCFT7CPe5/FNISCMqJ6RfS6wggtksAT+SMkn7mx684Ex/tkGReUVCn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="307736038"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="307736038"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2023 03:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="832342558"
X-IronPort-AV: E=Sophos;i="5.97,216,1669104000"; 
   d="scan'208";a="832342558"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 14 Jan 2023 03:20:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pGea5-0097lr-1S;
        Sat, 14 Jan 2023 13:20:13 +0200
Date:   Sat, 14 Jan 2023 13:20:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 12/16] bindings: cxx: add
 line_config.set_output_values()
Message-ID: <Y8KP7U84x0lvr52f@smile.fi.intel.com>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-13-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-13-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2023 at 10:52:06PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend line_config to expose a new method - set_output_values() - which
> wraps the new C function for setting multiple output values at once.

...

Side Q: Does documentation describe the order in which lines are being set?
Or is it solely specified by a kernel driver for a hardware?

(I can imagine that this may be not so trivial as long as the input parameters,
 i.e. line offsets, are not sorted and hardware supports full bank atomic
 write, this may have a lot of interesting side effects.)


-- 
With Best Regards,
Andy Shevchenko


