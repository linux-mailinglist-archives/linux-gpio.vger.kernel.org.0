Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F1A8EC6E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 15:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732059AbfHONKh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 09:10:37 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36353 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730635AbfHONKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 09:10:37 -0400
Received: by mail-pf1-f193.google.com with SMTP id w2so1324768pfi.3;
        Thu, 15 Aug 2019 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O7UsU+IB0EE7NVhDIGHpvj8aJpCdK3kTtUuGx3BwSGI=;
        b=gwFFNodooT/qbINiYVSeCDxk71mXjZiC7S+XJFZbRt1moD9TF+wTC//3cCZ6/gW7e2
         +GFwiNW47z0zBpVZX//63Au4UIdulWLXm/DQAOnR4MsJiW67WdTTSklMMeSwxBhb5JcO
         t0l6Ec2FpTnKg344AKoeu8+lrDnIRHI5ItTDxzG+Z7rFrRvkOJyIQfycFlBwI15/YKmv
         4/ia0TG1iMaObQpMJqDXIEPM4sSipwr51IWwAW4JWjrI01Mzg4kOzP+x7Qc0d+bN/Y+4
         f1PzORsZDI+3mI0MHPrAoHtD7KFd9HtvtOTp+i9clArOf/kp+wcamMYifFFuSEPGcq/Q
         P9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7UsU+IB0EE7NVhDIGHpvj8aJpCdK3kTtUuGx3BwSGI=;
        b=grmq7xnZeyI/mrokkMvf9HmJqCaf9Y209sAPVX6/AEHIMBqo747vZvEFYfY5uL5q9q
         M3odjgoPYzr5IQR1xIrp6WovcOjcmXVEkqYZ8YF1qKvnpM1Rzg8qsHOw+4xHpRepcBpi
         6SR5CyCJPr0VJDwPiSRJI4h+qLGFrkEXP6/lUz0AaKWl3iUc5+QJR7U/16pdakwENSav
         TvmAWiMUvWRL1Wp9gTc5Ba48a8uWA/qXvOtgY+A+DAzD0jQP5nvxWzEk7k8HuN1KcjGG
         KkiiRkemtJaS7d2hzOhUTEdpRSSYa60tf0W/LVPMVL7RZ0FQDqfhh5bF6g0qSze8qmdA
         g8Nw==
X-Gm-Message-State: APjAAAUODzYGo4YsHzhTLfC3XkBzHWJ6wRal6tAiEZwvA4TwTc1ibBv4
        bXIZ4rF6ibLNWypCSgTNqEX7hVNuEPnfPhb6N+uC3LZm
X-Google-Smtp-Source: APXvYqx8IquyCXVRV8V1mOek+yuM6k8+je0LcuDmJciyOCZuG5B1qZv11I1EODVf93jqY/FOYUV2IGqY6ihgUkQsk2Q=
X-Received: by 2002:a05:6a00:8e:: with SMTP id c14mr5173336pfj.241.1565874636467;
 Thu, 15 Aug 2019 06:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <5D514D6F.4090904@hisilicon.com>
In-Reply-To: <5D514D6F.4090904@hisilicon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 15 Aug 2019 16:10:24 +0300
Message-ID: <CAHp75VcKNZeq80hw5qjKKuh8Qg=WUrXPSpcy6yx5h-_7RHah+g@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Fix the issue failed to register the ACPI interruption
To:     Wei Xu <xuwei5@hisilicon.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linuxarm <linuxarm@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Shiju Jose <shiju.jose@huawei.com>, jinying@hisilicon.com,
        Zhangyi ac <zhangyi.ac@huawei.com>,
        "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
        Tangkunshan <tangkunshan@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 2:30 PM Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Invoke acpi_gpiochip_request_interrupts after the acpi data has been
> attached to the pl061 acpi node to register interruption.
>
> Otherwise it will be failed to register interruption for the ACPI case.
> Because in the gpiochip_add_data_with_key, acpi_gpiochip_add is invoked
> after gpiochip_add_irqchip but at that time the acpi data has not been
> attached yet.
>
> Tested with below steps on QEMU v4.1.0-rc3 and Linux kernel v5.3-rc4,
> and found pl061 interruption is missed in the /proc/interrupts:
> 1.
> qemu-system-aarch64 \
> -machine virt,gic-version=3 -cpu cortex-a57 \
> -m 1G,maxmem=4G,slots=4 \
> -kernel Image -initrd rootfs.cpio.gz \
> -net none -nographic  \
> -bios QEMU_EFI.fd  \
> -append "console=ttyAMA0 acpi=force earlycon=pl011,0x9000000"
>
> 2. cat /proc/interrupts in the guest console:
> estuary:/$ cat /proc/interrupts
> CPU0
> 2:       3228     GICv3  27 Level     arch_timer
> 4:         15     GICv3  33 Level     uart-pl011
> 42:          0     GICv3  23 Level     arm-pmu
> IPI0:         0       Rescheduling interrupts
> IPI1:         0       Function call interrupts
> IPI2:         0       CPU stop interrupts
> IPI3:         0       CPU stop (for crash dump) interrupts
> IPI4:         0       Timer broadcast interrupts
> IPI5:         0       IRQ work interrupts
> IPI6:         0       CPU wake-up interrupts
> Err:          0
>
> Fixes: 04ce935c6b2a ("gpio: pl061: Pass irqchip when adding gpiochip")

Linus, I'm wondering if we can do this for all inside the GPIO library.
Thoughts?

--
With Best Regards,
Andy Shevchenko
