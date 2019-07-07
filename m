Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAA261375
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Jul 2019 03:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfGGBqX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Jul 2019 21:46:23 -0400
Received: from onstation.org ([52.200.56.107]:45746 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726927AbfGGBqX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 6 Jul 2019 21:46:23 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 32E683E942;
        Sun,  7 Jul 2019 01:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562463981;
        bh=JfOufF6PDbtapl6xEU3+xv/xvpYseaEUmGWOzeSxVRk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TQBjDZFRJGz62VFzvR3989RJykPj/J9XfGNqTtpMQeZxOzZ/fDGwIZJHdCjvSyDYa
         KwghDE1OL8aJDTJ8W8XiqIomckfRJRkf0Ou8EfE0QDqEQW7hwR78zIR6ks0rA4mMqT
         yJJNnFY/thESef95k+SP3fviCzy98qrBnlqyTpZU=
Date:   Sat, 6 Jul 2019 21:46:20 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-tegra@vger.kernel.org,
        David Daney <david.daney@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/4 v1] gpio: Add support for hierarchical IRQ domains
Message-ID: <20190707014620.GA9690@onstation.org>
References: <20190624132531.6184-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624132531.6184-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, Jun 24, 2019 at 03:25:28PM +0200, Linus Walleij wrote:
> Hierarchical IRQ domains can be used to stack different IRQ
> controllers on top of each other.
> 
> Bring hierarchical IRQ domains into the GPIOLIB core with the
> following basic idea:

I got this working with spmi-gpio with two additional changes. See below
for details. Hopefully I'll have time tomorrow evening (GMT-4) to finish
cleaning up what I have so I can send out my series.

> +static int gpiochip_hierarchy_irq_domain_translate(struct irq_domain *d,
> +						   struct irq_fwspec *fwspec,
> +						   unsigned long *hwirq,
> +						   unsigned int *type)
> +{
> +	/* We support standard DT translation */
> +	if (is_of_node(fwspec->fwnode) && fwspec->param_count == 2) {
> +		return irq_domain_translate_twocell(d, fwspec, hwirq, type);
> +	}
> +
> +	/* This is for board files and others not using DT */
> +	if (is_fwnode_irqchip(fwspec->fwnode)) {
> +		int ret;
> +
> +		ret = irq_domain_translate_twocell(d, fwspec, hwirq, type);
> +		if (ret)
> +			return ret;
> +		WARN_ON(*type == IRQ_TYPE_NONE);
> +		return 0;
> +	}
> +	return -EINVAL;
> +}
>
> [ snip ]
>
> +static const struct irq_domain_ops gpiochip_hierarchy_domain_ops = {
> +	.activate = gpiochip_irq_domain_activate,
> +	.deactivate = gpiochip_irq_domain_deactivate,
> +	.translate = gpiochip_hierarchy_irq_domain_translate,
> +	.alloc = gpiochip_hierarchy_irq_domain_alloc,
> +	.free = irq_domain_free_irqs_common,
> +};

spmi and ssbi gpio both need to subtract one from the hwirq in the
translate function.

https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c#L956

I'm going to optionally allow overriding the translate() function
pointer as well.

> +static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
> +					       unsigned int irq,
> +					       unsigned int nr_irqs,
> +					       void *data)
> +{
> +	struct gpio_chip *gc = d->host_data;
> +	irq_hw_number_t hwirq;
> +	unsigned int type = IRQ_TYPE_NONE;
> +	struct irq_fwspec *fwspec = data;
> +	int ret;
> +	int i;
> +
> +	chip_info(gc, "called %s\n", __func__);
> +
> +	ret = gpiochip_hierarchy_irq_domain_translate(d, fwspec, &hwirq, &type);
> +	if (ret)
> +		return ret;
> +
> +	chip_info(gc, "allocate IRQ %d..%d, hwirq %lu..%lu\n",
> +		  irq, irq + nr_irqs - 1,
> +		  hwirq, hwirq + nr_irqs - 1);
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		struct irq_fwspec parent_fwspec;
> +		unsigned int parent_hwirq;
> +		unsigned int parent_type;
> +		struct gpio_irq_chip *girq = &gc->irq;
> +
> +		ret = girq->child_to_parent_hwirq(gc, hwirq, type,
> +						  &parent_hwirq, &parent_type);
> +		if (ret) {
> +			chip_err(gc, "can't look up hwirq %lu\n", hwirq);
> +			return ret;
> +		}
> +		chip_info(gc, "found parent hwirq %u\n", parent_hwirq);
> +
> +		/*
> +		 * We set handle_bad_irq because the .set_type() should
> +		 * always be invoked and set the right type of handler.
> +		 */
> +		irq_domain_set_info(d,
> +				    irq + i,
> +				    hwirq + i,
> +				    gc->irq.chip,
> +				    gc,
> +				    handle_bad_irq,
                                    ^^^^^^^^^^
In order to get this working, I had to change handle_bad_irq to
handle_level_irq otherwise I get this attempted NULL pointer
dereference:

[    2.260256] Unable to handle kernel NULL pointer dereference at virtual address 00000018
[    2.263388] pgd = (ptrval)
[    2.271624] [00000018] *pgd=00000000
[    2.274149] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    2.277877] Modules linked in:
[    2.283174] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc7-next-20190701-00017-g58c27736c3cb-dirty #34
[    2.286043] Hardware name: Generic DT based system
[    2.295687] PC is at irq_chip_ack_parent+0x8/0x10
[    2.300540] LR is at __irq_do_set_handler+0x1b4/0x1bc
[    2.305309] pc : [<c0372af4>]    lr : [<c0373f6c>]    psr: a0000093
[    2.310343] sp : de899be0  ip : c100f06c  fp : 00000001
[    2.316420] r10: 0000004e  r9 : 00000000  r8 : 00000000
[    2.321626] r7 : 00000000  r6 : 00000000  r5 : c036eea4  r4 : c4e7a600
[    2.326839] r3 : 00000000  r2 : 00000000  r1 : c0372aec  r0 : c4e7d5c0
[    2.333438] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    2.339947] Control: 10c5787d  Table: 0020406a  DAC: 00000051
[    2.347152] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    2.352967] Stack: (0xde899be0 to 0xde89a000)
[    2.359063] 9be0: 00000000 00000000 c1004c48 c4e7a600 c036eea4 c0373fc0 60000013 921471da
[    2.363322] 9c00: 0000004e 00000000 c036eea4 00000000 00000000 c0375d44 c4df124c 921471da
[    2.371480] 9c20: c4df124c c4df124c 0000004e 00000000 c4de8900 c06cf28c c4df124c c036eea4
[    2.379640] 9c40: 00000000 00000000 c1004c48 c0da5e28 c036eea4 c0da5e48 de899c7c 00000001
[    2.387800] 9c60: 00000000 000000c1 00000000 00000001 c4e7a600 c036e394 c0d74960 00000000
[    2.395959] 9c80: 0000004f c0af60b0 00000000 00000000 00000002 0000004e c4df0600 00000001
[    2.404120] 9ca0: 00000000 ffffffff 00000000 c4de8900 c4e7d5c0 921471da c4e27940 c06cf120
[    2.412278] 9cc0: 00000001 0000004e 0000004e c4de8900 c0e172b4 00000001 c4e7d5c0 c0376bac
[    2.420438] 9ce0: 00000000 c0834274 00000000 c1004c48 c4de8900 de899d4c 00000000 de9d9c10
[    2.428598] 9d00: 00000001 00000000 c4e27940 c03771d4 de899d4c 00000000 00000000 c06ca5b0
[    2.436759] 9d20: de9d9db8 00000001 00000000 921471da c1004c48 c4df124c c4de8900 00000001
[    2.444919] 9d40: de9d9c10 c06c90b8 c27065bc def6e270 00000002 00000002 00000000 c10a2374
[    2.453077] 9d60: c4d6f810 de9d9c10 de899d80 6f697067 de9d0073 a0000013 c1004c48 00000000
[    2.461237] 9d80: a0000013 c098977c c4e27940 921471da c4e27940 921471da c4d6f810 c4e6ec8c
[    2.469399] 9da0: c4e2795c 00000000 c27065bc c06c8624 c4e6ec8c c092b1b8 00000001 c27065bc
[    2.477558] 9dc0: c10c59b8 c4e6ec60 00000000 c4e81000 00000000 def757d4 c4e2795c c4e6ec40
[    2.485717] 9de0: de9d9c00 c092ab44 c092aac8 c092ab60 00000000 de9d9c10 00000000 c10a2608
[    2.493876] 9e00: 00000000 c10c59b8 00000000 c10a2608 0000000e c0817c00 c110dcf4 de9d9c10
[    2.502037] 9e20: c110dcf8 c0815738 c10a2608 de9d9c10 c0f004a4 de9d9c10 c10a2608 c10a2608
[    2.510197] 9e40: c0815fa4 00000000 c0f56838 c0f56858 c0f004a4 c0815bf4 c0f56858 c0989428
[    2.518355] 9e60: c0bbf5c8 de9d9c10 00000000 c10a2608 c0815fa4 00000000 c0f56838 c0f56858
[    2.526515] 9e80: c0f004a4 c0815f9c 00000000 c10a2608 de9d9c10 c0816058 de9dab34 c1004c48
[    2.534677] 9ea0: c10a2608 c0813908 c1095780 de825858 de9dab34 921471da de82586c c10a2608
[    2.542835] 9ec0: c4e96780 c1095780 00000000 c0814aa0 c0df2cac c1004c48 ffffe000 c10a2608
[    2.550994] 9ee0: c1004c48 ffffe000 c0f39074 c0816be4 c10b97c0 c1004c48 ffffe000 c0302f7c
[    2.559153] 9f00: 00000000 c0f004a4 c10be278 00000000 00000007 c0d59294 c0dd2fe4 00000000
[    2.567314] 9f20: 00000000 c1004c48 c0d69934 c0d5934c 00002cc0 dffffbf8 dffffc0d 921471da
[    2.575475] 9f40: 00000000 c10b97c0 dffffa80 921471da c10b97c0 c0f6414c 00000008 c10d2cc0
[    2.583633] 9f60: c10d2cc0 c0f01204 00000007 00000007 00000000 c0f004a4 000000db 00000000
[    2.591793] 9f80: c0af5ba8 00000000 c0af5ba8 00000000 00000000 00000000 00000000 00000000
[    2.599951] 9fa0: 00000000 c0af5bb0 00000000 c03010e8 00000000 00000000 00000000 00000000
[    2.608111] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.616271] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    2.624430] [<c0372af4>] (irq_chip_ack_parent) from [<c0373f6c>] (__irq_do_set_handler+0x1b4/0x1bc)
[    2.632584] [<c0373f6c>] (__irq_do_set_handler) from [<c0373fc0>] (__irq_set_handler+0x4c/0x78)
[    2.641441] [<c0373fc0>] (__irq_set_handler) from [<c0375d44>] (irq_domain_set_info+0x38/0x4c)
[    2.650126] [<c0375d44>] (irq_domain_set_info) from [<c06cf28c>] (gpiochip_hierarchy_irq_domain_alloc+0x16c/0x22c)
[    2.658808] [<c06cf28c>] (gpiochip_hierarchy_irq_domain_alloc) from [<c0376bac>] (__irq_domain_alloc_irqs+0x12c/0x320)
[    2.669134] [<c0376bac>] (__irq_domain_alloc_irqs) from [<c03771d4>] (irq_create_fwspec_mapping+0x27c/0x344)
[    2.679808] [<c03771d4>] (irq_create_fwspec_mapping) from [<c06c90b8>] (gpiochip_to_irq+0x6c/0xa0)
[    2.689793] [<c06c90b8>] (gpiochip_to_irq) from [<c06c8624>] (gpiod_to_irq+0x48/0x64)
[    2.698558] [<c06c8624>] (gpiod_to_irq) from [<c092b1b8>] (gpio_keys_probe+0x4b4/0x8e8)
[    2.706461] [<c092b1b8>] (gpio_keys_probe) from [<c0817c00>] (platform_drv_probe+0x48/0x98)
[    2.714272] [<c0817c00>] (platform_drv_probe) from [<c0815738>] (really_probe+0x108/0x40c)
[    2.722599] [<c0815738>] (really_probe) from [<c0815bf4>] (driver_probe_device+0x78/0x1c4)
[    2.730934] [<c0815bf4>] (driver_probe_device) from [<c0815f9c>] (device_driver_attach+0x58/0x60)
[    2.739182] [<c0815f9c>] (device_driver_attach) from [<c0816058>] (__driver_attach+0xb4/0x154)
[    2.748121] [<c0816058>] (__driver_attach) from [<c0813908>] (bus_for_each_dev+0x74/0xb4)
[    2.756628] [<c0813908>] (bus_for_each_dev) from [<c0814aa0>] (bus_add_driver+0x1c0/0x200)
[    2.764875] [<c0814aa0>] (bus_add_driver) from [<c0816be4>] (driver_register+0x7c/0x114)
[    2.773035] [<c0816be4>] (driver_register) from [<c0302f7c>] (do_one_initcall+0x54/0x2a0)
[    2.781284] [<c0302f7c>] (do_one_initcall) from [<c0f01204>] (kernel_init_freeable+0x2d4/0x36c)
[    2.789357] [<c0f01204>] (kernel_init_freeable) from [<c0af5bb0>] (kernel_init+0x8/0x110)
[    2.797860] [<c0af5bb0>] (kernel_init) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[    2.806181] Exception stack(0xde899fb0 to 0xde899ff8)
[    2.813653] 9fa0:                                     00000000 00000000 00000000 00000000
[    2.818788] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.826943] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.835102] Code: 0592301c e12fff13 e5900018 e5903010 (e5933018) 
[    2.841513] ---[ end trace e31675e4bfb4e93f ]---

The parent's irq_chip struct isn't populated yet and the error occurs
here:

    void irq_chip_ack_parent(struct irq_data *data)
    {
            data = data->parent_data;
            data->chip->irq_ack(data);
                  ^^^^

We haven't called irq_domain_alloc_irqs_parent() yet, which is fine.

__irq_do_set_handler() has a special check for handle_bad_irq():

https://elixir.bootlin.com/linux/latest/source/kernel/irq/chip.c#L974

I'm not sure what the proper fix is here and not going to dig into this
anymore this evening.

> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
> index 1ce7fcd0f989..3099c7fbefdb 100644
> --- a/Documentation/driver-api/gpio/driver.rst
> +++ b/Documentation/driver-api/gpio/driver.rst

I'm still on linux next-20190701. Does this patch series of yours
require any other patches? I get a merge conflict against driver.rst.
Everything else applies cleanly. I honestly haven't looked in detail
about the conflicts.

Brian
