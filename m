Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1A3260DFF2
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 13:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233599AbiJZLrp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 07:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbiJZLrb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 07:47:31 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33353845E;
        Wed, 26 Oct 2022 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666784818; x=1698320818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b06/ixQTvo4yNJzSWIRRf7XvwhiUnFL1NIt+eXhoE1Q=;
  b=b9shMvIYO54QiiLYPABV9hm1Q//OY4lnZwQzq1Q+/6SUhl/PlYlHbMBX
   PzePayvuBpLODVMPpFy8Y8AMQyzrm8PVEoqWUdMrPbFqXaJhEK6djErxu
   CzHcc+bwynyAdxseBBkMhHqVqvN3aKvZXVoyNcCKTR+penrAS/Ue9+drf
   stU0uOu/4/heUUSrZ6VVlc7nK0rSack4jthZjGXQh+0EQisIso3wOS/wn
   Rpa7FAhOtafaX2A2AgOTgR/6UEId+ZpJlAaJs8p9L4tjAKL3pWvnf1IrL
   H/BaAkjOL3p418rn/DAox8DuVAq5fOanVPbkIa0lkHGhZHDHCQiw26o24
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="288319659"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="288319659"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 04:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10511"; a="634456778"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; 
   d="scan'208";a="634456778"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 26 Oct 2022 04:46:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onerx-002cjx-2j;
        Wed, 26 Oct 2022 14:46:49 +0300
Date:   Wed, 26 Oct 2022 14:46:49 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-gpio@vger.kernel.org, git@amd.com,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org
Subject: Re: [PATCH v5 2/3] gpio: pca9570: add a platform data structure
Message-ID: <Y1keKRzBhSDi671j@smile.fi.intel.com>
References: <20220930102259.21918-1-shubhrajyoti.datta@amd.com>
 <20220930102259.21918-3-shubhrajyoti.datta@amd.com>
 <CAMuHMdUAcA=4Xcgr9hHgT5cro=s0mvAQqHmco0-e-NvWKJmrCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUAcA=4Xcgr9hHgT5cro=s0mvAQqHmco0-e-NvWKJmrCA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 12:00:34PM +0200, Geert Uytterhoeven wrote:
> Hi Shubhrajyoti,
> On Fri, Sep 30, 2022 at 12:41 PM Shubhrajyoti Datta
> <shubhrajyoti.datta@amd.com> wrote:

...

> Thanks for your patch, which is now commit 35a4bc94a47f2ea6 ("gpio:
> pca9570: add a platform data structure") in gpio/gpio/for-next
> linux-next/master next-20221026

Dunno if Bart rebases his tree...

...

> >  static const struct of_device_id pca9570_of_match_table[] = {
> > -       { .compatible = "nxp,pca9570", .data = (void *)4 },
> > -       { .compatible = "nxp,pca9571", .data = (void *)8 },
> > +       { .compatible = "nxp,pca9570", .data = &pca9570_gpio },
> > +       { .compatible = "nxp,pca9571", .data = &pca9571_gpio },
> 
> This breaks bisection, as .data is still considered to be the number
> of GPIOs:
> 
>     gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);

You beat me up to it, I have also noticed this.

> >         { /* sentinel */ }
> >  };

-- 
With Best Regards,
Andy Shevchenko


