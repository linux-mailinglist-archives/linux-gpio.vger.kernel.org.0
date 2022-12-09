Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFDC648A72
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Dec 2022 23:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiLIWAe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Dec 2022 17:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiLIWAd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Dec 2022 17:00:33 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944E89D883
        for <linux-gpio@vger.kernel.org>; Fri,  9 Dec 2022 14:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670623232; x=1702159232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Nk79F07Qs/JqBkaS7YDEEY90sb/3xzQogXJfT6XvzY=;
  b=jp/SOafb4eY/AhRTxCk7/3DcdZ2StGtV5ft2bfvm2N5zZegIzHbqAl06
   rN8UYaPfV3IPEEIEot0a3dCiZoo7TqGThyKx201+/T7ESblb+xspmoqUQ
   hhuu+OzKjYTBQrOwtFWrK5xO8f8dCiurb+UIDyKMCDH+vxCr2JcdymlV5
   ACRXf+QT/x++qlad7aSRBxYijr8MlK+Cwb3KcG8x7dJrLyciOTkvq+lr5
   6IZb3prz8GmRomivrodCp8tgsoRiJ1R/BOGf2rwPKJxU0W1RpT/SrJLLu
   O5CP3VmZty0wJXL37dhenYQZtO90Uy0AuAhM3qqVxEpaiUJrTlQIakOQe
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="315192446"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="315192446"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2022 14:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10556"; a="789848115"
X-IronPort-AV: E=Sophos;i="5.96,232,1665471600"; 
   d="scan'208";a="789848115"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2022 14:00:30 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1p3lPw-007CrQ-1N;
        Sat, 10 Dec 2022 00:00:28 +0200
Date:   Sat, 10 Dec 2022 00:00:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     haibo.chen@nxp.com
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, linux-imx@nxp.com,
        linux-gpio@vger.kernel.org, martyn.welch@collabora.com
Subject: Re: [PATCH 2/2] gpio: pca953x: avoid logically dead code
Message-ID: <Y5Ov/LJtxpB0WMBN@smile.fi.intel.com>
References: <20221209075040.2141042-1-haibo.chen@nxp.com>
 <20221209075040.2141042-2-haibo.chen@nxp.com>
 <Y5OjDFIM5hqVQKib@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5OjDFIM5hqVQKib@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 09, 2022 at 11:05:16PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 09, 2022 at 03:50:40PM +0800, haibo.chen@nxp.com wrote:
> > From: Haibo Chen <haibo.chen@nxp.com>

...

> > -	if (reg >= 0x30) {
> > +	if (reg >= 0x30 && reg < 0x54) {
> >  		/*
> >  		 * Reserved block between 14h and 2Fh does not align on
> >  		 * expected bank boundaries like other devices.
> 
> Can we convert this to a switch case with ranges?

Looking into code more, I think we can accept this (patch 2) as a fix for now
and clean up later on.

The problem is that it really depends on the patch 1 which we need to figure
out what the correct fix would be.

-- 
With Best Regards,
Andy Shevchenko


