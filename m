Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BEF2B0117
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 09:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgKLIRU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 03:17:20 -0500
Received: from mga11.intel.com ([192.55.52.93]:48794 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgKLIRU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 03:17:20 -0500
IronPort-SDR: XwyIfFODV+1KsoN8bFqoNxg0zVvguxTJuGnUPkKe2y8IrZNfZT4daQ3oAk1YpgZascr42yjBlt
 CO38jB3v0TBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="166768466"
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="166768466"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:17:20 -0800
IronPort-SDR: vsqQBPw3/hTKQzF34TheA376EwHD4R4zOzuqOyif+mSzZgxn/ZwwhyVnvu0GulsKvGXoyOHYRA
 61WaucpSf1mw==
X-IronPort-AV: E=Sophos;i="5.77,471,1596524400"; 
   d="scan'208";a="474190162"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 00:17:17 -0800
Received: by lahna (sSMTP sendmail emulation); Thu, 12 Nov 2020 10:17:15 +0200
Date:   Thu, 12 Nov 2020 10:17:15 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7 11/18] gpiolib: acpi: Move non-critical code outside
 of critical section
Message-ID: <20201112081715.GW2495@lahna.fi.intel.com>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <20201111222008.39993-12-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111222008.39993-12-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:20:01AM +0200, Andy Shevchenko wrote:
> Mika noticed that some code is run under mutex when it doesn't require
> the lock, like an error code assignment.
> 
> Move non-critical code outside of critical section.
> 
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
