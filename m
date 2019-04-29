Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 724F5DEB1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 11:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727239AbfD2JKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 05:10:01 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46791 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbfD2JKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 05:10:01 -0400
Received: by mail-io1-f65.google.com with SMTP id p23so8252099iol.13
        for <linux-gpio@vger.kernel.org>; Mon, 29 Apr 2019 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ih8hG8q4IaybDOZY3Rf+4Yk3q7/Hf/ofVFl1Lr6j8Cg=;
        b=Yg8Hx1TP+Xtcajo/o3u7dmrtAUiUf5kQ61hNmyMD8cDk0xnX7ESDyOG31M/myEMrxu
         d3nnhuCunolDisrREnv13MrAXTLI8uDDKnXTeQH8fBzt69Wy5ZcJvcosyFVK6iKeXW0P
         ntYz3tL8lBlbrJhPNOR2ySmOdL/ZwMNg5LtBJ3kKokCW2lfukjfKepQQudK7GomD9Ptt
         3vTUniHad/sMYapMoIK4a8/POJJyTYIRR3MUPqCpAqSVBIvXI3k+ztNG1BRUxMsDHevq
         UJWaODhPEv6PAgJjjDy+JbJts/UaIQnACJe+9p1sdS2mD27HO44GDQfm/RKQ26mmNgSB
         H4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ih8hG8q4IaybDOZY3Rf+4Yk3q7/Hf/ofVFl1Lr6j8Cg=;
        b=Aa8MKePQLinwmVWGFwWGqtMTIFGru8dd5NATBnkgFvbrZtlE82TLWpMDm5EHKVbcH+
         aZAcUPbDb4fEcOKvcpzINuDJuJDgunoeL0aNgjnsOOcebOP0/W5JN1rhSw9Xt34aG0t2
         eldPg+sIIeKHQESlZH4uldo/+Mg9/LBnEFr3gVAjhw9jyZVn7p6+aavwr0U7pd5Uypap
         QMouW2BBGEl6TErt/cJVY3NFiIGmCnJI1IztlsiHG9cE13kwRMpMygwxDlf44vWZoni/
         N/IvJNMOWAn8Ajh36ZxFByfz96qAERvgLxI4jQzLAtQZvo1Dwyt1hJChEIqt3qWzA2T0
         xAuw==
X-Gm-Message-State: APjAAAXHgvHFqWw5V4Qw0gwhhns1gv4sRe0bCEvHlW+F5qUI0WpPeAN1
        4XtbvQrwD8ftAhRWgM0wxqgujcLTGu7Z8qGAQ6/92w==
X-Google-Smtp-Source: APXvYqwExWNhO+HkpzCjA7yLl1kJDbjA9zowSQDB5j+cHoChJNePooNkPCWJNFt+KhLzzF3EpTEB5EStbyOJbPBYAY8=
X-Received: by 2002:a6b:7b47:: with SMTP id m7mr495836iop.173.1556529000223;
 Mon, 29 Apr 2019 02:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190425102020.21533-1-ard.biesheuvel@linaro.org>
 <20190425102020.21533-3-ard.biesheuvel@linaro.org> <1fbbfc30-7389-5618-a046-ab8872882494@arm.com>
 <CAKv+Gu99JXhNnUPpfN274qN7+TJXvFTAatn_31yDDAcrU7LpaQ@mail.gmail.com>
 <eedc61f7-5c71-46eb-0f06-18daa9c5b5df@arm.com> <CAKv+Gu-RnR5=RqW7=GTaUYSpQUSTLpCfaUQfASxha-KhcxY4_g@mail.gmail.com>
 <CAKv+Gu_7tprJ7UOowQ+3fhoO2Sq2yJ8SKzcM5OiZE3eWm=o_Tw@mail.gmail.com>
In-Reply-To: <CAKv+Gu_7tprJ7UOowQ+3fhoO2Sq2yJ8SKzcM5OiZE3eWm=o_Tw@mail.gmail.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Mon, 29 Apr 2019 11:09:48 +0200
Message-ID: <CAKv+Gu-7BNe9Zk-zPe1_SZmGH=5P+PubUc2G+03+ZWt=eD==Bg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] irqchip/exiu: implement ACPI gpiolib/irqchip support
To:     Marc Zyngier <marc.zyngier@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Masahisa Kojima <masahisa.kojima@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Graeme Gregory <graeme.gregory@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 27 Apr 2019 at 00:27, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Fri, 26 Apr 2019 at 13:45, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > On Fri, 26 Apr 2019 at 10:44, Marc Zyngier <marc.zyngier@arm.com> wrote:
> > >
> > > On 26/04/2019 09:24, Ard Biesheuvel wrote:
> > > > On Thu, 25 Apr 2019 at 17:33, Marc Zyngier <marc.zyngier@arm.com> wrote:
> > > >>
> > > >> Hi Ard,
> > > >>
> > > >> On 25/04/2019 11:20, Ard Biesheuvel wrote:
> > > >>> Expose the existing EXIU hierarchical irqchip domain code to permit
> > > >>> the interrupt controller to be used as the irqchip component of a
> > > >>> GPIO controller on ACPI systems.
> > > >>>
> > > >>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > > >>> ---
> > > >>>  drivers/irqchip/irq-sni-exiu.c | 82 +++++++++++++++++---
> > > >>>  1 file changed, 73 insertions(+), 9 deletions(-)
> > > >>>
> > > >>
> > > >> [...]
> > > >>
> > > >>> +int exiu_acpi_init(struct platform_device *pdev, struct gpio_chip *gc)
> > > >>> +{
> > > >>> +     struct irq_domain *parent_domain = NULL, *domain;
> > > >>> +     struct resource *res;
> > > >>> +     int irq;
> > > >>> +
> > > >>> +     irq = platform_get_irq(pdev, 0);
> > > >>> +     if (irq > 0)
> > > >>> +             parent_domain = irq_get_irq_data(irq)->domain;
> > > >>> +
> > > >>> +     if (!parent_domain) {
> > > >>> +             dev_err(&pdev->dev, "unable to obtain parent domain\n");
> > > >>> +             return -ENODEV;
> > > >>> +     }
> > > >>> +
> > > >>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > >>> +     if (!res) {
> > > >>> +             dev_err(&pdev->dev, "failed to parse memory resource\n");
> > > >>> +             return -ENXIO;
> > > >>> +     }
> > > >>> +
> > > >>> +     domain = exiu_init(parent_domain, dev_fwnode(&pdev->dev), res);
> > > >>> +     if (IS_ERR(domain)) {
> > > >>> +             dev_err(&pdev->dev, "failed to create IRQ domain (%ld)\n",
> > > >>> +                     PTR_ERR(domain));
> > > >>> +             return PTR_ERR(domain);
> > > >>> +     }
> > > >>> +
> > > >>> +     gc->irq.domain = domain;
> > > >>> +     gc->to_irq = exiu_acpi_gpio_to_irq;
> > > >>> +
> > > >>> +     dev_info(&pdev->dev, "%d interrupts forwarded\n", NUM_IRQS);
> > > >>> +
> > > >>> +     return 0;
> > > >>> +}
> > > >>> +EXPORT_SYMBOL(exiu_acpi_init);
> > > >>> +#endif
> > > >>>
> > > >>
> > > >> I must say I'm not overly keen on this function. Why can't this be
> > > >> probed as an ACPI device, creating the corresponding domain, and leaving
> > > >> to the GPIO driver the task of doing the GPIO stuff?
> > > >>
> > > >
> > > > Because ACPI only permits 'system' interrupts or GPIO interrupts, it
> > > > does not allow arbitrary device objects in the ACPI namespace to be
> > > > targeted as interrupt controllers.
> > >
> > > Hmmm. We already have at least one driver (irq-mbigen.c) that does
> > > exactly that. It uses interrupts from the GIC (it is notionally behind
> > > the ITS), and offers a bunch of interrupt lines itself. Why is it different?
> > >
> >
> > You are right, it isn't. It turns out that there is another way to
> > signal ACPI events based on interrupts, and it involves the ACPI0013
> > GED device. I will try to model it that way instead.
> >
>
> Unfortunately, this doesn't work either. The GED device can respond to
> GSIVs only, and so going via the EXIU doesn't work.
>
> I have attempted to hack it up via AML, but the GED driver uses a
> threaded interrupt, and so the interrupt is re-enabled at the GIC
> before the AML handler is executed (which clears it in the EXIU)
>
> For the RAS case, I guess we could let the firmware pick an arbitrary
> unused SPI and signal that directly into the GIC, but for the power
> button (which is physically wired to the EXIU), we have to model the
> EXIU either has a separate pseudo-GPIO controller, or as part of the
> real GPIO block.

(+ Mika)

I made some progress describing the EXIU and GPIO controllers as follow.

    Device (EXIU) {
      Name (_HID, "SCX0008")
      Name (_UID, Zero)
      Name (_CRS, ResourceTemplate () {
        Memory32Fixed (ReadWrite, SYNQUACER_EXIU_BASE, SYNQUACER_EXIU_SIZE)
        Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake) {
          144, 145, 146, 147, 148, 149, 150, 151,
          152, 153, 154, 155, 156, 157, 158, 159,
          160, 161, 162, 163, 164, 165, 166, 167,
          168, 169, 170, 171, 172, 173, 174, 175,
        }
      })
      Name (_DSD, Package () {
        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
        Package () {
          Package () { "socionext,spi-base", 112 },
        }
      })
    }

and

    Device (GPIO) {
      Name (_HID, "SCX0007")
      Name (_UID, Zero)
      Name (_CRS, ResourceTemplate () {
        Memory32Fixed (ReadWrite, SYNQUACER_GPIO_BASE, SYNQUACER_GPIO_SIZE)
        Interrupt (ResourceConsumer, Edge, ActiveLow,
ExclusiveAndWake, 0, "\\_SB.EXIU") {
          7,
        }
      })
      Name (_AEI, ResourceTemplate () {
        GpioInt (Edge, ActiveHigh, ExclusiveAndWake, PullDefault, 0,
"\\_SB.GPIO")
        {
          7
        }
      })
      Method (_E07) {
        Notify (\_SB.PWRB, 0x80)
      }
    }

This is actually a fairly accurate depiction of reality: the EXIU is a
separate unit, and only some of the GPIOs are routed through it.

In the GPIO controller's to_irq() callback, I return the Linux IRQ
number based on the platform IRQ resources claimed by the GPIO device,
and I end up with something like

 46:          0 ... 0      EXIU   7 Edge      ACPI:Event

which looks correct to me. debugfs tells me it is mapped as

handler:  handle_fasteoi_irq
device:   (null)
status:   0x00000001
istate:   0x00000020
            IRQS_ONESHOT
ddepth:   0
wdepth:   1
dstate:   0x03404201
            IRQ_TYPE_EDGE_RISING
            IRQD_ACTIVATED
            IRQD_IRQ_STARTED
            IRQD_SINGLE_TARGET
            IRQD_WAKEUP_STATE
node:     0
affinity: 0-23
effectiv: 0
domain:  \_SB_.EXIU
 hwirq:   0x7
 chip:    EXIU
  flags:   0x55
             IRQCHIP_SET_TYPE_MASKED
             IRQCHIP_MASK_ON_SUSPEND
             IRQCHIP_SKIP_SET_WAKE
             IRQCHIP_EOI_THREADED
 parent:
    domain:  irqchip@(____ptrval____)-1
     hwirq:   0x97
     chip:    GICv3
      flags:   0x15
                 IRQCHIP_SET_TYPE_MASKED
                 IRQCHIP_MASK_ON_SUSPEND
                 IRQCHIP_SKIP_SET_WAKE

The EXIU domain is described as

name:   \_SB_.EXIU
 size:   32
 mapped: 1
 flags:  0x00000041
 parent: irqchip@(____ptrval____)-1
    name:   irqchip@(____ptrval____)-1
     size:   0
     mapped: 55
     flags:  0x00000041

Unfortunately, the system locks up entirely as soon as the interrupt
is triggered (I use a DIP switch in this case). So while the
description is accurate and the correct interrupt does get mapped,
something is still not working entirely as expected.

Any thoughts?

Thanks,
Ard.
