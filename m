Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBDD37553E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 16:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbhEFOB1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 10:01:27 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:41684 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbhEFOBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 10:01:25 -0400
Received: by mail-ot1-f46.google.com with SMTP id c36-20020a05683034a4b02902a5b84b1d12so4935556otu.8;
        Thu, 06 May 2021 07:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hubMrxC9QQYXjgi7dy68ZaTpf75wgUYvH/C6a+Uaz+g=;
        b=dcYjeGL33nP3z9CO3l6kWbSDfahBS1mFeYzj3gKxL80JcSkRJX6lIsZZQpemqrmqja
         aDzEtLhdFWRhpVMcX5zXTZfo9XQLRqLszOa9bJfO0GAmujwzo1tuUSb4/SDb6zRGRrvc
         U/It5SNRth0yedLIK4Hf3oLay7KFLcztsebuNNoLvjNVHY0BzA3mZnkB0jyVOjZ6BIwr
         GTcgeRrb9Wyhzcbqbo8wBwomPZzWi6e7YXe2JccsP8gMOpw2W4vRmldoVw5qM7LXbS/e
         WvVT/qu4yOfaQ/7uI0VWW+AOMRkw1jHoXardfX4HE5uGEOssIiZPsJhzpU5qAckpD/Sg
         OSUw==
X-Gm-Message-State: AOAM532jmjJZa7WVRai/i3Mz8JwMNTtEZJFEeCx+DI/AcjlwCrRDIpsu
        AdPFCdKtqn8eM7ANTTJHmQ==
X-Google-Smtp-Source: ABdhPJxt69flBdzgxkBwftZhwACly8LWduQwM/VXsjhVEp1lsBG3o51WA+c1IVJr1Bi2YuNnql5sgA==
X-Received: by 2002:a9d:62d2:: with SMTP id z18mr3774871otk.78.1620309627083;
        Thu, 06 May 2021 07:00:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p22sm599281otf.25.2021.05.06.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 07:00:26 -0700 (PDT)
Received: (nullmailer pid 244779 invoked by uid 1000);
        Thu, 06 May 2021 14:00:24 -0000
Date:   Thu, 6 May 2021 09:00:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     lee.jones@linaro.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com, linux@roeck-us.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
Subject: Re: [PATCH 3/6] gpio: Add Delta TN48M CPLD GPIO driver
Message-ID: <20210506140024.GB3340759@robh.at.kernel.org>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430123511.116057-3-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 02:35:08PM +0200, Robert Marko wrote:
> Delta TN48M CPLD is used as a GPIO expander for the SFP GPIOs.
> 
> It is a mix of input only and output only pins.
> 
> Since there is no logical GPIO numbering arbitrary one is used
> along dt-bindings to make it humanly readable.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/gpio/Kconfig      |  12 +++
>  drivers/gpio/Makefile     |   1 +
>  drivers/gpio/gpio-tn48m.c | 191 ++++++++++++++++++++++++++++++++++++++
>  drivers/mfd/tn48m-cpld.c  |   6 +-
>  include/linux/mfd/tn48m.h |   3 +
>  5 files changed, 212 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpio/gpio-tn48m.c


> +static const struct platform_device_id tn48m_gpio_id_table[] = {
> +	{ "delta,tn48m-gpio", },

Looks like a compatible, but is not. I think you can drop this and just 
use 'tm48m-gpio' (the driver name).

Same for hwmon.

Rob

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, tn48m_gpio_id_table);
> +
> +static struct platform_driver tn48m_gpio_driver = {
> +	.driver = {
> +		.name = "tn48m-gpio",
> +	},
> +	.probe = tn48m_gpio_probe,
> +	.id_table = tn48m_gpio_id_table,
> +};
> +module_platform_driver(tn48m_gpio_driver);
