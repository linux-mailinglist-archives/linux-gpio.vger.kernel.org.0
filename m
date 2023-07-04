Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43149747456
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jul 2023 16:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjGDOpy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jul 2023 10:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjGDOpx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2023 10:45:53 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB17E49
        for <linux-gpio@vger.kernel.org>; Tue,  4 Jul 2023 07:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688481952; x=1720017952;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kAgvHoyepNldKY2kVJ9tpLH/o3qdQ55Z+tiksdlAXpM=;
  b=VOZkqbTQFw0kQ6QKCp+blktfXXu0t57yETfwonvABAhKB7Vd72qCwvxZ
   +6zXV/1YhVWxJ6T3/qUw7K67xSKq147mUzWeN5Ou/M2wEKf/yden8VPKn
   WYRQJ5oV1pc5f2usVCXqIScrYUU8SM0VBdPNa9lBAe6xRejaJtqK2kLnv
   3AcxiDefOOqoiCsaCM6DswSzMp9a3VQ2MeJqJBlGiKNYu/ZlWUDXJ4t+c
   BLKazQ52+m8UHuc6rAVa9+ldps6UjPXskNmiqNFdNIpL5L5XQJUifhHA9
   rM4lqcvpyj8wbwkU6kNqwNTpy2NIRwitNJDGV40F2MKj5PmE8+g78PJlX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="429174891"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="429174891"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 07:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748440587"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="748440587"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 04 Jul 2023 07:45:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qGhHh-0002w3-39;
        Tue, 04 Jul 2023 17:45:41 +0300
Date:   Tue, 4 Jul 2023 17:45:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: clarify the non-option arguments in
 help text
Message-ID: <ZKQwlX39DU4fSzES@smile.fi.intel.com>
References: <20230704121222.314617-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704121222.314617-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 04, 2023 at 02:12:22PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We already use [] for optional and <> for required arguments in help text
> but let's make it clear that we can pass multiple chips/lines and in most
> tools only the first one is required.

I agree with Kent, I prefer the former over the latter.

And with this syntax the reality looks as

	[chip1 [chip2] ...]

rather than ambiguous [x] [y] where I can't understand what is the meaning
of the chip1 be omitted while chip2 is present.

-- 
With Best Regards,
Andy Shevchenko


