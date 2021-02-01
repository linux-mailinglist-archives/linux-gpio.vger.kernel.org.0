Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4BDE30B1F6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 22:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhBAVQ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 16:16:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhBAVQZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 16:16:25 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C59CC061756;
        Mon,  1 Feb 2021 13:15:45 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id e15so4661621lft.13;
        Mon, 01 Feb 2021 13:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=irOj1nASK0NREc3BcDFDuw6eRYD59HzaD0YvEhbe2rA=;
        b=r6u2S91UMDxQwNdFTsw6DnqRBYyHcKo6KI5z0VToO/XYoEQDiQSd1LiKk82mPbMBuu
         tDuND+PJGJzf0S3OW0DJ2FnLDRrsvjRa766Iby5rjjIFf7B+8jpTAxaPk+8qY9muwp0o
         EzUkwQuUEVMQN1WV4njw4EvOlpbY6W8bjwlVb9BVzivY2fwVv8u0YC588ma3YgNqIzMR
         FLHSJyJ8oioo1j0D8N85ZjUegpJNVIoHQ54qOkOGabg604XOPas8rD2Sjj8uDj3WgnXE
         P42zY6QD2t+cZjXGY7k/h0OeXjrUqWix4u5r0MzEdzE5wrMjX1rlns5sAnglDWroy2wA
         FxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=irOj1nASK0NREc3BcDFDuw6eRYD59HzaD0YvEhbe2rA=;
        b=gZHG0PhAznycy1SESzPmUIuCOvjrUUNJTLlHvHGEwxbm8Gp2lhaWPdxDrXkeIgAR7m
         vAmqBNpgz+M0f9HB7BgryItZ8EDu7EGnvIdGqzaP/OOIfQQaKIjtyz2jaPUJOiUj1BxD
         iQT8dFilwjutXqdoaDYvVdC13hhKuN6iqJgIcwlNQHgkuu7+ElVwU7Cx66cKwiRkwzMa
         buj3fm3eznX2i7h5YjBf3g0meuWKLnETTh+CUgMmirU2Y6SoDqUzlfEcmUNyURlnJ9vS
         BhFFYihaMqygAPGzTw6WQecMnZQ1HaV4y9P23hWbCrQZkvbRQNLCbF1kmzJIsJAI53EQ
         LXqQ==
X-Gm-Message-State: AOAM533dz83QoOxS2rJ1r4N7MqzP837JRRdvY7sciBIM/L694up+O/TP
        hCi3aue8fukmC/eerymDTotTIWl8UXY=
X-Google-Smtp-Source: ABdhPJwrYdmYDCxfBTGx/h8g8QUyHPBH1jncl9qWiKnu6iHbto/awpIkRJw2dkXN4Urr8MOt3kHYyg==
X-Received: by 2002:ac2:4ad0:: with SMTP id m16mr3317361lfp.53.1612214143755;
        Mon, 01 Feb 2021 13:15:43 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id o16sm988956lft.44.2021.02.01.13.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 13:15:43 -0800 (PST)
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20210122193600.1415639-1-saravanak@google.com>
 <544ad0e4-0954-274c-8e77-866aaa5661a8@gmail.com>
 <CAGETcx_CYKczo+geD7yDo+T2+_-tgGYwtjR-2sMPQYHuz-wAgw@mail.gmail.com>
 <09502076-02e9-39ee-e432-24260696a927@gmail.com>
 <CAGETcx9fqnCZTC=afDUHnS6gES8WW4SwFNmH5sWaGVRYiysOMQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c21d1a6b-5464-b59d-3967-c75c5a16136c@gmail.com>
Date:   Tue, 2 Feb 2021 00:15:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAGETcx9fqnCZTC=afDUHnS6gES8WW4SwFNmH5sWaGVRYiysOMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

01.02.2021 23:15, Saravana Kannan пишет:
> On Mon, Feb 1, 2021 at 8:49 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 01.02.2021 00:28, Saravana Kannan пишет:
>>>> This patch causes these new errors on NVIDIA Tegra30 Nexus 7 using recent linux-next:
>>>>
>>>>  gpio-1022 (cpu-pwr-req-hog): hogged as input
>>>>  max77620-pinctrl max77620-pinctrl: pin gpio4 already requested by max77620-pinctrl; cannot claim for gpiochip1
>>>>  max77620-pinctrl max77620-pinctrl: pin-4 (gpiochip1) status -22
>>>>  max77620-pinctrl max77620-pinctrl: could not request pin 4 (gpio4) from group gpio4  on device max77620-pinctrl
>>>>  gpio_stub_drv gpiochip1: Error applying setting, reverse things back
>>>>  gpio_stub_drv: probe of gpiochip1 failed with error -22
>>>>
>>>> Please fix, thanks in advance.
>>> I have a partial guess on why this is happening. So can you try this patch?
>>>
>>> Thanks,
>>> Saravana
>>>
>>> --- a/drivers/gpio/gpiolib.c
>>> +++ b/drivers/gpio/gpiolib.c
>>> @@ -4213,6 +4213,8 @@ static int gpio_stub_drv_probe(struct device *dev)
>>>          * gpio_device of the GPIO chip with the firmware node and then simply
>>>          * bind it to this stub driver.
>>>          */
>>> +       if (dev->fwnode && dev->fwnode->dev != dev)
>>> +               return -EBUSY;
>>>         return 0;
>>>  }
>>
>> This change doesn't help, exactly the same errors are still there.
> 
> Sorry, I see what's happening. Try this instead. If it works, I'll
> send out a proper patch.
> 
> Thanks,
> Saravana
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8e0564c50840..f3d0ffe8a930 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -56,8 +56,10 @@
>  static DEFINE_IDA(gpio_ida);
>  static dev_t gpio_devt;
>  #define GPIO_DEV_MAX 256 /* 256 GPIO chip devices supported */
> +static int gpio_bus_match(struct device *dev, struct device_driver *drv);
>  static struct bus_type gpio_bus_type = {
>         .name = "gpio",
> +       .match = gpio_bus_match,
>  };
> 
>  /*
> @@ -4199,6 +4201,14 @@ void gpiod_put_array(struct gpio_descs *descs)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_put_array);
> 
> +
> +static int gpio_bus_match(struct device *dev, struct device_driver *drv)
> +{
> +       if (dev->fwnode && dev->fwnode->dev != dev)
> +               return 0;
> +       return 1;
> +}
> +
>  static int gpio_stub_drv_probe(struct device *dev)
>  {
>         /*
> 

This works, thank you!

Tested-by: Dmitry Osipenko <digetx@gmail.com>
