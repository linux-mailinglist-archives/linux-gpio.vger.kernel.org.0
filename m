Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064C8681CCB
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 22:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbjA3Vcp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 16:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjA3Vco (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 16:32:44 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E7A7A81
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 13:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675114363; x=1706650363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zZmuqiJQQELHUyrYRukTOT+iBS4QcygtyX0R1bl4hUQ=;
  b=LwCyFzRSoRQ5A+SUPUMTCm5rgzvTF8XoXEjc/NShIszGLofgf7s26d/3
   d6csE/axMqGO89qgMq+1c/R6epk7EKCirkVm4IiGBtFPhlTs8VI3HQuga
   edAeUpcbMWvVAW3hWHTChKPVnHM5kW5+UtHed/CndtRro8ICrVN5ztMRo
   gaWwGLQb/1g0gxYBOVbUdPfjaixG1c+8/CflYXfmI9r+CMLVTW/HzjRMJ
   jImA4ekTxtoTJP2fDPXIWrvr1Ub4fxeX2RdbXCmvDsvwL4gvcL6O1GUV/
   N9nDP8UrDMPPlR39paELN7Y0FjV3HHinwvGNdsH+gdNuFdduPJ2U51HT6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="308024261"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="308024261"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 13:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="727658869"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="727658869"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2023 13:32:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pMblW-00HYrO-1P;
        Mon, 30 Jan 2023 23:32:38 +0200
Date:   Mon, 30 Jan 2023 23:32:38 +0200
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
Message-ID: <Y9g3djq8xUQ7VjXK@smile.fi.intel.com>
References: <7b736829-414a-ba4f-59f5-bc78c27621e5@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b736829-414a-ba4f-59f5-bc78c27621e5@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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

Thank you for the update, I'll look into the series later on.
Just to tell you that your cover letter is from something else according to the
email chain (the 1/3 isn't linked to 0/3).

-- 
With Best Regards,
Andy Shevchenko


