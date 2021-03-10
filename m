Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CC6333C48
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 13:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbhCJMKK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 07:10:10 -0500
Received: from mga11.intel.com ([192.55.52.93]:34965 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232758AbhCJMJz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 07:09:55 -0500
IronPort-SDR: 2CEV/w878rDxhUzRWpJGKOzmVf/F0oeXSD4a6zSmY7V8AlxfvQcceYJ+ur0W5BSOhztXkHQ/j+
 4UGIcW6S9mjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="185096046"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="185096046"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 04:09:55 -0800
IronPort-SDR: LO774NGduKoLLyq6YR0XAm1dDQySwDGAzMkWAOyMEGPE3XBT3StFoVBdHJm2Rl4y22AWFVqHjJ
 Hr8Vtx4Cp1rA==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="509644591"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 04:09:53 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lJxex-00BJkG-BE; Wed, 10 Mar 2021 14:09:51 +0200
Date:   Wed, 10 Mar 2021 14:09:51 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <YEi3D2fCBh/azOnb@smile.fi.intel.com>
References: <20210310111210.1232-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210310111210.1232-1-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 07:12:10PM +0800, Shawn Guo wrote:
> It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
> problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
> resource to cover 3 tiles defined by SC8180X.  To follow the hardware
> layout of 3 tiles which is already supported DT probe, it adds one
> function to replace the original single memory resource with 3 named
> ones for tiles.  With that, We can map memory for ACPI in the same way
> as DT.

You are reinventing a wheel, i.e. MFD framework. Can you simple utilize
devm_mfd_add_devices()?

Basically you may write an new pure MFD driver (drivers/mfd) that will
instantiate properly the pin control driver.

-- 
With Best Regards,
Andy Shevchenko


