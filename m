Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57281EA07A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2020 11:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgFAJDY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jun 2020 05:03:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:9946 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbgFAJDY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 1 Jun 2020 05:03:24 -0400
IronPort-SDR: fwptyJWmDRjo+AHG/YDNHpxotJN3Kudeh85PGOBAmaZO/sXHV3ygU4xhm0re4F15k+D+r9pW2T
 a+ByFMqJb6fw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2020 02:03:23 -0700
IronPort-SDR: D5JTPqaZmk3HKwnBeoeUy2LCfH76AkkvAsaYNblvUkJs3r60P/uxo2ItXTp6Bn9Zl1OvZ+x2lu
 uFX3+P08nEBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,460,1583222400"; 
   d="scan'208";a="271934269"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006.jf.intel.com with ESMTP; 01 Jun 2020 02:03:22 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jfgLt-00ABbC-J2; Mon, 01 Jun 2020 12:03:25 +0300
Date:   Mon, 1 Jun 2020 12:03:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v4 2/2] gpio: pca953x: Override IRQ for one of the
 expanders on Galileo Gen 2
Message-ID: <20200601090325.GD1634618@smile.fi.intel.com>
References: <20200529133054.20136-1-andriy.shevchenko@linux.intel.com>
 <20200529133054.20136-2-andriy.shevchenko@linux.intel.com>
 <20200601084023.GR247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200601084023.GR247495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 01, 2020 at 11:40:23AM +0300, Mika Westerberg wrote:
> On Fri, May 29, 2020 at 04:30:54PM +0300, Andy Shevchenko wrote:
> > ACPI table on Intel Galileo Gen 2 has wrong pin number for IRQ resource
> > of one of the I²C GPIO expanders. Since we know what that number is and
> > luckily have GPIO bases fixed for SoC's controllers, we may use a simple
> > DMI quirk to match the platform and retrieve GpioInt() pin on it for
> > the expander in question.
> > 
> > Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> I don't think this is needed since I did not suggest you to write this
> patch. I only gave a couple of review comments.

You suggested the way to avoid a quirk which brings us to almost rewritten
version of this. I think it's appropriate to put your tag, but if you insist,
I'll remove it.

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


