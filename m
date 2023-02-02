Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4C368815C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 16:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjBBPM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 10:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbjBBPMz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 10:12:55 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE2C945E2
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 07:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350750; x=1706886750;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xL1WadO6AMRE/2r8QdLAOaCgfP5qANdJj0tnFfUY3ng=;
  b=YkO4PnPUWJSxU8iUNLbxJDsFG6bGW3eS2BA0/DbcEsK4DlJXe2M7DkyB
   73S9v+hfYSI1V7baY5x3hTmS3ZRns3ZYDRvsN6CEfeKcZc+fvWoza2b+d
   uu/IZIM9C/cs7CtaGys7rSffbSuDMdlj3YvNIPGcEGM7Mkz+DbW3+xemA
   g8v/JE2bC5uECms7JZDOLg0L57v5hNoeVEPHiZnF17X6yMWB8jrp52ugC
   xz5qNn7TVSxRY3P/9XN+9Pz+E4UMSoY3k2nCQ1cLj5ZjXGPsA222u7VLd
   ouN2gu7CO6E1XBCLoU5zfAiIeSVrCQH9crWgd97m38Eft0jUY5AmWiqH+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308117892"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="308117892"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:12:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807990480"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="807990480"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 07:12:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pNbGA-001EAP-0m;
        Thu, 02 Feb 2023 17:12:22 +0200
Date:   Thu, 2 Feb 2023 17:12:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [RFC PATCH 0/3] gpio: pca953x: Redesign handling of chip types
Message-ID: <Y9vS1dsuMm5XxkdD@smile.fi.intel.com>
References: <7b736829-414a-ba4f-59f5-bc78c27621e5@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b736829-414a-ba4f-59f5-bc78c27621e5@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 09:59:30PM +0100, Levente Révész wrote:
> Hi All,
> 
> The pca953x driver supports many chips. These all have the basic 4
> registers: input, output, invert and direction. Most of them have
> additional registers for various functions, like pull-up and
> pull-down control, interrupt status and mask, hardware debounce.
> 
> Different chip types have various register layouts. These layouts differ
> even in the basic 4 registers.
> 
> This patch series
> 
>     1. Cleans up chip type handling, and
>     2. Replaces register address calculations. The proposed scheme
>        works with every register of every chip type.
> 
> These changes make it possible to add support for extended functions for
> more chip types, including:
> 
>     * Interrupt mask for PCA950X, PCA9698, PCA957X and XRA120X
>     * Interrupt status for PCA957X and XRA120X
>     * Bias for PCA957X and XRA120X
>     * Debounce for PCAL65XX and XRA120X
> 
> References:
> 1. Previous discussion about the chip types
>    https://lore.kernel.org/linux-gpio/Y1q52efyv93%2Fz8BC@smile.fi.intel.com/
> 2. An overview of pca953x chip types
>    https://lore.kernel.org/linux-gpio/67bba210-09ac-32fb-bb97-8bfc40c2c200@eilabs.com/

Now as I'm thinking more of your nice job, it may be less effort to everybody
if you start from moving the driver to be a real pin control driver united with
GPIO handling.

That said, start drivers/pinctrl/pinctrl-pca953x.c from scratch with all your
ideas in it. To make it better for review and testing, split by series in which
you add the main chip family, i.e. PCA953x one (without interrupt?) and then
adding each type one-by-one.

Also prepare some documentation file in Documentation/...gpio.../pca953x or
start a brand new pinctrl folder (we do not have it yet) where you describe
all your research.

Note, this will be quite useful to enable PWM support later on for some chips.

-- 
With Best Regards,
Andy Shevchenko


