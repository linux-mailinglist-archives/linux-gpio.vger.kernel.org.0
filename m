Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3726C60489D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 16:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbiJSOBf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 10:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233234AbiJSOBM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 10:01:12 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AB4191D6D
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 06:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666186910; x=1697722910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f7DYs7FCfToVAGZyGA0ZzOuqwJ1jCItxM4JguOoQnec=;
  b=ldA4XjqVE5K0OP3Sb67Pdk1VSoo8qLw8YjomcfcfFMZPi6ZcPS6yM1up
   iDv7ZtA/n53Il8/iEYTLrHLEGqSHk7MwJRh3D5FabcdGBiUqg99tZ1bIU
   eVItisd8SvB2RBje5pyfp8HY15RItkHGpRskIbEFabJoKurl0PRTEIxq0
   FDrJCOOVr/47nDytcSTOP7o4XBzPf8NfpiHLKiN/Vv2w7du+EUZ3DQVPG
   Myy5DPJv+/c0wfY1BVFF7szKSRcFAhf6tlG44h7tcH4rjXSLGXu1GRJam
   Cs0OMgagmw34Ok5vkEegwdtB1MT7AQCTEaP18tEkuwjXI6jV+dHfRM/uF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="370629119"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="370629119"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 06:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="660351761"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="660351761"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 19 Oct 2022 06:39:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ol9I7-009sem-1g;
        Wed, 19 Oct 2022 16:39:27 +0300
Date:   Wed, 19 Oct 2022 16:39:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Fabio Estevam <festevam@denx.de>
Cc:     linus.walleij@linaro.org, ping.bai@nxp.com,
        linux-gpio@vger.kernel.org, naresh.kamboju@linaro.org,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] pinctrl: imx1: Include the <linux/seq_file.h> header
Message-ID: <Y0/+DwnSuP5M7Qu1@smile.fi.intel.com>
References: <20221019132306.65244-1-festevam@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019132306.65244-1-festevam@denx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2022 at 10:23:06AM -0300, Fabio Estevam wrote:
> After some recent header cleanup in the pinctrl subsystem, the following
> build error is seen:
> 
> drivers/pinctrl/freescale/pinctrl-imx1-core.c: In function 'imx1_pin_dbg_show':
> drivers/pinctrl/freescale/pinctrl-imx1-core.c:209:2: error: implicit
> declaration of function 'seq_printf'; did you mean 'scnprintf'?
> [-Werror=implicit-function-declaration]
> 
> Explicitly add the <linux/seq_file.h> header to fix it.

Thank you, I will incorporate it into the respective series.

-- 
With Best Regards,
Andy Shevchenko


