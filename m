Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E864D3A34
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 09:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfJKHnn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 03:43:43 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39207 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbfJKHnm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 03:43:42 -0400
Received: by mail-lj1-f195.google.com with SMTP id y3so8828245ljj.6
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=75drn0EC3pVb7nMu4OqJSjfSZVRc5lsrjDDKVXKY+D0=;
        b=OBn9GSt506Ru+vELjcSjxQOpMzJfkCdPlvbD0WJ1HTwia637wVf8cVY+QtfZfMjsAy
         MKsl7AwGeBNWTrJSBp/xxSeRew0knY1BkeJqeyn6U21EJdTZ54ayyEz1lE3QpdD/DXOI
         UL1kh6U0kgRGA5bI4Ud8OnNkJPUUbeUcU0+4eMOQF8/kDGEMZZ7bJincQ7XO+t/C/xzQ
         5YxjfhNGiO+IN1wc5PSbPWtJiCdQEZoMl+yr/Zvgx2qnWFL2xj+YYWWl0qk01fhIiXSQ
         X3oNGXs8ZWja1aOVQkJsQz8kzrvCgd4aDtAKtbdmYcSLnhdfZoHy0NTvSTdpzfNo6gUK
         gffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=75drn0EC3pVb7nMu4OqJSjfSZVRc5lsrjDDKVXKY+D0=;
        b=rJM4TefXq10Zsi1Ka6kpVuYt+AZxDk1Wj77BexAGndXcumx1gVcklE6H1vLEsadOIT
         nad22dWi/FuvOki1KK4+obhG2WxcKop1yMCD8k8ff03tnSDyY7puokXG4j774XNp1KIg
         mpfsjA+V9v1RZAbQw90JzWdFL/UJEr7XRK6T7EXhe8tSroyloMqLC1JKmyrbYaFRQBPH
         8voYmmDwoNCy+Db9rDrVJ0t9KemiGqi5XcDY4qZ2AusE5eVbUCovTbTzytI74kutzpbV
         3raaQfTweFQBbOzbPOe04BeQapqPUmYYqfuJgT5LxGn7RE7UV6ljsy061vruPOx6KTii
         neOA==
X-Gm-Message-State: APjAAAUXhRZwIMy0NMnX+DbHSHM99GllhoRYEaQbc2sm82g6LTNLvWWP
        0d1CyEnhDF+PEsFQ0Fvt/ghl9gjfA4mqJUQ3dnnGGw==
X-Google-Smtp-Source: APXvYqwsrIaguR6gc+cn7lI3kvBjYYwMw83TKOjdKm1xRk5zZloQNbY9/z0V77KhG/9cVgtk4Qsd8iMAjnc/LwmtG4E=
X-Received: by 2002:a2e:81cf:: with SMTP id s15mr7434961ljg.99.1570779819412;
 Fri, 11 Oct 2019 00:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191004012525.26647-1-chris.packham@alliedtelesis.co.nz> <20191004012525.26647-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191004012525.26647-3-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 11 Oct 2019 09:43:28 +0200
Message-ID: <CACRpkdYWLTjiSQo_VTeReL1CfEO3h_8ONbdCk=PD1x+oc2ggCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add xgs-iproc driver
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        richard.laing@alliedtelesis.co.nz,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chris!

Thanks for your patch!

On Fri, Oct 4, 2019 at 3:25 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> This driver supports the Chip Common A GPIO controller present on a
> number of Broadcom switch ASICs with integrated SoCs. The controller is
> similar to the pinctrl-nsp-gpio and pinctrl-iproc-gpio blocks but
> different enough that a separate driver is required.
>
> This has been ported from Broadcom's XLDK 5.0.3 retaining only the CCA
> support (pinctrl-iproc-gpio covers CCB).
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

(...)

> +config GPIO_XGS_IPROC
> +       tristate "BRCM XGS iProc GPIO support"
> +       depends on OF_GPIO && (ARCH_BCM_IPROC || COMPILE_TEST)
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP

Nice reuse of abstractions.

> +static u32 iproc_gpio_readl(struct iproc_gpio_chip *chip, int reg)
> +{
> +       return readl(chip->base + reg);
> +}
> +
> +static void iproc_gpio_writel(struct iproc_gpio_chip *chip, u32 val, int reg)
> +{
> +       writel(val, chip->base + reg);
> +}

These wrappers don't really add anything do they? Just inline the
direct readl()/writel() to base + reg everywhere instead.

> +/* returns the corresponding gpio register bit */
> +static int iproc_irq_to_gpio(struct iproc_gpio_chip *chip, u32 irq)
> +{
> +       struct irq_data *data = irq_domain_get_irq_data(chip->irq_domain, irq);
> +
> +       return data->hwirq;
> +}

I would name it something clearer since "gpio" is pretty ambigous.

Like iproc_irq_to_gpio_offset()

Maybe this is also a bit of unnecessary wrapper?

> +static irqreturn_t iproc_gpio_irq_handler(int irq, void *data)
> +{
> +       struct iproc_gpio_chip *chip = (struct iproc_gpio_chip *)data;
> +       struct gpio_chip gc = chip->gc;
> +       int bit;
> +       unsigned long int_bits = 0;
> +       u32 int_status;
> +
> +       /* go through the entire GPIOs and handle all interrupts */
> +       int_status = readl(chip->intr + CCA_INT_STS);
> +       if (int_status & CCA_INT_F_GPIOINT) {
> +               u32 event, level;
> +
> +               /* Get level and edge interrupts */
> +               event = readl(chip->base + GPIO_CCA_INT_EVENT_MASK);
> +               event &= readl(chip->base + GPIO_CCA_INT_EVENT);
> +               level = readl(chip->base + GPIO_CCA_DIN);
> +               level ^= readl(chip->base + GPIO_CCA_INT_LEVEL);
> +               level &= readl(chip->base + GPIO_CCA_INT_LEVEL_MASK);
> +               int_bits = level | event;
> +
> +               for_each_set_bit(bit, &int_bits, gc.ngpio)
> +                       generic_handle_irq(
> +                               irq_linear_revmap(chip->irq_domain, bit));
> +       }
> +
> +       return  int_bits ? IRQ_HANDLED : IRQ_NONE;
> +}

I think this should be a chained interrupt handler (see below how to
register it).

See e.g. drivers/gpio/gpio-ftgpio010.c for an example:
change function prototype, no return value, use
chained_irq_enter/exit(irqchip, desc); etc.

> +static int iproc_gpiolib_input(struct gpio_chip *gc, u32 gpio)
> +static int iproc_gpiolib_output(struct gpio_chip *gc, u32 gpio, int value)
> +static void iproc_gpiolib_set(struct gpio_chip *gc, u32 gpio, int value)
> +static int iproc_gpiolib_get(struct gpio_chip *gc, u32 gpio)

These callbacks seems to reimplement parts of GPIO_GENERIC
that you should already be using.

Again look at drivers/gpio/gpio-ftgpio010.c() use bgpio_init()
to set up the library callbacks, look in
drivers/gpio/gpio-mmio.c for kerneldoc on the function.

> +static int iproc_gpiolib_to_irq(struct gpio_chip *gc, u32 offset)
> +{
> +       struct iproc_gpio_chip *chip = gpiochip_get_data(gc);
> +
> +       return irq_linear_revmap(chip->irq_domain, offset);
> +}

GPIOLIB_IRQCHIP provides a .to_irq() implementation
so drop this and let the library handle this.

> +static int iproc_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *dn = pdev->dev.of_node;
> +       struct iproc_gpio_chip *chip;
> +       u32 num_gpios;
> +       int irq, ret;
> +
> +       chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +
> +       chip->dev = dev;
> +       platform_set_drvdata(pdev, chip);
> +
> +       chip->gc.label = dev_name(dev);
> +
> +       chip->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(chip->base))
> +               return PTR_ERR(chip->base);
> +
> +       /* Get number of GPIO pin */
> +       if (of_property_read_u32(dn, "ngpios", &num_gpios)) {
> +               dev_err(dev, "missing ngpios DT property\n");
> +               return -EINVAL;
> +       }

Maybe provide a sensible default?

> +       chip->gc.ngpio = num_gpios;
> +       chip->gc.parent = dev;
> +       chip->gc.of_node = dn;
> +       chip->gc.direction_input = iproc_gpiolib_input;
> +       chip->gc.direction_output = iproc_gpiolib_output;
> +       chip->gc.set = iproc_gpiolib_set;
> +       chip->gc.get = iproc_gpiolib_get;

Drop this and call bgpio_init() to set up the callbacks
instead. However, set up .ngpio *after* calling
bgpio_init() so users can't access the nonexisting
gpios.

> +       chip->gc.to_irq = iproc_gpiolib_to_irq;

Drop this and use the GPIOLIB_IRQCHIP.

> +       ret = gpiochip_add_data(&chip->gc, chip);
> +       if (ret) {
> +               dev_err(dev, "unable to add GPIO chip\n");
> +               return ret;
> +       }

Why not use devm_gpiochip_add_data()?

> +       irq = platform_get_irq(pdev, 0);
> +       if (irq > 0) {
> +               u32 val, count;
> +               struct irq_chip *irqc;
> +
> +               irqc = &chip->irqchip;
> +               irqc->name = dev_name(dev);
> +               irqc->irq_ack = iproc_gpio_irq_ack;
> +               irqc->irq_mask = iproc_gpio_irq_mask;
> +               irqc->irq_unmask = iproc_gpio_irq_unmask;
> +               irqc->irq_set_type = iproc_gpio_irq_set_type;
> +               irqc->irq_enable = iproc_gpio_irq_unmask;
> +               irqc->irq_disable = iproc_gpio_irq_mask;
> +               chip->intr = devm_platform_ioremap_resource(pdev, 1);
> +               if (IS_ERR(chip->intr))
> +                       return PTR_ERR(chip->intr);

Move all this above the [devm_]gpiochip_add_data()
call and add:

struct gpio_irq_chip *girq;

girq = &chip->gc.irq;
girq->chip = irqc;

etc follow the pattern from other drivers like the
mentioned ftgpio010.c.

> +               /* Create irq domain */
> +               chip->irq_domain = irq_domain_add_linear(dn, num_gpios,
> +                               &irq_domain_simple_ops, chip);
> +
> +               if (!chip->irq_domain) {
> +                       dev_err(dev, "Couldn't allocate IRQ domain\n");
> +                       ret = -ENODEV;
> +                       goto err_irq_domain;
> +               }
> +
> +               /* Map each gpio pin to an IRQ and set the handler */
> +               for (count = 0; count < num_gpios; count++) {
> +                       int irq;
> +
> +                       irq = irq_create_mapping(chip->irq_domain, count);
> +                       irq_set_chip_and_handler(irq, irqc, handle_simple_irq);
> +                       irq_set_chip_data(irq, chip);
> +               }

Drop this and let the generic GPIO irqchip handle
the domain.

> +               /* Enable GPIO interrupts for CCA GPIO */
> +               val = readl(chip->intr + CCA_INT_MASK);
> +               val |= CCA_INT_F_GPIOINT;
> +               writel(val, chip->intr + CCA_INT_MASK);

Move this before registering the chip.

> +               /* Install ISR for this GPIO controller */
> +               ret = devm_request_irq(dev, irq, iproc_gpio_irq_handler,
> +                                      IRQF_SHARED, chip->gc.label, chip);
> +               if (ret) {
> +                       dev_err(dev, "Fail to request IRQ%d: %d\n", irq, ret);
> +                       goto err_irq_request;
> +               }

Drop this and use the gpiolib irqchip library.

Yours,
Linus Walleij
