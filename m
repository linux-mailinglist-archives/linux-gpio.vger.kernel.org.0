Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80EC2928B4
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 16:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgJSOBm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 10:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbgJSOBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 10:01:41 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFD2C0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:01:41 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id e7so6048102pfn.12
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p2Ao+ZvKz7Sccwyj8CurRMLkxu9iE8z6oHo9tCS+ThY=;
        b=FU4cbSVNVHFphHZG0GKPM7CaN8mKv4CdztQO8Z7rLCot2GlEJ7xxrQ5dchgm6aINgF
         laJXfwgxgnn/PynwQipmAi4D0eCP/BS1GG/HR5/nf/hbUOa5MB7c+0ANMx8vdyDO6ubm
         FY01VrDW8ty+Q1xGE4Bi/w0uNV8PShFYNtqOL4I6iIrpGwtd0LYSeU+JjKrM3NvLZ1X+
         VbL20iZIn6DFj8D079RW3ZM9l546EDH6cyEFJGCwH10q7yWYrl6xTGUTPeFDPcckGtVd
         jZMSUh3Y1WLGwABDTYAn5Ca0IIDbfjEcfv6CO5/C37oSgho1Am3v59LeIrtprwu7z1d8
         plCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p2Ao+ZvKz7Sccwyj8CurRMLkxu9iE8z6oHo9tCS+ThY=;
        b=fQpjzftlgq4BK3Rzu372LjPw7H1nKxWKxp7TaOuP3iJnjgVCWlnQXfZudW2llH5873
         8OBUaBlRHXimK/m3qYx9eSg2exiM1N5FRFirnoHQdd1OVDfI666/Mn5JHwTYOJZ1j7Jm
         lJCsfO0xSfrQw/BZzUCtXj46XUps97hYW4Kq/fB8/2OLv8ylyeur8mCN5bkxwL/I60s3
         mjS+IogxKpolKu1G50jTkPWHfG49f3E1byh9CX33mnwPAHhrXjaxKtNzKIY1NMUIpgaI
         pJoxzAcJ+E19LM3gYOgjoBPKYiL1e0y2XpuiNvoir542ezZ65dYx6jGDMsqVrmZXREjL
         m8zA==
X-Gm-Message-State: AOAM532Nz2WeiTE1t8egFDkNnxnTCFBOzN2Rs/aauRceaMggmbqRoeT+
        BikWuSFoZQmCeoLuBz8UZ17trYF0esLkLpUazU0=
X-Google-Smtp-Source: ABdhPJzK8Zycy11rQkirDhiRn9f4SxFPRl9QzDtA8gXEdVhg9OqrFD/aV6uKW9AZ07YJxE06pJGOb0u2WjrHTBcyNBA=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr8056993pfd.7.1603116100399; Mon, 19 Oct
 2020 07:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201019134046.65101-1-linus.walleij@linaro.org>
In-Reply-To: <20201019134046.65101-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Oct 2020 17:02:29 +0300
Message-ID: <CAHp75Vdav_D-8O7KxNaZ1BPCPv0Kz-c43m+ffOXrQiHk6ZVp4Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: Retire the explicit gpio irqchip code
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 4:44 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Now that all gpiolib irqchip users have been over to use
> the irqchip template, we can finally retire the old code
> path and leave just one way in to the irqchip: set up the

in to -> into ?

> template when registering the gpio_chip. For a while
> we had two code paths for this which was a bit confusing.
>
> This brings this work to a conclusion, there is now one
> way to do this.

way of doing this ?


Well done milestone!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/driver-api/gpio/driver.rst |  63 ++++++----
>  drivers/gpio/TODO                        |  49 --------
>  drivers/gpio/gpiolib.c                   | 153 -----------------------
>  include/linux/gpio/driver.h              |  71 -----------
>  4 files changed, 42 insertions(+), 294 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
> index 072a7455044e..c9dac5233f3e 100644
> --- a/Documentation/driver-api/gpio/driver.rst
> +++ b/Documentation/driver-api/gpio/driver.rst
> @@ -416,7 +416,8 @@ The preferred way to set up the helpers is to fill in the
>  struct gpio_irq_chip inside struct gpio_chip before adding the gpio_chip.
>  If you do this, the additional irq_chip will be set up by gpiolib at the
>  same time as setting up the rest of the GPIO functionality. The following
> -is a typical example of a cascaded interrupt handler using gpio_irq_chip:
> +is a typical example of a chained cascaded interrupt handler using
> +the gpio_irq_chip:
>
>  .. code-block:: c
>
> @@ -452,7 +453,46 @@ is a typical example of a cascaded interrupt handler using gpio_irq_chip:
>
>    return devm_gpiochip_add_data(dev, &g->gc, g);
>
> -The helper support using hierarchical interrupt controllers as well.
> +The helper support using threaded interrupts as well. Then you just request

supports ?

> +the interrupt separately and go with it:
> +
> +.. code-block:: c
> +
> +  /* Typical state container with dynamic irqchip */
> +  struct my_gpio {
> +      struct gpio_chip gc;
> +      struct irq_chip irq;
> +  };
> +
> +  int irq; /* from platform etc */
> +  struct my_gpio *g;
> +  struct gpio_irq_chip *girq;
> +
> +  /* Set up the irqchip dynamically */
> +  g->irq.name = "my_gpio_irq";
> +  g->irq.irq_ack = my_gpio_ack_irq;
> +  g->irq.irq_mask = my_gpio_mask_irq;
> +  g->irq.irq_unmask = my_gpio_unmask_irq;
> +  g->irq.irq_set_type = my_gpio_set_irq_type;
> +
> +  ret = devm_request_threaded_irq(dev, irq, NULL,
> +               irq_thread_fn, IRQF_ONESHOT, "my-chip", g);
> +  if (ret < 0)
> +       return ret;
> +
> +  /* Get a pointer to the gpio_irq_chip */
> +  girq = &g->gc.irq;
> +  girq->chip = &g->irq;
> +  /* This will let us handle the parent IRQ in the driver */
> +  girq->parent_handler = NULL;
> +  girq->num_parents = 0;
> +  girq->parents = NULL;
> +  girq->default_type = IRQ_TYPE_NONE;
> +  girq->handler = handle_bad_irq;
> +
> +  return devm_gpiochip_add_data(dev, &g->gc, g);
> +
> +The helper supports using hierarchical interrupt controllers as well.
>  In this case the typical set-up will look like this:
>
>  .. code-block:: c
> @@ -493,25 +533,6 @@ the parent hardware irq from a child (i.e. this gpio chip) hardware irq.
>  As always it is good to look at examples in the kernel tree for advice
>  on how to find the required pieces.
>
> -The old way of adding irqchips to gpiochips after registration is also still
> -available but we try to move away from this:
> -
> -- DEPRECATED: gpiochip_irqchip_add(): adds a chained cascaded irqchip to a
> -  gpiochip. It will pass the struct gpio_chip* for the chip to all IRQ
> -  callbacks, so the callbacks need to embed the gpio_chip in its state
> -  container and obtain a pointer to the container using container_of().
> -  (See Documentation/driver-api/driver-model/design-patterns.rst)
> -
> -- gpiochip_irqchip_add_nested(): adds a nested cascaded irqchip to a gpiochip,
> -  as discussed above regarding different types of cascaded irqchips. The
> -  cascaded irq has to be handled by a threaded interrupt handler.
> -  Apart from that it works exactly like the chained irqchip.
> -
> -- gpiochip_set_nested_irqchip(): sets up a nested cascaded irq handler for a
> -  gpio_chip from a parent IRQ. As the parent IRQ has usually been
> -  explicitly requested by the driver, this does very little more than
> -  mark all the child IRQs as having the other IRQ as parent.
> -
>  If there is a need to exclude certain GPIO lines from the IRQ domain handled by
>  these helpers, we can set .irq.need_valid_mask of the gpiochip before
>  devm_gpiochip_add_data() or gpiochip_add_data() is called. This allocates an
> diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
> index e560e45e84f8..cd04e0b60159 100644
> --- a/drivers/gpio/TODO
> +++ b/drivers/gpio/TODO
> @@ -129,58 +129,9 @@ GPIOLIB irqchip
>  The GPIOLIB irqchip is a helper irqchip for "simple cases" that should
>  try to cover any generic kind of irqchip cascaded from a GPIO.
>
> -- Convert all the GPIOLIB_IRQCHIP users to pass an irqchip template,
> -  parent and flags before calling [devm_]gpiochip_add[_data]().
> -  Currently we set up the irqchip after setting up the gpiochip
> -  using gpiochip_irqchip_add() and gpiochip_set_[chained|nested]_irqchip().
> -  This is too complex, so convert all users over to just set up
> -  the irqchip before registering the gpio_chip, typical example:
> -
> -  /* Typical state container with dynamic irqchip */
> -  struct my_gpio {
> -      struct gpio_chip gc;
> -      struct irq_chip irq;
> -  };
> -
> -  int irq; /* from platform etc */
> -  struct my_gpio *g;
> -  struct gpio_irq_chip *girq;
> -
> -  /* Set up the irqchip dynamically */
> -  g->irq.name = "my_gpio_irq";
> -  g->irq.irq_ack = my_gpio_ack_irq;
> -  g->irq.irq_mask = my_gpio_mask_irq;
> -  g->irq.irq_unmask = my_gpio_unmask_irq;
> -  g->irq.irq_set_type = my_gpio_set_irq_type;
> -
> -  /* Get a pointer to the gpio_irq_chip */
> -  girq = &g->gc.irq;
> -  girq->chip = &g->irq;
> -  girq->parent_handler = ftgpio_gpio_irq_handler;
> -  girq->num_parents = 1;
> -  girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
> -                               GFP_KERNEL);
> -  if (!girq->parents)
> -      return -ENOMEM;
> -  girq->default_type = IRQ_TYPE_NONE;
> -  girq->handler = handle_bad_irq;
> -  girq->parents[0] = irq;
> -
> -  When this is done, we will delete the old APIs for instatiating
> -  GPIOLIB_IRQCHIP and simplify the code.
> -
>  - Look over and identify any remaining easily converted drivers and
>    dry-code conversions to gpiolib irqchip for maintainers to test
>
> -- Drop gpiochip_set_chained_irqchip() when all the chained irqchips
> -  have been converted to the above infrastructure.
> -
> -- Add more infrastructure to make it possible to also pass a threaded
> -  irqchip in struct gpio_irq_chip.
> -
> -- Drop gpiochip_irqchip_add_nested() when all the chained irqchips
> -  have been converted to the above infrastructure.
> -
>
>  Increase integration with pin control
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 3b23a0ca77dd..8e29a60c3697 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -924,67 +924,6 @@ bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_irqchip_irq_valid);
>
> -/**
> - * gpiochip_set_cascaded_irqchip() - connects a cascaded irqchip to a gpiochip
> - * @gc: the gpiochip to set the irqchip chain to
> - * @parent_irq: the irq number corresponding to the parent IRQ for this
> - * cascaded irqchip
> - * @parent_handler: the parent interrupt handler for the accumulated IRQ
> - * coming out of the gpiochip. If the interrupt is nested rather than
> - * cascaded, pass NULL in this handler argument
> - */
> -static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gc,
> -                                         unsigned int parent_irq,
> -                                         irq_flow_handler_t parent_handler)
> -{
> -       struct gpio_irq_chip *girq = &gc->irq;
> -       struct device *dev = &gc->gpiodev->dev;
> -
> -       if (!girq->domain) {
> -               chip_err(gc, "called %s before setting up irqchip\n",
> -                        __func__);
> -               return;
> -       }
> -
> -       if (parent_handler) {
> -               if (gc->can_sleep) {
> -                       chip_err(gc,
> -                                "you cannot have chained interrupts on a chip that may sleep\n");
> -                       return;
> -               }
> -               girq->parents = devm_kcalloc(dev, 1,
> -                                            sizeof(*girq->parents),
> -                                            GFP_KERNEL);
> -               if (!girq->parents) {
> -                       chip_err(gc, "out of memory allocating parent IRQ\n");
> -                       return;
> -               }
> -               girq->parents[0] = parent_irq;
> -               girq->num_parents = 1;
> -               /*
> -                * The parent irqchip is already using the chip_data for this
> -                * irqchip, so our callbacks simply use the handler_data.
> -                */
> -               irq_set_chained_handler_and_data(parent_irq, parent_handler,
> -                                                gc);
> -       }
> -}
> -
> -/**
> - * gpiochip_set_nested_irqchip() - connects a nested irqchip to a gpiochip
> - * @gc: the gpiochip to set the irqchip nested handler to
> - * @irqchip: the irqchip to nest to the gpiochip
> - * @parent_irq: the irq number corresponding to the parent IRQ for this
> - * nested irqchip
> - */
> -void gpiochip_set_nested_irqchip(struct gpio_chip *gc,
> -                                struct irq_chip *irqchip,
> -                                unsigned int parent_irq)
> -{
> -       gpiochip_set_cascaded_irqchip(gc, parent_irq, NULL);
> -}
> -EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
> -
>  #ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
>
>  /**
> @@ -1635,98 +1574,6 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gc)
>         gpiochip_irqchip_free_valid_mask(gc);
>  }
>
> -/**
> - * gpiochip_irqchip_add_key() - adds an irqchip to a gpiochip
> - * @gc: the gpiochip to add the irqchip to
> - * @irqchip: the irqchip to add to the gpiochip
> - * @first_irq: if not dynamically assigned, the base (first) IRQ to
> - * allocate gpiochip irqs from
> - * @handler: the irq handler to use (often a predefined irq core function)
> - * @type: the default type for IRQs on this irqchip, pass IRQ_TYPE_NONE
> - * to have the core avoid setting up any default type in the hardware.
> - * @threaded: whether this irqchip uses a nested thread handler
> - * @lock_key: lockdep class for IRQ lock
> - * @request_key: lockdep class for IRQ request
> - *
> - * This function closely associates a certain irqchip with a certain
> - * gpiochip, providing an irq domain to translate the local IRQs to
> - * global irqs in the gpiolib core, and making sure that the gpiochip
> - * is passed as chip data to all related functions. Driver callbacks
> - * need to use gpiochip_get_data() to get their local state containers back
> - * from the gpiochip passed as chip data. An irqdomain will be stored
> - * in the gpiochip that shall be used by the driver to handle IRQ number
> - * translation. The gpiochip will need to be initialized and registered
> - * before calling this function.
> - *
> - * This function will handle two cell:ed simple IRQs and assumes all
> - * the pins on the gpiochip can generate a unique IRQ. Everything else
> - * need to be open coded.
> - */
> -int gpiochip_irqchip_add_key(struct gpio_chip *gc,
> -                            struct irq_chip *irqchip,
> -                            unsigned int first_irq,
> -                            irq_flow_handler_t handler,
> -                            unsigned int type,
> -                            bool threaded,
> -                            struct lock_class_key *lock_key,
> -                            struct lock_class_key *request_key)
> -{
> -       struct device_node *of_node;
> -
> -       if (!gc || !irqchip)
> -               return -EINVAL;
> -
> -       if (!gc->parent) {
> -               chip_err(gc, "missing gpiochip .dev parent pointer\n");
> -               return -EINVAL;
> -       }
> -       gc->irq.threaded = threaded;
> -       of_node = gc->parent->of_node;
> -#ifdef CONFIG_OF_GPIO
> -       /*
> -        * If the gpiochip has an assigned OF node this takes precedence
> -        * FIXME: get rid of this and use gc->parent->of_node
> -        * everywhere
> -        */
> -       if (gc->of_node)
> -               of_node = gc->of_node;
> -#endif
> -       /*
> -        * Specifying a default trigger is a terrible idea if DT or ACPI is
> -        * used to configure the interrupts, as you may end-up with
> -        * conflicting triggers. Tell the user, and reset to NONE.
> -        */
> -       if (WARN(of_node && type != IRQ_TYPE_NONE,
> -                "%pOF: Ignoring %d default trigger\n", of_node, type))
> -               type = IRQ_TYPE_NONE;
> -       if (has_acpi_companion(gc->parent) && type != IRQ_TYPE_NONE) {
> -               acpi_handle_warn(ACPI_HANDLE(gc->parent),
> -                                "Ignoring %d default trigger\n", type);
> -               type = IRQ_TYPE_NONE;
> -       }
> -
> -       gc->irq.chip = irqchip;
> -       gc->irq.handler = handler;
> -       gc->irq.default_type = type;
> -       gc->to_irq = gpiochip_to_irq;
> -       gc->irq.lock_key = lock_key;
> -       gc->irq.request_key = request_key;
> -       gc->irq.domain = irq_domain_add_simple(of_node,
> -                                       gc->ngpio, first_irq,
> -                                       &gpiochip_domain_ops, gc);
> -       if (!gc->irq.domain) {
> -               gc->irq.chip = NULL;
> -               return -EINVAL;
> -       }
> -
> -       gpiochip_set_irq_hooks(gc);
> -
> -       acpi_gpiochip_request_interrupts(gc);
> -
> -       return 0;
> -}
> -EXPORT_SYMBOL_GPL(gpiochip_irqchip_add_key);
> -
>  /**
>   * gpiochip_irqchip_add_domain() - adds an irqdomain to a gpiochip
>   * @gc: the gpiochip to add the irqchip to
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 4a7e295c3640..286de0520574 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -621,83 +621,12 @@ int gpiochip_irq_domain_activate(struct irq_domain *domain,
>  void gpiochip_irq_domain_deactivate(struct irq_domain *domain,
>                                     struct irq_data *data);
>
> -void gpiochip_set_nested_irqchip(struct gpio_chip *gc,
> -               struct irq_chip *irqchip,
> -               unsigned int parent_irq);
> -
> -int gpiochip_irqchip_add_key(struct gpio_chip *gc,
> -                            struct irq_chip *irqchip,
> -                            unsigned int first_irq,
> -                            irq_flow_handler_t handler,
> -                            unsigned int type,
> -                            bool threaded,
> -                            struct lock_class_key *lock_key,
> -                            struct lock_class_key *request_key);
> -
>  bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gc,
>                                 unsigned int offset);
>
>  int gpiochip_irqchip_add_domain(struct gpio_chip *gc,
>                                 struct irq_domain *domain);
>
> -#ifdef CONFIG_LOCKDEP
> -
> -/*
> - * Lockdep requires that each irqchip instance be created with a
> - * unique key so as to avoid unnecessary warnings. This upfront
> - * boilerplate static inlines provides such a key for each
> - * unique instance.
> - */
> -static inline int gpiochip_irqchip_add(struct gpio_chip *gc,
> -                                      struct irq_chip *irqchip,
> -                                      unsigned int first_irq,
> -                                      irq_flow_handler_t handler,
> -                                      unsigned int type)
> -{
> -       static struct lock_class_key lock_key;
> -       static struct lock_class_key request_key;
> -
> -       return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
> -                                       handler, type, false,
> -                                       &lock_key, &request_key);
> -}
> -
> -static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gc,
> -                         struct irq_chip *irqchip,
> -                         unsigned int first_irq,
> -                         irq_flow_handler_t handler,
> -                         unsigned int type)
> -{
> -
> -       static struct lock_class_key lock_key;
> -       static struct lock_class_key request_key;
> -
> -       return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
> -                                       handler, type, true,
> -                                       &lock_key, &request_key);
> -}
> -#else /* ! CONFIG_LOCKDEP */
> -static inline int gpiochip_irqchip_add(struct gpio_chip *gc,
> -                                      struct irq_chip *irqchip,
> -                                      unsigned int first_irq,
> -                                      irq_flow_handler_t handler,
> -                                      unsigned int type)
> -{
> -       return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
> -                                       handler, type, false, NULL, NULL);
> -}
> -
> -static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gc,
> -                         struct irq_chip *irqchip,
> -                         unsigned int first_irq,
> -                         irq_flow_handler_t handler,
> -                         unsigned int type)
> -{
> -       return gpiochip_irqchip_add_key(gc, irqchip, first_irq,
> -                                       handler, type, true, NULL, NULL);
> -}
> -#endif /* CONFIG_LOCKDEP */
> -
>  int gpiochip_generic_request(struct gpio_chip *gc, unsigned int offset);
>  void gpiochip_generic_free(struct gpio_chip *gc, unsigned int offset);
>  int gpiochip_generic_config(struct gpio_chip *gc, unsigned int offset,
> --
> 2.26.2
>


-- 
With Best Regards,
Andy Shevchenko
