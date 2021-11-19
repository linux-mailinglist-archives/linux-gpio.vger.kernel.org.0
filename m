Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9532B456BC5
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 09:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhKSInj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 03:43:39 -0500
Received: from mga12.intel.com ([192.55.52.136]:34025 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230169AbhKSInj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Nov 2021 03:43:39 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="214411611"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; 
   d="scan'208";a="214411611"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 00:40:38 -0800
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; 
   d="scan'208";a="673134895"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 00:40:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1mnzRe-008Tcn-M6;
        Fri, 19 Nov 2021 10:40:30 +0200
Date:   Fri, 19 Nov 2021 10:40:30 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linux pin control <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.17-1
Message-ID: <YZdi/lLVoDhoayth@smile.fi.intel.com>
References: <YZaUHy//vkja2la6@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZaUHy//vkja2la6@black.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 18, 2021 at 07:57:51PM +0200, Andy Shevchenko wrote:
> Hi Linux pin control  maintainers,
> 
> The kasprintf_strarray() series as PR for both Pin Control and GPIO subsystems.
> All tags have been applied.

Scratch it, kbuild bot found one typo, which makes code in zynqmp erroneous.
I'll update and send a new PR

-- 
With Best Regards,
Andy Shevchenko


