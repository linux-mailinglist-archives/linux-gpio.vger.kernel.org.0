Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D03132E9E
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 19:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbgAGSmB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 13:42:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26091 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728391AbgAGSmB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 13:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578422520;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gENCu0UbMTJ8+c3QrLGBJl46CsGhh7kSNycoBVRfXbs=;
        b=fVMsB8whIvFAUKxuWPGaKO7/0AROiZDwzQStxGOZw7T/shAoiHSaJPiSTPDzEvhBiYiH71
        x5TslNROZjzPWQVAich6wPa4X2AM9mtskH3fmyCnkhq0rtI1PtBFFxxz5F86yq8hnBMOs1
        gXnetpB24KVsUFkqziKPslA/MmrrYhA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-k7QaNDjcPxWvvgHPyPZqHQ-1; Tue, 07 Jan 2020 13:41:59 -0500
X-MC-Unique: k7QaNDjcPxWvvgHPyPZqHQ-1
Received: by mail-wm1-f70.google.com with SMTP id t4so160614wmf.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 10:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gENCu0UbMTJ8+c3QrLGBJl46CsGhh7kSNycoBVRfXbs=;
        b=jdLo8GhgZsDZAIruWsDMeVY93bcR+WivRspVpt1KTF3C8zhF3r69eGF7EPSYxc8Eqx
         aNd3Q34tgd0EqhhdQG9jhNNU6NcBbRo0lkOBsG5t6LSQVHd3hYesQfCjziGo6fpm99F+
         2v+IMkHPF8F6rFiPhd3WTPINBnIkT6tNQgQKYrqKI/wGQ4M6e+t91fmh+KHsH0EUB5oH
         8lP6pcz/qvBNw2VvaakbakHp5rUCLTcQejQU/YEdU7JS6KdUrOHr08rEDr33ppmEzNUb
         0vjqOFMY4YxLuOOu6QdFo98sfOIrRHcRgjsHqQyXJYv+wIyPR4ak5c7gTMOczFTa+L6x
         kalQ==
X-Gm-Message-State: APjAAAVXh7SqwDQDS7utOiIfQtDWGRKoeXqcFp69m29N7bkMc2yxuLdw
        HFxTakBE4zReHOWRK/NEao1Xr3qgQWjvBAUr/QRC61vXvBBsAXa4U69H329DsmX26QfWOKAFVgA
        djo612HrSjLfbfckF2sERYg==
X-Received: by 2002:a05:600c:2551:: with SMTP id e17mr447635wma.26.1578422518437;
        Tue, 07 Jan 2020 10:41:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpGM1svwLVg3Rk7KZDWMai3FCEe3dERy6+6LCgueZ2/2OxpDGfP5WHRBvAZG7YqRaPms0/kA==
X-Received: by 2002:a05:600c:2551:: with SMTP id e17mr447618wma.26.1578422518223;
        Tue, 07 Jan 2020 10:41:58 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id n3sm838121wrs.8.2020.01.07.10.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 10:41:57 -0800 (PST)
Subject: Re: [PATCH resend v2 2/2] gpiolib: acpi: Add honor_wakeup
 module-option + quirk mechanism
To:     Sasha Levin <sashal@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, stable@vger.kernel.org
References: <20200105160357.97154-3-hdegoede@redhat.com>
 <20200107183315.A2CE320848@mail.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <45cfd73c-0372-9622-b8c3-345aece253a7@redhat.com>
Date:   Tue, 7 Jan 2020 19:41:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200107183315.A2CE320848@mail.kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 07-01-2020 19:33, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
> 
> The bot has tested the following trees: v5.4.8, v4.19.93, v4.14.162, v4.9.208, v4.4.208.
> 
> v5.4.8: Failed to apply! Possible dependencies:
>      a5242f4858be ("gpiolib: acpi: Turn dmi_system_id table into a generic quirk table")
> 
> v4.19.93: Failed to apply! Possible dependencies:
>      a5242f4858be ("gpiolib: acpi: Turn dmi_system_id table into a generic quirk table")
> 
> v4.14.162: Failed to apply! Possible dependencies:
>      a5242f4858be ("gpiolib: acpi: Turn dmi_system_id table into a generic quirk table")
> 

Like with the previous patch adding this to 4.14 and later (which should apply cleanly once
the previous patch is applied) , leaving the others behind should be fine.

Thanks,

Hans



> v4.9.208: Failed to apply! Possible dependencies:
>      25e3ef894eef ("gpio: acpi: Split out acpi_gpio_get_irq_resource() helper")
>      2727315df3f5 ("gpiolib: acpi: Add Terra Pad 1061 to the run_edge_events_on_boot_blacklist")
>      61f7f7c8f978 ("gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot option and blacklist")
>      78d3a92edbfb ("gpiolib-acpi: Register GpioInt ACPI event handlers from a late_initcall")
>      85c73d50e57e ("gpio: acpi: Add managed variant of acpi_dev_add_driver_gpios()")
>      8a146fbe1f14 ("gpio: acpi: Call enable_irq_wake for _IAE GpioInts with Wake set")
>      993b9bc5c47f ("gpiolib: acpi: Switch to cansleep version of GPIO library call")
>      a5242f4858be ("gpiolib: acpi: Turn dmi_system_id table into a generic quirk table")
>      ca876c7483b6 ("gpiolib-acpi: make sure we trigger edge events at least once on boot")
>      e59f5e08ece1 ("gpiolib-acpi: Only defer request_irq for GpioInt ACPI event handlers")
> 
> v4.4.208: Failed to apply! Possible dependencies:
>      10cf4899f8af ("gpiolib: tighten up ACPI legacy gpio lookups")
>      25e3ef894eef ("gpio: acpi: Split out acpi_gpio_get_irq_resource() helper")
>      58383c78425e ("gpio: change member .dev to .parent")
>      61f7f7c8f978 ("gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot option and blacklist")
>      78d3a92edbfb ("gpiolib-acpi: Register GpioInt ACPI event handlers from a late_initcall")
>      85c73d50e57e ("gpio: acpi: Add managed variant of acpi_dev_add_driver_gpios()")
>      8a146fbe1f14 ("gpio: acpi: Call enable_irq_wake for _IAE GpioInts with Wake set")
>      993b9bc5c47f ("gpiolib: acpi: Switch to cansleep version of GPIO library call")
>      a5242f4858be ("gpiolib: acpi: Turn dmi_system_id table into a generic quirk table")
>      ca876c7483b6 ("gpiolib-acpi: make sure we trigger edge events at least once on boot")
>      e59f5e08ece1 ("gpiolib-acpi: Only defer request_irq for GpioInt ACPI event handlers")
> 
> 
> NOTE: The patch will not be queued to stable trees until it is upstream.
> 
> How should we proceed with this patch?
> 

