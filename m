Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10BBCA774A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 00:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfICWvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 18:51:04 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41052 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfICWvE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2019 18:51:04 -0400
Received: by mail-pl1-f193.google.com with SMTP id m9so8606428pls.8
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2019 15:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=9trNFzcMJPxSkbrSQIMdwqf4HgHwbgy97ByQX0gMK0E=;
        b=kVB2bGKrY+RjYxQMQPdpAu0cBQ0jsHUK6i1aB7e3YQSxT4wq4O9JOzSfKusm0rgZAc
         ymgZ3oXqU9FE6mJbG77HAhONRCRLgi4iO217Ph5ut58Y/T95sayXsjxTs8ZvsCHkIO8b
         JekHkmTtj0nhnaZI9IXjo3pTiggUG59ghAlM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=9trNFzcMJPxSkbrSQIMdwqf4HgHwbgy97ByQX0gMK0E=;
        b=a1ERMj7IO/UWtZRUXsCh+wyNY9RutO6EmQlX4v1UVrawa9veXG7TSl1GMmXuz3lnQX
         8/Uf7EphOYCG/o465fVP5gJFdrqJHl7j7WMm2y40DcGaalBHXnFFEHMlzTJBlaYWrRVv
         25QmYzUcRhVJPYh7cFXL5+MF2IFavwvo3aixUTZVeYK16GKVc3Pkkg2koL+iGypfLkD8
         z4rInfMPzeUzQ+ICcU1GsjCjly+RB3SFdevG2vV3JdExunlcGWgdoFnEnxaOpQL08NBt
         BRIHa1tfRLYAfbDjpqMKtrofnAJUh8JInDe7etBfNGgQpjSYXiBMXRcm7MQfea1AfiBQ
         boRw==
X-Gm-Message-State: APjAAAXx8dBWOiEef7ZIJg1VDlSQE389Yax4Yny+p5dTuImLaNBCk62j
        RM2Jv8LHUkpGqL5dpt2EmWmN8A==
X-Google-Smtp-Source: APXvYqyqfTTW9r2z0CkUJ2ZJK1rN6wWkA/LBN/Q0DZBNDJVvFxkFkA6qVLLpORsqAkXypCXruhmEAQ==
X-Received: by 2002:a17:902:780c:: with SMTP id p12mr22955161pll.290.1567551063379;
        Tue, 03 Sep 2019 15:51:03 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id bt1sm588583pjb.17.2019.09.03.15.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 15:51:02 -0700 (PDT)
Message-ID: <5d6eee56.1c69fb81.e2ebe.2352@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829181203.2660-4-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-4-ilina@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RFC 03/14] drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, marc.zyngier@arm.com
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Tue, 03 Sep 2019 15:51:01 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-08-29 11:11:52)
> Introduce a new domain for wakeup capable GPIOs. The domain can be
> requested using the bus token DOMAIN_BUS_WAKEUP. In the following
> patches, we will specify PDC as the wakeup-parent for the TLMM GPIO
> irqchip. Requesting a wakeup GPIO will setup the GPIO and the
> corresponding PDC interrupt as its parent.
>=20
> Co-developed-by: Stephen Boyd <swboyd@chromium.org>

Per the Documentation about Co-developed-by this should have my=20

Signed-off-by: Stephen Boyd <swboyd@chromium.org>

here. Please add it for the next version.

> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
>  drivers/irqchip/qcom-pdc.c   | 104 ++++++++++++++++++++++++++++++++---
>  include/linux/soc/qcom/irq.h |  34 ++++++++++++
>  2 files changed, 129 insertions(+), 9 deletions(-)
>  create mode 100644 include/linux/soc/qcom/irq.h
>=20
> diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
> index 338fae604af5..ad1faf634bcf 100644
> --- a/drivers/irqchip/qcom-pdc.c
> +++ b/drivers/irqchip/qcom-pdc.c
> @@ -244,6 +261,60 @@ static const struct irq_domain_ops qcom_pdc_ops =3D {
>         .free           =3D irq_domain_free_irqs_common,
>  };
> =20
> +static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int v=
irq,
> +                              unsigned int nr_irqs, void *data)
> +{
> +       struct irq_fwspec *fwspec =3D data;
> +       struct irq_fwspec parent_fwspec;
> +       irq_hw_number_t hwirq, parent_hwirq;
> +       unsigned int type;
> +       int ret;
> +
> +       ret =3D qcom_pdc_translate(domain, fwspec, &hwirq, &type);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> +                                           &qcom_pdc_gic_chip, NULL);
> +       if (ret)
> +               return ret;
> +
> +       if (hwirq =3D=3D GPIO_NO_WAKE_IRQ)
> +               return 0;
> +
> +       parent_hwirq =3D get_parent_hwirq(hwirq);
> +       if (parent_hwirq =3D=3D PDC_NO_PARENT_IRQ)
> +               return 0;
> +
> +       if (type & IRQ_TYPE_EDGE_BOTH)
> +               type =3D IRQ_TYPE_EDGE_RISING;
> +
> +       if (type & IRQ_TYPE_LEVEL_MASK)
> +               type =3D IRQ_TYPE_LEVEL_HIGH;
> +
> +       parent_fwspec.fwnode      =3D domain->parent->fwnode;
> +       parent_fwspec.param_count =3D 3;
> +       parent_fwspec.param[0]    =3D 0;
> +       parent_fwspec.param[1]    =3D parent_hwirq;
> +       parent_fwspec.param[2]    =3D type;
> +
> +       return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
> +                                           &parent_fwspec);
> +}
> +
> +static int qcom_pdc_gpio_domain_select(struct irq_domain *d,
> +                                      struct irq_fwspec *fwspec,
> +                                      enum irq_domain_bus_token bus_toke=
n)
> +{
> +       return (bus_token =3D=3D DOMAIN_BUS_WAKEUP);

Drop the parenthesis please.

> +}
> +
> +static const struct irq_domain_ops qcom_pdc_gpio_ops =3D {
> +       .select         =3D qcom_pdc_gpio_domain_select,
> +       .alloc          =3D qcom_pdc_gpio_alloc,
> +       .free           =3D irq_domain_free_irqs_common,
> +};
> +
>  static int pdc_setup_pin_mapping(struct device_node *np)
>  {
>         int ret, n;
> @@ -282,7 +353,7 @@ static int pdc_setup_pin_mapping(struct device_node *=
np)
> =20
>  static int qcom_pdc_init(struct device_node *node, struct device_node *p=
arent)
>  {
> -       struct irq_domain *parent_domain, *pdc_domain;
> +       struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
>         int ret;
> =20
>         pdc_base =3D of_iomap(node, 0);
> @@ -313,8 +384,23 @@ static int qcom_pdc_init(struct device_node *node, s=
truct device_node *parent)
>                 goto fail;
>         }
> =20
> +       pdc_gpio_domain =3D irq_domain_create_hierarchy(parent_domain,
> +                                                     IRQ_DOMAIN_FLAG_QCO=
M_PDC_WAKEUP,
> +                                                     PDC_MAX_GPIO_IRQS,
> +                                                     of_fwnode_handle(no=
de),
> +                                                     &qcom_pdc_gpio_ops,=
 NULL);
> +       if (!pdc_gpio_domain) {
> +               pr_err("%pOF: GIC domain add failed for GPIO domain\n", n=
ode);

s/GIC/PDC/?

> +               ret =3D -ENOMEM;
> +               goto remove;
> +       }
> +
> +       irq_domain_update_bus_token(pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
> +
>         return 0;
> =20
> +remove:
> +       irq_domain_remove(pdc_domain);
>  fail:
>         kfree(pdc_region);
>         iounmap(pdc_base);
> diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
> new file mode 100644
> index 000000000000..73239917dc38
> --- /dev/null
> +++ b/include/linux/soc/qcom/irq.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __QCOM_IRQ_H
> +#define __QCOM_IRQ_H
> +
> +#include <linux/irqdomain.h>

Just forward declare struct irq_domain instead?

> +
> +#define GPIO_NO_WAKE_IRQ       ~0U
> +
> +/**
> + * QCOM specific IRQ domain flags that distinguishes the handling of wak=
eup
> + * capable interrupts by different interrupt controllers.
> + *
> + * IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP: Line must be masked at TLMM and the
> + *                                  interrupt configuration is done at P=
DC
> + * IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP: Interrupt configuration is handled a=
t TLMM
> + */
> +#define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP                (1 << 17)
> +#define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP                (1 << 18)

Why do these numbers start at 17?

> +
> +/**
> + * irq_domain_qcom_handle_wakeup: Return if the domain handles interrupt
> + *                                configuration
> + * @parent: irq domain
> + *
> + * This QCOM specific irq domain call returns if the interrupt controller
> + * requires the interrupt be masked at the child interrupt controller.
> + */
> +static inline bool irq_domain_qcom_handle_wakeup(struct irq_domain *pare=
nt)
> +{
> +       return (parent->flags & IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP);
> +}
> +
> +#endif
> --=20
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>=20
