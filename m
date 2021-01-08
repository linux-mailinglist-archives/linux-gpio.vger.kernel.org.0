Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECD72EEDB7
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jan 2021 08:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbhAHHJq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 02:09:46 -0500
Received: from mga02.intel.com ([134.134.136.20]:18205 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbhAHHJq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 8 Jan 2021 02:09:46 -0500
IronPort-SDR: u0YD0Ot/9sDqpvyKCbmm7WEi2HRmzJib6V/bXNeIAi5jyTFDlXLlh5AKDFu2ms3MTWU9yu5lio
 kJekpUoR6l6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164630435"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164630435"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:08:00 -0800
IronPort-SDR: MMxB3e2xcxXjxUSYLA9alQt9pqHIpaiiixVjHOj3Q79yG66sm8+JyVe/MrSJOTU7Nh+lcTtqwg
 CzLPU5s5/TOA==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="351592058"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:07:58 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 08 Jan 2021 09:07:55 +0200
Date:   Fri, 8 Jan 2021 09:07:55 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/4] pinctrl: intel: Split
 intel_pinctrl_add_padgroups() for better maintenance
Message-ID: <20210108070755.GY968855@lahna.fi.intel.com>
References: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107190200.41221-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 07, 2021 at 09:01:57PM +0200, Andy Shevchenko wrote:
> Currently the intel_pinctrl_add_padgroups() is twisted a bit due to
> a different nature of the pin control hardware implementations. Thus,
> its maintenance is a bit hard. Besides that some pieces of code
> are run on all hardware and make this code slightly inefficient,
> and moreover, validation for one case is done in a wrong time in a flow
> which makes it even slower.
> 
> Split intel_pinctrl_add_padgroups() to two functions, one per hardware
> implementation, for better maintenance and readability.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
