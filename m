Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7C21F5600
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 15:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgFJNl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 09:41:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:56158 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbgFJNl0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 09:41:26 -0400
IronPort-SDR: b80dPNFJxk4WxVaxs9O2nNnv+cqTAKY71mv8fHMAJ4OcDFDFSD+foZhIDDy5FXg54AeIQkddrb
 gC5HGkb3JNjQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 06:41:25 -0700
IronPort-SDR: XYLLYmsFiGjVgU6b8ruF36UcNxGyRRD7J42f1vvtgfnYb1p5pwcuDnqnmnMNzZ/OkaNTy3L70s
 8nvFsasVJgnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="271249881"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 10 Jun 2020 06:41:23 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jj0ys-00C9Og-AO; Wed, 10 Jun 2020 16:41:26 +0300
Date:   Wed, 10 Jun 2020 16:41:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 2/6] gpio: dwapb: Read GPIO base from snps,gpio-base
 property
Message-ID: <20200610134126.GG2428291@smile.fi.intel.com>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200608134300.76091-3-andriy.shevchenko@linux.intel.com>
 <CACRpkdZD5VNxZzycwbFWrzpT1TxkkViBuzAp5P0KQOW4oWjpVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZD5VNxZzycwbFWrzpT1TxkkViBuzAp5P0KQOW4oWjpVw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2020 at 01:26:59PM +0200, Linus Walleij wrote:
> On Mon, Jun 8, 2020 at 3:43 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > For backward compatibility with some legacy devices, introduce
> > a new property snps,gpio-base to read GPIO base. Don't advertise
> > to discourage users from utilizing it.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I usually have a very negative gut reaction to any attempts to hardcode
> the heavily deprecated use of the gpio_base for the global GPIO
> numberspace. The reason is clear from drivers/gpio/TODO I think.
> 
> I need a really good explanation why this is needed, the only reason
> people have been pushing this in the past is "oh we are using the
> sysfs and we don't wanna change the GPIO numbers in our scripts"
> which I really want to push back on now that we have the chardev and
> the libgpiod utils.

I understand the point, that's why this property is not being advertised.
The problem here is that on existing (legacy) platform we have to deal with an absolute numbers of GPIOs and those numbers can work if we keep the base

> If this is needed for something driver internal, it should stay in a
> driver-local
> variable.

It's a cross drivers variable. The purpose of this series is to unify interface
in the GPIO driver how to deal with device properties (so, be agnostic from
resource provider at the end).

Everything so far so good, but then we need a mean how not to break the
platform. Because dropping the base in this case will immediately make a
regression.

We can re-use 'gpio-base' as gpio-mockup is using it silently. So, in such case
we won't add any deviation to the property namespace.

Or we can rename above to linux,gpio-base and re-use it here with this name to
explicitly show that this is not firmware property.

-- 
With Best Regards,
Andy Shevchenko


