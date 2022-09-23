Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBAA5E786F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Sep 2022 12:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiIWKdv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 06:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbiIWKd1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 06:33:27 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB1A178BC
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 03:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663929206; x=1695465206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sbt6cd6bMKZZescG1FHs0vj+QdI6/FusrkBoUfimDzM=;
  b=gTelr6lyFBDoLNea82oc8ERuYIxn5cNBkKrBezj7T1teBWjLlGJHgc5v
   D5NMeYYzS97ge4x8DEKD7E39y1g5unUaCO0hgl4ezZYYGkpAIYWCLF5Li
   e6eXzZRJ95s4sxFxVN86h7KBFA6DHxO4TTrOgCNT49vnP5NBiSt1parJD
   PzfF84PG8WZGsWa4z/RZbdlJfew4wLYxnrKyFE9wacN6H71TDyhfJf3Bs
   HSHzwZyHgSup4sst/oMDUlqxHWdbj+yXlc8x78d3y1H1Mra6TkV43ehLn
   dYlhkXwnoQMQ4eASnpkVc3oi9BCIdSqfbb6+KiPjBPU9tUbDKBatS43Pl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280929960"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="280929960"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 03:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="571335290"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 23 Sep 2022 03:33:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1obfzl-006QDU-2e;
        Fri, 23 Sep 2022 13:33:21 +0300
Date:   Fri, 23 Sep 2022 13:33:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linus Walleij <linus.walleij@linaro.org>, jbx6244@gmail.com,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 RESEND 0/2] rockchip pinctrl for acpi
Message-ID: <Yy2LcZmdaN3t898E@smile.fi.intel.com>
References: <20220917060929.657778-1-jay.xu@rock-chips.com>
 <CACRpkdanniba+TUAeqei93dmkBT82HY5D95KxTsc8aE7jV+5VQ@mail.gmail.com>
 <2419940.Icojqenx9y@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2419940.Icojqenx9y@phil>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 23, 2022 at 12:26:06PM +0200, Heiko Stuebner wrote:
> Am Dienstag, 20. September 2022, 11:26:26 CEST schrieb Linus Walleij:
> > On Sat, Sep 17, 2022 at 8:09 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:
> > 
> > > These patch fixes to support acpi by:
> > > 1. populate gpio platform before pinctrl to probe
> > > 2. get gpiochip by finding from gpiochip list
> > > 3. get match data by device api
> > >
> > > Jianqun Xu (2):
> > >   pinctrl: rockchip: find gpiochip by name from gpio module
> > >   pinctrl: rockchip: get match data by device_get_match_data
> > 
> > These look OK to me but I would feel better if Heiko or Andy ACK:ed
> > them so I give them a few more days to comment.
> 
> Right now I'm actually quite confused as I seem to have a bunch
> of pinctrl/gpio-acpi patchsets of varying lengths in my inbox.
> 
> There is a "v2", a "v8", a 20-patchset without version.
> It's all quite confusing.

With the LKP complains on top of almost each series...

That's why I stopped considering them seriously (like some RFC is going on)
and no more reviewing.

I can suggest the author to create a branch on a public tree and collect all
series together (like topic branches that are merged one-by-one to the main
topic branch) and start again.

-- 
With Best Regards,
Andy Shevchenko


