Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 529B410C30D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 04:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfK1DrJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 22:47:09 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.101]:32521 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfK1DrI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 22:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574912825;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=YdruPdKAoK6txPA5JOxDAj/vTUfByn2ONRopUgEmExs=;
        b=kTHmdPrtWh/7DTav16iKTsrWvF4XqHRxyD6DUumHVdUHwfW1VSA5/+MbeHjoqFns25
        Iz1h1OtWNIMItVSrlEbi7ll5Amx7IZ/6WF2sC0zACKTEdwza740luxdAarqL16QcwyiF
        nVDcPwTT+v2ds2lZ2Bbi8B4Sz+FiSJSHTLlvR19qEb9Txm73LUvH5KJDDPdHXLFt+hDp
        xRvZX2REFsSYu6dYwH4xGKiofS3Lhs9WllrCEUeIeE2AdeWMQLvPPForB4420+vbjJxo
        MpRcplKL3+ZJqJhALIxXlpx1We+w05zq09SQeoeM+FUMtlKtkVzQpEoN9B7hZa1WLnEo
        256w==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp04-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.0.0 AUTH)
        with ESMTPSA id 604beevAS3f32J3
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 28 Nov 2019 04:41:03 +0100 (CET)
Date:   Thu, 28 Nov 2019 04:41:02 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Message-ID: <761320534.1467709.1574912462950@webmail.strato.com>
In-Reply-To: <20191127084253.16356-7-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-7-geert+renesas@glider.be>
Subject: Re: [PATCH v3 6/7] docs: gpio: Add GPIO Aggregator/Repeater
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev22
X-Originating-IP: 112.198.74.215
X-Originating-Client: open-xchange-appsuite
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


> On November 27, 2019 at 9:42 AM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> Document the GPIO Aggregator/Repeater, and the three typical use-cases.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  .../admin-guide/gpio/gpio-aggregator.rst      | 111 ++++++++++++++++++
>  Documentation/admin-guide/gpio/index.rst      |   1 +
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/admin-guide/gpio/gpio-aggregator.rst
> 
> diff --git a/Documentation/admin-guide/gpio/gpio-aggregator.rst b/Documentation/admin-guide/gpio/gpio-aggregator.rst
> new file mode 100644
> index 0000000000000000..826146e260253299
> --- /dev/null
> +++ b/Documentation/admin-guide/gpio/gpio-aggregator.rst
> @@ -0,0 +1,111 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +GPIO Aggregator/Repeater
> +========================
> +
> +The GPIO Aggregator/Repeater allows to aggregate GPIOs, and expose them as a
> +new gpio_chip.  This supports the following use cases.
> +
> +
> +Aggregating GPIOs using Sysfs
> +-----------------------------
> +
> +GPIO controllers are exported to userspace using /dev/gpiochip* character
> +devices.  Access control to these devices is provided by standard UNIX file
> +system permissions, on an all-or-nothing basis: either a GPIO controller is
> +accessible for a user, or it is not.
> +
> +The GPIO Aggregator allows access control for individual GPIOs, by aggregating
> +them into a new gpio_chip, which can be assigned to a group or user using
> +standard UNIX file ownership and permissions.  Furthermore, this simplifies and
> +hardens exporting GPIOs to a virtual machine, as the VM can just grab the full
> +GPIO controller, and no longer needs to care about which GPIOs to grab and
> +which not, reducing the attack surface.
> +
> +Aggregated GPIO controllers are instantiated and destroyed by writing to
> +write-only attribute files in sysfs.
> +
> +    /sys/bus/platform/drivers/gpio-aggregator/
> +
> +	"new_device" ...
> +		Userspace may ask the kernel to instantiate an aggregated GPIO
> +		controller by writing a string describing the GPIOs to
> +		aggregate to the "new_device" file, using the format
> +
> +		.. code-block:: none
> +
> +		    [<gpioA>] [<gpiochipB> <offsets>] ...
> +
> +		Where:
> +
> +		    "<gpioA>" ...
> +			    is a GPIO line name,
> +
> +		    "<gpiochipB>" ...
> +			    is a GPIO chip label or name, and
> +
> +		    "<offsets>" ...
> +			    is a comma-separated list of GPIO offsets and/or
> +			    GPIO offset ranges denoted by dashes.
> +
> +		Example: Instantiate a new GPIO aggregator by aggregating GPIO
> +		19 of "e6052000.gpio" and GPIOs 20-21 of "gpiochip2" into a new
> +		gpio_chip:
> +
> +		.. code-block:: bash
> +
> +		    echo 'e6052000.gpio 19 gpiochip2 20-21' > new_device
> +
> +	"delete_device" ...
> +		Userspace may ask the kernel to destroy an aggregated GPIO
> +		controller after use by writing its device name to the
> +		"delete_device" file.
> +
> +		Example: Destroy the previously-created aggregated GPIO
> +		controller "gpio-aggregator.0":
> +
> +		.. code-block:: bash
> +
> +		    echo gpio-aggregator.0 > delete_device
> +
> +
> +GPIO Repeater in Device Tree
> +----------------------------
> +
> +A GPIO Repeater is a node in a Device Tree representing a repeater for one or
> +more GPIOs, possibly including physical signal property translation (e.g.
> +polarity inversion).  This allows to model e.g. inverters in DT.
> +
> +See Documentation/devicetree/bindings/gpio/gpio-repeater.yaml
> +
> +
> +Generic GPIO Driver
> +-------------------
> +
> +The GPIO Aggregator can also be used as a generic driver for a simple
> +GPIO-operated device described in DT, without a dedicated in-kernel driver.
> +This is not unlike e.g. spidev, which allows to communicated with an SPI device
> +from userspace.
> +
> +Binding a device to the GPIO Aggregator is performed either by modifying the
> +gpio-aggregator driver, or by writing to the "driver_override" file in Sysfs.
> +
> +Example: If "frobnicator" is a GPIO-operated device described in DT, using its
> +own compatible value::
> +
> +        frobnicator {
> +                compatible = "myvendor,frobnicator";
> +
> +                gpios = <&gpio2 19 GPIO_ACTIVE_HIGH>,
> +                        <&gpio2 20 GPIO_ACTIVE_LOW>;
> +        };
> +
> +it can be bound to the GPIO Aggregator by either:
> +
> +1. Adding its compatible value to ``gpio_aggregator_dt_ids[]``,
> +2. Binding manually using "driver_override":
> +
> +.. code-block:: bash
> +
> +    echo gpio-aggregator > /sys/bus/platform/devices/frobnicator/driver_override
> +    echo frobnicator > /sys/bus/platform/drivers/gpio-aggregator/bind
> diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
> index a244ba4e87d5398a..ef2838638e967777 100644
> --- a/Documentation/admin-guide/gpio/index.rst
> +++ b/Documentation/admin-guide/gpio/index.rst
> @@ -7,6 +7,7 @@ gpio
>  .. toctree::
>      :maxdepth: 1
>  
> +    gpio-aggregator
>      sysfs
>  
>  .. only::  subproject and html
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
