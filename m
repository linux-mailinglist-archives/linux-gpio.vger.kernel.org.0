Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E9E60E669
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 19:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbiJZRZa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 13:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233840AbiJZRZa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 13:25:30 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B16981C8
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 10:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666805129; x=1698341129;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=m3lGQ+DS/DLtVJzqivRs1SmlJy00NLTtXjS71zgaDHw=;
  b=XCX1JG9YlGeRFlWUT33snt5uT3sLqNt+5fd9vZz78sH5B6AsR5rIXb+A
   MtshryDgC5j2NvI7a6jTDmHlMSuoo+yzqkASWMMHbK8nCCaXjeL5Vlw4h
   N95PiN4rOYXUHrGu70MfTcLU2af/r2TDeIGo4WUbOavD3yQFzZAk82Fps
   s97SHV1AxYlHb9Pb7/r9Kph8IGjp7UI7D5RuMec6BKigBjLBzkJojcvGu
   v9upPWNUcKA7gTbVVCYmoPXD9dEyJpLTSod8IfxXVEml6jq8/i0FcKJQU
   O6hTREJ8PVsFW/viLvd49uttEDSqD6lyOD32j5TTQYwHEC5Y/RiDGb5jW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="308006525"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="308006525"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 10:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="737334965"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="737334965"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 26 Oct 2022 10:25:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onk9c-002lp1-1Z;
        Wed, 26 Oct 2022 20:25:24 +0300
Date:   Wed, 26 Oct 2022 20:25:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/6] gpio: pca953x: Add PCAL953X as a separate chip
 type
Message-ID: <Y1lthH3RNut4m/Wq@smile.fi.intel.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bdc962c-1cfe-8240-963c-491f3992b2cb@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 01:21:23PM +0200, Levente Révész wrote:
> The PCAL-ness of a chip can be known from its chip type:
> PCAL953X and PCAL653X chips have the PCAL register set, the others
> do not. It's better to have a separate chip type for PCAL953X chips:
> this encodes that the driver needs to use their extended registers,
> without the need for a separate PCA_PCAL flag in the driver_data.
> 
> Remove PCA_PCAL bit and PCA_LATCH_INT bitmask.
> 
> Add pca953x_is_pcal_type() function to check if chip is PCAL.

Suggested-by: ?

> Signed-off-by: Levente Révész <levente.revesz@eilabs.com>

...

> +static inline bool pca953x_is_pcal_type(const struct pca953x_chip *chip)
> +{
> +	int chip_type = PCA_CHIP_TYPE(chip->driver_data);

+ blank line

> +	return chip_type == PCAL953X_TYPE || chip_type == PCAL653X_TYPE;
> +}

-- 
With Best Regards,
Andy Shevchenko


