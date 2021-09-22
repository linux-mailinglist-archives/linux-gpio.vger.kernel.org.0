Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0527B41423B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 09:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232940AbhIVHBg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 03:01:36 -0400
Received: from mga07.intel.com ([134.134.136.100]:24662 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232927AbhIVHBf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 03:01:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="287200983"
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="287200983"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 00:00:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,313,1624345200"; 
   d="scan'208";a="454643738"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2021 00:00:01 -0700
Received: from andy by smile with local (Exim 4.95-RC2)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1mSwEY-0048vq-J9;
        Wed, 22 Sep 2021 09:59:58 +0300
Date:   Wed, 22 Sep 2021 09:59:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, nd@arm.com
Subject: Re: [PATCH v1 0/1] pinctrl/GPIO driver for Apple SoCs
Message-ID: <YUrUblZ+ChU+mBA5@smile.fi.intel.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921222956.40719-1-joey.gouly@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 21, 2021 at 11:29:55PM +0100, Joey Gouly wrote:
> Hi all,
> 
> This is a driver for the combined pinctrl / GPIO hw in the Apple M1 computers.
> The driver is based on Corellium's driver [1], and has been rebased and cleaned up.
> The bindings are in Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml

Have you checked if there is any (qualcomm / samsung / ?) existing driver is
close enough to this hardware?

> This has been tested with out-of-tree patches for the keyboard on the Macbook
> Air, it has also been tested with i2c for the USB PD driver and PCIe (all
> out-of-tree drivers currently).
> 
> I left two defines at the top 'USE_PINMUX_GENERIC_FN' and
> 'USE_PINCTRL_GENERIC_FN', I wasn't sure if I should use the generic functions for
> getting the groups/functions, so I left both approaches in and will remove one
> of them for the next version! Which approach should I use?

Try to get rid of defines.

> There is a branch here with the driver:
>   https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v1
> 
> There is also a branch which contains all the commits as I was
> developing here (and keyboard drivers):
>   https://gitlab.arm.com/linux-arm/jg-open/-/commits/m1-keyboard
> 
> I look forward to feedback!
> 
> Thanks,
> Joey
> 
> note: I'm sending this from my arm work e-mail address, however it was done on
> personal time.

It doesn't matter to the community. Check this with your employer.

> note2: For those that have been testing this with PCIe etc, you will probably
> want to also include the last commit in the following branch, as I dropped the
> clock references in the code (due to the switch to power domains):
> https://gitlab.arm.com/linux-arm/jg-open/-/commits/pinctrl_apple_v1_clock
> 
> [1]
> https://github.com/corellium/linux-m1/blob/d5ec2a737e64de23a21025f9eddc554588deb23f/drivers/pinctrl/pinctrl-apple-gpio.c

-- 
With Best Regards,
Andy Shevchenko


