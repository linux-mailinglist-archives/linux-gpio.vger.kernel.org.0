Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF961E22C4
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 15:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgEZNLb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 09:11:31 -0400
Received: from mga06.intel.com ([134.134.136.31]:60182 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbgEZNLa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 May 2020 09:11:30 -0400
IronPort-SDR: JpCWUCFd31hlAK6lLQH20cSSsq+Skce6sk8GyCh8Rk+9F6U2DHCFukcOPjhJenCUuQruN1fWru
 UKQVBsdr14hQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 06:11:18 -0700
IronPort-SDR: PJZO3NYhVqFJQGcrEMtjUMn9mU6j8T3qQDPy4wDkmCj40VOWXP8Qd/LVzF6Ios+gLROHhMYYHV
 K3ga2dUujhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; 
   d="scan'208";a="284424615"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 26 May 2020 06:11:16 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdZMV-008zVf-Sj; Tue, 26 May 2020 16:11:19 +0300
Date:   Tue, 26 May 2020 16:11:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
Message-ID: <20200526131119.GQ1634618@smile.fi.intel.com>
References: <20200525190845.60959-1-andriy.shevchenko@linux.intel.com>
 <20200526053101.GD247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526053101.GD247495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 26, 2020 at 08:31:01AM +0300, Mika Westerberg wrote:
> On Mon, May 25, 2020 at 10:08:45PM +0300, Andy Shevchenko wrote:

...

> > +	dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> > +	return gpiod_to_irq(gpio_to_desc(pin));
> 
> You need to request the GPIO as well, I missed that from my example.

How? I can't find a function to request GPIO by its descriptor in
include/linux/gpio/*.

-- 
With Best Regards,
Andy Shevchenko


