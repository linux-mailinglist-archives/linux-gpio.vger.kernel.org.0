Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDEF1EF9B2
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 15:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbgFEN40 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 09:56:26 -0400
Received: from mga18.intel.com ([134.134.136.126]:7848 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726970AbgFEN40 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 09:56:26 -0400
IronPort-SDR: FGA6zC9WdP4Ofr25Erql9RmYrCDzKW31K8QjWbF56Lh8BrmiVX1hgqoK3yX55ZfTYh+lmR0vBz
 zP5ChUFl8BVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 06:56:25 -0700
IronPort-SDR: DMXLzsz9PH/f3gbhJPvTVi2gEXX99KEqdogXdxxudypftoCXZpjbhvlwXKHb09yK2B2po/YORT
 ds+RlGAYP+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; 
   d="scan'208";a="305068830"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2020 06:56:24 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jhCpf-00B2Zi-0d; Fri, 05 Jun 2020 16:56:27 +0300
Date:   Fri, 5 Jun 2020 16:56:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 2/2] gpio: pca953x: Override IRQ for one of the
 expanders on Galileo Gen 2
Message-ID: <20200605135627.GN2428291@smile.fi.intel.com>
References: <20200529133054.20136-1-andriy.shevchenko@linux.intel.com>
 <20200529133054.20136-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200529133054.20136-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 29, 2020 at 04:30:54PM +0300, Andy Shevchenko wrote:
> ACPI table on Intel Galileo Gen 2 has wrong pin number for IRQ resource
> of one of the I²C GPIO expanders. Since we know what that number is and
> luckily have GPIO bases fixed for SoC's controllers, we may use a simple
> DMI quirk to match the platform and retrieve GpioInt() pin on it for
> the expander in question.

Since patch 1 from this series has been applied and I fixed few more bugs
I sent recently the series of four fixes with this one included as v1.

So, please, consider that one instead. I also applied Mika's tag.

-- 
With Best Regards,
Andy Shevchenko


