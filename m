Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC6376BC72
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Aug 2023 20:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjHAS2q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Aug 2023 14:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjHAS2p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Aug 2023 14:28:45 -0400
Received: from mgamail.intel.com (unknown [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611A42D69
        for <linux-gpio@vger.kernel.org>; Tue,  1 Aug 2023 11:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690914498; x=1722450498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=koWiHOBWzmF0CbVGoV/fDJRvlK81DrCIFR2Ky3MS818=;
  b=b6hd2BwqhBaj8kL5lWfbVZTB1y1aSiE1SD4pSz96EIGnNcSh42CHek2+
   PeVEyLWhLQdOIAo9Q+l/aTQ9cNsC6JXoxWG2aAma1vQybSXVSLnHjnCvU
   krFC7AnMSaKKmuiRXAg5GTApEv7sR3JRdsp7xHkpmLfkiRAVIX9J7Kscb
   tZNRgOEwZeZ/7nFU2nkuDOwSa+Xt0Yl/mqK0+uM04wptYRow4QbKeEAXi
   bNJgRsJ+YFUrtCLqyhGf+ywk12kLZXLhprjn2OEyxhx/r0IBD8LJFOc5f
   QV4B28s4wJcapyxYQSQ1H2QtibJqrAnHLgmzMNfaBHbnjy0j6CHmqZSeg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="435706521"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="435706521"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 11:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="728802768"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="728802768"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 01 Aug 2023 11:27:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qQu5g-00EXWT-09;
        Tue, 01 Aug 2023 21:27:28 +0300
Date:   Tue, 1 Aug 2023 21:27:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, shc_work@mail.ru, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        u.kleine-koenig@pengutronix.de, arnd@arndb.de
Subject: Re: [PATCH -next] gpio: clps711x: remove redundant of_match_ptr
Message-ID: <ZMlOjxU6OQARC3qd@smile.fi.intel.com>
References: <20230801033513.220783-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801033513.220783-1-wangzhu9@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 01, 2023 at 11:35:13AM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use
> of_match_ptr here.

of_match_ptr()

> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it. Hence we remove of_match_ptr.

of_match_ptr().

You need to drop __maybe_unused at the same time.

-- 
With Best Regards,
Andy Shevchenko


