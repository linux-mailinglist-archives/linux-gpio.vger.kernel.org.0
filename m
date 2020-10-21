Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5381D294AD7
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Oct 2020 11:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441581AbgJUJy4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Oct 2020 05:54:56 -0400
Received: from mga03.intel.com ([134.134.136.65]:52433 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409251AbgJUJy4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 05:54:56 -0400
IronPort-SDR: bWQ8abkerDYiz2NrQsjGeEr4WZEHqRT8FsUfNdU66L1OtgLYTw3C+9cEahlUMnQLArkUrmjLGy
 /FmYxXU0S7RQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="167432345"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="167432345"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:54:56 -0700
IronPort-SDR: XMv0i1B5yKo5uK0FfYp+Gpur6np5yM6jzWTF9G6S1srPQARtdNSIPecoW7dsoqF4yDM0EAO8Ku
 Ahd5EIECrqLw==
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="466241627"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:54:50 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 21 Oct 2020 12:54:46 +0300
Date:   Wed, 21 Oct 2020 12:54:46 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jamie McClymont <jamie@kwiius.com>
Subject: Re: [PATCH v1 2/2] pinctrl: intel: Set default bias in case no
 particular value given
Message-ID: <20201021095446.GU2495@lahna.fi.intel.com>
References: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
 <20201014104638.84043-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014104638.84043-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 01:46:38PM +0300, Andy Shevchenko wrote:
> When GPIO library asks pin control to set the bias, it doesn't pass
> any value of it and argument is considered boolean (and this is true
> for ACPI GpioIo() / GpioInt() resources, by the way). Thus, individual
> drivers must behave well, when they got the resistance value of 1 Ohm,
> i.e. transforming it to sane default.
> 
> In case of Intel pin control hardware the 5 kOhm sounds plausible
> because on one hand it's a minimum of resistors present in all
> hardware generations and at the same time it's high enough to minimize
> leakage current (will be only 200 uA with the above choice).
> 
> Fixes: e57725eabf87 ("pinctrl: intel: Add support for hardware debouncer")
> Reported-by: Jamie McClymont <jamie@kwiius.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
