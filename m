Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8FC60DF62
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbiJZLS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbiJZLS4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:18:56 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F579185C
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666783135; x=1698319135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F8r+uj7D8qDAwjnwwWekxwUDBqGLNXrDiVRJOcB/7jE=;
  b=H9wL11R3XFeCR9mDQxCRRGsrwkPuxMH8YcGr4Z6Ts0zwvox5rmQ3vvTK
   9wwYBRblsHZ0cJW1zdnkkcIPKJax4LzqXDl17P+nXHM38CchGk9vy8k/+
   j3r46wTGCFq3i/XBFj8U4nGEFVO47cu6APqYBCqmRZrMLuP+rRQFb579U
   c7irrMFINw+1vq0Um5oRE0N3VbiFXfNW0hAMbIx/h3ZLLWuZFy+KVCAY4
   voRlvulV/J4IZFI+3ZQI3C/rt7on44Qrh7GWJB8pEspoorBhnlq4knutb
   4cMu3/buua5RCp405/Ax1lKExolKUbzBrKRo3dSP1BQUIHGK2Sah/XxqJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="287636255"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="287636255"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 04:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="721212447"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="721212447"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Oct 2022 04:18:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oneQu-002bv4-1N;
        Wed, 26 Oct 2022 14:18:52 +0300
Date:   Wed, 26 Oct 2022 14:18:52 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-2
Message-ID: <Y1kXnDttlqyzRAUW@smile.fi.intel.com>
References: <Y1fl6ZaTNa7L6QfQ@black.fi.intel.com>
 <CACRpkdb3-ifo2u02kcxbQzB6fJzYSQOSjVhXRWWsCRrc2_BU-Q@mail.gmail.com>
 <Y1kXd8++brY23LHb@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1kXd8++brY23LHb@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 02:18:15PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 26, 2022 at 10:00:02AM +0200, Linus Walleij wrote:
> > On Tue, Oct 25, 2022 at 3:34 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > > A bunch of cleanups of the pin control and GPIO headers. It has been a couple
> > > of days in Linux Next without any major issue reported, a few fixes are already
> > > incorporated in the respective patches. The idea is that pin control and GPIO
> > > subsystems take it now and we will continue from this for all new code.
> > 
> > I'm a big fan of this cleanup series!
> > 
> > > Linus, Bart, please pull to your trees.
> > > The tag is signed and can be considered as immutable.
> > 
> > Pulled in to my devel branch for v6.2.
> 
> Thank you!
> 
> Now I'm starting to fill the branch by the patches in the queue.

I mean it will be another PR closer to the end of the cycle with the rest of
pin control material from me.

-- 
With Best Regards,
Andy Shevchenko


