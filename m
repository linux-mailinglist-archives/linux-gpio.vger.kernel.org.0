Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E53A5066DB
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Apr 2022 10:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349947AbiDSI0V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Apr 2022 04:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245310AbiDSI0U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2022 04:26:20 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A94033354;
        Tue, 19 Apr 2022 01:23:36 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id u15so31266498ejf.11;
        Tue, 19 Apr 2022 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OAl3ELUye5QTaEQ9sJN4fiXNJrRrEIjwLn0y+ARKudI=;
        b=L2zifKI3w7RmXkycQ4H5gvj6twdWiT9A6dscdsTTHxIRsvWaDM9fTdCJBuTeuicFaa
         4W4LcIrKDwD6Y1+A8P0WqrJSXcOfwHO2iElPLjZGwl34sxnygBZToCQ+RCbnQ99tBLkZ
         NBfa+goHX5wDEyRa8bNcYT1+Yd8ZPhOlYvYW572Uil9ZYstuLtBcgpK3nnzjRCrW3awk
         bdyNvTPUmHDSIV28qkqSMUsusaYVtdOTML7ntWVlyWRywoi41Mr7BqoB/ElIu9cYb87F
         y5mxzrG/rjYb7ahxZcWvsc7ramvxbw5sdomeCEK4PXBySRoejPbDux7WSwuQFMCmfwW7
         BDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OAl3ELUye5QTaEQ9sJN4fiXNJrRrEIjwLn0y+ARKudI=;
        b=w37vUmDy9iqjuufE2cdf5Kgb4zL0rtyaS8NVliKLqBeLduYIrRcbQKlPYUbRXchkib
         1Ent7KDwo5MVtP1Wn9VCv2/ONdAJU5fmD7f1sCvwuu8uCtsaz9ptUoH9pkuC6Lly3X54
         HJkHSfJ/LIKIdXsfDp/zm9BkXbnVg20ylQ2ZduyR3xepJ5SbyzlHZtDcYJMlJmwwnrL8
         evzmZqumcbS3gaJnP+RCqjE6PRLAc+JZnr+UNp8zjpjDqqzo0r72qGrkeo4MhEOP87/t
         3mqK7oLVRm5qrakH+j1W7q0elaYjewLJOUZPBTLXeZIEdttRXUQ5Hz8M1QzuD0JV4oMg
         NmpQ==
X-Gm-Message-State: AOAM532kXxvoKlI7vZxsL/Qvd8xEZigONWGVgiYr4rqIw5Rps8uaFkl+
        j5PrwXTMB3UtQMHAGscQ/kO/f6KjJv6W547VbRQ=
X-Google-Smtp-Source: ABdhPJwY+PoNDh82e6wjgwVfETAjklw8Ms/pQYPEFBb/lwXxLt3QC3DtuPVp/Aqno10l+I4tBo23X89s7b/SVZSZyFs=
X-Received: by 2002:a17:906:3799:b0:6ec:d25:3afe with SMTP id
 n25-20020a170906379900b006ec0d253afemr12665959ejc.44.1650356614546; Tue, 19
 Apr 2022 01:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Meo4TbdxQzynb7paDgC7J19Tc6hhKU7du4mZvgP0mynTQ@mail.gmail.com>
 <20220419012810.88417-1-schspa@gmail.com>
In-Reply-To: <20220419012810.88417-1-schspa@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 19 Apr 2022 11:22:58 +0300
Message-ID: <CAHp75VdGB=uT8qB=GbzyP8vJ5mvVL_T_2PG4GPg-5MYq2OBaWA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: use raw spinlock for gpio chip shadowed data
To:     Schspa Shi <schspa@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        opendmb@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 19, 2022 at 4:28 AM Schspa Shi <schspa@gmail.com> wrote:
>
> In case of PREEMPT_RT, there is a raw_spinlock -> spinlock dependency
> as the lockdep report shows.
>
> __irq_set_handler
>   irq_get_desc_buslock
>     __irq_get_desc_lock
>       raw_spin_lock_irqsave(&desc->lock, *flags);  // raw spinlock get he=
re
>   __irq_do_set_handler
>     mask_ack_irq
>       dwapb_irq_ack
>         spin_lock_irqsave(&gc->bgpio_lock, flags); // sleep able spinlock
>   irq_put_desc_busunlock
>
> Replace with a raw lock to avoid BUGs. This lock is only used to access
> registers, and It's safe to replace with the raw lock without bad
> influence.
>
> [   15.090359][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   15.090365][    T1] [ BUG: Invalid wait context ]
> [   15.090373][    T1] 5.10.59-rt52-00983-g186a6841c682-dirty #3 Not tain=
ted
> [   15.090386][    T1] -----------------------------
> [   15.090392][    T1] swapper/0/1 is trying to lock:
> [   15.090402][    T1] 70ff00018507c188 (&gc->bgpio_lock){....}-{3:3}, at=
: _raw_spin_lock_irqsave+0x1c/0x28
> [   15.090470][    T1] other info that might help us debug this:
> [   15.090477][    T1] context-{5:5}
> [   15.090485][    T1] 3 locks held by swapper/0/1:
> [   15.090497][    T1]  #0: c2ff0001816de1a0 (&dev->mutex){....}-{4:4}, a=
t: __device_driver_lock+0x98/0x104
> [   15.090553][    T1]  #1: ffff90001485b4b8 (irq_domain_mutex){+.+.}-{4:=
4}, at: irq_domain_associate+0xbc/0x6d4
> [   15.090606][    T1]  #2: 4bff000185d7a8e0 (lock_class){....}-{2:2}, at=
: _raw_spin_lock_irqsave+0x1c/0x28
> [   15.090654][    T1] stack backtrace:
> [   15.090661][    T1] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.10.59-=
rt52-00983-g186a6841c682-dirty #3
> [   15.090682][    T1] Hardware name: Horizon Robotics Journey 5 DVB (DT)
> [   15.090692][    T1] Call trace:
> ......
> [   15.090811][    T1]  _raw_spin_lock_irqsave+0x1c/0x28
> [   15.090828][    T1]  dwapb_irq_ack+0xb4/0x300
> [   15.090846][    T1]  __irq_do_set_handler+0x494/0xb2c
> [   15.090864][    T1]  __irq_set_handler+0x74/0x114
> [   15.090881][    T1]  irq_set_chip_and_handler_name+0x44/0x58
> [   15.090900][    T1]  gpiochip_irq_map+0x210/0x644

Looks good to me,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Schspa Shi <schspa@gmail.com>
>
> ---
>
> Changelog:
> v1 -> v2:
>         - Reduce the useless stacktrace.
>         - Split to series of patches
> v2 -> v3:
>         - Restore to a single patch as Andy and Bartosz's suggest
>         - add cutter =E2=80=98--- =E2=80=98 line for Change log
> ---
>  drivers/gpio/gpio-amdpt.c                 | 10 +++----
>  drivers/gpio/gpio-brcmstb.c               | 12 ++++----
>  drivers/gpio/gpio-cadence.c               | 12 ++++----
>  drivers/gpio/gpio-dwapb.c                 | 36 +++++++++++------------
>  drivers/gpio/gpio-grgpio.c                | 30 +++++++++----------
>  drivers/gpio/gpio-hlwd.c                  | 18 ++++++------
>  drivers/gpio/gpio-idt3243x.c              | 12 ++++----
>  drivers/gpio/gpio-ixp4xx.c                |  4 +--
>  drivers/gpio/gpio-loongson1.c             |  8 ++---
>  drivers/gpio/gpio-menz127.c               |  8 ++---
>  drivers/gpio/gpio-mlxbf2.c                | 18 ++++++------
>  drivers/gpio/gpio-mmio.c                  | 22 +++++++-------
>  drivers/gpio/gpio-sifive.c                | 12 ++++----
>  drivers/gpio/gpio-tb10x.c                 |  4 +--
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |  8 ++---
>  include/linux/gpio/driver.h               |  2 +-
>  16 files changed, 108 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
> index 8cfb353c3abb..07c6d090058d 100644
> --- a/drivers/gpio/gpio-amdpt.c
> +++ b/drivers/gpio/gpio-amdpt.c
> @@ -36,19 +36,19 @@ static int pt_gpio_request(struct gpio_chip *gc, unsi=
gned offset)
>
>         dev_dbg(gc->parent, "pt_gpio_request offset=3D%x\n", offset);
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         using_pins =3D readl(pt_gpio->reg_base + PT_SYNC_REG);
>         if (using_pins & BIT(offset)) {
>                 dev_warn(gc->parent, "PT GPIO pin %x reconfigured\n",
>                          offset);
> -               spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +               raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>                 return -EINVAL;
>         }
>
>         writel(using_pins | BIT(offset), pt_gpio->reg_base + PT_SYNC_REG)=
;
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         return 0;
>  }
> @@ -59,13 +59,13 @@ static void pt_gpio_free(struct gpio_chip *gc, unsign=
ed offset)
>         unsigned long flags;
>         u32 using_pins;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         using_pins =3D readl(pt_gpio->reg_base + PT_SYNC_REG);
>         using_pins &=3D ~BIT(offset);
>         writel(using_pins, pt_gpio->reg_base + PT_SYNC_REG);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         dev_dbg(gc->parent, "pt_gpio_free offset=3D%x\n", offset);
>  }
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 74ef89248867..6b7439b44690 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -92,9 +92,9 @@ brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *=
bank)
>         unsigned long status;
>         unsigned long flags;
>
> -       spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
>         status =3D __brcmstb_gpio_get_active_irqs(bank);
> -       spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
>
>         return status;
>  }
> @@ -114,14 +114,14 @@ static void brcmstb_gpio_set_imask(struct brcmstb_g=
pio_bank *bank,
>         u32 imask;
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         imask =3D gc->read_reg(priv->reg_base + GIO_MASK(bank->id));
>         if (enable)
>                 imask |=3D mask;
>         else
>                 imask &=3D ~mask;
>         gc->write_reg(priv->reg_base + GIO_MASK(bank->id), imask);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> @@ -204,7 +204,7 @@ static int brcmstb_gpio_irq_set_type(struct irq_data =
*d, unsigned int type)
>                 return -EINVAL;
>         }
>
> -       spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
>
>         iedge_config =3D bank->gc.read_reg(priv->reg_base +
>                         GIO_EC(bank->id)) & ~mask;
> @@ -220,7 +220,7 @@ static int brcmstb_gpio_irq_set_type(struct irq_data =
*d, unsigned int type)
>         bank->gc.write_reg(priv->reg_base + GIO_LEVEL(bank->id),
>                         ilevel | level);
>
> -       spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
>         return 0;
>  }
>
> diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
> index 562f8f7e7d1f..137aea49ba02 100644
> --- a/drivers/gpio/gpio-cadence.c
> +++ b/drivers/gpio/gpio-cadence.c
> @@ -41,12 +41,12 @@ static int cdns_gpio_request(struct gpio_chip *chip, =
unsigned int offset)
>         struct cdns_gpio_chip *cgpio =3D gpiochip_get_data(chip);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&chip->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
>
>         iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) & ~BIT(of=
fset),
>                   cgpio->regs + CDNS_GPIO_BYPASS_MODE);
>
> -       spin_unlock_irqrestore(&chip->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
>         return 0;
>  }
>
> @@ -55,13 +55,13 @@ static void cdns_gpio_free(struct gpio_chip *chip, un=
signed int offset)
>         struct cdns_gpio_chip *cgpio =3D gpiochip_get_data(chip);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&chip->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
>
>         iowrite32(ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE) |
>                   (BIT(offset) & cgpio->bypass_orig),
>                   cgpio->regs + CDNS_GPIO_BYPASS_MODE);
>
> -       spin_unlock_irqrestore(&chip->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
>  }
>
>  static void cdns_gpio_irq_mask(struct irq_data *d)
> @@ -90,7 +90,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d, u=
nsigned int type)
>         u32 mask =3D BIT(d->hwirq);
>         int ret =3D 0;
>
> -       spin_lock_irqsave(&chip->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&chip->bgpio_lock, flags);
>
>         int_value =3D ioread32(cgpio->regs + CDNS_GPIO_IRQ_VALUE) & ~mask=
;
>         int_type =3D ioread32(cgpio->regs + CDNS_GPIO_IRQ_TYPE) & ~mask;
> @@ -115,7 +115,7 @@ static int cdns_gpio_irq_set_type(struct irq_data *d,=
 unsigned int type)
>         iowrite32(int_type, cgpio->regs + CDNS_GPIO_IRQ_TYPE);
>
>  err_irq_type:
> -       spin_unlock_irqrestore(&chip->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&chip->bgpio_lock, flags);
>         return ret;
>  }
>
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index b0f3aca61974..7130195da48d 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -243,9 +243,9 @@ static void dwapb_irq_ack(struct irq_data *d)
>         u32 val =3D BIT(irqd_to_hwirq(d));
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         dwapb_write(gpio, GPIO_PORTA_EOI, val);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void dwapb_irq_mask(struct irq_data *d)
> @@ -255,10 +255,10 @@ static void dwapb_irq_mask(struct irq_data *d)
>         unsigned long flags;
>         u32 val;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         val =3D dwapb_read(gpio, GPIO_INTMASK) | BIT(irqd_to_hwirq(d));
>         dwapb_write(gpio, GPIO_INTMASK, val);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void dwapb_irq_unmask(struct irq_data *d)
> @@ -268,10 +268,10 @@ static void dwapb_irq_unmask(struct irq_data *d)
>         unsigned long flags;
>         u32 val;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         val =3D dwapb_read(gpio, GPIO_INTMASK) & ~BIT(irqd_to_hwirq(d));
>         dwapb_write(gpio, GPIO_INTMASK, val);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void dwapb_irq_enable(struct irq_data *d)
> @@ -281,11 +281,11 @@ static void dwapb_irq_enable(struct irq_data *d)
>         unsigned long flags;
>         u32 val;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         val =3D dwapb_read(gpio, GPIO_INTEN);
>         val |=3D BIT(irqd_to_hwirq(d));
>         dwapb_write(gpio, GPIO_INTEN, val);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void dwapb_irq_disable(struct irq_data *d)
> @@ -295,11 +295,11 @@ static void dwapb_irq_disable(struct irq_data *d)
>         unsigned long flags;
>         u32 val;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         val =3D dwapb_read(gpio, GPIO_INTEN);
>         val &=3D ~BIT(irqd_to_hwirq(d));
>         dwapb_write(gpio, GPIO_INTEN, val);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static int dwapb_irq_set_type(struct irq_data *d, u32 type)
> @@ -309,7 +309,7 @@ static int dwapb_irq_set_type(struct irq_data *d, u32=
 type)
>         irq_hw_number_t bit =3D irqd_to_hwirq(d);
>         unsigned long level, polarity, flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         level =3D dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
>         polarity =3D dwapb_read(gpio, GPIO_INT_POLARITY);
>
> @@ -344,7 +344,7 @@ static int dwapb_irq_set_type(struct irq_data *d, u32=
 type)
>         dwapb_write(gpio, GPIO_INTTYPE_LEVEL, level);
>         if (type !=3D IRQ_TYPE_EDGE_BOTH)
>                 dwapb_write(gpio, GPIO_INT_POLARITY, polarity);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         return 0;
>  }
> @@ -374,7 +374,7 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *=
gc,
>         unsigned long flags, val_deb;
>         unsigned long mask =3D BIT(offset);
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         val_deb =3D dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
>         if (debounce)
> @@ -383,7 +383,7 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *=
gc,
>                 val_deb &=3D ~mask;
>         dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         return 0;
>  }
> @@ -738,7 +738,7 @@ static int dwapb_gpio_suspend(struct device *dev)
>         unsigned long flags;
>         int i;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         for (i =3D 0; i < gpio->nr_ports; i++) {
>                 unsigned int offset;
>                 unsigned int idx =3D gpio->ports[i].idx;
> @@ -765,7 +765,7 @@ static int dwapb_gpio_suspend(struct device *dev)
>                         dwapb_write(gpio, GPIO_INTMASK, ~ctx->wake_en);
>                 }
>         }
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
>
> @@ -785,7 +785,7 @@ static int dwapb_gpio_resume(struct device *dev)
>                 return err;
>         }
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         for (i =3D 0; i < gpio->nr_ports; i++) {
>                 unsigned int offset;
>                 unsigned int idx =3D gpio->ports[i].idx;
> @@ -812,7 +812,7 @@ static int dwapb_gpio_resume(struct device *dev)
>                         dwapb_write(gpio, GPIO_PORTA_EOI, 0xffffffff);
>                 }
>         }
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         return 0;
>  }
> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index 23d447e17a67..df563616f943 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -145,7 +145,7 @@ static int grgpio_irq_set_type(struct irq_data *d, un=
signed int type)
>                 return -EINVAL;
>         }
>
> -       spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
>
>         ipol =3D priv->gc.read_reg(priv->regs + GRGPIO_IPOL) & ~mask;
>         iedge =3D priv->gc.read_reg(priv->regs + GRGPIO_IEDGE) & ~mask;
> @@ -153,7 +153,7 @@ static int grgpio_irq_set_type(struct irq_data *d, un=
signed int type)
>         priv->gc.write_reg(priv->regs + GRGPIO_IPOL, ipol | pol);
>         priv->gc.write_reg(priv->regs + GRGPIO_IEDGE, iedge | edge);
>
> -       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
>
>         return 0;
>  }
> @@ -164,11 +164,11 @@ static void grgpio_irq_mask(struct irq_data *d)
>         int offset =3D d->hwirq;
>         unsigned long flags;
>
> -       spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
>
>         grgpio_set_imask(priv, offset, 0);
>
> -       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
>  }
>
>  static void grgpio_irq_unmask(struct irq_data *d)
> @@ -177,11 +177,11 @@ static void grgpio_irq_unmask(struct irq_data *d)
>         int offset =3D d->hwirq;
>         unsigned long flags;
>
> -       spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
>
>         grgpio_set_imask(priv, offset, 1);
>
> -       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
>  }
>
>  static struct irq_chip grgpio_irq_chip =3D {
> @@ -199,7 +199,7 @@ static irqreturn_t grgpio_irq_handler(int irq, void *=
dev)
>         int i;
>         int match =3D 0;
>
> -       spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
>
>         /*
>          * For each gpio line, call its interrupt handler if it its under=
lying
> @@ -215,7 +215,7 @@ static irqreturn_t grgpio_irq_handler(int irq, void *=
dev)
>                 }
>         }
>
> -       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
>
>         if (!match)
>                 dev_warn(priv->dev, "No gpio line matched irq %d\n", irq)=
;
> @@ -247,13 +247,13 @@ static int grgpio_irq_map(struct irq_domain *d, uns=
igned int irq,
>         dev_dbg(priv->dev, "Mapping irq %d for gpio line %d\n",
>                 irq, offset);
>
> -       spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
>
>         /* Request underlying irq if not already requested */
>         lirq->irq =3D irq;
>         uirq =3D &priv->uirqs[lirq->index];
>         if (uirq->refcnt =3D=3D 0) {
> -               spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +               raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
>                 ret =3D request_irq(uirq->uirq, grgpio_irq_handler, 0,
>                                   dev_name(priv->dev), priv);
>                 if (ret) {
> @@ -262,11 +262,11 @@ static int grgpio_irq_map(struct irq_domain *d, uns=
igned int irq,
>                                 uirq->uirq);
>                         return ret;
>                 }
> -               spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
> +               raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
>         }
>         uirq->refcnt++;
>
> -       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
>
>         /* Setup irq  */
>         irq_set_chip_data(irq, priv);
> @@ -290,7 +290,7 @@ static void grgpio_irq_unmap(struct irq_domain *d, un=
signed int irq)
>         irq_set_chip_and_handler(irq, NULL, NULL);
>         irq_set_chip_data(irq, NULL);
>
> -       spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&priv->gc.bgpio_lock, flags);
>
>         /* Free underlying irq if last user unmapped */
>         index =3D -1;
> @@ -309,13 +309,13 @@ static void grgpio_irq_unmap(struct irq_domain *d, =
unsigned int irq)
>                 uirq =3D &priv->uirqs[lirq->index];
>                 uirq->refcnt--;
>                 if (uirq->refcnt =3D=3D 0) {
> -                       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flag=
s);
> +                       raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, =
flags);
>                         free_irq(uirq->uirq, priv);
>                         return;
>                 }
>         }
>
> -       spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&priv->gc.bgpio_lock, flags);
>  }
>
>  static const struct irq_domain_ops grgpio_irq_domain_ops =3D {
> diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
> index 641719a96a1a..4e13e937f832 100644
> --- a/drivers/gpio/gpio-hlwd.c
> +++ b/drivers/gpio/gpio-hlwd.c
> @@ -65,7 +65,7 @@ static void hlwd_gpio_irqhandler(struct irq_desc *desc)
>         int hwirq;
>         u32 emulated_pending;
>
> -       spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
>         pending =3D ioread32be(hlwd->regs + HW_GPIOB_INTFLAG);
>         pending &=3D ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
>
> @@ -93,7 +93,7 @@ static void hlwd_gpio_irqhandler(struct irq_desc *desc)
>                 /* Mark emulated interrupts as pending */
>                 pending |=3D rising | falling;
>         }
> -       spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
>
>         chained_irq_enter(chip, desc);
>
> @@ -118,11 +118,11 @@ static void hlwd_gpio_irq_mask(struct irq_data *dat=
a)
>         unsigned long flags;
>         u32 mask;
>
> -       spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
>         mask =3D ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
>         mask &=3D ~BIT(data->hwirq);
>         iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
> -       spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
>  }
>
>  static void hlwd_gpio_irq_unmask(struct irq_data *data)
> @@ -132,11 +132,11 @@ static void hlwd_gpio_irq_unmask(struct irq_data *d=
ata)
>         unsigned long flags;
>         u32 mask;
>
> -       spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
>         mask =3D ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
>         mask |=3D BIT(data->hwirq);
>         iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
> -       spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
>  }
>
>  static void hlwd_gpio_irq_enable(struct irq_data *data)
> @@ -173,7 +173,7 @@ static int hlwd_gpio_irq_set_type(struct irq_data *da=
ta, unsigned int flow_type)
>         unsigned long flags;
>         u32 level;
>
> -       spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
>
>         hlwd->edge_emulation &=3D ~BIT(data->hwirq);
>
> @@ -194,11 +194,11 @@ static int hlwd_gpio_irq_set_type(struct irq_data *=
data, unsigned int flow_type)
>                 hlwd_gpio_irq_setup_emulation(hlwd, data->hwirq, flow_typ=
e);
>                 break;
>         default:
> -               spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
> +               raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags=
);
>                 return -EINVAL;
>         }
>
> -       spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
>         return 0;
>  }
>
> diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
> index 52b8b72ded77..1cafdf46f875 100644
> --- a/drivers/gpio/gpio-idt3243x.c
> +++ b/drivers/gpio/gpio-idt3243x.c
> @@ -57,7 +57,7 @@ static int idt_gpio_irq_set_type(struct irq_data *d, un=
signed int flow_type)
>         if (sense =3D=3D IRQ_TYPE_NONE || (sense & IRQ_TYPE_EDGE_BOTH))
>                 return -EINVAL;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         ilevel =3D readl(ctrl->gpio + IDT_GPIO_ILEVEL);
>         if (sense & IRQ_TYPE_LEVEL_HIGH)
> @@ -68,7 +68,7 @@ static int idt_gpio_irq_set_type(struct irq_data *d, un=
signed int flow_type)
>         writel(ilevel, ctrl->gpio + IDT_GPIO_ILEVEL);
>         irq_set_handler_locked(d, handle_level_irq);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>         return 0;
>  }
>
> @@ -86,12 +86,12 @@ static void idt_gpio_mask(struct irq_data *d)
>         struct idt_gpio_ctrl *ctrl =3D gpiochip_get_data(gc);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         ctrl->mask_cache |=3D BIT(d->hwirq);
>         writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void idt_gpio_unmask(struct irq_data *d)
> @@ -100,12 +100,12 @@ static void idt_gpio_unmask(struct irq_data *d)
>         struct idt_gpio_ctrl *ctrl =3D gpiochip_get_data(gc);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         ctrl->mask_cache &=3D ~BIT(d->hwirq);
>         writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static int idt_gpio_irq_init_hw(struct gpio_chip *gc)
> diff --git a/drivers/gpio/gpio-ixp4xx.c b/drivers/gpio/gpio-ixp4xx.c
> index b3b050604e0b..6b184502fa3f 100644
> --- a/drivers/gpio/gpio-ixp4xx.c
> +++ b/drivers/gpio/gpio-ixp4xx.c
> @@ -128,7 +128,7 @@ static int ixp4xx_gpio_irq_set_type(struct irq_data *=
d, unsigned int type)
>                 int_reg =3D IXP4XX_REG_GPIT1;
>         }
>
> -       spin_lock_irqsave(&g->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&g->gc.bgpio_lock, flags);
>
>         /* Clear the style for the appropriate pin */
>         val =3D __raw_readl(g->base + int_reg);
> @@ -147,7 +147,7 @@ static int ixp4xx_gpio_irq_set_type(struct irq_data *=
d, unsigned int type)
>         val |=3D BIT(d->hwirq);
>         __raw_writel(val, g->base + IXP4XX_REG_GPOE);
>
> -       spin_unlock_irqrestore(&g->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&g->gc.bgpio_lock, flags);
>
>         /* This parent only accept level high (asserted) */
>         return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
> diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.=
c
> index 1b1ee94eeab4..5d90b3bc5a25 100644
> --- a/drivers/gpio/gpio-loongson1.c
> +++ b/drivers/gpio/gpio-loongson1.c
> @@ -25,10 +25,10 @@ static int ls1x_gpio_request(struct gpio_chip *gc, un=
signed int offset)
>  {
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         __raw_writel(__raw_readl(gpio_reg_base + GPIO_CFG) | BIT(offset),
>                      gpio_reg_base + GPIO_CFG);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         return 0;
>  }
> @@ -37,10 +37,10 @@ static void ls1x_gpio_free(struct gpio_chip *gc, unsi=
gned int offset)
>  {
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         __raw_writel(__raw_readl(gpio_reg_base + GPIO_CFG) & ~BIT(offset)=
,
>                      gpio_reg_base + GPIO_CFG);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static int ls1x_gpio_probe(struct platform_device *pdev)
> diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
> index 1e21c661d79d..a035a9bcb57c 100644
> --- a/drivers/gpio/gpio-menz127.c
> +++ b/drivers/gpio/gpio-menz127.c
> @@ -64,7 +64,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsi=
gned gpio,
>                 debounce /=3D 50;
>         }
>
> -       spin_lock(&gc->bgpio_lock);
> +       raw_spin_lock(&gc->bgpio_lock);
>
>         db_en =3D readl(priv->reg_base + MEN_Z127_DBER);
>
> @@ -79,7 +79,7 @@ static int men_z127_debounce(struct gpio_chip *gc, unsi=
gned gpio,
>         writel(db_en, priv->reg_base + MEN_Z127_DBER);
>         writel(db_cnt, priv->reg_base + GPIO_TO_DBCNT_REG(gpio));
>
> -       spin_unlock(&gc->bgpio_lock);
> +       raw_spin_unlock(&gc->bgpio_lock);
>
>         return 0;
>  }
> @@ -91,7 +91,7 @@ static int men_z127_set_single_ended(struct gpio_chip *=
gc,
>         struct men_z127_gpio *priv =3D gpiochip_get_data(gc);
>         u32 od_en;
>
> -       spin_lock(&gc->bgpio_lock);
> +       raw_spin_lock(&gc->bgpio_lock);
>         od_en =3D readl(priv->reg_base + MEN_Z127_ODER);
>
>         if (param =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN)
> @@ -101,7 +101,7 @@ static int men_z127_set_single_ended(struct gpio_chip=
 *gc,
>                 od_en &=3D ~BIT(offset);
>
>         writel(od_en, priv->reg_base + MEN_Z127_ODER);
> -       spin_unlock(&gc->bgpio_lock);
> +       raw_spin_unlock(&gc->bgpio_lock);
>
>         return 0;
>  }
> diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
> index 3d89912a05b8..64cb060d9d75 100644
> --- a/drivers/gpio/gpio-mlxbf2.c
> +++ b/drivers/gpio/gpio-mlxbf2.c
> @@ -131,7 +131,7 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpi=
o_context *gs)
>         u32 arm_gpio_lock_val;
>
>         mutex_lock(yu_arm_gpio_lock_param.lock);
> -       spin_lock(&gs->gc.bgpio_lock);
> +       raw_spin_lock(&gs->gc.bgpio_lock);
>
>         arm_gpio_lock_val =3D readl(yu_arm_gpio_lock_param.io);
>
> @@ -139,7 +139,7 @@ static int mlxbf2_gpio_lock_acquire(struct mlxbf2_gpi=
o_context *gs)
>          * When lock active bit[31] is set, ModeX is write enabled
>          */
>         if (YU_LOCK_ACTIVE_BIT(arm_gpio_lock_val)) {
> -               spin_unlock(&gs->gc.bgpio_lock);
> +               raw_spin_unlock(&gs->gc.bgpio_lock);
>                 mutex_unlock(yu_arm_gpio_lock_param.lock);
>                 return -EINVAL;
>         }
> @@ -157,7 +157,7 @@ static void mlxbf2_gpio_lock_release(struct mlxbf2_gp=
io_context *gs)
>         __releases(yu_arm_gpio_lock_param.lock)
>  {
>         writel(YU_ARM_GPIO_LOCK_RELEASE, yu_arm_gpio_lock_param.io);
> -       spin_unlock(&gs->gc.bgpio_lock);
> +       raw_spin_unlock(&gs->gc.bgpio_lock);
>         mutex_unlock(yu_arm_gpio_lock_param.lock);
>  }
>
> @@ -237,7 +237,7 @@ static void mlxbf2_gpio_irq_enable(struct irq_data *i=
rqd)
>         unsigned long flags;
>         u32 val;
>
> -       spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
>         val =3D readl(gs->gpio_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
>         val |=3D BIT(offset);
>         writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
> @@ -245,7 +245,7 @@ static void mlxbf2_gpio_irq_enable(struct irq_data *i=
rqd)
>         val =3D readl(gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
>         val |=3D BIT(offset);
>         writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
> -       spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
>  }
>
>  static void mlxbf2_gpio_irq_disable(struct irq_data *irqd)
> @@ -256,11 +256,11 @@ static void mlxbf2_gpio_irq_disable(struct irq_data=
 *irqd)
>         unsigned long flags;
>         u32 val;
>
> -       spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
>         val =3D readl(gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
>         val &=3D ~BIT(offset);
>         writel(val, gs->gpio_io + YU_GPIO_CAUSE_OR_EVTEN0);
> -       spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
>  }
>
>  static irqreturn_t mlxbf2_gpio_irq_handler(int irq, void *ptr)
> @@ -307,7 +307,7 @@ mlxbf2_gpio_irq_set_type(struct irq_data *irqd, unsig=
ned int type)
>                 return -EINVAL;
>         }
>
> -       spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
>         if (fall) {
>                 val =3D readl(gs->gpio_io + YU_GPIO_CAUSE_FALL_EN);
>                 val |=3D BIT(offset);
> @@ -319,7 +319,7 @@ mlxbf2_gpio_irq_set_type(struct irq_data *irqd, unsig=
ned int type)
>                 val |=3D BIT(offset);
>                 writel(val, gs->gpio_io + YU_GPIO_CAUSE_RISE_EN);
>         }
> -       spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
>
>         return 0;
>  }
> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index c335a0309ba3..d9dff3dc92ae 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
> @@ -220,7 +220,7 @@ static void bgpio_set(struct gpio_chip *gc, unsigned =
int gpio, int val)
>         unsigned long mask =3D bgpio_line2mask(gc, gpio);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         if (val)
>                 gc->bgpio_data |=3D mask;
> @@ -229,7 +229,7 @@ static void bgpio_set(struct gpio_chip *gc, unsigned =
int gpio, int val)
>
>         gc->write_reg(gc->reg_dat, gc->bgpio_data);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void bgpio_set_with_clear(struct gpio_chip *gc, unsigned int gpio=
,
> @@ -248,7 +248,7 @@ static void bgpio_set_set(struct gpio_chip *gc, unsig=
ned int gpio, int val)
>         unsigned long mask =3D bgpio_line2mask(gc, gpio);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         if (val)
>                 gc->bgpio_data |=3D mask;
> @@ -257,7 +257,7 @@ static void bgpio_set_set(struct gpio_chip *gc, unsig=
ned int gpio, int val)
>
>         gc->write_reg(gc->reg_set, gc->bgpio_data);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void bgpio_multiple_get_masks(struct gpio_chip *gc,
> @@ -286,7 +286,7 @@ static void bgpio_set_multiple_single_reg(struct gpio=
_chip *gc,
>         unsigned long flags;
>         unsigned long set_mask, clear_mask;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         bgpio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
>
> @@ -295,7 +295,7 @@ static void bgpio_set_multiple_single_reg(struct gpio=
_chip *gc,
>
>         gc->write_reg(reg, gc->bgpio_data);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void bgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask=
,
> @@ -347,7 +347,7 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigne=
d int gpio)
>  {
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         gc->bgpio_dir &=3D ~bgpio_line2mask(gc, gpio);
>
> @@ -356,7 +356,7 @@ static int bgpio_dir_in(struct gpio_chip *gc, unsigne=
d int gpio)
>         if (gc->reg_dir_out)
>                 gc->write_reg(gc->reg_dir_out, gc->bgpio_dir);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         return 0;
>  }
> @@ -387,7 +387,7 @@ static void bgpio_dir_out(struct gpio_chip *gc, unsig=
ned int gpio, int val)
>  {
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         gc->bgpio_dir |=3D bgpio_line2mask(gc, gpio);
>
> @@ -396,7 +396,7 @@ static void bgpio_dir_out(struct gpio_chip *gc, unsig=
ned int gpio, int val)
>         if (gc->reg_dir_out)
>                 gc->write_reg(gc->reg_dir_out, gc->bgpio_dir);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gp=
io,
> @@ -610,7 +610,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *d=
ev,
>         if (gc->bgpio_bits > BITS_PER_LONG)
>                 return -EINVAL;
>
> -       spin_lock_init(&gc->bgpio_lock);
> +       raw_spin_lock_init(&gc->bgpio_lock);
>         gc->parent =3D dev;
>         gc->label =3D dev_name(dev);
>         gc->base =3D -1;
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 7d82388b4ab7..03b8c4de2e91 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -44,7 +44,7 @@ static void sifive_gpio_set_ie(struct sifive_gpio *chip=
, unsigned int offset)
>         unsigned long flags;
>         unsigned int trigger;
>
> -       spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
>         trigger =3D (chip->irq_state & BIT(offset)) ? chip->trigger[offse=
t] : 0;
>         regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
>                            (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset)=
 : 0);
> @@ -54,7 +54,7 @@ static void sifive_gpio_set_ie(struct sifive_gpio *chip=
, unsigned int offset)
>                            (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) =
: 0);
>         regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
>                            (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) :=
 0);
> -       spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
>  }
>
>  static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int tri=
gger)
> @@ -84,13 +84,13 @@ static void sifive_gpio_irq_enable(struct irq_data *d=
)
>         /* Switch to input */
>         gc->direction_input(gc, offset);
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         /* Clear any sticky pending interrupts */
>         regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
>         regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
>         regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
>         regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         /* Enable interrupts */
>         assign_bit(offset, &chip->irq_state, 1);
> @@ -116,13 +116,13 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
>         u32 bit =3D BIT(offset);
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>         /* Clear all pending interrupts */
>         regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
>         regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
>         regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
>         regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>
>         irq_chip_eoi_parent(d);
>  }
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index 718a508d3b2f..de6afa3f9716 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -62,14 +62,14 @@ static inline void tb10x_set_bits(struct tb10x_gpio *=
gpio, unsigned int offs,
>         u32 r;
>         unsigned long flags;
>
> -       spin_lock_irqsave(&gpio->gc.bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gpio->gc.bgpio_lock, flags);
>
>         r =3D tb10x_reg_read(gpio, offs);
>         r =3D (r & ~mask) | (val & mask);
>
>         tb10x_reg_write(gpio, offs, r);
>
> -       spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gpio->gc.bgpio_lock, flags);
>  }
>
>  static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/=
nuvoton/pinctrl-npcm7xx.c
> index 9557fac5d11c..b2a0f11a658b 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -104,12 +104,12 @@ static void npcm_gpio_set(struct gpio_chip *gc, voi=
d __iomem *reg,
>         unsigned long flags;
>         unsigned long val;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         val =3D ioread32(reg) | pinmask;
>         iowrite32(val, reg);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void npcm_gpio_clr(struct gpio_chip *gc, void __iomem *reg,
> @@ -118,12 +118,12 @@ static void npcm_gpio_clr(struct gpio_chip *gc, voi=
d __iomem *reg,
>         unsigned long flags;
>         unsigned long val;
>
> -       spin_lock_irqsave(&gc->bgpio_lock, flags);
> +       raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
>
>         val =3D ioread32(reg) & ~pinmask;
>         iowrite32(val, reg);
>
> -       spin_unlock_irqrestore(&gc->bgpio_lock, flags);
> +       raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
>  }
>
>  static void npcmgpio_dbg_show(struct seq_file *s, struct gpio_chip *chip=
)
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 874aabd270c9..ff8247a19f57 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -445,7 +445,7 @@ struct gpio_chip {
>         void __iomem *reg_dir_in;
>         bool bgpio_dir_unreadable;
>         int bgpio_bits;
> -       spinlock_t bgpio_lock;
> +       raw_spinlock_t bgpio_lock;
>         unsigned long bgpio_data;
>         unsigned long bgpio_dir;
>  #endif /* CONFIG_GPIO_GENERIC */
> --
> 2.24.3 (Apple Git-128)
>


--=20
With Best Regards,
Andy Shevchenko
