Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEB976BD26
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjHAS7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjHAS71 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:59:27 -0400
Received: from mgamail.intel.com (unknown [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CAE1BF1
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690916366; x=1722452366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rSFvRcT+GG2V/xys5I/qV3Jcz05lK3FG0V71QbTPQcE=;
  b=D3F8LywSOenM5gZac2I+q97BDyB4C7fuWkbhiw9G8mKIrP/qTFP6CNtv
   5GLhIz/UDu6mKrch4lncYkW2tTXozd++p+fBt7joUDlE9cEwajHW33uRM
   uTir9UYCqgAg9wtDt8ctRaS9+0ebnHBnz/3czUxZfdt3I20JyPF+XXXGt
   LCuZz/GBgMpZ9Vn/CQ0fzfvT1G0/9IuZE1udwgPBS/zudNJtR1V5kbpJZ
   o9SXMM2V+ec841zLyFQ3QLqOkdXKq+KQBRERTRTQvg0I/CgKVWsLCjBLh
   yYjgsPDJ/m4qCgEqHWwixcstaf+4VIkIRwzb0lLqD+6N0CgLdCBKrXLqI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="348992387"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="348992387"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="1059520502"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="1059520502"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2023 11:59:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQuaY-00FcIJ-20;
        Tue, 01 Aug 2023 21:59:22 +0300
Date:   Tue, 1 Aug 2023 21:59:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, nandor.han@ge.com,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, u.kleine-koenig@pengutronix.de,
        arnd@arndb.de
Subject: Re: [PATCH -next] gpio: xra1403: remove redundant of_match_ptr
Message-ID: <ZMlWChMGRUAo0sZ5@smile.fi.intel.com>
References: <20230801033658.221565-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033658.221565-1-wangzhu9@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 01, 2023 at 11:36:58AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here, and __maybe_unused can also be removed.

of_match_ptr()

> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.

Also drop no more needed of_device.h.
OTOH spi/spi.h de facto guarantees mod_devicetable.h to be included.

-- 
With Best Regards,
Andy Shevchenko


