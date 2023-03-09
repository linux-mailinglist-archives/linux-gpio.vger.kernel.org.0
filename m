Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B267E6B242B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 13:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjCIM1p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 07:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjCIM1a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 07:27:30 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31404ED0F9
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 04:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678364822; x=1709900822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XqAWvSGaYD1G+RObKmSZv2X4i13keN+Yfo57Kq55Wks=;
  b=g++0bjzbodRC3hNFVrF4mcw3ICF9qhb3ytZMuLbVwZNPYs48UMlKEYBN
   LbS7/DfYoY7eBSgn82tYD6VNk815Ckh1e3SdTKHdTzPYayWaf+EtcGkKU
   YhN1aRg3jq9KXqvT1RcmhHTKNsjP+68wa+iHtPHKyz5p0AYUYApOU9sLm
   AFLe6+n7A0T2SlMWo2BwKW4JBP5LfTsNfvfP3hjJAzoq81iCV26r6D4FV
   SRmUnZ+vMkQxGZ4kfh4xsv66myVtKjdFpqyKgV/DbYL95Cx0hyh+Kf7Vm
   JyqD7WrYQg8J7DVFUUa7/19ZpYfkebsB0sUb9YfY0oo3D8xUAi+uEVkrE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324752634"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="324752634"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679741529"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="679741529"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 04:26:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1paFMH-000JIb-2a;
        Thu, 09 Mar 2023 14:26:57 +0200
Date:   Thu, 9 Mar 2023 14:26:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
Subject: Re: gpiolib of_node removal
Message-ID: <ZAnQkX5olfH7MCBc@smile.fi.intel.com>
References: <760827e8-6e55-177a-851e-677f54edb3a7@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <760827e8-6e55-177a-851e-677f54edb3a7@nvidia.com>
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

On Wed, Mar 08, 2023 at 05:17:40PM -0800, Dipen Patel wrote:
> Hi Andy, Bartosz,
> 
> I see that 6.3-rc1 has https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/gpio/driver.h?id=70d0fc4288dabd65025fde7774b4f9262afa9034
> commit which removes of_node data member as it was deemed unused. Incidentally, I actually am using that member in ongoing patch series
> https://patchwork.kernel.org/project/timestamp/patch/20230214115553.10416-3-dipenp@nvidia.com/ and specifically in tegra_get_gpiochip_from_of_node function.
> 
> Should I revert that patch and add it in my next patch series or is there any other way to retrieve gpio_chip?

I don't know what you are doing exactly, but either use parent device for GPIO
chip or supply a custom fwnode. The OF node won't be resurrected.

-- 
With Best Regards,
Andy Shevchenko


