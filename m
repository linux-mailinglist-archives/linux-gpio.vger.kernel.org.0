Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE0A6BB57D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Mar 2023 15:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231748AbjCOOFM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Mar 2023 10:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbjCOOEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Mar 2023 10:04:47 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225B02ED48
        for <linux-gpio@vger.kernel.org>; Wed, 15 Mar 2023 07:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678889086; x=1710425086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jEhAE5g4ZakgQ+9UtV98/g9w1pncrloTKlXY6Q5Iqe8=;
  b=OaQx54lHxYrz95od6QasWiRfcYshX4X9FkEgQr/6qZ5l5c5vbsqOOb1E
   B0ikwj9SqkQCQQM002SdUGYVk0O4EoMg1YiCDMFbCv7HYApdTkEsC+ns9
   bUZ8py15k2y8XQ8k1MmrfjrjfNCy5nfsbN+jVnv+R/llrAPDU7xqUsjoO
   9/vZCnjy4bTYthL/wu+eogDn5KU1Akeeuyex4AKe+X0r/heXyNI+0bYF1
   bJRoeGQc+n6J003FyJK0ONw9nRkw+aO2FH25Co8kGZh8ZNRYA61//rO5Y
   nJB25IMPIkiEs7hioE26zUQ/T3P4dGfF5/EsHam6Yk1sykkZ3zml/8/St
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="400289897"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="400289897"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 07:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672756870"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="672756870"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 15 Mar 2023 07:03:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pcRjE-003rHg-05;
        Wed, 15 Mar 2023 16:03:44 +0200
Date:   Wed, 15 Mar 2023 16:03:43 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Wes Tarro <wes.tarro@azuresummit.com>
Subject: Re: [libgpiod][PATCH] tools: gpiomon: fix setting event clock type
Message-ID: <ZBHQP3e0/iDs0Jyn@smile.fi.intel.com>
References: <20230315083456.27590-1-brgl@bgdev.pl>
 <CACRpkdaBKxSbRxCoYRyNJMfjiDZ5TswYg7s-Z0Loy+aha4ZFLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaBKxSbRxCoYRyNJMfjiDZ5TswYg7s-Z0Loy+aha4ZFLQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 15, 2023 at 09:44:17AM +0100, Linus Walleij wrote:
> On Wed, Mar 15, 2023 at 9:35 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Fix an inverted logic bug when parsing event clock type in gpiomon.
> >
> > Fixes: 8ffb6489286f ("tools: line name focussed rework")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Reported-by: Wes Tarro <wes.tarro@azuresummit.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> > -       if (strcmp(option, "hte") != 0)
> > +       if (strcmp(option, "hte") == 0)
> 
> I tend to code if (!strcmp(option, "hte")) but taste differs.

Pity we don't have match_string() API in a libc or somewhere in the user space.
Allows to avoid such mistakes at once.

-- 
With Best Regards,
Andy Shevchenko


