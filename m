Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70BC52AA601
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Nov 2020 15:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgKGOok (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Nov 2020 09:44:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29826 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726021AbgKGOok (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Nov 2020 09:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604760276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V3cCdpfkN3u5wVbkwgQjEaccpKZ3yz8wFIU1UBtdL08=;
        b=FZp1C4xbzWELuMP13zEmyzX7GCW19lWEQLflg4dy/FXPg9isP/1XAtde1E/g7q5H2l9dVY
        zvmYNCp92ZmIxQ6gJJTSs48uwAmKX9CGga7xWQRghF3fKPwJ6kBHFaCVFPLZ4HeCO4tyo+
        8BdZR6+uPCdTz/kUozGuI1Y0WUV+PI8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-tPSedJYfOvmTEZSDpqLJ2A-1; Sat, 07 Nov 2020 09:44:35 -0500
X-MC-Unique: tPSedJYfOvmTEZSDpqLJ2A-1
Received: by mail-ej1-f71.google.com with SMTP id gj4so1736011ejb.13
        for <linux-gpio@vger.kernel.org>; Sat, 07 Nov 2020 06:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V3cCdpfkN3u5wVbkwgQjEaccpKZ3yz8wFIU1UBtdL08=;
        b=NQitj1IKyRD50vKV+1igtTNW+ILTrYI1uFa0M9kEvv6Q+nQuGqpcYN45SxBrL1Yx0c
         EBIVjJXULAvlo7Dq47sQSNjAQoNUTvaCIBc9lruzZo8O4JbuQ8RTbwYBfHxQdnzgyAlY
         y76B1e4Y4JP501ayuKPgg0iTh2Qng/IfktkODlXC4Wg3wmp53u+QcM5HyBw50NJZjBfw
         rfxgEp4h2A+v93nmqvyO7yUxU5BHR3jscWpV+/PF7cDDCpmASM65gMRBM3drLU3CKvLo
         Ycs8jYrzL6hmD9FE4K2hZJtvBDRjhwzf9kOkGvTuxpbfah7C61Hzhk49raczCrtzw1lb
         krMg==
X-Gm-Message-State: AOAM530gFrtUBXCi8gQZ9JsMpyvSAx6GwXQuuVQIoo/qu76mUYVEBwRB
        ReQyuSjvfCPl0/5mKCZVdatlqjBM0JQ9r5qf7Uy/jqVIdDqPFZC7LhD3AI8BzDtSBRg9hAXOfY4
        Mvq2U18oGOkaiBOtbo+bRyw==
X-Received: by 2002:a17:906:2b06:: with SMTP id a6mr7326205ejg.283.1604760273928;
        Sat, 07 Nov 2020 06:44:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ1al1FsvCCS4flA4R0ubdosCedvpjwHsj8wrPgxMkWtymYkIpmYWJeOCnZp7wwWdeQoPNtg==
X-Received: by 2002:a17:906:2b06:: with SMTP id a6mr7326190ejg.283.1604760273695;
        Sat, 07 Nov 2020 06:44:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id c3sm3628513edl.60.2020.11.07.06.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Nov 2020 06:44:32 -0800 (PST)
Subject: Re: [PATCH v4 3/9] gpiolib: acpi: Take into account debounce settings
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Coiby Xu <coiby.xu@gmail.com>
References: <20201106192304.49179-1-andriy.shevchenko@linux.intel.com>
 <20201106192304.49179-4-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0756cd6c-c0a7-17e8-2e32-de3e6db6a69b@redhat.com>
Date:   Sat, 7 Nov 2020 15:44:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201106192304.49179-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/6/20 8:22 PM, Andy Shevchenko wrote:
> We didn't take into account the debounce settings supplied by ACPI.
> This change is targeting the mentioned gap.
> 
> Reported-by: Coiby Xu <coiby.xu@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

I added an older version of this (which only modified acpi_dev_gpio_irq_get())
for testing and when booting a kernel with that version applied to it,
on a Cherry Trail device I noticed that a whole bunch of devices where no
longer seen by the kernel because of acpi_dev_gpio_irq_get() returning
errors now (-ENOTSUPP).

Quoting from the gpiod_set_debounce docs:

/**
 * gpiod_set_debounce - sets @debounce time for a GPIO
 * @desc: descriptor of the GPIO for which to set debounce time
 * @debounce: debounce time in microseconds
 *
 * Returns:
 * 0 on success, %-ENOTSUPP if the controller doesn't support setting the
 * debounce time.
 */

This is expected on GPIO chips where setting the debounce time
is not supported. So the error handling should be modified to
ignore -ENOTSUPP errors here.

This certainly MUST NOT be merged as is because it breaks a lot
of things as is.

Regards,

Hans




> ---
>  drivers/gpio/gpiolib-acpi.c | 18 ++++++++++++++++++
>  drivers/gpio/gpiolib-acpi.h |  2 ++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index c127b410a7a2..b4a0decfeac2 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -299,6 +299,10 @@ static acpi_status acpi_gpiochip_alloc_event(struct acpi_resource *ares,
>  		return AE_OK;
>  	}
>  
> +	ret = gpiod_set_debounce(desc, agpio->debounce_timeout);
> +	if (ret)
> +		goto fail_free_desc;
> +
>  	ret = gpiochip_lock_as_irq(chip, pin);
>  	if (ret) {
>  		dev_err(chip->parent,
> @@ -664,6 +668,7 @@ static int acpi_populate_gpio_lookup(struct acpi_resource *ares, void *data)
>  		lookup->desc = acpi_get_gpiod(agpio->resource_source.string_ptr,
>  					      agpio->pin_table[pin_index]);
>  		lookup->info.pin_config = agpio->pin_config;
> +		lookup->info.debounce = agpio->debounce_timeout;
>  		lookup->info.gpioint = gpioint;
>  
>  		/*
> @@ -961,6 +966,10 @@ int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
>  			if (ret < 0)
>  				return ret;
>  
> +			ret = gpiod_set_debounce(desc, info.debounce);
> +			if (ret)
> +				return ret;
> +
>  			irq_flags = acpi_dev_get_irq_type(info.triggering,
>  							  info.polarity);
>  
> @@ -1048,6 +1057,7 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  		if (!found) {
>  			enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio);
>  			const char *label = "ACPI:OpRegion";
> +			int ret;
>  
>  			desc = gpiochip_request_own_desc(chip, pin, label,
>  							 GPIO_ACTIVE_HIGH,
> @@ -1058,6 +1068,14 @@ acpi_gpio_adr_space_handler(u32 function, acpi_physical_address address,
>  				goto out;
>  			}
>  
> +			ret = gpiod_set_debounce(desc, agpio->debounce_timeout);
> +			if (ret) {
> +				status = AE_ERROR;
> +				gpiochip_free_own_desc(desc);
> +				mutex_unlock(&achip->conn_lock);
> +				goto out;
> +			}
> +
>  			conn = kzalloc(sizeof(*conn), GFP_KERNEL);
>  			if (!conn) {
>  				status = AE_NO_MEMORY;
> diff --git a/drivers/gpio/gpiolib-acpi.h b/drivers/gpio/gpiolib-acpi.h
> index 1c6d65cf0629..e2edb632b2cc 100644
> --- a/drivers/gpio/gpiolib-acpi.h
> +++ b/drivers/gpio/gpiolib-acpi.h
> @@ -18,6 +18,7 @@ struct acpi_device;
>   * @pin_config: pin bias as provided by ACPI
>   * @polarity: interrupt polarity as provided by ACPI
>   * @triggering: triggering type as provided by ACPI
> + * @debounce: debounce timeout as provided by ACPI
>   * @quirks: Linux specific quirks as provided by struct acpi_gpio_mapping
>   */
>  struct acpi_gpio_info {
> @@ -27,6 +28,7 @@ struct acpi_gpio_info {
>  	int pin_config;
>  	int polarity;
>  	int triggering;
> +	unsigned int debounce;
>  	unsigned int quirks;
>  };
>  
> 

