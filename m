Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94CDC6AEBBB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Mar 2023 18:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbjCGRsW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Mar 2023 12:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231933AbjCGRsE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Mar 2023 12:48:04 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB49C4235;
        Tue,  7 Mar 2023 09:42:55 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333390318"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="333390318"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 09:41:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626621570"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="626621570"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 07 Mar 2023 09:41:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pZbJg-00H2R9-23;
        Tue, 07 Mar 2023 19:41:36 +0200
Date:   Tue, 7 Mar 2023 19:41:36 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Andrew Davis <afd@ti.com>
Cc:     Peter Tyser <ptyser@xes-inc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] gpio: ich: Use devm_gpiochip_add_data() to simplify
 remove path
Message-ID: <ZAd3UJ+DpvpPvjMg@smile.fi.intel.com>
References: <20230307165432.25484-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307165432.25484-1-afd@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 07, 2023 at 10:54:27AM -0600, Andrew Davis wrote:
> Use devm version of gpiochip add function to handle removal for us.

OK, everything else is already using devm, so we are fine to have this also
being managed.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


