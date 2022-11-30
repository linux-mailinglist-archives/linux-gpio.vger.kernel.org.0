Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1D163E26F
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 22:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbiK3VCs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 16:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiK3VCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 16:02:44 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1C8B1D6
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 13:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669842156; x=1701378156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lJjZATcC4jodo0+obTNvG6WjnjKjl+5X3Porqy15EAg=;
  b=AS01umeXITT+Kh1O3PCVAMUG7LiQC6sTEdBuWyW9SeeWtkCs/v9YouxV
   xFs8vu5Lke54aYxO8qd8Y2tTJXZxzo4G9iteT+mhZD9we2Nt5yWg9jjI/
   xVP1m8ggYCsnTwHWd3N1p3jIv8GV9zYFZk+6FpX72ZAqV4AwDRPjGUxKF
   HC39eCiVExjZgxEw0vb8eZrNQ89Mw9rTyx7qtK8VA4dF373/LcyqNLSc8
   s0iV/juRhHCuuuO2J+O3h/zKiC2XubyeOUwWtga7+sEVV1HoviIvSVoVE
   5f77AUXLZit/wZvIeuXmAD04J5IbitBHn5pt8rirukfJZLHvcNfnik92D
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="303115259"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="303115259"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 13:02:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="638138859"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="638138859"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 30 Nov 2022 13:02:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0UDx-002TjX-0H;
        Wed, 30 Nov 2022 23:02:33 +0200
Date:   Wed, 30 Nov 2022 23:02:32 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Niyas Sait <niyas.sait@linaro.org>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org, fugang.duan@linaro.org
Subject: Re: [PATCH v3 1/2] pinctrl: add support for ACPI pin function and
 config resources
Message-ID: <Y4fE6CPLHKPdjt9y@smile.fi.intel.com>
References: <20221130164027.682898-1-niyas.sait@linaro.org>
 <20221130164027.682898-2-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130164027.682898-2-niyas.sait@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 04:40:26PM +0000, Niyas Sait wrote:
> Add support for following ACPI pin resources
> 
> - PinFunction
> - PinConfig
> 
> Pinctrl-acpi parses the ACPI table and generates list of pin
> descriptors that can be used by pin controller to set and config pin.
> 
> See Documentation/driver-acpi/pin-control-acpi.rst for details

Thank you for an update, my comments below.

...

> +++ b/Documentation/driver-api/pin-control-acpi.rst

We have Documentation/firmware-guide/acpi/, but I'm not sure
which one suits better for this.

...

> +bias to be set to pull up with pull strength of 10K Ohms and for GPIO functionality

I believe the proper way to write units is this 10 kOhms. Same for the rest
similar cases.

...

> +OSPM will have to handle the above resources and select the pin function and configuration
> +through vendor specific interfaces (e.g: memory mapped registers) for the devices to be
> +fully functional.

If it's a copy'n'paste from the specification, we don't need that here.

...

> +			Name (RBUF, ResourceTemplate()
> +			{
> +				Memory32Fixed(ReadWrite, 0x4F800000, 0x20)
> +				Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) {0x55}
> +				PinFunction(Exclusive, PullDefault, 0x5, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
> +				// Configure 10k Pull up for I2C SDA/SCL pins
> +				PinConfig(Exclusive, 0x01, 10000, "\\_SB.GPI0", 0, ResourceConsumer, ) {2, 3}
> +			})
> +			Return(RBUF)

In all examples the 2, 3 is used as a pin list for all kind of resources,
it's so confusing. Also take into account the difference between GPIO and
pin number spaces as I told before. Examples should cover that.

Also try to compile all ASL with latest ACPICA tools and fix warnings / errors.

...

> +Pin control devices can add callbacks for following pinctrl_ops to handle ACPI
> +pin resources.

Why? What use case requires this?
ACPI specification is more stricter in this than DT if I understand correctly
the state of affairs.  So, can't we parse the tables in the same way for all?

...

> +		case PINCTRL_ACPI_PIN_FUNCTION:

> +		case PINCTRL_ACPI_PIN_CONFIG:

These are definitely what we do not want to see in the individual drivers.
(I understand that it might be that some OEMs will screw up and we would
 need quirks, but not now)

...

>  obj-$(CONFIG_OF)		+= devicetree.o
> +obj-$(CONFIG_ACPI)		+= pinctrl-acpi.o

So, it should be called acpi.c here in analogous with DT.

...

>  #include <linux/pinctrl/consumer.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/machine.h>
> +#include <linux/acpi.h>

Ordering?

...

>  #include "devicetree.h"
>  #include "pinmux.h"
>  #include "pinconf.h"

> -
> +#include "pinctrl-acpi.h"

Ditto.

...

> +	status = acpi_get_handle(NULL, pinctrl_acpi, &handle);
> +	if (ACPI_FAILURE(status))
> +		return NULL;
> +
> +	adev = acpi_get_acpi_dev(handle);
> +	if (!adev)
> +		return NULL;
> +
> +	dev_name = acpi_dev_name(adev);
> +	if (!dev_name)
> +		return NULL;
> +
> +	return get_pinctrl_dev_from_devname(dev_name);

Are they all resource leakage-free?

...

> +		ret = acpi_pin_config_to_pinctrl_map(

Indentation.

> +			p, ares->resource_source.string_ptr, ares->pin_table[i],
> +			&config_node.node, 1);
> +		if (ret < 0)
> +			return ret;

-- 
With Best Regards,
Andy Shevchenko


