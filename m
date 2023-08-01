Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF7576BCB7
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjHASng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjHASnO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:43:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34BF26BA
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690915392; x=1722451392;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4nxJjged74xpv2Jgei7IuXo1MiXSFfeAMqzMsvCOqPY=;
  b=dZRRf5sAJMey5L/6rGcwk/4805/Ie7nyNtmBBipGzIvDSN3brYs5jWYD
   Id8C84DkTwr4jZYoJmUfc1AvxireEUZRjx3pEq+75JpvBhIZhDAnJxenw
   fNs8+BE7EagXfZTtnpKQ3jkuDe+9eaPSAZ2BXBI8VtHR++qLfYccp8w9e
   Jsupd/0qBNOpUChTZ7KDkYWhNS4nwPLWVIImBTqfLJUJ+9DGksZUl6qnK
   l/DymEyJ/OGAASIP1k6kXLjPLS0Qyyf/HmY3zME0AX3V6CFh+Cxs1uKI8
   vWokHQcLpZB9CtGchV6wPPLmVAYsaEOidhjNRwyEFNLtP83doU6rOfS5k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359427766"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="359427766"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="818897818"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="818897818"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2023 11:43:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQuKq-00F4ED-0r;
        Tue, 01 Aug 2023 21:43:08 +0300
Date:   Tue, 1 Aug 2023 21:43:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, arnd@arndb.de
Subject: Re: [PATCH -next] gpio: max732x: remove redundant CONFIG_OF and
 of_match_ptr
Message-ID: <ZMlSPN2m42VDov22@smile.fi.intel.com>
References: <20230801033620.221270-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033620.221270-1-wangzhu9@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 01, 2023 at 11:36:20AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here. We remove both CONFIG_OF and of_match_ptr here.

of_match_ptr()

> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.

With this change, drop of.h which is not needed anymore.
OTOH the mod_devicetable.h is implicitly included by i2c.h
and this is used by so many drivers that we may omit explicit
inclusion.

-- 
With Best Regards,
Andy Shevchenko


