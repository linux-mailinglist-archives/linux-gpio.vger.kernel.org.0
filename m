Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCA82AF4C1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgKKPdV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:33:21 -0500
Received: from mga18.intel.com ([134.134.136.126]:57323 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbgKKPdU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:33:20 -0500
IronPort-SDR: WR6qAeC9NZmLo8Vw5S3o21XS63I4pvUhfpJYQnaZfYyDF+TfwfoZty2P/u83M1496ulTt7Q89g
 psfHMXHJQf1A==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="157941365"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="157941365"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:33:20 -0800
IronPort-SDR: I2kJ+FTqMij3l65eMmmYO8ukhYH3x6FMk0mCo8OiYhFNE7r4rQRYeCN3Rzf37liCdZm568Ya21
 cJhmHBFAxD1Q==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="541844843"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:33:18 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:33:15 +0200
Date:   Wed, 11 Nov 2020 17:33:15 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 05/17] gpiolib: Extract
 gpio_set_config_with_argument() for future use
Message-ID: <20201111153315.GB2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-6-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:20PM +0200, Andy Shevchenko wrote:
> In the future we will need to have a separate function
> that takes an arbitrary argument value.
> 
> Extract gpio_set_config_with_argument() for that purpose.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
