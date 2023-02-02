Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F28C688148
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 16:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjBBPJB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 10:09:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232408AbjBBPIr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 10:08:47 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E82A93E3C
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 07:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675350504; x=1706886504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oNLoDCrNz5E3tpcWjxQu6H5DXL42C8IWrVoNuwWD2eI=;
  b=J1mO2SHR+hEbzcxD8mhLD3gkBA4yoKtATcfQHhbzlzGqrGSzMmqDMUMd
   3INIReycQxAbZFERPobujjgzxBSJ/riLXJBm7bZPyUng3DxCmDYCCdakM
   Vo4d11Zz1KuEhji71r5+0lEdxTtpaVw6rq8ikJkX8Cz9ADUjps8Fy4djG
   HXWPZOCsdEjpfDB+Qw4OH34JO49asVbcEA5n1x4SaS1LEE+HFPTINK29E
   K5nzfdi7SEuSTuT8Z4ppOOiLZ1u0x5SfW7xNbnxAg736Zg2KmB8zz5MUz
   X917VKTlhvmojbaHTpg1KddVoakyjxipql+Q6QEfr6NUcHRRJZ/ey0cmo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308805454"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="308805454"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 07:06:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="789310975"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="789310975"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 02 Feb 2023 07:06:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pNbAl-001E3s-2C;
        Thu, 02 Feb 2023 17:06:47 +0200
Date:   Thu, 2 Feb 2023 17:06:47 +0200
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
Subject: Re: [RFC PATCH 3/3] gpio: pca953x: Redesign register address
 calculation
Message-ID: <Y9vRhwqFUL0878qO@smile.fi.intel.com>
References: <fbd33cdb-6942-e1ac-57ad-b7f3faf7eba5@eilabs.com>
 <5a4ce37a-2d5b-d179-dd1b-04fdd038c63f@eilabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a4ce37a-2d5b-d179-dd1b-04fdd038c63f@eilabs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 09:59:55PM +0100, Levente Révész wrote:
> The driver supports 8 chip types, 6 of which have extended registers
> with various functions, e.g. pull-up and pull-down bias for the gpio
> lines or interrupt masking. To allow supporting these functions, the
> driver has to be able to calculate the addresses of these registers.
> 
> Replace the address calculation scheme with new reg_addr() and check_reg()
> functions, one for each register layout. The new functions can work with
> all of the extended registers. The functions have been tested with the
> register layout of each compatible chip.

...

> +/*
> + * Register types:
> + *   - Single register: 1 byte for each GPIO port.
> + *   - Double register: 2 bytes for each GPIO port.
> + *   - One-byte register: Only a single byte.

We use term "bank".

> + */

...

> + * Returns -1 if reg_addr is invalid.

Use proper error code.

...

> + * Convert register address to register enum value.
> + * Returns -1 if reg_addr is invalid.

Ditto.

-- 
With Best Regards,
Andy Shevchenko


