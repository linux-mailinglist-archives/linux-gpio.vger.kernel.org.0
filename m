Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7AD60E651
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 19:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbiJZRTF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 13:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233142AbiJZRTE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 13:19:04 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1505A83F37
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666804744; x=1698340744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0X3DI8UEy9V/BNuOV0EEMrQXJctxSf/MzCb+hBHHqGU=;
  b=GQpgtn4b+d0g64Bkltv39WVjwk38ANbChjbaAG1pZY74I9p+wFJnz6rF
   osJ0We6jE/2NctlUhhDjugYrqb2bSBNGql7SqrrXkr9OVhR/UCJKDXcE5
   Jw/LtqXSo43evpFhZXAIZmp4DdARSNekRLuuIMuOHuD2YuyNwT7CvbZFb
   qAtlNPpSdWgHwcURUl2mx4TwpzzO40Omha/igAdazOCqvsIa1HMU8MoaA
   JKxbyPSoZiLtNItqqiQrPt+rgYWMkSQhn+ASQbXWI4PZhjfvIrHnE4F1S
   LX8X7sS/sAjp/v/B0shTsQ4WhAEwYca4G4ZRtYw/d+Q/dKolGbxrYFdCi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="291314471"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="291314471"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 10:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="695461251"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="695461251"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 26 Oct 2022 10:19:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onk3N-002lej-2S;
        Wed, 26 Oct 2022 20:18:57 +0300
Date:   Wed, 26 Oct 2022 20:18:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/6] gpio: pca953x: Convert PCA_TYPE from bits to
 number
Message-ID: <Y1lsAZX1vCOZkPCR@smile.fi.intel.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <0de783a2-d35c-6f20-4c22-86d6cd8dbc41@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0de783a2-d35c-6f20-4c22-86d6cd8dbc41@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 01:18:57PM +0200, Levente Révész wrote:
> There are 3 chip types already in the driver:
> 
>     * PCA953X_TYPE (standard register set, + pcal chips have extended set)

PCAL

>     * PCAL653X_TYPE (standard + extended register set, different spacing)
>     * PCA957X_TYPE (standard + other registers, different addresses)
> 
> A later patch in this series adds yet another type. This would take up all
> 4 bits allocated to chip type information in driver_data, leaving no space
> for new types in the future.
> 
> Convert PCA_TYPE defines from bits to numbers.
> 
> Replace if-else statements with cleaner switch statements. This makes it
> easier to add new types.

Suggested-by: ?

> Signed-off-by: Levente Révész <levente.revesz@eilabs.com>

...

> -#define PCA953X_TYPE		BIT(12)
> -#define PCA957X_TYPE		BIT(13)
> -#define PCAL653X_TYPE		BIT(14)
> +#define PCA953X_TYPE		(0x00 << 12)
> +#define PCAL653X_TYPE		(0x02 << 12)
> +#define PCA957X_TYPE		(0x03 << 12)
>  #define PCA_TYPE_MASK		GENMASK(15, 12)

Please, use decimal numbers and drop the shifts...

>  #define PCA_CHIP_TYPE(x)	((x) & PCA_TYPE_MASK)

...instead add a shift here.

...

I think you can consider adding default case to each of the new switch-case.

-- 
With Best Regards,
Andy Shevchenko


