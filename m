Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 973F963E289
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 22:10:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiK3VKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 16:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiK3VKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 16:10:40 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF96D865BF
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 13:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669842639; x=1701378639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CLBtieqEVAi3J1qGlO8SfCim445BkaNqDuMzj0byJLM=;
  b=mZwGq98hVhn3lgdeRqquwDdopNQ3n8fo75eGCuyZSFy/76+J99i1O0zj
   LaxuB4eqfwcl8i9r4ZFCBijvdNRCweitAmp2+I+zS7eZoimSCp9XKM2jr
   1ZW0IIKwxcjXji4JQ3M9yC1JaOIbFMdJSvdfvuLuRSYEVRPa3zYMNzwF9
   Ehe78cPk/Ae3W7kb92wnkwIwp+RIb3y3fWC/wMSm+CCxSsNQpnqxufvc0
   t5t5nZRWxN3TtuiXpk5UEgXKLTPGtTE4XfiWXDYpi/j/hXV5RXP9RAylP
   CwgsOVS5OzqCoJEKu/eUe0bx/1utGwS8Q/PRB7dBFIExM4vhOM8edZGd+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="298883527"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="298883527"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 13:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="889446032"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="889446032"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2022 13:10:33 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0ULf-002TvU-2C;
        Wed, 30 Nov 2022 23:10:31 +0200
Date:   Wed, 30 Nov 2022 23:10:31 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Message-ID: <Y4fGx3yWnbejOsVy@smile.fi.intel.com>
References: <20221130164027.682898-1-niyas.sait@linaro.org>
 <20221130164027.682898-2-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130164027.682898-2-niyas.sait@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 04:40:26PM +0000, Niyas Sait wrote:
> Add support for following ACPI pin resources
> 
> - PinFunction
> - PinConfig
> 
> Pinctrl-acpi parses the ACPI table and generates list of pin
> descriptors that can be used by pin controller to set and config pin.

...

>  	struct list_head dt_maps;
> +	struct list_head acpi_maps;

Why these can't be unified?

From the pin control point of view the data it needs should be ~equal
independently on the resource provider (ACPI, DT, etc.).

-- 
With Best Regards,
Andy Shevchenko


