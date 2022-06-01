Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE45B53A32B
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352195AbiFAKrK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352478AbiFAKqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:46:35 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1580084A1D
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654080389; x=1685616389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3QXSGEFTycWlHzV65nY73E/jzFcOa8J5L+ojom/KQpY=;
  b=M0TRhXiXSatU1AgRunH2wfsImmRZtzaUzkbNhEu8lOlTeEth3Az4YUAV
   l9sWoOhbB/guAJ5o9UWbXbv5LKeuOog9/LuubJVxLLbVGXxPpLlvaJqTM
   uRLap51jcnEIrEDecCi9DLXpsDwlVgpsn5FrFoXjzhxxs9hFnR2s1Ju29
   jteThOKPh9ntwzyTlY9IOC7em2HW0BmDp9hHodM++xRNwNAoh5gop5Sbs
   6GFJfPn3HA0/B9/osf9t+UEzOBH4FcdaYQ9hNcotLeXSB0icis9pQ26R/
   ZwSId9Yu6vHl4tgNEefyjLHCVoxzhqBHfJ/tXPFzFs7GJTfd5cS9QQmMv
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275555627"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="275555627"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:46:28 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="645439515"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 03:46:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nwLpm-000QZ9-Bf;
        Wed, 01 Jun 2022 13:44:14 +0300
Date:   Wed, 1 Jun 2022 13:44:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com
Subject: Re: [PATCH v4 6/6] pinctrl: amd: Implement pinmux functionality
Message-ID: <YpdC/lYxyMkDy80k@smile.fi.intel.com>
References: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
 <20220601100214.828595-7-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601100214.828595-7-Basavaraj.Natikar@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 01, 2022 at 03:32:14PM +0530, Basavaraj Natikar wrote:
> Provide pinmux functionality by implementing pinmux_ops.

...

> +	if (!gpio_dev->iomux_base) {
> +		dev_warn(&gpio_dev->pdev->dev, "iomux function %d group not supported\n", selector);
> +		return -EINVAL;

In all cases like this, why dev_warn()? This message level is inconsistent with
the code flow, i.e. 'warn' means "tell and go on", 'err' - "tell and fail
execution".

> +	}

-- 
With Best Regards,
Andy Shevchenko


