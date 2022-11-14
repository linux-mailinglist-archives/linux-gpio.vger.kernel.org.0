Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFE2627A9D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 11:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235613AbiKNKgQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 05:36:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235126AbiKNKfv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 05:35:51 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821D71D65B;
        Mon, 14 Nov 2022 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668422150; x=1699958150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KQI39jI+VhVq9DkODJATdCRiiFhF16bievVRLfJnrnw=;
  b=E3Kh+FO4PXk2BSmUV59SRJzrFwwXKB3lpNUaXDYg5CEzHNMPyhlzEjar
   ZMshzZfxNhJx6ggzQUoS209ujfwJeS2hN63R/VKd2mkUO3Zr8EIVWyikD
   IHpMgvlZ57OokRWnHBXwejYVoQS4zoz2WZfm7a2Mo4YaWeEl2ckVBb6dE
   XMN4wJws9uxQ7zqeEn54Zf+n1ANYABCiqjtzyX/zGx3h5+a64DXGJ406O
   hbco6oMzlKqvYKcaCz0nOKQjXtVhUUDNGswraPqx03F8ZXrXBENIvcml2
   CrENjSmn/XYEHcZE3VBOfWr+zaajIvnff9cmSIoQUkVfm7/gkzfeF+Zip
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="338722178"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="338722178"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 02:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="589320025"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="589320025"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 14 Nov 2022 02:35:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ouWoY-00C7k0-1J;
        Mon, 14 Nov 2022 12:35:42 +0200
Date:   Mon, 14 Nov 2022 12:35:42 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, devicetree@vger.kernel.org,
        Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 1/7] mfd: Add core Apple Mac SMC driver
Message-ID: <Y3IZ/ppKU/bWc5aU@smile.fi.intel.com>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXJ-002mvq-Bg@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1osRXJ-002mvq-Bg@rmk-PC.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 08, 2022 at 04:33:17PM +0000, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements support for the SMC (System Management
> Controller) in Apple Macs. In contrast to the existing applesmc driver,
> it uses pluggable backends that allow it to support different SMC
> implementations, and uses the MFD subsystem to expose the core SMC
> functionality so that specific features (gpio, hwmon, battery, etc.) can
> be implemented by separate drivers in their respective downstream
> subsystems.

...

> +	ret = mfd_add_devices(dev, -1, apple_smc_devs, ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);

PLATFORM_DEVID_NONE

> +	if (ret)
> +		return ERR_PTR(dev_err_probe(dev, ret, "Subdevice initialization failed"));

...

> +EXPORT_SYMBOL(apple_smc_probe);

Namespace?

-- 
With Best Regards,
Andy Shevchenko


