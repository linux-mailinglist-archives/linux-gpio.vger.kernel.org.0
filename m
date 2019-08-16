Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A8A90342
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2019 15:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbfHPNkx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Aug 2019 09:40:53 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37450 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfHPNkw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2019 09:40:52 -0400
Received: by mail-pl1-f196.google.com with SMTP id bj8so2477487plb.4;
        Fri, 16 Aug 2019 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vDN0+dyr6DMJd4+K52kh69879Me//RnUZQzc4InlSuI=;
        b=pKlnlCGxRoVBUmrLdA9fApZTDvZ5DJq3I+0kCVBqienNx9Qn7pdopdYm+dyXTWCi4e
         ld85emkhKH4xYp5n5lnIHz47ik8yefKVI2kFdE03AHYTvMEkyOdF0qM2zLwuzXmxbadi
         brekO1yP9CUCjg8NFI4TeAbMfP4dggWQUssO3eCaHccAm79SCnyTosfUSTusDQrB+MSL
         PllpCHry3OMcTFyCmbgX4XBbKwsgBO9nNMI0HBqOOx3WPDHErJ0ylYPB9GhHg0m8PzYL
         sBSZhoHVSVTGIOc2Kr9FdHg8PZ7X02lzsJVJHvQFu3+mv6c91tDwRj4pd/E4WH0jwJPA
         HOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vDN0+dyr6DMJd4+K52kh69879Me//RnUZQzc4InlSuI=;
        b=L2/bq+gEyaijiKYNL4ZsthRCHA5drjbOegIGZmXDwwlY0hAv1idngl82i0M57o3nes
         fZXV7xEZsEAfioIneard5luntQ9nVO3VovHG+a7E3fCCbHCP5Bquk0jFw2q8O4zV2+md
         LfcShBD9MTdV/mMy75sOd7O78R3xXH0koxEHXhQbePptwJc5fpqs1ybw5zvbjE+aFvFn
         u2ieB8Rj73LrTechSNldp2gGyeu0dKxkDITGlh+TBlD/RyBG3CuYpUyCpFN78lhuXuUK
         jZP5n2FMNXfTaxne9VdpEmUGRC/bDuZL+lGNZpragVDUwlKIDUjh3VxwFQRsiwoArjtl
         9tGA==
X-Gm-Message-State: APjAAAW41DLiGVeLMjSs1I74J/h5OWNflyey71LD9kK0rgI7u9P+tD3e
        H5Ov/N8m4PtHUBNuX3pq+1oWd1RPrpwudfg+q3M=
X-Google-Smtp-Source: APXvYqyOqNRH0WBVdfxBLkaw7mQ2WBZbnECGUjAk75ks9d9mQcn1NWOwlq96XVwE8oEFizIMPWTo+W4QkBOhfTK99nE=
X-Received: by 2002:a17:902:e106:: with SMTP id cc6mr9230690plb.255.1565962852141;
 Fri, 16 Aug 2019 06:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <1565946336-20080-1-git-send-email-xuwei5@hisilicon.com>
In-Reply-To: <1565946336-20080-1-git-send-email-xuwei5@hisilicon.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 16 Aug 2019 16:40:40 +0300
Message-ID: <CAHp75VfjE4V7yY1b3JYd_Mk9-8RTok2WCN=-MMrUBw5NN90o2A@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pl061: Fix the issue failed to register the ACPI interrtupion
To:     Wei Xu <xuwei5@hisilicon.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linuxarm <linuxarm@huawei.com>,
        shameerali.kolothum.thodi@huawei.com,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        John Garry <john.garry@huawei.com>, salil.mehta@huawei.com,
        shiju.jose@huawei.com, jinying@hisilicon.com,
        zhangyi.ac@huawei.com, liguozhu@hisilicon.com,
        tangkunshan@huawei.com, huangdaode <huangdaode@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 16, 2019 at 12:07 PM Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Invoke acpi_gpiochip_request_interrupts after the acpi data has been
> attached to the pl061 acpi node to register interruption.
>
> Otherwise it will be failed to register interruption for the ACPI case.
> Because in the gpiochip_add_data_with_key, acpi_gpiochip_add is invoked
> after gpiochip_add_irqchip but at that time the acpi data has not been
> attached yet.

> 2. cat /proc/interrupts in the guest console:
>
>         estuary:/$ cat /proc/interrupts
>                    CPU0
>         2:         3228     GICv3  27 Level     arch_timer
>         4:           15     GICv3  33 Level     uart-pl011
>         42:           0     GICv3  23 Level     arm-pmu
>         IPI0:         0       Rescheduling interrupts
>         IPI1:         0       Function call interrupts
>         IPI2:         0       CPU stop interrupts
>         IPI3:         0       CPU stop (for crash dump) interrupts
>         IPI4:         0       Timer broadcast interrupts
>         IPI5:         0       IRQ work interrupts
>         IPI6:         0       CPU wake-up interrupts
>         Err:          0
>
> But on QEMU v3.0.0 and Linux kernel v5.2.0-rc7, pl061 interruption is
> there as below:
>
>         estuary:/$ cat /proc/interrupts
>                    CPU0
>           2:       2648     GICv3  27 Level     arch_timer
>           4:         12     GICv3  33 Level     uart-pl011
>          42:          0     GICv3  23 Level     arm-pmu
>          43:          0  ARMH0061:00   3 Edge      ACPI:Event
>         IPI0:         0       Rescheduling interrupts
>         IPI1:         0       Function call interrupts
>         IPI2:         0       CPU stop interrupts
>         IPI3:         0       CPU stop (for crash dump) interrupts
>         IPI4:         0       Timer broadcast interrupts
>         IPI5:         0       IRQ work interrupts
>         IPI6:         0       CPU wake-up interrupts
>         Err:          0

In above show only affected line.

> And the whole dmesg log on Linux kernel v5.2.0-rc7 is as below:

NO!
Please, remove this huge noise!

-- 
With Best Regards,
Andy Shevchenko
