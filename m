Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65CA83891DF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 16:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354624AbhESOun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 10:50:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:19175 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348649AbhESOum (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 May 2021 10:50:42 -0400
IronPort-SDR: s1zXu38+/EsCiz/ZESP40oxDynbMKw+VdOk68RsMXEO2Wc9+vwdgVTgCzVC6VgixheaMsKxHfG
 gmsdawP3lvyQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="201040553"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="201040553"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 07:49:22 -0700
IronPort-SDR: S/qcyX91iz6L8YqXIX4rN0f4cH1BC9cYrGprRXK1dIfzG+lz87iVDYi++60xM8NivkmqMaOcgt
 sLemi1SywjkQ==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="474652345"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 07:49:20 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ljNVe-00DFl9-8D; Wed, 19 May 2021 17:49:18 +0300
Date:   Wed, 19 May 2021 17:49:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: Re: [RFC PATCH v2 1/1] misc: add sloppy logic analyzer using polling
Message-ID: <YKUlbsWhT45l5Zm0@smile.fi.intel.com>
References: <20210519132528.4394-1-wsa+renesas@sang-engineering.com>
 <20210519132528.4394-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519132528.4394-2-wsa+renesas@sang-engineering.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 19, 2021 at 03:25:28PM +0200, Wolfram Sang wrote:
> This is a sloppy logic analyzer using GPIOs. It comes with a script to
> isolate a CPU for polling. While this is definately not a production
> level analyzer, it can be a helpful first view when remote debugging.
> Read the documentation for details.

Thanks for an update!

My comments below.

...

> +Tell the kernel which GPIOs are used as probes. For a DT based system, you need

'DT' -> 'Device Tree'

> +to use the following bindings. Because these bindings are only for debugging,
> +there is no official yaml file::

'yaml file' -> 'device tree schema' or so

> +    i2c-analyzer {
> +            compatible = "gpio-sloppy-logic-analyzer";
> +            probe-gpios = <&gpio6 21 GPIO_OPEN_DRAIN>, <&gpio6 4 GPIO_OPEN_DRAIN>;
> +            probe-names = "SCL", "SDA";
> +    };

'For ACPI one may use PRP0001 approach with the following ASL excerpt example::

    Device (GSLA) {
        Name (_HID, "PRP0001")
        Name (_DDN, "GPIO sloppy logic analyzer")
        Name (_CRS, ResourceTemplate () {
            GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone,
                "\\_SB.PCI0.GPIO", 0, ResourceConsumer, , ) { 13 }
            PinConfig(Exclusive, 0x07, 0, "\\_SB.PCI0.GPIO", 0, ResourceConsumer, ) { 7 }
            GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone,
                "\\_SB.PCI0.GPIO", 0, ResourceConsumer, , ) { 12 }
            PinConfig(Exclusive, 0x07, 0, "\\_SB.PCI0.GPIO", 0, ResourceConsumer, ) { 6 }
        })

        Name (_DSD, Package () {
            ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
            Package () {
                Package () { "compatible", Package () { "gpio-sloppy-logic-analyzer" } },
                Package () {
                    "probe-gpios", Package () {
                        ^GSLA, 0, 0, 0,
                        ^GSLA, 1, 0, 0,
                    },
                Package () {
                    "probe-names", Package () {
                        "SCL",
                        "SDA",
                    },
            }
        })

Note, that pin configuration uses pin numbering space, while GPIO resources
are in GPIO numbering space, which may be different in ACPI. In other words,
there is no guarantee that GPIO and pins are mapped 1:1, that's why there are
two different pairs in the example, i.e. {13,12} GPIO vs. {7,6} pin.

Yet pin configuration support in Linux kernel is subject to implement.'

> +maximum of 8 probes are supported. 32 are likely possible but are not
> +implemented yet.

...

> + * Copyright (C) Wolfram Sang <wsa@sang-engineering.com>
> + * Copyright (C) Renesas Electronics Corporation

No years?

...

> +#include <linux/of.h>

Nothing from this header is used here. You meant mod_devicetable.h.

...

> +#define GPIO_LA_NAME "gpio-sloppy-logic-analyzer"
> +#define GPIO_LA_DEFAULT_BUF_SIZE SZ_256K
> +/* can be increased but then we need to extend the u8 buffers */
> +#define GPIO_LA_MAX_PROBES 8
> +#define GPIO_LA_NUM_TESTS 1024

I prefer TAB indentation of the values for better reading, but it's up to you.

...

> +#define gpio_la_get_array(d, sptr) gpiod_get_array_value((d)->ndescs, (d)->desc, \
> +							 (d)->info, sptr);

Can we put it like

#define gpio_la_get_array(d, sptr)					\
	gpiod_get_array_value((d)->ndescs, (d)->desc, (d)->info, sptr)

?

Also I believe the semicolon is redundant here.

...

> +struct gpio_la_poll_priv {
> +	struct mutex lock;
> +	u32 buf_idx;
> +	unsigned long ndelay;
> +	struct gpio_descs *descs;
> +	struct debugfs_blob_wrapper blob;

> +	struct dentry *debug_dir, *blob_dent;

One member per line, please.

> +	struct debugfs_blob_wrapper meta;
> +	unsigned long gpio_acq_delay;
> +	struct device *dev;

> +	unsigned int trig_len;

On 64-bit arch you may save 4 bytes by moving this to be together with u32
member above.

> +	u8 *trig_data;
> +};

> +static struct dentry *gpio_la_poll_debug_dir;

I have seen the idea of looking up the debugfs entry. That said, do we actually
need this global variable?

...

> +static int fops_capture_set(void *data, u64 val)
> +{
> +	struct gpio_la_poll_priv *priv = data;
> +	u8 *la_buf = priv->blob.data;

> +	unsigned long state = 0;

Seems redundant assignment.

> +	int i, ret;

> +}

...

> +	if (count == 0 || count > 2048 || count & 1)

Isn't it guaranteed by kernfs code that you never get here if count == 0?

> +		return -EINVAL;

...

> +	ret = device_property_read_string_array(dev, "probe-names", gpio_names,
> +						priv->descs->ndescs);
> +	if (ret >= 0 && ret != priv->descs->ndescs)
> +		ret = -ENOSTR;
> +	if (ret < 0) {
> +		dev_err(dev, "error naming the GPIOs: %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < priv->descs->ndescs; i++) {
> +		unsigned int add_len;
> +
> +		if (gpiod_cansleep(priv->descs->desc[i]))
> +			return -EREMOTE;
> +
> +		gpiod_set_consumer_name(priv->descs->desc[i], gpio_names[i]);
> +
> +		/* '10' is length of 'probe00=\n\0' */
> +		add_len = strlen(gpio_names[i]) + 10;
> +		meta = devm_krealloc(dev, meta, meta_len + add_len, GFP_KERNEL);

First of all, this realloc() pattern *) is bad. While it's tricky and has side
effects (i.e. it has no leaks) better not to use it to avoid confusion.

*) foo = realloc(foo, ...); is 101 mistake.

> +		if (!meta)
> +			return -ENOMEM;
> +		snprintf(meta + meta_len, add_len, "probe%02d=%s\n", i + 1, gpio_names[i]);
> +		/* ' - 1' to skip the NUL terminator */
> +		meta_len += add_len - 1;
> +	}


But second, all your use is based on:
 - all strings are of equal lengths
 - all or none will go

Hence, why not to use regular devm_kcalloc() before loop?

...

> +#! /bin/sh

Space is not needed (and actually unusual to have here).

On top of that, try to add -efu and see what would break :-)

...

> +init_cpu()
> +{
> +	local CPU OLDMASK

Local variables a better to be in lower letters.

> +	CPU="$1"
> +	[ ! -d $CPUSETDIR ] && mkdir $CPUSETDIR

[ -d ... ] || ...

> +	mount | grep -q $CPUSETDIR || mount -t cpuset cpuset $CPUSETDIR
> +	[ ! -d $LACPUSETDIR ] && mkdir $LACPUSETDIR

Ditto.

> +}

...

> +			# Check if we could parse something and the channel number fits
> +			[ $chan != $c -a $chan -le $MAX_CHANS ] 2> /dev/null || { echo "Syntax error: $c" && exit 1; }

Why 2>/dev/null ?

...

> +		[ $val1 -ne $val2 ] &&	TRIGGER_BINDAT="$TRIGGER_BINDAT$(printf '\\%o\\%o' $mask $val2)"

One space is enough.

...

> +[ $SAMPLEFREQ -eq 0 ] &&

 echo "Invalid sample frequency" && exit 1

This kind of stuff deserves an exit function, like

# my_exit(code, msg)
my_exit()
{
  local code="$1"; shift
  local msg="$1"; shift

  echo "$msg"
  exit $code
}

(Yeah, yeah, after -efu you will discover that && is not an equivalent to if-then-fi)

-- 
With Best Regards,
Andy Shevchenko


