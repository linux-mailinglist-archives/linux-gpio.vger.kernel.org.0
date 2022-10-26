Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6775360E68D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 19:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbiJZRcl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 13:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbiJZRck (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 13:32:40 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CA6103DBD
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 10:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666805559; x=1698341559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/if8DQ5EflrQr8sz6S1J4sRbItNVfPHM8ngYZIIISek=;
  b=Yqjb8FCDshnpxWvf9sCgMjuWDpbUyOgG4ZsTK/2dN+8WawVNsteHaIvC
   dKM3b5fHbC6irhMY/clr1r2Db242/0soqrGRhrJBksbvHD3yf+XVT3EJe
   v0KY6q0oOEy7HGwxofM3dxBYu0EmUDNk8//+oqan9rTMCFDcLIWG7RaFp
   cA0NyIJ38iSxPyAYM170EEJagy19doblhkS7UZ2+fYrhy7kkaYpfcwlNW
   0ixDHJ0Vwc5EYKrvZWnNu5cREv1eUE+DBkKh1zCfI5xi2QdlAg0dr5866
   82oNSkzsU+pJ9GvT/MvkzeWdDHiCoG59LdwbIK+YpkKBzFjumoHymbRDm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="308008194"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="308008194"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 10:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="877274486"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="877274486"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2022 10:32:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1onkGY-002lzP-2y;
        Wed, 26 Oct 2022 20:32:34 +0300
Date:   Wed, 26 Oct 2022 20:32:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Levente =?iso-8859-1?B?Uul26XN6?= <levente.revesz@eilabs.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Martyn Welch <martyn.welch@collabora.com>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 5/6] gpio: pca953x: Add interrupt mask support for
 chips with the standard register set
Message-ID: <Y1lvMuQGcurQr5qD@smile.fi.intel.com>
References: <cc987520-d95b-01b9-5b65-53442ce122f6@eilabs.com>
 <9df1a016-36be-14b7-9674-d18c7df208c7@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9df1a016-36be-14b7-9674-d18c7df208c7@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 26, 2022 at 01:25:23PM +0200, Levente Révész wrote:
> Some chips in the pca953x family in addition to the standard 4
> registers have a fifth interrupt mask register:
> 
>     0: INPUT
>     1: OUTPUT
>     2: POLARITY
>     3: CONFIGURATION
>     4: INTERRUPT MASK
> 
> Chips with this register:
> 
>     - pca9505
>     - pca9506
>     - pca9698
> 
> This register defaults to all interrupts disabled. The driver has to set
> the register to use interrupts with these chips.
> 
> Add PCA953X_INT_MASK register. Use it as the interrupt register of
> (non-pcal) pca953x chips.
> 
> Set pca9505 and pca9506 to use this register.

Please, compile each patch in the series separately (incremental building).

-- 
With Best Regards,
Andy Shevchenko


