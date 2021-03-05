Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9714832E7B8
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 13:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCEMMw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 07:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38941 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229646AbhCEMMh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 07:12:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614946356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fAyYqTnDcpVAR0ieZCi/gAvDdjFh5X9B67vvBIY5fbE=;
        b=cligTNqT9tzZiKPu5RR7PFy/+Ckqn67+8WzN507uMLnS9WXjVKU5bGlvVDfXJ+s5k2rWj9
        vEJmrVAuV/c+SD5GyyxoZ2a3Nisthpsl7HPfDyGkGxFuFhYc77Ojs7/VKXpIxzkaFsEZhs
        42AdmWXfykftKERON3EEsHoV7QibYMA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-cseXDDinPt2D2TtVcOJh6g-1; Fri, 05 Mar 2021 07:12:35 -0500
X-MC-Unique: cseXDDinPt2D2TtVcOJh6g-1
Received: by mail-ed1-f72.google.com with SMTP id q1so835009edv.5
        for <linux-gpio@vger.kernel.org>; Fri, 05 Mar 2021 04:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fAyYqTnDcpVAR0ieZCi/gAvDdjFh5X9B67vvBIY5fbE=;
        b=ffCwZ+4hUHB+NXocX3raEOkc89mET8gd/fBR5EZO9rTknoS1r6TjwFljLQaySyR155
         vCGn+kiuRNreGx1323Zdb9S0XpL0wCAZ6xUH4P5jsxZuWXRM6pQ/+OB9kMyfl6ZMF0Dc
         5uTQ5YpTBGKzZjAHYQgYXXHiDBJVU3WAcTtkwNJPg84ZKYVBzo+tbugvd9Y2FEbrtQLl
         yBr8hqaW0nTOkwag0DllTelGigQyC4R8s2sMpg9D2ddHBwkq1Ej7YeMczZ4Jp3iQOSvH
         8aKUZYE7HgvM+6pa+hD0hjZZy/hxPmrB6dm8Gxxpe827BMt2hW+3WDzb4moXb2XuLVI1
         v+GA==
X-Gm-Message-State: AOAM530PL7CZcEMHFTjBBxoDsmLBIfUGpa1cEVgp1Dj+BO8OAH4b+BLZ
        koMAutLiNHVARP0/xE7gakw5AF7Ycw69k5LI8EeBvaawMlWtP9DqeafEU6d2KjNnvWAkm3MgwPl
        +yImcgcDb90Y38m+P6UL4Xw==
X-Received: by 2002:a17:906:3c50:: with SMTP id i16mr1981545ejg.175.1614946353879;
        Fri, 05 Mar 2021 04:12:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLhqfbJ7vZPyUnZjyzDZeBLLaS0g9cjwHbi7VZ8TDQW2908sdhTjGMqgtkN70DP1HkZwW+7A==
X-Received: by 2002:a17:906:3c50:: with SMTP id i16mr1981536ejg.175.1614946353691;
        Fri, 05 Mar 2021 04:12:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f21sm1394287ejw.124.2021.03.05.04.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 04:12:33 -0800 (PST)
Subject: Re: [PATCH] gpiolib: acpi: support override broken GPIO number in
 ACPI table
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210226033919.8871-1-shawn.guo@linaro.org>
 <YD9bQXBD+9k3Lf/4@smile.fi.intel.com>
 <2ed0d4dc-2756-9a55-3f54-1377732e35fc@redhat.com>
 <20210305011429.GH17424@dragon>
 <f7aa417e-42b5-0c42-6f59-7311b060384f@redhat.com>
 <20210305112614.GK17424@dragon>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <669fad34-6367-81e7-c324-6d12e2387493@redhat.com>
Date:   Fri, 5 Mar 2021 13:12:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305112614.GK17424@dragon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 3/5/21 12:26 PM, Shawn Guo wrote:
> On Fri, Mar 05, 2021 at 10:10:50AM +0100, Hans de Goede wrote:
>>> So we reach a consensus that this is not the right solution for Lenovo
>>> Flex 5G. But what about for Andy's Galileo Gen 2 case, where the GPIO
>>> number in ACPI is truly broken?
>>
>> Well if the ACPI table truely simply has a wrong number in it, like in
>> this case, then we clearly need a workaround.
>>
>>>   ba8c90c61847 ("gpio: pca953x: Override IRQ for one of the expanders on Galileo Gen 2")
>>
>> And we have one in place, so I'm not sure what the question is?
>>
>> I guess the question is of your generic GPIO renumber patch would not
>> be a better answer to that ?
>>
>> IMHO no, we want to keep quirks out of the core as much as possible,
>> for example the code which Andy added a quirk to is build as a module
>> in the generic Fedora distro kernel, so for most users the code will
>> not be loaded into memory. Where as if we add it to the core it would
>> use up extra memory for everyone.
> 
> Fair point. I did not really think of it, because there is already
> gpiolib_acpi_quirks[] in core code.  And on the other side, if there are
> more drivers need such workaround, having each of these drivers copy the
> same code is not ideal either.
> 
>>
>> Also if, in the future, we were to ever add a generic GPIO renumber quirk
>> mechanism to the core, then your code would need more work. Because to be
>> truely generic it would need to remap one gpiochip-name:pin-number on
>> another gpiochip-name:pin-number pair. There might very well be a case
>> with multiple gpiochips with pin number 32 being referenced in the DSDT
>> and where we need to remap one of those 32-s to a different number
>> (or possibly even to a different chip + number).
> 
> Yeah, I had already have v2 of my patch, just did not post it as the
> overall direction is not agreed on.  I attach it here for discussion.
> I think with the GPIO consumer specified, it should be good enough to
> locate the broken GPIO number that needs override.  If gpiochip is
> wrong, that means "\\_SB.GIO0" of GpioInt needs an override.  That's
> a different issue.

Not really it is still pointing to a wrong pin, the full identifier
for a pin in linux (see the userspace iocontrol interface also) is
<gpio-chip-name> + <index> so if we add support for remapping we should
add support for specifying the full pair. But your new approach with
the consumer is also interesting.

Maybe a generic override mechanism should use the following
inputs (indexing into the override map) and outputs:

In: consumer-dev-name + consumer-gpio-pin-name (e.g. "power", etc.)
Out: gpio-chip-name> + index + flags

That would also work in cases where GPIOs are just completely missing
from the DSDTs.

And to circle back to Andy's point about the current fix for his
case requiring duplicating lots of gpiolib-acpi code.

Maybe we need a gpiod_get_with_lookup_table() or some such
where the driver doing the gpiod_get call can specify a lookup
table to do the overriding of the broken DSDT.

I think we should even be able to make this non ACPI specific
this way.

This will allow drivers to avoid having to code all
the lookup code themselves, while still pushing the
responsibility of actually maintaining the lookup-overrides
inside the individual drivers.

Regards,

Hans





> 
> GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
>     "\\_SB.GIO0", 0x00, ResourceConsumer, ,
>     )
>     {   // Pin list
> 	0x0280
>     }
> 
> Shawn
> 
> 
> [PATCH v2] gpiolib: acpi: support override broken GPIO number in ACPI
> 
> Running kernel with ACPI on Lenovo Flex 5G laptop, touchpad is just
> not working.  That's because the GpioInt number of TCPD node in ACPI
> table is simply wrong, and the number even exceeds the maximum GPIO
> lines.  As the touchpad works fine with Windows on the same machine,
> presumably this is something Windows-ism.  Although it's obviously
> a specification violation, believe of that Microsoft will fix this in
> the near future is not really realistic.
> 
> It adds the support of overriding broken GPIO number in ACPI table
> on particular machines, which are matched using DMI info.  Such
> mechanism for fixing up broken firmware and ACPI table is not uncommon
> in kernel.  And hopefully it can be useful for other machines that get
> broken GPIO number coded in ACPI table.
> 
> The signature of acpi_get_gpiod() gets updated to pass over acpi_device
> pointer of consumer device, so that the broken pin can be matched
> precisely with consumer fwnode name.
> 
> Changes for v2:
> - Match broken pin with additional consumer fwnode name comparison.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/gpio/gpiolib-acpi.c | 79 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 76 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index e37a57d0a2f0..fed045d64a26 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -93,6 +93,72 @@ static DEFINE_MUTEX(acpi_gpio_deferred_req_irqs_lock);
>  static LIST_HEAD(acpi_gpio_deferred_req_irqs_list);
>  static bool acpi_gpio_deferred_req_irqs_done;
>  
> +struct acpi_gpio_pin_fixup {
> +	const char *consumer;
> +	int pin_broken;
> +	int pin_correct;
> +};
> +
> +struct acpi_gpio_pin_override {
> +	const struct acpi_gpio_pin_fixup *fixups;
> +	int num;
> +};
> +
> +static const struct acpi_gpio_pin_fixup lenovo_flex_5g_fixups[] = {
> +	{
> +		/* GpioInt of Touchpad */
> +		.consumer = "\\_SB.I2C8.TCPD",
> +		.pin_broken = 0x0280,
> +		.pin_correct = 0x0018,
> +	},
> +};
> +
> +static const struct acpi_gpio_pin_override lenovo_flex_5g_override = {
> +	.fixups = lenovo_flex_5g_fixups,
> +	.num = ARRAY_SIZE(lenovo_flex_5g_fixups),
> +};
> +
> +static const struct dmi_system_id acpi_gpio_pin_override_table[] = {
> +	{
> +		.ident = "Lenovo Flex 5G",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_FAMILY, "Flex 5G 14Q8CX05"),
> +		},
> +		.driver_data = (void *)&lenovo_flex_5g_override,
> +	},
> +	{ } /* terminator */
> +};
> +
> +static int acpi_gpio_pin_override(struct acpi_device *adev, int pin)
> +{
> +	const struct acpi_gpio_pin_override *override;
> +	const struct dmi_system_id *system_id;
> +	char *fwname;
> +	int ret = pin;
> +	int i;
> +
> +	system_id = dmi_first_match(acpi_gpio_pin_override_table);
> +	if (!system_id)
> +		return ret;
> +
> +	fwname = kasprintf(GFP_KERNEL, "%pfwf", &adev->fwnode);
> +	override = system_id->driver_data;
> +
> +	for (i = 0; i < override->num; i++) {
> +		const struct acpi_gpio_pin_fixup *f = &override->fixups[i];
> +
> +		if (!strcmp(f->consumer, fwname) && pin == f->pin_broken) {
> +			ret = f->pin_correct;
> +			goto done;
> +		}
> +	}
> +
> +done:
> +	kfree(fwname);
> +	return ret;
> +}
> +
>  static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
>  {
>  	if (!gc->parent)
> @@ -103,6 +169,7 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
>  
>  /**
>   * acpi_get_gpiod() - Translate ACPI GPIO pin to GPIO descriptor usable with GPIO API
> + * @adev:	ACPI device that consumes the GPIO
>   * @path:	ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
>   * @pin:	ACPI GPIO pin number (0-based, controller-relative)
>   *
> @@ -111,7 +178,8 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
>   * controller does not have GPIO chip registered at the moment. This is to
>   * support probe deferral.
>   */
> -static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
> +static struct gpio_desc *acpi_get_gpiod(struct acpi_device *adev,
> +					char *path, int pin)
>  {
>  	struct gpio_chip *chip;
>  	acpi_handle handle;
> @@ -125,7 +193,11 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
>  	if (!chip)
>  		return ERR_PTR(-EPROBE_DEFER);
>  
> -	return gpiochip_get_desc(chip, pin);
> +	/*
> +	 * Give it a chance to correct the broken GPIO pin number in ACPI
> +	 * table of particular machines.
> +	 */
> +	return gpiochip_get_desc(chip, acpi_gpio_pin_override(adev, pin));
>  }
>  
>  static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
> @@ -689,7 +761,8 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
>  		if (pin_index >= agpio->pin_table_length)
>  			return 1;
>  
> -		lookup->desc = acpi_get_gpiod(agpio->resource_source.string_ptr,
> +		lookup->desc = acpi_get_gpiod(lookup->info.adev,
> +					      agpio->resource_source.string_ptr,
>  					      agpio->pin_table[pin_index]);
>  		lookup->info.pin_config = agpio->pin_config;
>  		lookup->info.debounce = agpio->debounce_timeout;
> 

