Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8C8606737
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 19:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiJTRo7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 13:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiJTRo6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 13:44:58 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993618E71C
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666287897; x=1697823897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZHnyCIt34ObmvA/2NAlMJnTg0SQeOV78jHmryMt4X8A=;
  b=BqAZYBcA3k2IkYTfP90zGRy3nWz45zDyb1epexywQwDUFSimJzSw03pi
   pW3GgC5AOQwnHT0CjmbNpDeOPnV2TeEBcmrVyB9ZqQ0rYyJ004E7TJABJ
   RBR0RdO+D5TDSe7nTvnHlYdT0cFuzlLD5SQrUJrXEn27554X0bFhmfoN7
   X5l3KNWRMBVfw1+hq9OxjNfZpQQ4Zvu0JAwzRwct5MNULeZKeZmuzrBU9
   gpY+VPADebLE8CEMyNPcn09OB4ibsdfDFTT/Og+t4M0x4dNvaH9UaN3Ug
   3r6ajDOjhSiR5Qm26V36RNE+xtyzdZAJeLlYSecT+ZJlmKFc+BV64I3qI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="306781715"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="306781715"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="959090926"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="959090926"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 20 Oct 2022 10:44:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1olZbB-00AfxL-1c;
        Thu, 20 Oct 2022 20:44:53 +0300
Date:   Thu, 20 Oct 2022 20:44:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-1
Message-ID: <Y1GJFakunT78fXmE@smile.fi.intel.com>
References: <Y1FgAAHJu/cVNAIC@black.fi.intel.com>
 <CAMRc=Medt_M0h+1TdtRnu=7v1NmGePqfFBS02+zceXGLQ4OV3w@mail.gmail.com>
 <Y1GItraKIaDqFMjG@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1GItraKIaDqFMjG@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2022 at 08:43:18PM +0300, Andy Shevchenko wrote:
> On Thu, Oct 20, 2022 at 07:31:23PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Oct 20, 2022 at 4:58 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> > Can you send the GPIO changes separately? This way I don't need to
> > pull all those pinctrl patches into the GPIO PR for the next merge
> > window.
> 
> Some of them, but not all, if that what you wish.
> I.o.w. a couple of the GPIO changes must be part of pin control series.

And I just realized that if any of new GPIO code will appear with the wrong
headers, there will be an inconsistent state. That said, I prefer this PR is
go as is.

-- 
With Best Regards,
Andy Shevchenko


