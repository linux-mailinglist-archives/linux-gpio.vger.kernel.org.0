Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CACCC927FB
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 17:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfHSPHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 11:07:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46413 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbfHSPHr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 11:07:47 -0400
Received: by mail-pg1-f194.google.com with SMTP id m3so1370403pgv.13;
        Mon, 19 Aug 2019 08:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hd5r0WEwP797Bcjl677J0kfX+yGFvnC6jJRdRPfYUHE=;
        b=e9IwPue31vXYimlp3bK+fSUjE5BQzSNQp/qoupT2K3YzseSWcP6spDQqQQKfszOaUa
         YAMWS0gJEfcqnZYNyg0wTeBKR5M807tlc7ZJ4aXgKDZU/EmJNxY4tQbQ6jSXsgsNF4GC
         On/XGCZWJOZDcKDRfG+qE5q6rKkB2NtcdpeGerUoYQs9Ihf5IoFe/dWu2e9tW96DieWQ
         90B+V0Frr8Muqoa7+aNwswRoHdTW2y3GaHgsC9OhyfPRzuXWs3TE7QcgQgZd8i64VSEp
         evY/zt/IN2I5HNfszQ+laplxQR7hvApo+TGHEqtf2OoFLQGUBKj52YX3FQT90CjsH01/
         tqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hd5r0WEwP797Bcjl677J0kfX+yGFvnC6jJRdRPfYUHE=;
        b=QLpWpEY4N9ekbTyIS22b6kegItiE27qX0yGT3FPt0I16qb+OkXhKWQB5CFftkVXWB2
         9/40ZNsk7IGw/qPW7NgAQy6B6U1402RWpD0lojgU+SJdeOJlmho19dyyJpmPjjZDvRDa
         aBbuocKqwL1Nf8j1AozgNRdN+4e7XtHM86zu1fcWeZbp8sfgfP/IjeSHFvKzENTO3LgI
         izv4Mxv+eAaZNEh91JhL+5XomoOcqCdZ1vuPJm3l75GMQI45OCmaefnZoPw2z8vpuZha
         GO858cnygzHKVwecz3mKViW5+Zgxk+NGC0pMW1cc/M52Xidnu1yEol9KE4ngJdczNwgd
         ztdw==
X-Gm-Message-State: APjAAAV6T9PjLOfVVE4RhCEFZHZbc6SgwxNyiAi/00ub+wrC4IsMLBUS
        OaJ+Kyc7Ru4fPb9xoxgDSENeWVJ1H1/sGv57Ol8=
X-Google-Smtp-Source: APXvYqyf1tTOFKwnnkjydQxzYuwsYNGgVwWGdJg3bsxdR2Vpue/v9ezEdgyTsR26yvKaDBUO4BjeDfHOeIWF/viDWIo=
X-Received: by 2002:a63:e54f:: with SMTP id z15mr20272610pgj.4.1566227266644;
 Mon, 19 Aug 2019 08:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com>
In-Reply-To: <1566221225-5170-1-git-send-email-xuwei5@hisilicon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Aug 2019 18:07:34 +0300
Message-ID: <CAHp75Vct3qtR5bDF6iALmduKEEq+gNL-btmzQVuWq_hYsmxKhw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: pl061: Fix the issue failed to register the ACPI interrtupion
To:     Wei Xu <xuwei5@hisilicon.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
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

On Mon, Aug 19, 2019 at 4:29 PM Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Invoke acpi_gpiochip_request_interrupts after the acpi data has been
> attached to the pl061 acpi node to register interruption.
>
> Otherwise it will be failed to register interruption for the ACPI case.
> Because in the gpiochip_add_data_with_key, acpi_gpiochip_add is invoked
> after gpiochip_add_irqchip but at that time the acpi data has not been
> attached yet.
>
> Tested with below steps:
>
>         qemu-system-aarch64 \
>         -machine virt,gic-version=3 -cpu cortex-a57 \
>         -m 1G,maxmem=4G,slots=4 \
>         -kernel Image -initrd rootfs.cpio.gz \
>         -net none -nographic  \
>         -bios QEMU_EFI.fd  \
>         -append "console=ttyAMA0 acpi=force earlycon=pl011,0x9000000"
>
> The pl061 interruption is missed and the following output is not in the
> /proc/interrupts on the v5.3-rc4 compared with the v5.2.0-rc7.
>
>          43:          0  ARMH0061:00   3 Edge      ACPI:Event

The proper fix is to revert the culprit since we call
acpi_gpiochip_request_interrupts() for all controllers.
Linus, please re-do the approach with IRQ handling, it seems broadly
regress with ACPI enabled platforms.

-- 
With Best Regards,
Andy Shevchenko
