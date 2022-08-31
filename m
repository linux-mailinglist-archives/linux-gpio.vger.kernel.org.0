Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B630E5A8226
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 17:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbiHaPsH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 11:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbiHaPrr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 11:47:47 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C2829CA3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 08:47:18 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id se27so21499723ejb.8
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ZAFwR8VQC6A5+qQ3/wutczbrN/lYJfuyNY2OCQH2Bxw=;
        b=ImuWJKBbyfu6yfi64msyJsih1VgSgo+rCFdqVcHVMRsC4VtKm/NgjfQFulEZcUaKAm
         sm6IcOZD8fPla8gMcVXbQ8SMUM2wvG6IG0ptL2HSAxihtL9zltPssEaTKTFI3KGQ3k5x
         l1IBaBq2xRBWg4ttN4H/XOwlsSSYA4vdFw6GVhPU7cARKJ84NydHjrMgct9vdgLYLd5W
         KsyUvd5WSlcZUm4E2rKJV1P58i1JsAAmwR2m5oWVu2k7TdhP6cDEF7TV35hQBBkjGH5H
         +gWJK+UdzsQGJ8so5hHxVOfTubkSaC/KnvRbs5a1DwXd1ryMiyE2eFfyhbdKF6SY1u3l
         9KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ZAFwR8VQC6A5+qQ3/wutczbrN/lYJfuyNY2OCQH2Bxw=;
        b=ORgs/KH8/xmKgRvk8UvRvFfTwL/deYGJ4tU0OYzBaMipr+SsXEoci0aJJvz4qbil4e
         jfhHe0bC5OKsaAiX2qBF4DdwL3UIqKK8hZjZ6qbmZK+JqgJRctyfCZpn07ugQdWNQkl9
         /9vNCvQomKnhiFM05EJW5PVcIbIepkwt9rgAWM953Zuqb3UMtTQP/z+Na0IQwqGR/e/T
         8zkngjh/t/Ah53B4Lzx9sbtPOpcLsBw8kM46/dB9F3QMg+F9HShEo+VQocA3IdKNkB50
         DfjmWhEcFNdngBpTSMO5JlQhmYBsVgUZJAQGsbXicA0gVPUnOIS8bI/9hM0TBDBAFtH4
         C+0A==
X-Gm-Message-State: ACgBeo3CxP/dt7ZxrXbQ7ewrSUOAMcBhY3xwf6RoF+GM7DJh5ZtZuf+m
        3Tl/ZXHUe5Y1+Ege9m81VegTfp6e3HGTgEC29zQX0qBP2IA=
X-Google-Smtp-Source: AA6agR7hT6qBJFK5fmw33wuvUbj86RgLjo/+aOjL7OmIN4ATY+TAcjqxGTo2XfvzhCtLp2SAcLHMMOThAnhjDKomzy4=
X-Received: by 2002:a17:907:7254:b0:731:61c6:ecf9 with SMTP id
 ds20-20020a170907725400b0073161c6ecf9mr21195499ejc.101.1661960837214; Wed, 31
 Aug 2022 08:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220807192114.44890-1-sander@svanheule.net>
In-Reply-To: <20220807192114.44890-1-sander@svanheule.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 17:47:06 +0200
Message-ID: <CAMRc=McRtkWdGgjU2b1TVf6HDeXQ6r_78H8BxHnknwsh+GaoMA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: realtek-otto: switch to 32-bit I/O
To:     Sander Vanheule <sander@svanheule.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Birger Koblitz <mail@birger-koblitz.de>,
        Jan Hoffmann <jan@3e8.eu>, Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 7, 2022 at 9:21 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> By using 16-bit I/O on the GPIO peripheral, which is apparently not safe
> on MIPS, the IMR can end up containing garbage. This then results in
> interrupt triggers for lines that don't have an interrupt handler
> associated. The irq_desc lookup fails, and the ISR will not be cleared,
> keeping the CPU busy until reboot, or until another IMR operation
> restores the correct value. This situation appears to happen very
> rarely, for < 0.5% of IMR writes.
>
> Instead of using 8-bit or 16-bit I/O operations on the 32-bit memory
> mapped peripheral registers, switch to using 32-bit I/O only, operating
> on the entire bank for all single bit line settings. For 2-bit line
> settings, with 16-bit port values, stick to manual (un)packing.
>
> This issue has been seen on RTL8382M (HPE 1920-16G), RTL8391M (Netgear
> GS728TP v2), and RTL8393M (D-Link DGS-1210-52 F3, Zyxel GS1900-48).
>
> Reported-by: Luiz Angelo Daros de Luca <luizluca@gmail.com> # DGS-1210-52
> Reported-by: Birger Koblitz <mail@birger-koblitz.de> # GS728TP
> Reported-by: Jan Hoffmann <jan@3e8.eu> # 1920-16G
> Fixes: 0d82fb1127fb ("gpio: Add Realtek Otto GPIO support")
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Cc: Paul Cercueil <paul@crapouillou.net>
> ---
> Changes since v2:
> Link: https://lore.kernel.org/all/20220724113141.51646-1-sander@svanheule.net/
>   - Fix off-by-one in initialisation mask size
>   - Add Fixes: tag for original driver commit, since it wasn't working
>     properly
>
> Changes since v1:
> Link: https://lore.kernel.org/all/20220723094957.73880-1-sander@svanheule.net/
>   - Add tags for issue reporters
>   - Rename {read,write}32() to bank_{read,write}(), to give a better
>     semantic meaning to these functions
>   - Rework IMR handling to also be line-based instead of port-based
>
>  drivers/gpio/gpio-realtek-otto.c | 166 ++++++++++++++++---------------
>  1 file changed, 85 insertions(+), 81 deletions(-)
>
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
> index ea2ae6006c71..b014958c8fdf 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -48,10 +48,20 @@
>   * @lock: Lock for accessing the IRQ registers and values
>   * @intr_mask: Mask for interrupts lines
>   * @intr_type: Interrupt type selection
> + * @bank_read: Read a bank setting as a single 32-bit value
> + * @bank_write: Write a bank setting as a single 32-bit value
> + * @imr_line_pos: Bit shift of an IRQ line's IMR value.
> + *
> + * The DIR, DATA, and ISR registers consist of four 8-bit port values, packed
> + * into a single 32-bit register. Use @bank_read (@bank_write) to get (assign)
> + * a value from (to) these registers. The IMR register consists of four 16-bit
> + * port values, packed into two 32-bit registers. Use @imr_line_pos to get the
> + * bit shift of the 2-bit field for a line's IMR settings. Shifts larger than
> + * 32 overflow into the second register.
>   *
>   * Because the interrupt mask register (IMR) combines the function of IRQ type
>   * selection and masking, two extra values are stored. @intr_mask is used to
> - * mask/unmask the interrupts for a GPIO port, and @intr_type is used to store
> + * mask/unmask the interrupts for a GPIO line, and @intr_type is used to store
>   * the selected interrupt types. The logical AND of these values is written to
>   * IMR on changes.
>   */
> @@ -61,10 +71,11 @@ struct realtek_gpio_ctrl {
>         void __iomem *cpumask_base;
>         struct cpumask cpu_irq_maskable;
>         raw_spinlock_t lock;
> -       u16 intr_mask[REALTEK_GPIO_PORTS_PER_BANK];
> -       u16 intr_type[REALTEK_GPIO_PORTS_PER_BANK];
> -       unsigned int (*port_offset_u8)(unsigned int port);
> -       unsigned int (*port_offset_u16)(unsigned int port);
> +       u8 intr_mask[REALTEK_GPIO_MAX];
> +       u8 intr_type[REALTEK_GPIO_MAX];
> +       u32 (*bank_read)(void __iomem *reg);
> +       void (*bank_write)(void __iomem *reg, u32 value);
> +       unsigned int (*line_imr_pos)(unsigned int line);
>  };
>
>  /* Expand with more flags as devices with other quirks are added */
> @@ -103,14 +114,22 @@ static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *data)
>   * port. The two interrupt mask registers store two bits per GPIO, so use u16
>   * values.
>   */
> -static unsigned int realtek_gpio_port_offset_u8(unsigned int port)
> +static u32 realtek_gpio_bank_read_swapped(void __iomem *reg)
>  {
> -       return port;
> +       return ioread32be(reg);
>  }
>
> -static unsigned int realtek_gpio_port_offset_u16(unsigned int port)
> +static void realtek_gpio_bank_write_swapped(void __iomem *reg, u32 value)
>  {
> -       return 2 * port;
> +       iowrite32be(value, reg);
> +}
> +
> +static unsigned int realtek_gpio_line_imr_pos_swapped(unsigned int line)
> +{
> +       unsigned int port_pin = line % 8;
> +       unsigned int port = line / 8;
> +
> +       return 2 * (8 * (port ^ 1) + port_pin);
>  }
>
>  /*
> @@ -121,66 +140,67 @@ static unsigned int realtek_gpio_port_offset_u16(unsigned int port)
>   * per GPIO, so use u16 values. The first register contains ports 1 and 0, the
>   * second ports 3 and 2.
>   */
> -static unsigned int realtek_gpio_port_offset_u8_rev(unsigned int port)
> +static u32 realtek_gpio_bank_read(void __iomem *reg)
>  {
> -       return 3 - port;
> +       return ioread32(reg);
>  }
>
> -static unsigned int realtek_gpio_port_offset_u16_rev(unsigned int port)
> +static void realtek_gpio_bank_write(void __iomem *reg, u32 value)
>  {
> -       return 2 * (port ^ 1);
> +       iowrite32(value, reg);
>  }
>
> -static void realtek_gpio_write_imr(struct realtek_gpio_ctrl *ctrl,
> -       unsigned int port, u16 irq_type, u16 irq_mask)
> +static unsigned int realtek_gpio_line_imr_pos(unsigned int line)
>  {
> -       iowrite16(irq_type & irq_mask,
> -               ctrl->base + REALTEK_GPIO_REG_IMR + ctrl->port_offset_u16(port));
> +       return 2 * line;
>  }
>
> -static void realtek_gpio_clear_isr(struct realtek_gpio_ctrl *ctrl,
> -       unsigned int port, u8 mask)
> +static void realtek_gpio_clear_isr(struct realtek_gpio_ctrl *ctrl, u32 mask)
>  {
> -       iowrite8(mask, ctrl->base + REALTEK_GPIO_REG_ISR + ctrl->port_offset_u8(port));
> +       ctrl->bank_write(ctrl->base + REALTEK_GPIO_REG_ISR, mask);
>  }
>
> -static u8 realtek_gpio_read_isr(struct realtek_gpio_ctrl *ctrl, unsigned int port)
> +static u32 realtek_gpio_read_isr(struct realtek_gpio_ctrl *ctrl)
>  {
> -       return ioread8(ctrl->base + REALTEK_GPIO_REG_ISR + ctrl->port_offset_u8(port));
> +       return ctrl->bank_read(ctrl->base + REALTEK_GPIO_REG_ISR);
>  }
>
> -/* Set the rising and falling edge mask bits for a GPIO port pin */
> -static u16 realtek_gpio_imr_bits(unsigned int pin, u16 value)
> +/* Set the rising and falling edge mask bits for a GPIO pin */
> +static void realtek_gpio_update_line_imr(struct realtek_gpio_ctrl *ctrl, unsigned int line)
>  {
> -       return (value & REALTEK_GPIO_IMR_LINE_MASK) << 2 * pin;
> +       void __iomem *reg = ctrl->base + REALTEK_GPIO_REG_IMR;
> +       unsigned int line_shift = ctrl->line_imr_pos(line);
> +       unsigned int shift = line_shift % 32;
> +       u32 irq_type = ctrl->intr_type[line];
> +       u32 irq_mask = ctrl->intr_mask[line];
> +       u32 reg_val;
> +
> +       reg += 4 * (line_shift / 32);
> +       reg_val = ioread32(reg);
> +       reg_val &= ~(REALTEK_GPIO_IMR_LINE_MASK << shift);
> +       reg_val |= (irq_type & irq_mask & REALTEK_GPIO_IMR_LINE_MASK) << shift;
> +       iowrite32(reg_val, reg);
>  }
>
>  static void realtek_gpio_irq_ack(struct irq_data *data)
>  {
>         struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
>         irq_hw_number_t line = irqd_to_hwirq(data);
> -       unsigned int port = line / 8;
> -       unsigned int port_pin = line % 8;
>
> -       realtek_gpio_clear_isr(ctrl, port, BIT(port_pin));
> +       realtek_gpio_clear_isr(ctrl, BIT(line));
>  }
>
>  static void realtek_gpio_irq_unmask(struct irq_data *data)
>  {
>         struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
>         unsigned int line = irqd_to_hwirq(data);
> -       unsigned int port = line / 8;
> -       unsigned int port_pin = line % 8;
>         unsigned long flags;
> -       u16 m;
>
>         gpiochip_enable_irq(&ctrl->gc, line);
>
>         raw_spin_lock_irqsave(&ctrl->lock, flags);
> -       m = ctrl->intr_mask[port];
> -       m |= realtek_gpio_imr_bits(port_pin, REALTEK_GPIO_IMR_LINE_MASK);
> -       ctrl->intr_mask[port] = m;
> -       realtek_gpio_write_imr(ctrl, port, ctrl->intr_type[port], m);
> +       ctrl->intr_mask[line] = REALTEK_GPIO_IMR_LINE_MASK;
> +       realtek_gpio_update_line_imr(ctrl, line);
>         raw_spin_unlock_irqrestore(&ctrl->lock, flags);
>  }
>
> @@ -188,16 +208,11 @@ static void realtek_gpio_irq_mask(struct irq_data *data)
>  {
>         struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
>         unsigned int line = irqd_to_hwirq(data);
> -       unsigned int port = line / 8;
> -       unsigned int port_pin = line % 8;
>         unsigned long flags;
> -       u16 m;
>
>         raw_spin_lock_irqsave(&ctrl->lock, flags);
> -       m = ctrl->intr_mask[port];
> -       m &= ~realtek_gpio_imr_bits(port_pin, REALTEK_GPIO_IMR_LINE_MASK);
> -       ctrl->intr_mask[port] = m;
> -       realtek_gpio_write_imr(ctrl, port, ctrl->intr_type[port], m);
> +       ctrl->intr_mask[line] = 0;
> +       realtek_gpio_update_line_imr(ctrl, line);
>         raw_spin_unlock_irqrestore(&ctrl->lock, flags);
>
>         gpiochip_disable_irq(&ctrl->gc, line);
> @@ -207,10 +222,8 @@ static int realtek_gpio_irq_set_type(struct irq_data *data, unsigned int flow_ty
>  {
>         struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
>         unsigned int line = irqd_to_hwirq(data);
> -       unsigned int port = line / 8;
> -       unsigned int port_pin = line % 8;
>         unsigned long flags;
> -       u16 type, t;
> +       u8 type;
>
>         switch (flow_type & IRQ_TYPE_SENSE_MASK) {
>         case IRQ_TYPE_EDGE_FALLING:
> @@ -229,11 +242,8 @@ static int realtek_gpio_irq_set_type(struct irq_data *data, unsigned int flow_ty
>         irq_set_handler_locked(data, handle_edge_irq);
>
>         raw_spin_lock_irqsave(&ctrl->lock, flags);
> -       t = ctrl->intr_type[port];
> -       t &= ~realtek_gpio_imr_bits(port_pin, REALTEK_GPIO_IMR_LINE_MASK);
> -       t |= realtek_gpio_imr_bits(port_pin, type);
> -       ctrl->intr_type[port] = t;
> -       realtek_gpio_write_imr(ctrl, port, t, ctrl->intr_mask[port]);
> +       ctrl->intr_type[line] = type;
> +       realtek_gpio_update_line_imr(ctrl, line);
>         raw_spin_unlock_irqrestore(&ctrl->lock, flags);
>
>         return 0;
> @@ -244,28 +254,21 @@ static void realtek_gpio_irq_handler(struct irq_desc *desc)
>         struct gpio_chip *gc = irq_desc_get_handler_data(desc);
>         struct realtek_gpio_ctrl *ctrl = gpiochip_get_data(gc);
>         struct irq_chip *irq_chip = irq_desc_get_chip(desc);
> -       unsigned int lines_done;
> -       unsigned int port_pin_count;
>         unsigned long status;
>         int offset;
>
>         chained_irq_enter(irq_chip, desc);
>
> -       for (lines_done = 0; lines_done < gc->ngpio; lines_done += 8) {
> -               status = realtek_gpio_read_isr(ctrl, lines_done / 8);
> -               port_pin_count = min(gc->ngpio - lines_done, 8U);
> -               for_each_set_bit(offset, &status, port_pin_count)
> -                       generic_handle_domain_irq(gc->irq.domain, offset + lines_done);
> -       }
> +       status = realtek_gpio_read_isr(ctrl);
> +       for_each_set_bit(offset, &status, gc->ngpio)
> +               generic_handle_domain_irq(gc->irq.domain, offset);
>
>         chained_irq_exit(irq_chip, desc);
>  }
>
> -static inline void __iomem *realtek_gpio_irq_cpu_mask(struct realtek_gpio_ctrl *ctrl,
> -       unsigned int port, int cpu)
> +static inline void __iomem *realtek_gpio_irq_cpu_mask(struct realtek_gpio_ctrl *ctrl, int cpu)
>  {
> -       return ctrl->cpumask_base + ctrl->port_offset_u8(port) +
> -               REALTEK_GPIO_PORTS_PER_BANK * cpu;
> +       return ctrl->cpumask_base + REALTEK_GPIO_PORTS_PER_BANK * cpu;
>  }
>
>  static int realtek_gpio_irq_set_affinity(struct irq_data *data,
> @@ -273,12 +276,10 @@ static int realtek_gpio_irq_set_affinity(struct irq_data *data,
>  {
>         struct realtek_gpio_ctrl *ctrl = irq_data_to_ctrl(data);
>         unsigned int line = irqd_to_hwirq(data);
> -       unsigned int port = line / 8;
> -       unsigned int port_pin = line % 8;
>         void __iomem *irq_cpu_mask;
>         unsigned long flags;
>         int cpu;
> -       u8 v;
> +       u32 v;
>
>         if (!ctrl->cpumask_base)
>                 return -ENXIO;
> @@ -286,15 +287,15 @@ static int realtek_gpio_irq_set_affinity(struct irq_data *data,
>         raw_spin_lock_irqsave(&ctrl->lock, flags);
>
>         for_each_cpu(cpu, &ctrl->cpu_irq_maskable) {
> -               irq_cpu_mask = realtek_gpio_irq_cpu_mask(ctrl, port, cpu);
> -               v = ioread8(irq_cpu_mask);
> +               irq_cpu_mask = realtek_gpio_irq_cpu_mask(ctrl, cpu);
> +               v = ctrl->bank_read(irq_cpu_mask);
>
>                 if (cpumask_test_cpu(cpu, dest))
> -                       v |= BIT(port_pin);
> +                       v |= BIT(line);
>                 else
> -                       v &= ~BIT(port_pin);
> +                       v &= ~BIT(line);
>
> -               iowrite8(v, irq_cpu_mask);
> +               ctrl->bank_write(irq_cpu_mask, v);
>         }
>
>         raw_spin_unlock_irqrestore(&ctrl->lock, flags);
> @@ -307,16 +308,17 @@ static int realtek_gpio_irq_set_affinity(struct irq_data *data,
>  static int realtek_gpio_irq_init(struct gpio_chip *gc)
>  {
>         struct realtek_gpio_ctrl *ctrl = gpiochip_get_data(gc);
> -       unsigned int port;
> +       u32 mask_all = GENMASK(gc->ngpio - 1, 0);
> +       unsigned int line;
>         int cpu;
>
> -       for (port = 0; (port * 8) < gc->ngpio; port++) {
> -               realtek_gpio_write_imr(ctrl, port, 0, 0);
> -               realtek_gpio_clear_isr(ctrl, port, GENMASK(7, 0));
> +       for (line = 0; line < gc->ngpio; line++)
> +               realtek_gpio_update_line_imr(ctrl, line);
>
> -               for_each_cpu(cpu, &ctrl->cpu_irq_maskable)
> -                       iowrite8(GENMASK(7, 0), realtek_gpio_irq_cpu_mask(ctrl, port, cpu));
> -       }
> +       realtek_gpio_clear_isr(ctrl, mask_all);
> +
> +       for_each_cpu(cpu, &ctrl->cpu_irq_maskable)
> +               ctrl->bank_write(realtek_gpio_irq_cpu_mask(ctrl, cpu), mask_all);
>
>         return 0;
>  }
> @@ -387,12 +389,14 @@ static int realtek_gpio_probe(struct platform_device *pdev)
>
>         if (dev_flags & GPIO_PORTS_REVERSED) {
>                 bgpio_flags = 0;
> -               ctrl->port_offset_u8 = realtek_gpio_port_offset_u8_rev;
> -               ctrl->port_offset_u16 = realtek_gpio_port_offset_u16_rev;
> +               ctrl->bank_read = realtek_gpio_bank_read;
> +               ctrl->bank_write = realtek_gpio_bank_write;
> +               ctrl->line_imr_pos = realtek_gpio_line_imr_pos;
>         } else {
>                 bgpio_flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER;
> -               ctrl->port_offset_u8 = realtek_gpio_port_offset_u8;
> -               ctrl->port_offset_u16 = realtek_gpio_port_offset_u16;
> +               ctrl->bank_read = realtek_gpio_bank_read_swapped;
> +               ctrl->bank_write = realtek_gpio_bank_write_swapped;
> +               ctrl->line_imr_pos = realtek_gpio_line_imr_pos_swapped;
>         }
>
>         err = bgpio_init(&ctrl->gc, dev, 4,
> --
> 2.37.1
>

Applied for fixes, thanks!

Bart
