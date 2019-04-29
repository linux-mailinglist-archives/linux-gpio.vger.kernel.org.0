Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B24DF85
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 11:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfD2JfX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 05:35:23 -0400
Received: from foss.arm.com ([217.140.101.70]:51614 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbfD2JfX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Apr 2019 05:35:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 773B880D;
        Mon, 29 Apr 2019 02:35:22 -0700 (PDT)
Received: from [10.1.196.92] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10AE03F5AF;
        Mon, 29 Apr 2019 02:35:20 -0700 (PDT)
Subject: Re: [RFC PATCH 2/3] irqchip/exiu: implement ACPI gpiolib/irqchip
 support
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Graeme Gregory <graeme.gregory@linaro.org>
References: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
 <20190425102020.21533-3-ard.biesheuvel@linaro.org>
 <1fbbfc30-7389-5618-a046-ab8872882494@arm.com>
 <CAKv+Gu99JXhNnUPpfN274qN7+TJXvFTAatn_31yDDAcrU7LpaQ@mail.gmail.com>
 <eedc61f7-5c71-46eb-0f06-18daa9c5b5df@arm.com>
 <CAKv+Gu-RnR5=RqW7=GTaUYSpQUSTLpCfaUQfASxha-KhcxY4_g@mail.gmail.com>
 <CAKv+Gu_7tprJ7UOowQ+3fhoO2Sq2yJ8SKzcM5OiZE3eWm=o_Tw@mail.gmail.com>
 <CAKv+Gu-7BNe9Zk-zPe1_SZmGH=5P+PubUc2G+03+ZWt=eD==Bg@mail.gmail.com>
From:   Marc Zyngier <marc.zyngier@arm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=marc.zyngier@arm.com; prefer-encrypt=mutual; keydata=
 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
Organization: ARM Ltd
Message-ID: <74beef02-64fe-5ca4-5f9e-daf230384446@arm.com>
Date:   Mon, 29 Apr 2019 10:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu-7BNe9Zk-zPe1_SZmGH=5P+PubUc2G+03+ZWt=eD==Bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/04/2019 10:09, Ard Biesheuvel wrote:
> On Sat, 27 Apr 2019 at 00:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>>
>> On Fri, 26 Apr 2019 at 13:45, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>>>
>>> On Fri, 26 Apr 2019 at 10:44, Marc Zyngier <marc.zyngier@arm.com> wrote:
>>>>
>>>> On 26/04/2019 09:24, Ard Biesheuvel wrote:
>>>>> On Thu, 25 Apr 2019 at 17:33, Marc Zyngier <marc.zyngier@arm.com> wrote:
>>>>>>
>>>>>> Hi Ard,
>>>>>>
>>>>>> On 25/04/2019 11:20, Ard Biesheuvel wrote:
>>>>>>> Expose the existing EXIU hierarchical irqchip domain code to permit
>>>>>>> the interrupt controller to be used as the irqchip component of a
>>>>>>> GPIO controller on ACPI systems.
>>>>>>>
>>>>>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>>>>>> ---
>>>>>>>  drivers/irqchip/irq-sni-exiu.c | 82 +++++++++++++++++---
>>>>>>>  1 file changed, 73 insertions(+), 9 deletions(-)
>>>>>>>
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +int exiu_acpi_init(struct platform_device *pdev, struct gpio_chip *gc)
>>>>>>> +{
>>>>>>> +     struct irq_domain *parent_domain = NULL, *domain;
>>>>>>> +     struct resource *res;
>>>>>>> +     int irq;
>>>>>>> +
>>>>>>> +     irq = platform_get_irq(pdev, 0);
>>>>>>> +     if (irq > 0)
>>>>>>> +             parent_domain = irq_get_irq_data(irq)->domain;
>>>>>>> +
>>>>>>> +     if (!parent_domain) {
>>>>>>> +             dev_err(&pdev->dev, "unable to obtain parent domain\n");
>>>>>>> +             return -ENODEV;
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>>>>>> +     if (!res) {
>>>>>>> +             dev_err(&pdev->dev, "failed to parse memory resource\n");
>>>>>>> +             return -ENXIO;
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     domain = exiu_init(parent_domain, dev_fwnode(&pdev->dev), res);
>>>>>>> +     if (IS_ERR(domain)) {
>>>>>>> +             dev_err(&pdev->dev, "failed to create IRQ domain (%ld)\n",
>>>>>>> +                     PTR_ERR(domain));
>>>>>>> +             return PTR_ERR(domain);
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     gc->irq.domain = domain;
>>>>>>> +     gc->to_irq = exiu_acpi_gpio_to_irq;
>>>>>>> +
>>>>>>> +     dev_info(&pdev->dev, "%d interrupts forwarded\n", NUM_IRQS);
>>>>>>> +
>>>>>>> +     return 0;
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL(exiu_acpi_init);
>>>>>>> +#endif
>>>>>>>
>>>>>>
>>>>>> I must say I'm not overly keen on this function. Why can't this be
>>>>>> probed as an ACPI device, creating the corresponding domain, and leaving
>>>>>> to the GPIO driver the task of doing the GPIO stuff?
>>>>>>
>>>>>
>>>>> Because ACPI only permits 'system' interrupts or GPIO interrupts, it
>>>>> does not allow arbitrary device objects in the ACPI namespace to be
>>>>> targeted as interrupt controllers.
>>>>
>>>> Hmmm. We already have at least one driver (irq-mbigen.c) that does
>>>> exactly that. It uses interrupts from the GIC (it is notionally behind
>>>> the ITS), and offers a bunch of interrupt lines itself. Why is it different?
>>>>
>>>
>>> You are right, it isn't. It turns out that there is another way to
>>> signal ACPI events based on interrupts, and it involves the ACPI0013
>>> GED device. I will try to model it that way instead.
>>>
>>
>> Unfortunately, this doesn't work either. The GED device can respond to
>> GSIVs only, and so going via the EXIU doesn't work.
>>
>> I have attempted to hack it up via AML, but the GED driver uses a
>> threaded interrupt, and so the interrupt is re-enabled at the GIC
>> before the AML handler is executed (which clears it in the EXIU)
>>
>> For the RAS case, I guess we could let the firmware pick an arbitrary
>> unused SPI and signal that directly into the GIC, but for the power
>> button (which is physically wired to the EXIU), we have to model the
>> EXIU either has a separate pseudo-GPIO controller, or as part of the
>> real GPIO block.
> 
> (+ Mika)
> 
> I made some progress describing the EXIU and GPIO controllers as follow.
> 
>     Device (EXIU) {
>       Name (_HID, "SCX0008")
>       Name (_UID, Zero)
>       Name (_CRS, ResourceTemplate () {
>         Memory32Fixed (ReadWrite, SYNQUACER_EXIU_BASE, SYNQUACER_EXIU_SIZE)
>         Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake) {
>           144, 145, 146, 147, 148, 149, 150, 151,
>           152, 153, 154, 155, 156, 157, 158, 159,
>           160, 161, 162, 163, 164, 165, 166, 167,
>           168, 169, 170, 171, 172, 173, 174, 175,
>         }
>       })
>       Name (_DSD, Package () {
>         ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>         Package () {
>           Package () { "socionext,spi-base", 112 },
>         }
>       })
>     }
> 
> and
> 
>     Device (GPIO) {
>       Name (_HID, "SCX0007")
>       Name (_UID, Zero)
>       Name (_CRS, ResourceTemplate () {
>         Memory32Fixed (ReadWrite, SYNQUACER_GPIO_BASE, SYNQUACER_GPIO_SIZE)
>         Interrupt (ResourceConsumer, Edge, ActiveLow,
> ExclusiveAndWake, 0, "\\_SB.EXIU") {
>           7,
>         }
>       })
>       Name (_AEI, ResourceTemplate () {
>         GpioInt (Edge, ActiveHigh, ExclusiveAndWake, PullDefault, 0,
> "\\_SB.GPIO")
>         {
>           7
>         }
>       })
>       Method (_E07) {
>         Notify (\_SB.PWRB, 0x80)
>       }
>     }
> 
> This is actually a fairly accurate depiction of reality: the EXIU is a
> separate unit, and only some of the GPIOs are routed through it.
> 
> In the GPIO controller's to_irq() callback, I return the Linux IRQ
> number based on the platform IRQ resources claimed by the GPIO device,
> and I end up with something like
> 
>  46:          0 ... 0      EXIU   7 Edge      ACPI:Event
> 
> which looks correct to me. debugfs tells me it is mapped as
> 
> handler:  handle_fasteoi_irq
> device:   (null)
> status:   0x00000001
> istate:   0x00000020
>             IRQS_ONESHOT
> ddepth:   0
> wdepth:   1
> dstate:   0x03404201
>             IRQ_TYPE_EDGE_RISING
>             IRQD_ACTIVATED
>             IRQD_IRQ_STARTED
>             IRQD_SINGLE_TARGET
>             IRQD_WAKEUP_STATE
> node:     0
> affinity: 0-23
> effectiv: 0
> domain:  \_SB_.EXIU
>  hwirq:   0x7
>  chip:    EXIU
>   flags:   0x55
>              IRQCHIP_SET_TYPE_MASKED
>              IRQCHIP_MASK_ON_SUSPEND
>              IRQCHIP_SKIP_SET_WAKE
>              IRQCHIP_EOI_THREADED
>  parent:
>     domain:  irqchip@(____ptrval____)-1
>      hwirq:   0x97
>      chip:    GICv3
>       flags:   0x15
>                  IRQCHIP_SET_TYPE_MASKED
>                  IRQCHIP_MASK_ON_SUSPEND
>                  IRQCHIP_SKIP_SET_WAKE
> 
> The EXIU domain is described as
> 
> name:   \_SB_.EXIU
>  size:   32
>  mapped: 1
>  flags:  0x00000041
>  parent: irqchip@(____ptrval____)-1
>     name:   irqchip@(____ptrval____)-1
>      size:   0
>      mapped: 55
>      flags:  0x00000041
> 
> Unfortunately, the system locks up entirely as soon as the interrupt
> is triggered (I use a DIP switch in this case). So while the
> description is accurate and the correct interrupt does get mapped,
> something is still not working entirely as expected.
> 
> Any thoughts?

It feels like an interrupt storm with an edge vs level misconfiguration.
Can you check that the IRQ_TYPE_EDGE_RISING is correctly propagated
across the hierarchy?

The EXIU block has:

Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake) {

while the GPIO block has:

Interrupt (ResourceConsumer, Edge, ActiveLow, ExclusiveAndWake, 0,
"\\_SB.EXIU")

and the interrupt is configured for yet another trigger
(IRQ_TYPE_EDGE_RISING).

Hope this helps,

	M.
-- 
Jazz is not dead. It just smells funny...
