Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E67F310EA7A
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 14:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727478AbfLBNF4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 08:05:56 -0500
Received: from mga02.intel.com ([134.134.136.20]:9739 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727454AbfLBNF4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 2 Dec 2019 08:05:56 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Dec 2019 05:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; 
   d="scan'208";a="235468621"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2019 05:05:54 -0800
Received: from andy by smile with local (Exim 4.93-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iblOj-0002CD-Ug; Mon, 02 Dec 2019 15:05:53 +0200
Date:   Mon, 2 Dec 2019 15:05:53 +0200
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     "Stanimir, Vasile-Laurentiu" 
        <Vasile-Laurentiu.Stanimir@windriver.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources
 based on pullup and polarity
Message-ID: <20191202130553.GG32742@smile.fi.intel.com>
References: <D4218E93E3D74741B4028993B2A8DBE0534BF84B@ALA-MBD.corp.ad.wrs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D4218E93E3D74741B4028993B2A8DBE0534BF84B@ALA-MBD.corp.ad.wrs.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 02, 2019 at 12:36:47PM +0000, Stanimir, Vasile-Laurentiu wrote:
> From f8093f2c73c636b75fcf4dee4178af0e24c2f878 Mon Sep 17 00:00:00 2001
> From: Vasile-Laurentiu Stanimir <vasile-laurentiu.stanimir@windriver.com>
> Date: Mon, 2 Dec 2019 14:20:11 +0200
> Subject: [PATCH] gpiolib-acpi: Set gpiod flags for ACPI GPIO resources based
>  on pullup and polarity
> 
> ACPI GPIO resources don't contain an initial value for the
> GPIO. Therefore instead of deducting its value based on pullup field
> we should deduce that value from the polarity and the pull field.
> Typical scenario is when ACPI is defined in acpi-table and its polarity
> is defined as ACTIVE-LOW in the following call:
> 
> acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
>   acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
> 
> it will return GPIOD_OUT_HIGH if pull_up is set no matter if
> polarity is GPIO_ACTIVE_LOW, so it will return the current level instead
> of the logical level.

Thank you for the patch.

I have question in general. If we have Active Low polarity and Pull Down,
isn't it simple a bad ACPI table and rather quirk is needed here?

-- 
With Best Regards,
Andy Shevchenko


