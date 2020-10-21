Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07DEC294AED
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 11:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733119AbgJUJ70 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 05:59:26 -0400
Received: from mga11.intel.com ([192.55.52.93]:50919 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729186AbgJUJ70 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 05:59:26 -0400
IronPort-SDR: f5rNo9cGTvgq3DbLuaI48REehSN0fqOHNHqnm79DPh11h+oS2I6HAQc6duG3mcDi8hxE86Uay9
 Vjc0Wblcs5uQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="163851943"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="163851943"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:59:24 -0700
IronPort-SDR: 8UxGBlFjsVugQtq3lQho+KUNobUT+DsriWBguPMEDgS9kPSXmXoOX0s92QMNSFhvR+kXbYWDIj
 GXNUICMC47Fg==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="466242861"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:59:22 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 21 Oct 2020 12:59:20 +0300
Date:   Wed, 21 Oct 2020 12:59:20 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 2/3] gpiolib: acpi: Use named item for enum
 gpiod_flags variable
Message-ID: <20201021095920.GW2495@lahna.fi.intel.com>
References: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
 <20201014133154.30610-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014133154.30610-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 04:31:53PM +0300, Andy Shevchenko wrote:
> Use named item instead of plain integer for enum gpiod_flags
> to make it clear that even 0 has its own meaning.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
