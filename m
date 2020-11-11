Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF6C2AF58B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgKKPzh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:55:37 -0500
Received: from mga01.intel.com ([192.55.52.88]:40880 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726830AbgKKPzh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:55:37 -0500
IronPort-SDR: CnxfcHUpfVN3DMRVBbqejMHDD/CqqXQWTDDXl1tv0emc7e+wMWka3lP/gttJJK4NT2DDT6Z0Gk
 GTikbdpERgtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="188147732"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="188147732"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:55:34 -0800
IronPort-SDR: s9zx4X9/+78f70/SIyUkgX4CAxyG/EYERguQIW3LZsMw68LH8whMtroXbzF8VZB3gu4jjiepb/
 PvOCLc4SQUNA==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="541851711"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:55:32 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:55:29 +0200
Date:   Wed, 11 Nov 2020 17:55:29 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 15/17] gpiolib: acpi: Convert pin_index to be u16
Message-ID: <20201111155529.GK2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-16-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-16-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:30PM +0200, Andy Shevchenko wrote:
> As defined by ACPI the pin index is 16-bit unsigned integer.
> Define the variable, which holds it, accordingly.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
