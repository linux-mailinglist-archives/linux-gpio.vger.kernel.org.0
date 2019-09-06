Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51634AAFE0
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 02:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390838AbfIFAgA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 20:36:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39074 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733217AbfIFAgA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 20:36:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id u17so2417095pgi.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2019 17:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=XGrs3zKsFjlZSZ99C8s6sJjUrU3wy1rabuuaViSwzsY=;
        b=nV14H9on5xvo2rClhm31u7GROgaQnL48oFKwFoeb1X3ekfXK3WAJlgeTZoIOqi906S
         JR+cGRU+g2hHG3GUakJ7pH9+M+LXFORZQeiWZkhsxvHhmHSculzfLCjmxlKKMUPLHmCF
         v1+Tx/lw0Q6cuLT1qIHOCeEPvY9t2HIUMqr2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=XGrs3zKsFjlZSZ99C8s6sJjUrU3wy1rabuuaViSwzsY=;
        b=pcVfuGo/nqu3YguRTpWqa7nTj1UB5LFg5dinAtz2/ODIGPJ2eD9CTvnFM6+cNmn/Py
         7naQyxohE/+LLiWl48IHDZBBXqJsOMsn6+t0t3huqUZSyvSeNIJFkxeVVfQFUcIIKpgq
         dzhsfzmnx2V+7tKny+se5oXh5vEyIIuciKx/jynoykaJ8orCYdWbIGRYmO6M/6eHaejT
         w0LyroPrd3jGVQTmomsk78f6GzEDsgEcQG3/n7H/riTQriFUTkh5yNnoeer/0RGGk7Rd
         0BObpb9CA37EWkAkKgWq74a306LzUQ4SPwHYs4SRVJwOykb4D2E3s6heLeSeS2jGnNbL
         CTVw==
X-Gm-Message-State: APjAAAVrYoijsqgPhJY786zCtPb0NBS/pUCwC6iha1yIjpRkExncDLM6
        J+TBUuPU4ZbhLFhq61imoVtdTA==
X-Google-Smtp-Source: APXvYqyeIQEnulmoqJMFz91dhuRMwrBWrdXyLOyfrPiPa6L3ba/p7c6ISBV8gn+QMzNVQdyUJOTF0g==
X-Received: by 2002:a63:60a:: with SMTP id 10mr5596338pgg.381.1567730159909;
        Thu, 05 Sep 2019 17:35:59 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r185sm5696226pfr.68.2019.09.05.17.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 17:35:59 -0700 (PDT)
Message-ID: <5d71a9ef.1c69fb81.c5fbe.e477@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829181203.2660-8-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org> <20190829181203.2660-8-ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, evgreen@chromium.org,
        linus.walleij@linaro.org, marc.zyngier@arm.com
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org
Subject: Re: [PATCH RFC 07/14] genirq: Introduce irq_chip_get/set_parent_state calls
User-Agent: alot/0.8.1
Date:   Thu, 05 Sep 2019 17:35:58 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-08-29 11:11:56)
> From: Maulik Shah <mkshah@codeaurora.org>
>=20
> On certain QTI chipsets some GPIOs are direct-connect interrupts
> to the GIC.
>=20
> Even when GPIOs are not used for interrupt generation and interrupt
> line is disabled, it does not prevent interrupt to get pending at
> GIC_ISPEND. When drivers call enable_irq unwanted interrupt occures.

Inidicate functions with parenthesis like enable_irq().

>=20
> Introduce irq_chip_get/set_parent_state calls to clear pending irq
> which can get called within irq_enable of child irq chip to clear
> any pending irq before enabling.

This sentence is hard to read.

>=20
> index b76703b2c0af..6bb5b22bb0a7 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -1297,6 +1297,50 @@ EXPORT_SYMBOL_GPL(handle_fasteoi_mask_irq);
> =20
>  #endif /* CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS */
> =20
> +/**
> + *     irq_chip_set_parent_state - set the state of a parent interrupt.
> + *     @data: Pointer to interrupt specific data
> + *     @which: State to be restored (one of IRQCHIP_STATE_*)
> + *     @val: Value corresponding to @which
> + *
> + */
> +int irq_chip_set_parent_state(struct irq_data *data,
> +                             enum irqchip_irq_state which,
> +                             bool val)
> +{
> +       data =3D data->parent_data;
> +       if (!data)
> +               return 0;
> +
> +       if (data->chip->irq_set_irqchip_state)
> +               return data->chip->irq_set_irqchip_state(data, which, val=
);
> +
> +       return 0;

How about=20

	if (!data || !data->chip->irq_set_irqchip_state)
		return 0;
=09
	return data->chip->irq_set_irqchip_state(...)

> +}
> +EXPORT_SYMBOL(irq_chip_set_parent_state);
> +
> +/**
> + *     irq_chip_get_parent_state - get the state of a parent interrupt.

Why is this indented so much?

> + *     @data: Pointer to interrupt specific data
> + *     @which: one of IRQCHIP_STATE_* the caller wants to know
> + *     @state: a pointer to a boolean where the state is to be stored
> + *

Document return value?

> + */
> +int irq_chip_get_parent_state(struct irq_data *data,
> +                             enum irqchip_irq_state which,
> +                             bool *state)
> +{
> +       data =3D data->parent_data;
> +       if (!data)
> +               return 0;
> +
> +       if (data->chip->irq_get_irqchip_state)
> +               return data->chip->irq_get_irqchip_state(data, which, sta=
te);
> +

Same comment here about collapsing logic.

> +       return 0;
> +}
> +EXPORT_SYMBOL(irq_chip_get_parent_state);

Please make these symbols _GPL.

> +
>  /**
>   * irq_chip_enable_parent - Enable the parent interrupt (defaults to unm=
ask if
>   * NULL)
