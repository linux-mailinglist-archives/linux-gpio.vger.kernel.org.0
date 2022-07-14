Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F3D575395
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Jul 2022 19:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238189AbiGNRAW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Jul 2022 13:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbiGNRAV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jul 2022 13:00:21 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D180954CA7;
        Thu, 14 Jul 2022 10:00:19 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31df2545d87so660027b3.10;
        Thu, 14 Jul 2022 10:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yu/LZMM77+OazDEA02pgMpteAkMyBK5KRAEy7jXL1hc=;
        b=P95AxEiTCYrt5Ytz+lhANp961rSuf/fzAjmzc3J2QUpf8SClRz433C8fBhKh3IzBsh
         acaEoKK3SnheOhA/Pj7mgSfHwQ3gygZ+O6oYOw7xP6Qet5slvS1xFYuL5lTyYvQOXH5x
         5KJFCJHkE4GyU2vJKJXwjDgWTn5ApEl7JN89ZB90LqpQ4gDzNK0AdD9PvmT0lTCdVlKE
         11FyFCvW5dJaqZuOmHGw+NGOKYECLpbpVSewYCsXQNRQ+h6UrCkuIQZgZtITv9aDpNMv
         NuUe+UnTYDK6NSNaOXX6Sdo4WRmYLSER7did0XSgYAQkXd/ChQ0EXeYDvuMvx2sCB/6s
         dh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yu/LZMM77+OazDEA02pgMpteAkMyBK5KRAEy7jXL1hc=;
        b=fA8u2TfqCcFt56tCkwTv+E91M231XJ2iwor341fr2EgP5U2XSgdKamhkgERVqTlO3G
         1uZQa4TLycEmX/ANUkq7N+dAYwHOwoqM/Viak1OrCFiSjiATfCunzU+FDkdxN2PqCdM1
         WVu5uuT2Re5yrbD+EOz8adFW3VwRBU6ELgb408K+JSQ/cL99kgbb8PtjyanPuUph6hhO
         6dOHYiMpTZDf71Pvvl3bZ1sEujK4nZ+mZnMHrkydPqYuaS7ze0kKiPpIMjZ4P28eWGOB
         U5/5MrbdQubvM7B3yT1HS5Ul3Hu+cNKWF42ZlpC/CMLed6lcWYADsim0xWCkzKPM6rTs
         nNeg==
X-Gm-Message-State: AJIora9j69D8mFyWsnhSJABv6PCofGk/MjB8pAcsGILUaB6REgNS3pRE
        yAFv/CZiAfaaJZxrx9JTiTa80/jGRUX9Ap7bhAhrqatMYXxauA==
X-Google-Smtp-Source: AGRyM1tiRQoLtYjVrbOFk7dYSy0ZmYajnsvawCRXoRCvK6Q/kGNGmrKzOer306s/JQTOiJUr4hO4x9B9oBkJxh6GwzM=
X-Received: by 2002:a81:54c1:0:b0:31d:ec18:fd5d with SMTP id
 i184-20020a8154c1000000b0031dec18fd5dmr1282433ywb.277.1657818018838; Thu, 14
 Jul 2022 10:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220714122322.63663-1-tmaimon77@gmail.com> <20220714122322.63663-3-tmaimon77@gmail.com>
In-Reply-To: <20220714122322.63663-3-tmaimon77@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 14 Jul 2022 18:59:41 +0200
Message-ID: <CAHp75Vcd6vATJQoJMh_SQ27ijOpiCjMWuSZ04d2OOnExunveqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
To:     Tomer Maimon <tmaimon77@gmail.com>
Cc:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        zhengbin13@huawei.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 14, 2022 at 2:29 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add pinctrl and GPIO controller driver support to Arbel BMC NPCM8XX SoC.
>
> Arbel BMC NPCM8XX pinctrl driver based on Poleg NPCM7XX, except the
> pin mux mapping difference the NPCM8XX GPIO supports adjust debounce
> period time.

...

> +config PINCTRL_NPCM8XX
> +       bool "Pinctrl and GPIO driver for Nuvoton NPCM8XX"

Why boolean?

> +       depends on (ARCH_NPCM || COMPILE_TEST) && OF

I believe the OF is not compile time dependency, hence you may for it
as functional one by

  depends on (ARCH_NPCM && OF) || COMPILE_TEST

> +       select PINMUX
> +       select PINCONF
> +       select GENERIC_PINCONF
> +       select GPIOLIB
> +       select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP
> +       help
> +         Say Y here to enable pin controller and GPIO support
> +         for Nuvoton NPCM8XX SoC.

Depends on the answer above, this might need an addition on how module
will be called.

...

Missed bits.h.

> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>

Missed mod_devicetable.h.

> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>

How are these being used?

> +#include <linux/pinctrl/machine.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>

+ property.h.

> +#include <linux/regmap.h>

...

> +/* GCR registers */
> +#define NPCM8XX_GCR_PDID       0x00
> +#define NPCM8XX_GCR_SRCNT      0x68
> +#define NPCM8XX_GCR_FLOCKR1    0x74
> +#define NPCM8XX_GCR_DSCNT      0x78
> +#define NPCM8XX_GCR_I2CSEGCTL  0xE4
> +#define NPCM8XX_GCR_I2CSEGSEL  0xE0

Format them with the same width, e.g. 0x0E0.
And, btw, why capital letters in the numbers?

> +#define NPCM8XX_GCR_MFSEL1     0x260
> +#define NPCM8XX_GCR_MFSEL2     0x264
> +#define NPCM8XX_GCR_MFSEL3     0x268
> +#define NPCM8XX_GCR_MFSEL4     0x26C
> +#define NPCM8XX_GCR_MFSEL5     0x270
> +#define NPCM8XX_GCR_MFSEL6     0x274
> +#define NPCM8XX_GCR_MFSEL7     0x278

...

> +/* GPIO registers */

Ditto.

...

> +#define NPCM8XX_DEBOUNCE_NANOSEC       40

_NSEC is enough.

...

> +#define NPCM8XX_DEBOUNCE_VAL_MASK      GENMASK(23, 4)
> +#define NPCM8XX_DEBOUNCE_MAX_VAL       0xFFFFF7

How MAX_VAL is different from the MASK ?

...

> +struct npcm8xx_gpio {
> +       void __iomem            *base;

> +       struct gpio_chip        gc;

Making this first member in the structure may reduce the code base at
compile time due to pointer arithmetic. You may confirm that by using
bloat-o-meter.

> +       struct debounce_time    debounce;
> +       int                     irqbase;
> +       int                     irq;
> +       struct irq_chip         irq_chip;
> +       u32                     pinctrl_id;
> +       int (*direction_input)(struct gpio_chip *chip, unsigned int offset);
> +       int (*direction_output)(struct gpio_chip *chip, unsigned int offset,
> +                               int value);
> +       int (*request)(struct gpio_chip *chip, unsigned int offset);
> +       void (*free)(struct gpio_chip *chip, unsigned int offset);
> +};

...

> +       val = ioread32(reg) | pinmask;
> +       iowrite32(val, reg);

With this kind of indentation you may even reduce codebase with

iowrite32(ioread32(reg) | pinmask, reg);

...

> +       val = ioread32(reg) & ~pinmask;
> +       iowrite32(val, reg);

Ditto.

...

> +static void npcmgpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
> +{
> +       seq_printf(s, "-- module %d [gpio%d - %d]\n",

Hmm... Isn't pin range is showed in a separate debugfs node?

> +}

...

> +       for_each_set_bit(bit, (const void *)&sts, NPCM8XX_GPIO_PER_BANK)

Why this casting?

> +               generic_handle_domain_irq(gc->irq.domain, bit);

...

> +       unsigned int gpio = BIT(d->hwirq);

There is a special helper to get an H/W IRQ, which is type of
irq_hw_number_t IIRC.

...

> +       if (type & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {

IRQ_TYPE_LEVEL_MASK

> +               npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_EVTYP, gpio);
> +               irq_set_handler_locked(d, handle_level_irq);

> +       } else if (type & (IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_EDGE_RISING
> +                          | IRQ_TYPE_EDGE_FALLING)) {

Why duplicating RISING and FAILING? Isn't it covered by BOTH?

> +               npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_EVTYP, gpio);
> +               irq_set_handler_locked(d, handle_edge_irq);
> +       }

...

> +       unsigned int gpio = d->hwirq;

Read the documentation on how the mask()/unmask() has to be
implemented (there are examples):
https://www.kernel.org/doc/html/latest/driver-api/gpio/driver.html#infrastructure-helpers-for-gpio-irqchips

...

> +/*
> + * pin:             name, number
> + * group:    name, npins,   pins
> + * function: name, ngroups, groups
> + */
> +struct npcm8xx_group {
> +       const char *name;
> +       const unsigned int *pins;
> +       int npins;
> +};

NIH struct pingroup.

...

Temporary variable here

 ...reg = base + OSCR;

> +       int gpio = BIT(pin % bank->gc.ngpio);
> +
> +       if (pincfg[pin].flag & SLEW) {
> +               switch (arg) {
> +               case 0:
> +                       npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_OSRC,
> +                                     gpio);
> +                       return 0;
> +               case 1:
> +                       npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_OSRC,
> +                                     gpio);

...will save one LoC in this switch-case.

> +                       return 0;
> +               default:
> +                       return -EINVAL;
> +               }
> +       }

...

> +       int gpio = (pin % bank->gc.ngpio);

Too many parentheses.

...

> +       u32 ds = 0;

This assignment is redundant, if...

> +       flg = pincfg[pin].flag;
> +       if (flg & DRIVE_STRENGTH_MASK) {

you use traditional pattern, i.e.

if (error_condition)
  return an_error;

> +               val = ioread32(bank->base + NPCM8XX_GP_N_ODSC) & pinmask;
> +               ds = val ? DSHI(flg) : DSLO(flg);
> +               dev_dbg(bank->gc.parent, "pin %d strength %d = %d\n", pin, val, ds);
> +               return ds;
> +       }
> +
> +       return -EINVAL;

...

> +       v = (pincfg[pin].flag & DRIVE_STRENGTH_MASK);

Too many parentheses.

> +       if (!nval || !v)
> +               return -ENOTSUPP;
> +       if (DSLO(v) == nval) {
> +               npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_ODSC, gpio);
> +               return 0;
> +       }
> +       if (DSHI(v) == nval) {
> +               npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_ODSC, gpio);
> +               return 0;
> +       }
> +
> +       return -ENOTSUPP;

Traditional pattern:

if (LO == nval)
  clr()
else if (HI == nval)
  set()
else
  return -ENOTSUPP;

return 0;

...

> +static int npcm8xx_gpio_request_enable(struct pinctrl_dev *pctldev,
> +                                      struct pinctrl_gpio_range *range,
> +                                      unsigned int offset)
> +{
> +       struct npcm8xx_pinctrl *npcm = pinctrl_dev_get_drvdata(pctldev);

> +       if (!range) {
> +               dev_err(npcm->dev, "invalid range\n");
> +               return -EINVAL;
> +       }

> +       if (!range->gc) {
> +               dev_err(npcm->dev, "invalid gpiochip\n");
> +               return -EINVAL;
> +       }

I'm wondering when you can have one of these triggered.

> +
> +       npcm8xx_setfunc(npcm->gcr_regmap, &offset, 1, fn_gpio);
> +
> +       return 0;
> +}

...

> +static int debounce_timing_setting(struct npcm8xx_gpio *bank, u32 gpio,
> +                                  u32 nanosecs)
> +{
> +       int gpio_debounce = (gpio % 16) * 2;
> +       u32 dbncp_val, dbncp_val_mod;
> +       int DBNCS_offset = gpio / 16;

Can you group it together with gpio%16 line? It would be easier for
the reader who knows that on some architectures the both assignments
may be done in one assembly instruction.

> +       int debounce_select;

This logically would be grouped with above int:s.

       u32 dbncp_val, dbncp_val_mod;
       int gpio_debounce = (gpio % 16) * 2;
       int DBNCS_offset = gpio / 16;
       int debounce_select;

...

> +                               npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_DBNCS0 + (DBNCS_offset * 4), debounce_select);

> +                       npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_DBNCS0 + (DBNCS_offset * 4), debounce_select);

We can make this line much shorter with help of a temporary variable.

...

> +                               iowrite32(0x40, bank->base + NPCM8XX_GP_N_DBNCP0 + (i * 4));
> +                               iowrite32(0x50, bank->base + NPCM8XX_GP_N_DBNCP0 + (i * 4));
> +                               iowrite32(0x60, bank->base + NPCM8XX_GP_N_DBNCP0 + (i * 4));
> +                               iowrite32(0x70, bank->base + NPCM8XX_GP_N_DBNCP0 + (i * 4));

And this lines can be shorter with a helper function, but this is up to you.

...

> +                               dbncp_val_mod = dbncp_val & 0xF;

GENMASK() ?
Or (BIT(x) - 1) if it's a limitation by the hardware in bits, this
will show it directly (like 4 bits limit).

> +                               if (dbncp_val_mod > 0x7)

In similar way.

...

> +       int ret = 0;

Redundant assignment.

Such assignments in some cases may hide real bugs.

> +       if (nanosecs) {
> +               ret = debounce_timing_setting(bank, pin % bank->gc.ngpio,
> +                                             nanosecs);
> +               if (!ret) {

Why not positive conditional and in this case aka "traditional pattern":
  if (error) {
    ...handle error...
    return error;
  }

> +                       npcm_gpio_set(&bank->gc, bank->base + NPCM8XX_GP_N_DBNC,
> +                                     gpio);
> +               } else {

> +                       dev_info(npcm->dev, "All four debounce timing values are used, please use one of exist debounce values\n");
> +                       dev_err(npcm->dev, "Pin %d debounce_timing_setting failed, ret=%d\n", pin, ret);

Too much noise in the messages. Create one error message

> +               }
> +
> +               return ret;
> +       }
> +
> +       npcm_gpio_clr(&bank->gc, bank->base + NPCM8XX_GP_N_DBNC, gpio);
> +
> +       return 0;

...

> +               if (param == PIN_CONFIG_BIAS_DISABLE)
> +                       rc = (!pu && !pd);
> +               else if (param == PIN_CONFIG_BIAS_PULL_UP)
> +                       rc = (pu && !pd);
> +               else if (param == PIN_CONFIG_BIAS_PULL_DOWN)
> +                       rc = (!pu && pd);

In many places (and not only in this function) you are using too many
parentheses, why? Can you clean all them up?

...

> +static int npcm8xx_gpio_of(struct npcm8xx_pinctrl *pctrl)

_fw

...

> +       char gpioirqname[30];

How 30 was chosen?

...

> +               pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
> +               if (!pctrl->gpio_bank[id].gc.label)
> +                       dev_err_probe(dev, -ENOMEM, "No GPIO label %u\n", id);

-ENOMEM doesn't need an error message.

...

> +       dev_set_drvdata(&pdev->dev, pctrl);

platform_set_drvdata();

-- 
With Best Regards,
Andy Shevchenko
