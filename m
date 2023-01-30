Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12492681D95
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 23:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjA3WBh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 17:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjA3WBg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 17:01:36 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D20555BA
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 14:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675116096; x=1706652096;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0P2h33p3coOQnbU56xV5FZ56EBUog9HESRn2YY95xkU=;
  b=g6YJAaJlq3Qn6YNvvkq/fC5XD616ll5aYk8m+9XBlh3O6ZEhVOX6LUbZ
   Pi8UT/fy2a1VcyYpB2wLtM7YbKEK7cgsG1DBQ1WQhklmpElnzFF5tTejf
   q/dnD9CHu9qQQKuUhLE3tRjgzgJCxJdSPTeWkY73pKqu+QzJqFcGfNWYW
   EtGZZzpOTFjJOApQ6UQ/EMAxOgNkB6Yi1to3DSBNd9VbfFFk5uJMFkqrU
   pmHGQUhyHmvSW3nAAIeLr1Jwq3JNPK4tuShw3rJWqcqVn5kRZjTiZbBBu
   jZB9p//TbdoYpr8lRXR+EXSFxcbOFN0ndgSAOZ4Lbo73zrNzpvAF5Bd7x
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="390050147"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="390050147"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 14:01:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664242063"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="664242063"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 14:01:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pMcDR-00HZTf-0L;
        Tue, 31 Jan 2023 00:01:29 +0200
Date:   Tue, 31 Jan 2023 00:01:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [RFC PATCH 1/3] gpio: pca953x: Replace chip type flags with a
 type enum
Message-ID: <Y9g+OFJOGlXW4TaH@smile.fi.intel.com>
References: <fbd33cdb-6942-e1ac-57ad-b7f3faf7eba5@eilabs.com>
 <77a8e6b4-15d4-da2a-4697-5181994920d4@eilabs.com>
 <Y9g9NhELIEPXbG4O@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9g9NhELIEPXbG4O@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 11:57:11PM +0200, Andy Shevchenko wrote:
> On Mon, Jan 30, 2023 at 09:59:42PM +0100, Levente Révész wrote:

...

> static_assert((PCA_TYPE_MASK + 1) >= (TYPE_MAX << 8));

Actually better

static_assert(PCA_TYPE_MASK >= ((TYPE_MAX - 1) << 8));

to prevent potential overflow if we move this field to the end of the type.

-- 
With Best Regards,
Andy Shevchenko


