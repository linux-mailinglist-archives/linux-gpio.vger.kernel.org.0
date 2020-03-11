Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30401181C8B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2020 16:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgCKPna (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Mar 2020 11:43:30 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:38788 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729824AbgCKPn3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2020 11:43:29 -0400
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jC3Vv-0003YB-Q2; Wed, 11 Mar 2020 16:43:19 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 04E17100F5A; Wed, 11 Mar 2020 16:43:18 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Tim Harvey <tharvey@gateworks.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Marc Zyngier <marc.zyngier@arm.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        "open list\:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v8 07/14] gpio: thunderx: Use the default parent apis for {request,release}_resources
In-Reply-To: <CAJ+vNU2gnKKxX2YL1JUSnpF7qNqKVAsPhC2emv=Y79HPJbZXzw@mail.gmail.com>
References: <20190430101230.21794-1-lokeshvutla@ti.com> <20190430101230.21794-8-lokeshvutla@ti.com> <CAJ+vNU2gnKKxX2YL1JUSnpF7qNqKVAsPhC2emv=Y79HPJbZXzw@mail.gmail.com>
Date:   Wed, 11 Mar 2020 16:43:18 +0100
Message-ID: <87zhcmkicp.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tim,

Tim Harvey <tharvey@gateworks.com> writes:
> On Tue, Apr 30, 2019 at 3:14 AM Lokesh Vutla <lokeshvutla@ti.com> wrote:
>> -       if (parent_data && parent_data->chip->irq_request_resources) {
>> -               r = parent_data->chip->irq_request_resources(parent_data);
>> -               if (r)
>> -                       goto error;
>> -       }
>> +       r = irq_chip_request_resources_parent(data);
>> +       if (r)
>> +               gpiochip_unlock_as_irq(&txgpio->chip, txline->line);
>
> This patch breaks irq resources for thunderx-gpio as
> parent_data->chip->irq_request_resources is undefined thus your new
> irq_chip_request_resources_parent() returns -ENOSYS causing this
> function to return an error where as before it would happily return 0.
>
> Is the following the correct fix or should we qualify
> data->parent_data->chip->irq_request_resources before calling
> irq_chip_request_resources_parent() in thunderx-gpio?

You are not supposed to fiddle with parent data at all. Just because C
allows you is no excuse to violate abstractions in the first place.

irq_chip_request_resources_parent() rightfully returns -ENOSYS when it
can't request a resource from the parent chip because that chip does not
have anything to offer.

It's up to the caller to do something sensible with the return code. If
your chip is happy with the parent not providing it then handle
-ENOSYS. None of the chip callbacks should return -ENOSYS. If one does
then that wants to be fixed.

Thanks,

        tglx


