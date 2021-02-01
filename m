Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5DB30AD09
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 17:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhBAQuQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 11:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhBAQuK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 11:50:10 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC38CC061573;
        Mon,  1 Feb 2021 08:49:28 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e18so20423006lja.12;
        Mon, 01 Feb 2021 08:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9VdbASHiVmFzlRrCBkcgPO/Bb9c7Lp5JC3aGueKrB7w=;
        b=kPfZhEmLVIOVBOCVIlPCZJmSk0JBqzOoBhSvYEL4yjjzBe6NYjHz/rd6rFD1HpCSCw
         AjgtMdl0oQBfgXMFHmKSOVnj5WK8qSABWsPJBNiZP/hW49izNJY6hGwE6YSFRXTXUEMX
         ebdPBO3Du0NikGKlyrkYrEbdhY/w1rmg7npYWlFwdFZCkrc9zlU42UM5/L56gYXarJOo
         wRq6tu4rLrh+2QxKe5FbbEeHoJ+C/F+Qpp7vbmCyB8Yqt64mAupTmfza/hySkY7bUwLs
         vnDMf+zH3o8GNIY/filvZqjh66MOpEBBhDd/dAif+NuTxB9yJN/BZgCMR9h/wZ6saayX
         9qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9VdbASHiVmFzlRrCBkcgPO/Bb9c7Lp5JC3aGueKrB7w=;
        b=KlLlsb3bJWTE40Ae9fF2QUF+GsqSs5c0+KoPi/ugBIvVl/7rTfj9aN4GKhmFj8qrmQ
         Dphlo3LdV+UB5+PM4WaF7VizQPS0yDUL5g4f4LizzQ3eqjrGftBhgXSg2UWx3/aXAsKF
         3tKi3G0G0P8ocDdHcEBWMWuMHDq47FKZwWVLcAeKciZ3TRDeMpNxQxWYrtvW5WZlya7p
         jEDj7aw0Q3TpzwkVhP8+U+Tvn/3OT4I9ps+rlZsIgynGh6eYbfNgY4INhrYL2A7wEb23
         pIX0wa83eNcMskJxlpOXgEiv2c1Y4ovEq9VonCPpV8F/HLuYFuDV9GUu9E4X0RzStp2y
         ND8g==
X-Gm-Message-State: AOAM530g5dM0Yva+NuJ+Rn0FIbku/8EuOIgIrknSi/EoIgIa10hOoby8
        EoE46RCNC9tV9IjaBLdjJFGw9UyZQK0=
X-Google-Smtp-Source: ABdhPJyqUln8hLIlpdaaPXa0X70kBzyZJ6VG5Y5wvGlI+AQBzrIzvi28yRY26QMKXKPCzztPNjrrwQ==
X-Received: by 2002:a2e:b8d3:: with SMTP id s19mr10951810ljp.97.1612198167162;
        Mon, 01 Feb 2021 08:49:27 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id x20sm3011428lfe.256.2021.02.01.08.49.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 08:49:26 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <09502076-02e9-39ee-e432-24260696a927@gmail.com>
Date:   Mon, 1 Feb 2021 19:49:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAGETcx_CYKczo+geD7yDo+T2+_-tgGYwtjR-2sMPQYHuz-wAgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

01.02.2021 00:28, Saravana Kannan пишет:
>> This patch causes these new errors on NVIDIA Tegra30 Nexus 7 using recent linux-next:
>>
>>  gpio-1022 (cpu-pwr-req-hog): hogged as input
>>  max77620-pinctrl max77620-pinctrl: pin gpio4 already requested by max77620-pinctrl; cannot claim for gpiochip1
>>  max77620-pinctrl max77620-pinctrl: pin-4 (gpiochip1) status -22
>>  max77620-pinctrl max77620-pinctrl: could not request pin 4 (gpio4) from group gpio4  on device max77620-pinctrl
>>  gpio_stub_drv gpiochip1: Error applying setting, reverse things back
>>  gpio_stub_drv: probe of gpiochip1 failed with error -22
>>
>> Please fix, thanks in advance.
> I have a partial guess on why this is happening. So can you try this patch?
> 
> Thanks,
> Saravana
> 
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -4213,6 +4213,8 @@ static int gpio_stub_drv_probe(struct device *dev)
>          * gpio_device of the GPIO chip with the firmware node and then simply
>          * bind it to this stub driver.
>          */
> +       if (dev->fwnode && dev->fwnode->dev != dev)
> +               return -EBUSY;
>         return 0;
>  }

This change doesn't help, exactly the same errors are still there.
