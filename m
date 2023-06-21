Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9501E7384B3
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jun 2023 15:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbjFUNRp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jun 2023 09:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbjFUNRg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jun 2023 09:17:36 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FAF19BD
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jun 2023 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687353452; x=1718889452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZMO22a9mNsnw2la7mXQ1njEw7WkhoIFj5pgVhM1WMd4=;
  b=TIKP8uNib8HdySSwei3cLqlH9i8ZQe7GV2CLtuIWPVYxWmKltkTxFcCV
   guE+uJGIkmkXJNVOrUyu1Ufhq/aBx/rlVSgWXqQAHwYwi7PEyq85ByALL
   9nGx23/WqqwssO/0ymczQ4LKRUOYWiQOjxgHYP3uSzKyOhGg35Pcn2Yx7
   0wVF4EiR6q0cme1UhYcZKXbW93PIixFey0h6sqvGWZqT+vNdXWmh0O/QC
   ykyUCySNl+uMJopP8W+yY5wXrgaXQXT0SQnDEfY9T10AebJjxGznP9LHR
   lXCtzxWMv6YgPXq0qRjOJqy98/ShCH8Ox83epEq2Kg9RmsyZWvaZjkNDz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349899843"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="349899843"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 06:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="838608517"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="838608517"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 21 Jun 2023 06:17:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qBxiE-005VNJ-0y;
        Wed, 21 Jun 2023 16:17:30 +0300
Date:   Wed, 21 Jun 2023 16:17:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.5-1
Message-ID: <ZJL4aTQxfgtg21uh@smile.fi.intel.com>
References: <ZJGtpU3049d0bnfU@black.fi.intel.com>
 <CACRpkdZec9rukp0VvfP1Tq9vTEzhx1MdWECRB+TFN_wOVOLwjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZec9rukp0VvfP1Tq9vTEzhx1MdWECRB+TFN_wOVOLwjQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 21, 2023 at 09:38:46AM +0200, Linus Walleij wrote:
> On Tue, Jun 20, 2023 at 3:46 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Traditional PR for Intel pin control drivers for v6.5-rc1. This time not so
> > big with the most important part that fixes use of OPEN DRAIN pin mode in
> > a few drivers. That was in Linux Next for several weeks. Please pull.
> 
> Pulled in for v6.5, excellent work as always!

Thank you, as usual!

Side note: Do you know that you may use --signed-off for `git merge`?

-- 
With Best Regards,
Andy Shevchenko


