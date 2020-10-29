Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD3629EBED
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 13:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgJ2Mfc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 08:35:32 -0400
Received: from mga11.intel.com ([192.55.52.93]:5569 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgJ2Mfb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 08:35:31 -0400
IronPort-SDR: eS5c+Spd3fTS00aiJR6de3VUmAOtTKYb4jCHI7/4XKvGrtseZ+JRfS5QVrL9iC9+8gFq+4cYd9
 IEp/7Jw6x9dQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="164924458"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="164924458"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 05:35:31 -0700
IronPort-SDR: 0M88/V8Q0Ke+tW5R85UFsDtteiZxQoqKyEHf9vC6l6w6p4BomIvtLhWLZfFCEy5WNgon5jVlGv
 9a5vIDEWSD5g==
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="351428496"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 05:35:29 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 29 Oct 2020 14:33:15 +0200
Date:   Thu, 29 Oct 2020 14:33:15 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: intel: Add Intel Alder Lake-S pin controller
 support
Message-ID: <20201029123315.GV2495@lahna.fi.intel.com>
References: <20201029111315.66602-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029111315.66602-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 29, 2020 at 01:13:15PM +0200, Andy Shevchenko wrote:
> This driver adds pinctrl/GPIO support for Intel Alder Lake-S SoC. The
> GPIO controller is based on the next generation GPIO hardware but still
> compatible with the one supported by the Intel core pinctrl/GPIO driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
