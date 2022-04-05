Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6137A4F45DD
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Apr 2022 00:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241783AbiDEUTh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 16:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1455026AbiDEP7c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 11:59:32 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B71D120D88
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 08:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649171295; x=1680707295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b6eeKFuRroKxAbXgSUPaM1sVU2pjSBecm3biJhGQL7c=;
  b=cBuuYWzjcZAyhuMxBQwCrjE9FcezZI4+kaXR1TSJbD5h3t2Vkd36zhlM
   3XttWSyM57R1CRIay1b3up8ZScm6sJ0HU2Gt48a3KRkrZ1iMq4W+GH8R4
   4fEUtlLAfWuimjb6d7hzOIKjlsUDMSUmt/hdb1yAmZ3Jhl3FUpjmfnZRu
   YhNf05ahONaNfpgVqiH6UxL8Dc5gJzQ/5HVkBrwhvfOqWYBgYnLZ6LFhk
   0ZX/3mP1vhP2oYSD0MjJYgaTPN0TPXM6vIzV+L8rrOh7pj3dcUphFsQlX
   iHjsXk3BS5lU0BnPWQwZKn/96QRDUICnFD5TscP/T5qX8A+Q8nrYKNS50
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="260761022"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="260761022"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 08:07:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; 
   d="scan'208";a="549089028"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2022 08:07:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nbkmF-00DQaN-LE;
        Tue, 05 Apr 2022 18:07:27 +0300
Date:   Tue, 5 Apr 2022 18:07:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] API: rename gpiod_chip_find_line()
Message-ID: <YkxbL/7nxu+OvMYx@smile.fi.intel.com>
References: <20220405132158.33433-1-brgl@bgdev.pl>
 <20220405134424.GA29756@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405134424.GA29756@sol>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 05, 2022 at 09:44:24PM +0800, Kent Gibson wrote:
> On Tue, Apr 05, 2022 at 03:21:58PM +0200, Bartosz Golaszewski wrote:
> > The name "find_line" is quite ambigous. We should indicate that the
> > purpose of this routine is to map the line name to its HW offset.
> > Kent suggested get_line_get_offset_from_name() which is hard to beat
> > when it comes to being explicit.
> > 
> 
> My suggestion was actually gpiod_chip_line_offset_from_name().
> But gpiod_chip_get_line_offset_from_name() is even more explicit.
> And both make more sense than your misquote above ;-).
> 
> So that works for me - assuming you fix the quote.

I also like this. Thanks!

-- 
With Best Regards,
Andy Shevchenko


