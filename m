Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9475E2AF904
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 20:26:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgKKT0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 14:26:39 -0500
Received: from mga07.intel.com ([134.134.136.100]:22165 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726101AbgKKT0j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 14:26:39 -0500
IronPort-SDR: uhgZhFVrG/hAyJmdAqcZSfeGgWZ/4gQdnZPsm1oivOpHp9YCSD5cFPgFsVHIT2sjewfKbWLOY7
 RVn2/+HZA4sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="234367976"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="234367976"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 11:26:38 -0800
IronPort-SDR: ifABkoncaTSibR7Rzslf3aS8JlgMVPQUuzlVv5tX/aQH7N/buZv0VPC9xVRNS17sF05Zzrk/hd
 aHZQTwUncnCw==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; 
   d="scan'208";a="531840085"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 11:26:37 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kcvmN-005zHl-AF; Wed, 11 Nov 2020 21:27:39 +0200
Date:   Wed, 11 Nov 2020 21:27:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 17/17] gpiolib: acpi: Make Intel GPIO tree official
 for GPIO ACPI work
Message-ID: <20201111192739.GS4077@smile.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-18-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-18-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:32PM +0200, Andy Shevchenko wrote:
> Make Intel GPIO tree official for GPIO ACPI work.

Mika, do you think it's a good idea?

-- 
With Best Regards,
Andy Shevchenko


