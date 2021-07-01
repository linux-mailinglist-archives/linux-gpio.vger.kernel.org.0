Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0263B9266
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 15:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbhGANjO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 09:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231124AbhGANjO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 09:39:14 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4ABC061762;
        Thu,  1 Jul 2021 06:36:43 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x12so8482845eds.5;
        Thu, 01 Jul 2021 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l6vDPOd0158LoPE0Wi6ZflI8POB/niZV1IO1168TrRY=;
        b=JEuCl7wnoapiBv49yCZQFb5gZDyxIpaQet+F0zr0bsWF2zSNyQD6Cwr+mVSg8UiI2j
         T+mIa1sj5s+wRhi5cthgrDIQDljNi1KlejVT84Xnr4IbY5lqowJ2tCDhjPLzF7vMasa7
         Jax5NxHsqyk8dO6/X14FdNhnTrZ2A4TgbrDJ3d9xyAvRBlHAthrFtkb/6znmFa/nXn2H
         5KzJtqkS1BNfh9YqR5+FemTiFZM5l3RniksqyBepFfht1KrT446T6Hp08bU9mU+nSAwB
         IojfdpLk6jbdiptUj1vtNyILcoq4SIk8C1XhrglWFYT8/caBgaB22v8Ug3V7JaaVJRV1
         E1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l6vDPOd0158LoPE0Wi6ZflI8POB/niZV1IO1168TrRY=;
        b=ABA/ApCGKn/eShs5HWUhTE/jJBO4+d/FJokAomqD4EMtdzR7xLGf1La8+8pvffntQ6
         T337QGp9nCgRbCf15vrtBsGedS9f/U+a/M7RXejEeXPBfHR/2p6lcLXJiHfQs5wPg1U7
         3ZhO3FigAAwC+EA3A/Dv/M2E9fDgHmF1nhPfDoaGRTJvxFY0F8uWd7+U17iQsxsdmfpy
         sU+6XDIHV2L3LLCFFpdl23c9YJ4EukbczuQIdlrMjX5x3CQb5J37+Uja1Ul6d25quEBc
         JuLfuP130Z+HOzEEGj29wLQNQYvw/hbQPfOhcnXQ5xtlhPPK0NVWe/O387OlfudRiL7C
         MNFA==
X-Gm-Message-State: AOAM533xEOCokGkbUcR2DOy6IBEwrSPcprdao4rOZXGmFolYbd+hocS6
        Wufha2NKgBHpaFG+T89ZdpXZnTTMjOaonq32Eds=
X-Google-Smtp-Source: ABdhPJybKJAVif7BbeGov4jpl8PMZ+tV1mWWI1crNV49eSz0614/WqKz38NvUACBltb9bSflimk3QtV6/psY+VUne1U=
X-Received: by 2002:aa7:dad2:: with SMTP id x18mr43288707eds.319.1625146602190;
 Thu, 01 Jul 2021 06:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAF78GY0jB_oeKgfZc4SHWBVusGnNfxKk5jTC4UBDsteSEVEzTw@mail.gmail.com>
 <CAHp75VeZwUiK2v8HZ=MLGSkK8wLudDEJFhBSm--Wu9gzABhmSg@mail.gmail.com>
 <CAHp75Vd6M6D9baiGi8fU8a=pfXnSKtEgQ4+eMiwPh6P9cg1ojA@mail.gmail.com>
 <CAF78GY1PO3YwYHgQkEhYF1_FRQ=HVOOWFtECcHen9PFCR1=JOA@mail.gmail.com> <CAHp75Vcp9ujZMRwUU30__4jv18A_dzdHNHahVMyygrbfRHR_=A@mail.gmail.com>
In-Reply-To: <CAHp75Vcp9ujZMRwUU30__4jv18A_dzdHNHahVMyygrbfRHR_=A@mail.gmail.com>
From:   Vincent Pelletier <plr.vincent@gmail.com>
Date:   Thu, 1 Jul 2021 22:36:30 +0900
Message-ID: <CAF78GY0c6_oQp=vGs14hyu6awKEYbsoqwqnYMxXsA7YH6NDCLg@mail.gmail.com>
Subject: Re: gpiochip_lock_as_irq on pins without FLAG_REQUESTED: bug or
 feature ?
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

On Tue, Jun 29, 2021 at 7:19 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> > - why the plural in "set all handlers to handle_bad_irq()" ? Isn't
> >   there only a single handler in struct gpio_irq_chip ?
>
> Each GPIO line may have its own handler (usually level or edge). I
> guess it's written from the GPIO point of view.
[...]
> > - "Then set the handler to [...] in the irqchip .set_type() callback"
> >   Isn't set_type per-pin, and isn't the interrupt handler chip-level ?
>
> The idea behind that initially the chip-level IRQ handler is set to
> BAD. It means any (spurious) IRQ will be served by it. Now, when one
> requests IRQ the framework will call ->irq_set_type() of corresponding
> IRQ chip and change the handler for the certain pin (pin-level). So,
> the main handler is basically for spurious interrupts only.

I think I found what I was missing: I was only seeing
  (struct gpio_irq_chip *)->handler = handle_bad_irq;
and was completely missing
  irq_set_handler_locked((struct irq_data *), handle_..._irq);
hence my confusion about these points.
Thanks for this extra push which led me to these.
Maybe the doc should mention this function ?

> > - I do not find a function named gpiochip_irqchip_add(), only
> >   gpiochip_irqchip_add_domain()
>
> Missed during update I suppose.
> https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?h=gpio/for-next&id=f1f37abbe6fc2b1242f78157db76e48dbf9518ee
> Feel free to submit a patch!

Makes sense. Before trying to fix the documentation I intended
to get to the end of my IRQ issues though, as I feel I am still
lacking a lot of understanding which will be needed to produce a
decent documentation patch (or three).

But I feel I am as far as I can go, as I cannot even tell what is normal
and what is not, for lack of what I would identify as a reference setup
in other machines. I have no idea what to try next, and I am ashamed to
say I am working on this issue for over a week (outside of work hours,
but still).

So here goes all I spotted, if anyone reading can tell the good from
the bad:

The high-level issue: I added a devicetree entry to enable the power-button
function of a DA9063 PMIC. This is AFAICT the first subsystem of this chip
on this board (hifive unmatched) which produces IRQs in normal use (meaning
outside of catastrophic failures on the board, like the PMIC complaining
about an overcurrent condition).

I initially thought it worked fine: short push of the button, system shuts
down cleanly.

Then I disabled power button handling in systemd-logind, and only the first
press causes a key press event, all further presses do nothing.

I hacked a script to peek at IRQ registers behind the kernel, and here is
what I see:

vincent@riscv:~$ sudo ./unmatched_gpio_irq_debug.py 1
GPIO 1: dir=in  in=1 out=0 irq_en=low irq_pending=high
PLIC 24: irq=False hart=4
vincent@riscv:~$ sudo ./unmatched_gpio_irq_debug.py 1
GPIO 1: dir=in  in=1 out=0 irq_en=low irq_pending=rise,high,low
PLIC 24: irq=False hart=4
vincent@riscv:~$ sudo ./unmatched_gpio_irq_debug.py 1
GPIO 1: dir=in  in=0 out=0 irq_en=low irq_pending=rise,fall,high,low
PLIC 24: irq=False hart=4

Note:
- GPIO pin 1 is active low, consistently with the da9063 code and the gpio
  irq_en line.
- after the first press, the gpio pin reads as "high", so the irs is ack'ed
  at the da9063 level
- after the first press, the pending irq events are all but "falling", which
  to me indicate the GPIO-level IRQ was ack'ed while the pin was still low,
  so it immediately became pending again. Knowing the GPIO driver clears
  *all* pending interrupts, I understand "rise,high,low" as meaning the GPIO
  controller saw the pin go from low to high after it was cleared, which also
  hints that the da9063's IRQ was cleared after the GPIO, which seems wrong
  for a level interrupt - but I am not 100% sure.
- ...but the PLIC 24 pin (corresponding to GPIO 1 pin's IRQ) does not have a
  pending irq, which suggests it missed the GPIO IRQ re-triggering
- and after a second key press, the only change is that now the GPIO chip did
  see a falling edge, and it now has all its pending bits active for this pin.

On the /proc/interrupts front, here is what I see:

          CPU0       CPU1       CPU2       CPU3
 1:        637          0          0          0  SiFive PLIC  39
10010000.serial
 2:          0          0          0          0  SiFive PLIC  40
10011000.serial
 3:       1829          0          0          0  SiFive PLIC  52  10030000.i2c
 4:          0          0          0          0  SiFive PLIC  41  10040000.spi
 5:       7647      10727       9670      11094  RISC-V INTC   5  riscv-timer
 6:         96          0          0          0  SiFive PLIC  43  10050000.spi
 7:          0          0          0          0  SiFive PLIC  55  eth0
17:          0          0          0          0  SiFive PLIC  19  l2_ecc
18:          1          0          0          0  SiFive PLIC  21  l2_ecc
19:          0          0          0          0  SiFive PLIC  22  l2_ecc
20:          0          0          0          0  SiFive PLIC  20  l2_ecc
46:          0          0          0          0   PCI-MSI   0  PCIe PME, aerdrv
53:         22          0          0          0   PCI-MSI 3145728  nvme0q0
54:          1          0          0          0  sifive-gpio   1  da9063-irq
55:          1          0          0          0  da9063-irq   0  ONKEY
56:          0          0          0          0  da9063-irq   1  ALARM
63:          0          0          0          0  da9063-irq   8  LDO_LIM
84:        694          0          0          0   PCI-MSI 3145729  nvme0q1
85:       1780          0          0          0   PCI-MSI 3145730  nvme0q2
86:       1092          0          0          0   PCI-MSI 3145731  nvme0q3
87:       1303          0          0          0   PCI-MSI 3145732  nvme0q4
88:       6523          0          0          0   PCI-MSI 2097152  xhci_hcd
89:          0          0          0          0   PCI-MSI 2097153  xhci_hcd
90:          0          0          0          0   PCI-MSI 2097154  xhci_hcd
91:          0          0          0          0   PCI-MSI 2097155  xhci_hcd
92:          0          0          0          0   PCI-MSI 2097156  xhci_hcd
93:          0          0          0          0  sifive-gpio   6  lm90
94:       1029          0          0          0   PCI-MSI 2621440
iwlwifi: default queue
95:        282          0          0          0   PCI-MSI 2621441
iwlwifi: queue 1
96:          5          0          0          0   PCI-MSI 2621442
iwlwifi: queue 2
97:         31          0          0          0   PCI-MSI 2621443
iwlwifi: queue 3
98:          8          0          0          0   PCI-MSI 2621444
iwlwifi: queue 4
99:          5          0          0          0   PCI-MSI 2621445
iwlwifi: exception
IPI0:       109        125        110        104  Rescheduling interrupts
IPI1:      5072      10959       6008      12207  Function call interrupts
IPI2:         0          0          0          0  CPU stop interrupts
IPI3:         0          0          0          0  IRQ work interrupts
IPI4:         0          0          0          0  Timer broadcast interrupts

I note the absence of a "SiFive PLIC  24 sifive-gpio" line, but
I do not know if this is to be expected.

In kernel/debug/irqs, I further see:

# cat irqs/55
handler:  handle_bad_irq
device:   (null)
status:   0x00008508
           _IRQ_NOPROBE
           _IRQ_NESTED_THREAD
istate:   0x00000020
           IRQS_ONESHOT
ddepth:   0
wdepth:   0
dstate:   0x00402208
           IRQ_TYPE_LEVEL_LOW
           IRQD_LEVEL
           IRQD_ACTIVATED
           IRQD_IRQ_STARTED
node:     0
affinity: 0-3
domain:  :soc:i2c@10030000:pmic@58
hwirq:   0x0
chip:    da9063-irq
 flags:   0x0

# cat irqs/54
handler:  handle_level_irq
device:   (null)
status:   0x00000508
           _IRQ_NOPROBE
istate:   0x00000020
           IRQS_ONESHOT
ddepth:   0
wdepth:   0
dstate:   0x02403208
           IRQ_TYPE_LEVEL_LOW
           IRQD_LEVEL
           IRQD_ACTIVATED
           IRQD_IRQ_STARTED
           IRQD_AFFINITY_SET
           IRQD_DEFAULT_TRIGGER_SET
node:     0
affinity: 0-3
domain:  :soc:gpio@10060000
hwirq:   0x1
chip:    sifive-gpio
 flags:   0x0
parent:
   domain:  :soc:interrupt-controller@c000000
    hwirq:   0x18
    chip:    SiFive PLIC
     flags:   0x0

# cat irqs/22
handler:  handle_fasteoi_irq
device:   (null)
status:   0x00000400
           _IRQ_NOPROBE
istate:   0x00000000
ddepth:   1
wdepth:   0
dstate:   0x02031000
           IRQD_IRQ_DISABLED
           IRQD_IRQ_MASKED
           IRQD_AFFINITY_SET
           IRQD_DEFAULT_TRIGGER_SET
node:     0
affinity: 0-3
domain:  :soc:interrupt-controller@c000000
hwirq:   0x18
chip:    SiFive PLIC
 flags:   0x0

So:
- the GPIO driver seems to have properly told the kernel that
  it reports to interrupt-controller@c000000's domain,
  on line 24.
- ...but that line (soft irq 22 on this specific boot) is
  disabled and masked.
- the da9063 does not seem to have express its reliance on
  the gpio's irq domain, but still the gpio irq is enabled

What is abnormal here ?
What could be a probable cause ? PLIC driver ? GPIO driver ?
da9063 driver ? devicetree ?

Side note: the above traces are with a few of my hacks, they
may not fully represent a clean kernel. I did confirm that
the high-level symptom still exists.

Regards,
--
Vincent Pelletier
