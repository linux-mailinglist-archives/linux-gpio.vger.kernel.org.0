Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908741E439E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 15:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387867AbgE0N2q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 09:28:46 -0400
Received: from mga05.intel.com ([192.55.52.43]:31439 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387821AbgE0N2q (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 09:28:46 -0400
IronPort-SDR: u0VlAUO/2uViVVm56G2d1TQFx2vFV1Kj8bNYFd8sy9R/gM+8cC6JAqOUhXqX6c+f1EY83MMrjQ
 N3zD+/IUIBlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:28:45 -0700
IronPort-SDR: lLFgMtmHWMkUZV4n7EnxnpZVvx4/QvybVQB+K1rtZXE7zjWG3MLEZEHrN33sOKdvEab2c+3bJq
 OQg2Cyy08RiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="345531764"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2020 06:28:44 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdw6x-009Ebv-EN; Wed, 27 May 2020 16:28:47 +0300
Date:   Wed, 27 May 2020 16:28:47 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v3] gpio: pca953x: Override IRQ for one of the expanders
 on Galileo Gen 2
Message-ID: <20200527132847.GS1634618@smile.fi.intel.com>
References: <20200526171222.14835-1-andriy.shevchenko@linux.intel.com>
 <20200527112749.GS247495@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200527112749.GS247495@lahna.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 27, 2020 at 02:27:49PM +0300, Mika Westerberg wrote:
> On Tue, May 26, 2020 at 08:12:22PM +0300, Andy Shevchenko wrote:
> > ACPI table on Intel Galileo Gen 2 has wrong pin number for IRQ resource
> > of one of the I²C GPIO expanders. Since we know what that number is and
> > luckily have GPIO bases fixed for SoC's controllers, we may use a simple
> > DMI quirk to match the platform and retrieve GpioInt() pin on it for
> > the expander in question.

...

> > +static int pca953x_acpi_get_pin(struct acpi_resource *ares, void *data)
> > +{
> > +	struct acpi_resource_gpio *agpio;
> > +	int *pin = data;
> > +
> > +	if (!acpi_gpio_get_irq_resource(ares, &agpio))
> > +		return 1;
> > +
> > +	*pin = agpio->pin_table[0];
> 
> Writing it like below looks better IMHO:
> 
> 	if (acpi_gpio_get_irq_resource(ares, &agpio))
> 		*pin = agpio->pin_table[0];
> 	return 1;

Actually this reveals a suboptimal behaviour in comparison to
acpi_walk_resources(), i.e. there is no way to stop traversing when
(1st) resource is found.

But okay, I will rewrite.

> > +}

...

> > +	ret = acpi_dev_get_resources(adev, &r, pca953x_acpi_get_pin, &pin);
> > +	acpi_dev_free_resource_list(&r);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return pin;
> 
> Or
> 	return ret < 0 ? ret : pin;

I think former is better to read since it has been grouped appropriately.

...

> > +static int pca953x_acpi_get_irq(struct device *dev)
> > +{
> > +	int pin, ret;
> > +
> > +	pin = pca953x_acpi_find_pin(dev);
> > +	if (pin < 0)
> > +		return pin;
> 
> Since you don't actually check the error value you may also return
> simply 0 here (invalid IRQ) and other places.

I don't think it is a good idea, because...

> > +	dev_info(dev, "Applying ACPI interrupt quirk (GPIO %d)\n", pin);
> > +
> > +	if (!gpio_is_valid(pin))
> > +		return -EINVAL;
> > +
> > +	ret = gpio_request(pin, "pca953x interrupt");
> > +	if (ret)
> > +		return ret;
> > +
> > +	return gpio_to_irq(pin);

... this will become to something like

	ret = gpio_to_irq();
	if (ret < 0)
		return 0;

	return ret;

> > +}

...

I agree on the rest.


-- 
With Best Regards,
Andy Shevchenko


