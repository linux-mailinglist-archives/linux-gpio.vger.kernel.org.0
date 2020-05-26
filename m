Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCD11E22F1
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 15:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgEZNeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 09:34:08 -0400
Received: from mga12.intel.com ([192.55.52.136]:40210 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbgEZNeI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 May 2020 09:34:08 -0400
IronPort-SDR: S/bu4kRUqrq2O5D97CxN7xIrI1QLo4uh/3giAgWmg9wcrm7igOXuxhBnfS2F8N1SpRWO9/ym8w
 EMVepBbFgnww==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 06:34:08 -0700
IronPort-SDR: obBrEXOAEum1c31mslqPbSgdxUymPc7jX1TFlFeefI+6NY1F31GUZkdSvS9JttQs+WCow3wCh2
 Jw6LIHQkhq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; 
   d="scan'208";a="375698688"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 26 May 2020 06:34:06 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 26 May 2020 16:34:05 +0300
Date:   Tue, 26 May 2020 16:34:05 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
Message-ID: <20200526133405.GV247495@lahna.fi.intel.com>
References: <20200525190845.60959-1-andriy.shevchenko@linux.intel.com>
 <20200526053101.GD247495@lahna.fi.intel.com>
 <20200526131119.GQ1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526131119.GQ1634618@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 26, 2020 at 04:11:19PM +0300, Andy Shevchenko wrote:
> On Tue, May 26, 2020 at 08:31:01AM +0300, Mika Westerberg wrote:
> > On Mon, May 25, 2020 at 10:08:45PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > +	dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> > > +	return gpiod_to_irq(gpio_to_desc(pin));
> > 
> > You need to request the GPIO as well, I missed that from my example.
> 
> How? I can't find a function to request GPIO by its descriptor in
> include/linux/gpio/*.

Not by descriptor but by number which you are already using here anyway.
The function that does that is gpio_request(). I know we should use GPIO
descriptors everywhere but this is a special case for a special hardware
with a broken firmware, so IMHO it should be fine ;-) Once the legacy
API is gets removed this whole hack can be removed as well and nobody
will notice.
