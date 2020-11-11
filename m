Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065692AF4BF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 16:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgKKPch (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 10:32:37 -0500
Received: from mga06.intel.com ([134.134.136.31]:9353 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726136AbgKKPch (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Nov 2020 10:32:37 -0500
IronPort-SDR: Cf9sVsXqQhK4VNtV+5TjErOKk3IuEEft41aAlUZqKHqVimXmoNyolu8U+dEYa3k8EW7e7EnCZR
 e9PKhBAFffmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="231785114"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="231785114"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:32:36 -0800
IronPort-SDR: jidYSlJ7/r93wCVLin/1mLsBo4fRdZlYjXt2IJR5uCGS6MwOhTQvPsT7LHFFzvnjYfFZz1Khr8
 BQ7Ne+u49BeA==
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="473889899"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 07:32:34 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 11 Nov 2020 17:32:31 +0200
Date:   Wed, 11 Nov 2020 17:32:31 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 04/17] gpiolib: Add temporary variable to
 gpiod_set_transitory() for cleaner code
Message-ID: <20201111153231.GA2495@lahna.fi.intel.com>
References: <20201109205332.19592-1-andriy.shevchenko@linux.intel.com>
 <20201109205332.19592-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109205332.19592-5-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 09, 2020 at 10:53:19PM +0200, Andy Shevchenko wrote:
> Temporary variable that keeps mode allows to neat the code a bit.
> It will also help for the future changes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Not really sure if this is good change or not. Instead of constant you
now introduce a useless variable just to get them to the same line.

To me this looks better and reads easier:

	packed = pinconf_to_config_packed(PIN_CONFIG_PERSIST_STATE, !transitory);

But not insisting so if GPIO maintainers are fine then no objections :)
