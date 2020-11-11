Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECB92AF57A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbgKKPvn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:51:43 -0500
Received: from mga03.intel.com ([134.134.136.65]:53426 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727205AbgKKPvm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:51:42 -0500
IronPort-SDR: Fndt4LZzBmox9m2ihMFjJCxV/60toNYKKPY939Y2J0S6fpl34gPPU5xV8VMcRKgJql/sgwmmcA
 pbw4En0ZWXzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="170274720"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="170274720"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:51:41 -0800
IronPort-SDR: ioj6sRkO7GoJfqZLRsXLzu0lxjRZtJoBvyWp/wi+X7Za9qvSPFug7bEjd9iDgQugUIB6ex0/By
 BvIEumfyGCMw==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="473898183"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:51:38 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:51:36 +0200
Date:   Wed, 11 Nov 2020 17:51:35 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 14/17] gpiolib: acpi: Extract acpi_request_own_gpiod()
 helper
Message-ID: <20201111155135.GI2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-15-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-15-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:29PM +0200, Andy Shevchenko wrote:
> It appears that we are using similar code excerpts for ACPI OpRegion
> and event handling. Deduplicate those excerpts by extracting a new
> acpi_request_own_gpiod() helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
