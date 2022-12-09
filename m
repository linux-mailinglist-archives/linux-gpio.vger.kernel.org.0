Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8468648AA3
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 23:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiLIWPC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Dec 2022 17:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiLIWOz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2022 17:14:55 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B615C6F488
        for <linux-gpio@vger.kernel.org>; Fri,  9 Dec 2022 14:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670624094; x=1702160094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I/5PZj5E2KHGELnHSGFbBNSRvOmmaNChpefjepEISGY=;
  b=bCtMkoircoIY3bB1zCx4U283SLreeOaMZp+IvPF5OzX3f1FWjbm3btHw
   r/RibbaAskWbNNkEU3bx3UgWaKNpzMVMcyvfAbPm96ktCVQN70zvPEjVr
   iax1Kg2+BGtPFjf8bfk0FhoLpUfFPZ/h9OH4feNSHHz1/0jUKeYwvmpO+
   9in7scLWcaQ1ugkFRvqOPsfbiG4uO3FIMkHufqO3vXccd88mwaonrAZHc
   WM9fOV7fTo+EkdThvX+4R6G9/4MxnrdTTg2QPejrlPOA7rhtMH36cOE33
   GUlQxZM58MWDdZazHCxYKKJblTc3yZwYFpN9Z+3mZ3N0oCEkvuF3uCK3N
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="305201430"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="305201430"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 14:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="678284154"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="678284154"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 09 Dec 2022 14:13:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3lck-007DBt-2y;
        Sat, 10 Dec 2022 00:13:42 +0200
Date:   Sat, 10 Dec 2022 00:13:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-imx@nxp.com,
        linux-gpio@vger.kernel.org, martyn.welch@collabora.com
Subject: Re: [PATCH 2/2] gpio: pca953x: avoid logically dead code
Message-ID: <Y5OzFllVQF3Siy3D@smile.fi.intel.com>
References: <20221209075040.2141042-1-haibo.chen@nxp.com>
 <20221209075040.2141042-2-haibo.chen@nxp.com>
 <Y5OjDFIM5hqVQKib@smile.fi.intel.com>
 <Y5Ov/LJtxpB0WMBN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5Ov/LJtxpB0WMBN@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 10, 2022 at 12:00:28AM +0200, Andy Shevchenko wrote:
> On Fri, Dec 09, 2022 at 11:05:16PM +0200, Andy Shevchenko wrote:
> > On Fri, Dec 09, 2022 at 03:50:40PM +0800, haibo.chen@nxp.com wrote:
> > > From: Haibo Chen <haibo.chen@nxp.com>

...

> > > -	if (reg >= 0x30) {
> > > +	if (reg >= 0x30 && reg < 0x54) {
> > >  		/*
> > >  		 * Reserved block between 14h and 2Fh does not align on
> > >  		 * expected bank boundaries like other devices.
> > 
> > Can we convert this to a switch case with ranges?
> 
> Looking into code more, I think we can accept this (patch 2) as a fix for now
> and clean up later on.

Looking even more, I think the better fix is to shuffle conditional, so it will
go after the bigger check.

> The problem is that it really depends on the patch 1 which we need to figure
> out what the correct fix would be.

-- 
With Best Regards,
Andy Shevchenko


