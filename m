Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E63548AC7A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 12:32:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349484AbiAKLc3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 06:32:29 -0500
Received: from mga05.intel.com ([192.55.52.43]:64683 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349477AbiAKLc3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Jan 2022 06:32:29 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="329807738"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="329807738"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 03:32:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="558334209"
Received: from smile.fi.intel.com ([10.237.72.61])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 03:32:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andy.shevchenko@gmail.com>)
        id 1n7FMv-009ClB-Ea;
        Tue, 11 Jan 2022 13:31:13 +0200
Date:   Tue, 11 Jan 2022 13:31:13 +0200
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: tps68470: Allow building as module
Message-ID: <Yd1qgTKIFa7pTEwg@smile.fi.intel.com>
References: <20220111105632.219581-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111105632.219581-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 11:56:32AM +0100, Hans de Goede wrote:
> The gpio-tps68470 driver binds to a tps68470-gpio platform-device which
> itself gets instantiated by a special MFD driver from
> drivers/platform/x86/intel/int3472/tps68470.c
> 
> This MFD driver itself can be built as a module, so it makes no sense to
> force the gpio-tps68470 driver to always be built-in.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

> Changes in v2:
> - Fix some spelling errors in the commit msg
> - Remove blank line between tps68470_gpio_driver decleration and
>   module_platform_driver(tps68470_gpio_driver)

It used to be 2 patches in the series, are you going to send another one
separately?

-- 
With Best Regards,
Andy Shevchenko


