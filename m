Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFCFC62B78F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 11:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbiKPKSF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 05:18:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbiKPKSB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 05:18:01 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B762192B2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668593881; x=1700129881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GT4RTnq62K/D1kfAwggNNz3uPbxAWLGaAR9iMAkpuk8=;
  b=KZXXTu9hnHa5d91AKXX5yecf+ClWe8ykj7gi7YutTizaKFedgit27LqQ
   oLpOjCOIigbUnip/Q4C3jc2tZfLSnYvEMnYqWotAXS2sl21GhmZWimzer
   ZaqrRKuHbOi0K4WXsNx7HyW6uf+aHl4S/L8A1v2VaLxhHdqw56Pz+6ZEa
   AIfi4QrDjxqZubGKhWL3klHeCZskckq9cp7cn/x4T9hfYVCmZjtuF8NoY
   G5qv/bHw15ZppBOfI9hkitRsOrJeGNv20N0QG8ulTfI3RJ9PDsDJm9IcF
   No9aYmDp+fH8/8mNR2GK2V7A1y2gXGboG9+Pt62xBChhbL8QzNu5p705O
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="300037354"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="300037354"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 02:18:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="641584538"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="641584538"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 16 Nov 2022 02:17:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovFUT-00D5A1-1h;
        Wed, 16 Nov 2022 12:17:57 +0200
Date:   Wed, 16 Nov 2022 12:17:57 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Message-ID: <Y3S41U1xmjzi21bz@smile.fi.intel.com>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115175415.650690-1-niyas.sait@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_SBL_A
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 15, 2022 at 05:54:12PM +0000, Niyas Sait wrote:
> This is a proposal for adding ACPI support to pin controller.
> 
> The patch supports following resources introduced in ACPI from v6.2
> 
> - PinFunction
> - PinConfig
> - PinGroupFunction
> - PinGroupConfig
> - PinGroup
> 
> The patch has been tested on NXP I.MX8MP Plus platform with ACPI.

I have just published some old stuff I have [1] for targeting same feature.
Maybe you can find something interesting there.

What I have noticed that your series misses documentation part and it's
hard to see the design behind it.

[1]: https://bitbucket.org/andy-shev/linux/commits/branch/topic%2Feds-acpi-pinctrl

-- 
With Best Regards,
Andy Shevchenko


