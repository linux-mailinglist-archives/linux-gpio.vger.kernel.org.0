Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B850FE59F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 20:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKOTd3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 14:33:29 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36656 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfKOTd2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 14:33:28 -0500
Received: by mail-pg1-f196.google.com with SMTP id k13so6460090pgh.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 11:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=cp3PzINyGMCHojglnJapBfwrq2OpVGdUz19UTlxD2rw=;
        b=kBJGaF9LbsX8frVUcYd6t8i33OWS3Yi3jYORPHAo3A14174kibF0KlriI9dc0zX80C
         Hczs7RKtHXOUN/lwt/g/tIAXjzIZCZVRkGSPTUqfKA913uN/OqLijZ9+Sd39dnq1HtRi
         bAx+MuZcQJxX/jjrGZg4SFaz2unszR4/S7/wU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=cp3PzINyGMCHojglnJapBfwrq2OpVGdUz19UTlxD2rw=;
        b=cn9UpV0anXJcGsJX/MhhGZ4VHWJHUYhVWWvOTp7YLRo6IfhVlxtxMt+8ig/Wt05pxI
         7BeC1q2930bxtkq0SHclbFEuO+APrSmYUskUdW+71urLSGLfcTVmKNVTefcQZHpb21ZP
         4zblTgvItPqY0aWjVTyZsoSCl+7H6vNmOyKTb7WNGyEjgOAGRLDZlIxF1Xo9J8N4cuc7
         ZYbPC8KBG3WvbSszy57VqhgZord2jWF3nCZk43nKYohKmTQQB3hQqgr0mdOhGO1GRoVM
         tLJNGg0+jMjUlMUbIXqvRAPvydLd+ieVpNUTd8LKNtYbhOkDk04Q7K0GwOt5/PFwxADU
         moSA==
X-Gm-Message-State: APjAAAXkECgz+5k447ucBC6ertxXuc4xXqi+yz0tv/K7jCQO71LmZApq
        meymqlWEWeb3t1fDGfSUrZATkA==
X-Google-Smtp-Source: APXvYqx+rdpWSnOOkRQ4xqXZwE++pDxhm84la5znJZ8abx2vdvEtWyjI3FD21WGBh92lAE1Ohl3mvg==
X-Received: by 2002:a62:2686:: with SMTP id m128mr19396637pfm.143.1573846407707;
        Fri, 15 Nov 2019 11:33:27 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v23sm10943496pfm.175.2019.11.15.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:33:26 -0800 (PST)
Message-ID: <5dcefd86.1c69fb81.c72c8.07a1@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-9-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-9-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 08/12] drivers: pinctrl: msm: setup GPIO chip in hierarchy
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:33:25 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:17)
> Some GPIOs are marked as wakeup capable and are routed to another
> interrupt controller that is an always-domain and can detect interrupts
> even most of the SoC is powered off. The wakeup interrupt controller

even when?

> wakes up the GIC and replays the interrupt at the GIC.
>=20
> Setup the TLMM irqchip in hierarchy with the wakeup interrupt controller
> and ensure the wakeup GPIOs are handled correctly.
>=20
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Is it Co-developed-by for Maulik?

> Signed-off-by: Lina Iyer <ilina@codeaurora.org>

Some minor comments. Shouldn't be hard to fix and resend quickly I hope.

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pi=
nctrl-msm.c
> index 763da0b..c245686 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -44,6 +46,7 @@
>   * @enabled_irqs:   Bitmap of currently enabled irqs.
>   * @dual_edge_irqs: Bitmap of irqs that need sw emulated dual edge
>   *                  detection.
> + * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt contr=
roller

s/contrroller/controller/

>   * @soc;            Reference to soc_data of platform specific data.
>   * @regs:           Base addresses for the TLMM tiles.
>   */
> @@ -778,10 +794,37 @@ static void msm_gpio_irq_clear_unmask(struct irq_da=
ta *d, bool status_clear)
> =20
>  static void msm_gpio_irq_enable(struct irq_data *d)
>  {
> +       /*
> +        * Clear the interrupt that may be pending before we enable
> +        * the line.
> +        * This is especially a problem with the GPIOs routed to the
> +        * PDC. These GPIOs are direct-connect interrupts to the GIC.
> +        * Disabling the interrupt line at the PDC does not prevent
> +        * the interrupt from being latched at the GIC. The state at
> +        * GIC needs to be cleared before enabling.
> +        */
> +       if (d->parent_data) {
> +               irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
> +               irq_chip_enable_parent(d);
> +       }
> =20
>         msm_gpio_irq_clear_unmask(d, true);
>  }
> =20
> +static void msm_gpio_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
> +
> +       if (d->parent_data)
> +               irq_chip_disable_parent(d);
> +
> +       if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
> +               return;
> +
> +       msm_gpio_irq_mask(d);

Why not

	if (!test_bit(...)
		msm_gpio_irq_mask(d);

> +}
> +
>  static void msm_gpio_irq_unmask(struct irq_data *d)
>  {
>         msm_gpio_irq_clear_unmask(d, false);
> @@ -912,6 +964,15 @@ static int msm_gpio_irq_set_wake(struct irq_data *d,=
 unsigned int on)
>         struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
>         unsigned long flags;
> =20
> +       if (d->parent_data)
> +               irq_chip_set_wake_parent(d, on);
> +
> +       /*
> +        * While they may not wake up when the TLMM is powered off,
> +        * some GPIOs would like to wakeup the system from suspend
> +        * when TLMM is powered on. To allow that, enable the GPIO
> +        * summary line to be wakeup capable at GIC.
> +        */

Can this comment go above the irq_set_irq_wake() line below instead of
this spinlock?

>         raw_spin_lock_irqsave(&pctrl->lock, flags);
> =20
>         irq_set_irq_wake(pctrl->irq, on);
> @@ -990,6 +1051,30 @@ static void msm_gpio_irq_handler(struct irq_desc *d=
esc)
>         chained_irq_exit(chip, desc);
>  }
> =20
> +static int msm_gpio_wakeirq(struct gpio_chip *gc,
> +                           unsigned int child,
> +                           unsigned int child_type,
> +                           unsigned int *parent,
> +                           unsigned int *parent_type)
> +{
> +       struct msm_pinctrl *pctrl =3D gpiochip_get_data(gc);
> +       const struct msm_gpio_wakeirq_map *map;
> +       int i;
> +
> +       *parent =3D GPIO_NO_WAKE_IRQ;
> +       *parent_type =3D IRQ_TYPE_EDGE_RISING;
> +
> +       for (i =3D 0; i < pctrl->soc->nwakeirq_map; i++) {
> +               map =3D &pctrl->soc->wakeirq_map[i];
> +               if (map->gpio =3D=3D child) {
> +                       *parent =3D map->wakeirq;
> +                       break;
> +               }
> +       }
> +
> +       return 0;

Shouldn't we return -EINVAL if we can't translate the gpio irq to the
parent domain? I would expect to see return -EINVAL here and the above
if condition to return 0 instead of break.

> +}
> +
>  static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
>  {
>         if (pctrl->soc->reserved_gpios)
> @@ -1004,6 +1089,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>         struct gpio_irq_chip *girq;
>         int ret;
>         unsigned ngpio =3D pctrl->soc->ngpios;
> +       struct device_node *np;
> =20
>         if (WARN_ON(ngpio > MAX_NR_GPIO))
>                 return -EINVAL;
> @@ -1020,17 +1106,44 @@ static int msm_gpio_init(struct msm_pinctrl *pctr=
l)
> =20
>         pctrl->irq_chip.name =3D "msmgpio";
>         pctrl->irq_chip.irq_enable =3D msm_gpio_irq_enable;
> +       pctrl->irq_chip.irq_disable =3D msm_gpio_irq_disable;
>         pctrl->irq_chip.irq_mask =3D msm_gpio_irq_mask;
>         pctrl->irq_chip.irq_unmask =3D msm_gpio_irq_unmask;
>         pctrl->irq_chip.irq_ack =3D msm_gpio_irq_ack;
> +       pctrl->irq_chip.irq_eoi =3D irq_chip_eoi_parent;
>         pctrl->irq_chip.irq_set_type =3D msm_gpio_irq_set_type;
>         pctrl->irq_chip.irq_set_wake =3D msm_gpio_irq_set_wake;
>         pctrl->irq_chip.irq_request_resources =3D msm_gpio_irq_reqres;
>         pctrl->irq_chip.irq_release_resources =3D msm_gpio_irq_relres;
> =20
> +       np =3D of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
> +       if (np) {
> +               int i;
> +               bool skip;
> +               unsigned int gpio;

Can these be placed at the top of this function instead of buried
halfway down here?

> +
> +               chip->irq.parent_domain =3D irq_find_matching_host(np,
> +                                                DOMAIN_BUS_WAKEUP);
> +               of_node_put(np);
> +               if (!chip->irq.parent_domain)
> +                       return -EPROBE_DEFER;
> +               chip->irq.child_to_parent_hwirq =3D msm_gpio_wakeirq;
> +
> +               /*
> +                * Let's skip handling the GPIOs, if the parent irqchip
> +                * handling the direct connect IRQ of the GPIO.

is handling?

> +                */
> +               skip =3D irq_domain_qcom_handle_wakeup(chip->irq.parent_d=
omain);
> +               for (i =3D 0; skip && i < pctrl->soc->nwakeirq_map; i++) {
> +                       gpio =3D pctrl->soc->wakeirq_map[i].gpio;
> +                       set_bit(gpio, pctrl->skip_wake_irqs);
> +               }
> +       }
> +
>         girq =3D &chip->irq;
>         girq->chip =3D &pctrl->irq_chip;
>         girq->parent_handler =3D msm_gpio_irq_handler;
> +       girq->fwnode =3D pctrl->dev->fwnode;
>         girq->num_parents =3D 1;
>         girq->parents =3D devm_kcalloc(pctrl->dev, 1, sizeof(*girq->paren=
ts),
>                                      GFP_KERNEL);
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pi=
nctrl-msm.h
> index 48569cda8..1547020 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -5,6 +5,8 @@
>  #ifndef __PINCTRL_MSM_H__
>  #define __PINCTRL_MSM_H__
> =20
> +#include <linux/gpio/driver.h>

What is this include for?

> +
>  struct pinctrl_pin_desc;
> =20
>  /**
> @@ -101,6 +113,8 @@ struct msm_pingroup {
>   * @ngroups:       The numbmer of entries in @groups.
>   * @ngpio:         The number of pingroups the driver should expose as G=
PIOs.
>   * @pull_no_keeper: The SoC does not support keeper bias.
> + * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/M=
PM
> + * @nwakeirq_map:   The number of entries in @hierarchy_map

Is it 'number of entries in @wakeirq_map"?

>   */
>  struct msm_pinctrl_soc_data {
>         const struct pinctrl_pin_desc *pins;
> @@ -114,6 +128,8 @@ struct msm_pinctrl_soc_data {
>         const char *const *tiles;
>         unsigned int ntiles;
>         const int *reserved_gpios;
> +       const struct msm_gpio_wakeirq_map *wakeirq_map;
> +       unsigned int nwakeirq_map;
>  };
> =20
>  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
> index 637c0bf..e01391c 100644
> --- a/include/linux/soc/qcom/irq.h
> +++ b/include/linux/soc/qcom/irq.h
> @@ -18,4 +18,17 @@
>  #define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP                (IRQ_DOMAIN_FLAG_=
NONCORE << 0)
>  #define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP                (IRQ_DOMAIN_FLAG_=
NONCORE << 1)
> =20
> +/**
> + * irq_domain_qcom_handle_wakeup: Return if the domain handles interrupt
> + *                                configuration
> + * @d: irq domain
> + *
> + * This QCOM specific irq domain call returns if the interrupt controller
> + * requires the interrupt be masked at the child interrupt controller.
> + */
> +static inline bool irq_domain_qcom_handle_wakeup(struct irq_domain *d)

could be const irq_domain here.

> +{
> +       return (d->flags & IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP);
> +}
> +
