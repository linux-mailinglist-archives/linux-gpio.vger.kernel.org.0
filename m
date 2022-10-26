Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B558A60E68B
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 19:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbiJZRcF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 13:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbiJZRcD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 13:32:03 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF289FE916
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 10:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666805519; x=1698341519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GYhvMgKKMDWVKm5EWN2V2h0e++r6gPUv22d+dlLK1Ls=;
  b=NdkOLCb9SJ2huw7fArX20PAgq0kMnygeLguWrRhzihfN+WTsFLloOrNb
   3QKkFpH4nSTBgH4pmqym/BlkP3SihjtWA3fpnkrZvSKlB2My7/sN1SCW2
   nlIMrXzgWYxYpoD3Yif/63gRTRqgVubSQkMhGIl5OyLZchCWj0V05iZIn
   iqkNkp2HAvNhAnZ6XsrWhQYqJGTwPFFz5UiLQiQaHVbuheQatmBJ0QEBh
   ea+takSjeDtvonam0QcJxZWVWoTBFuBndGkKrITXPGn1V6hcv8SzhYor1
   PsZXI41CAbkZdgfIKPBLRw08vc8wu7EFgkvEiITB3m87lGU6UmVqgX0HK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="287729211"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="287729211"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 10:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="665373726"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="665373726"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 26 Oct 2022 10:31:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onkFt-002lxY-2W;
        Wed, 26 Oct 2022 20:31:53 +0300
Date:   Wed, 26 Oct 2022 20:31:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/6] gpio: pca953x: Generalize interrupt mask register
 handling
Message-ID: <Y1lvCSDnpBff0tVT@smile.fi.intel.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <edd3f359-effb-0951-f75f-b03ebb8b7b29@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edd3f359-effb-0951-f75f-b03ebb8b7b29@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 01:23:58PM +0200, Levente Révész wrote:

...

> Question:
> 
>     This patch uses the PCA_HAS_INT_MASK bit to encode if the chip has
> 	interrupt register mask. An alternatice approach would be to create
> 	a new chip type for PCA953X_TYPE chips with the mask register.
> 	What do you think?

Consider avoiding the change of the ID tables in almost every patch you have.
This can be achiever by carefully allocating bits for types and define the
actual HW via bit ORed masks.

-- 
With Best Regards,
Andy Shevchenko


