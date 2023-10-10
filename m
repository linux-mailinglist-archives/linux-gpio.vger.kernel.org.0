Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E557BFE5D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 15:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbjJJNse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 09:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbjJJNsd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 09:48:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C1DFE;
        Tue, 10 Oct 2023 06:48:31 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="5962155"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="5962155"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823788444"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823788444"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:48:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andy@kernel.org>)
        id 1qqD61-00000004M4c-3Cet;
        Tue, 10 Oct 2023 16:48:25 +0300
Date:   Tue, 10 Oct 2023 16:48:25 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] gpio: tegra186: Set fwnode of the GPIO chip
Message-ID: <ZSVWKSVNsBqDcOFS@smile.fi.intel.com>
References: <20231009173858.723686-1-dipenp@nvidia.com>
 <ZSVN73ffDkGBzmmI@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSVN73ffDkGBzmmI@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 10, 2023 at 04:13:19PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 09, 2023 at 10:38:58AM -0700, Dipen Patel wrote:

...

> > +	/*
> > +	 * This is needed for driver using gpio device matching where it
> > +	 * has to use gpio_chip fwnode to match the gpio controller.
> > +	 */
> > +	gpio->gpio.fwnode = of_node_to_fwnode(pdev->dev.of_node);
> 
> of_node_to_fwnode() is specific to IRQ, in other places we use generic
> of_fwnode_handle(). That's why better just to use dev_fwnode().

On the second thought is there any parent assigned?
At least I see that in tegra186_gpio_probe(). Are you saying
it is not working? Or is it (matching) called _before_ we
add a GPIO device?

-- 
With Best Regards,
Andy Shevchenko


