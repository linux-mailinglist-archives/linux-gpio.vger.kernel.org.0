Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30EFC662DCA
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 18:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237128AbjAIR6P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 12:58:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237218AbjAIR57 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 12:57:59 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69164A97F
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 09:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673286861; x=1704822861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DepVpziLJOdDFazJcNqTtxc+8CfcIPJUm2x6N9Rjs8A=;
  b=OSoabEpY7ASAtvnDqEPvsvTR1iDEn08XvzFKuwjpolsk63oTU3i4LFEd
   mcgyR6BzCO97WK2Ptzt08k5Q+YkyHa3QDr83wZQj6gwqhABh/y4UbtJGD
   Fer2wyOC9+wv13zN6eBh6W9+Dw8n8ndKihUEULn6WiafIpNcPRglIdOF+
   zQunxFJihYune2mvQ6YOII/Qdac5mv3SeDg2oy+KODHN1njTa8UQ5yxkc
   FucljEQrq9lizgWx4s/axLAut8nhPjkWgApRHJNbAySsR/SnutDPrh0Hy
   HDJQZ34Q9oSbk5L8CQMEHILnolfbUckuNQ3QA51kqBBv/zEbV4in/Dk+z
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="324180430"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="324180430"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 09:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="985474087"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="985474087"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jan 2023 09:54:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pEwLd-006du0-1F;
        Mon, 09 Jan 2023 19:54:13 +0200
Date:   Mon, 9 Jan 2023 19:54:13 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] core: make the library NULL-aware
Message-ID: <Y7xUxZzUx7/ZpNQ+@smile.fi.intel.com>
References: <20230106115129.393007-1-brgl@bgdev.pl>
 <Y7v6oWaNVgltjC8V@smile.fi.intel.com>
 <Y7v61HBtu1cPOS2D@smile.fi.intel.com>
 <CAMRc=McbtdZAm7JJF1AEus+vYdUFoNFrtj+WMH_4QS3_52GcZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McbtdZAm7JJF1AEus+vYdUFoNFrtj+WMH_4QS3_52GcZw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 09, 2023 at 06:36:56PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 9, 2023 at 12:30 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Jan 09, 2023 at 01:29:37PM +0200, Andy Shevchenko wrote:
> > > On Fri, Jan 06, 2023 at 12:51:29PM +0100, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

...

> > > >  GPIOD_API void gpiod_line_config_free(struct gpiod_line_config *config)
> > > >  {
> > > > +   if (!config)
> > > > +           return;
> > > > +
> > > >     free_refs(config);
> > > >     free(config);
> > > >  }
> > >
> > > At least this is redundant. free() is NULL-aware itself.
> >
> > And if free_refs() is not, it's better to make it explicit or fix that function
> > if possible.
> 
> free_refs() is not public and it's used elsewhere too where the config
> pointer is already checked. I prefer it this way.

Then perhaps

   if (config)
      free_refs(config);

   free(config);

?

P.S. Up to you since it's a minor stuff.

-- 
With Best Regards,
Andy Shevchenko


