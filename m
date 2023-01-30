Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83D3C681D8C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 22:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbjA3V5U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 16:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjA3V5S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 16:57:18 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A70D4A1C0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 13:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675115837; x=1706651837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2wIQHDCo0AQlAWBNPMahM//iQSj5yDLuakFS/uDkmcU=;
  b=FtwatL8jtjEAek7X3XK0D+bN8DpjCkjvhkhBBoq9o693naVRz5PAo5Kk
   Xsie/zh4x7lZzPey0M38EZKOmnLAF7YWBciVqUSaJZLNz9/FDykan3m90
   sj0xoIprGC5EVwX7W7A4dJVOIccDuCwFLMBul+kMm8oXntXXdb+vIHjU7
   DghwfPxPZtTSJOaPIAbqRmOcHbWEaAeXZ31aoDcO2gasziiCRzx0i9FsH
   HKxKWoqb/5YMStefHEVBVVHJdBFs6P+huyRYwQmfNnFjPJU6tBP/H8iDM
   kas/2V3tqoT09GhFr3pfpmE7faTRjjZEfSzth4nnkWdpfeTYyVXI4gC5R
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="328958768"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="328958768"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 13:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="657617517"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="657617517"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 30 Jan 2023 13:57:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pMc9H-00HZMv-0U;
        Mon, 30 Jan 2023 23:57:11 +0200
Date:   Mon, 30 Jan 2023 23:57:10 +0200
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
Subject: Re: [RFC PATCH 1/3] gpio: pca953x: Replace chip type flags with a
 type enum
Message-ID: <Y9g9NhELIEPXbG4O@smile.fi.intel.com>
References: <fbd33cdb-6942-e1ac-57ad-b7f3faf7eba5@eilabs.com>
 <77a8e6b4-15d4-da2a-4697-5181994920d4@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77a8e6b4-15d4-da2a-4697-5181994920d4@eilabs.com>
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

On Mon, Jan 30, 2023 at 09:59:42PM +0100, Levente Révész wrote:
> The driver supports 8 chip types. The chip type is encoded in
> driver_data so that different chip types can be handled appropriately.
> 
> Encoding the type information in separate bit flags was not too
> straightforward, and it didn't make it possible to encode 8 chip
> types.
> 
> Replace bit flags with a pca953x_chip_type enum. Encode this enum in
> driver_data as a number. Add missing chip types based on chip functions
> and register layout.

...

> +/*
> + * driver_data
> + *
> + *   31    24 23    16 15     8 7      0
> + *   xxxxxxxx xxxxxxxx xxxx____ ________
> + *                         ^^^^ ^^^^^^^^
> + *                         |    number of gpio lines
> + *                         chip type
> + */

Not sure we need this as it's self explanatory from the below masks.
Moreover, driver_data is 64-bit or 32-bit depending on the build.

> +#define PCA_GPIO_MASK		GENMASK(7, 0)
> +#define PCA_TYPE_MASK		GENMASK(11, 8)

...

> +enum pca953x_chip_type {

> +	TYPE_PCA953X_NOINT,
> +	TYPE_PCA953X,

Hmm... Since you change this anyway, I think I would distinguish them better.
Perhaps

	TYPE_PCA953X_INT,
	TYPE_PCA953X_NOINT,

?

In any case, please add a kernel doc to this enum to explain each type briefly.

> +	TYPE_PCA950X,

Can we make sorted? (I.e. move this before PCA953X)

> +	TYPE_PCAL953X,
> +	TYPE_PCAL652X,
> +	TYPE_PCAL653X,
> +	TYPE_PCA957X,

Can we make sorted? (I.e. move this after PCA953X)

> +	TYPE_XRA120X,

	TYPE_MAX

> +};

static_assert((PCA_TYPE_MASK + 1) >= (TYPE_MAX << 8));

-- 
With Best Regards,
Andy Shevchenko


