Return-Path: <linux-gpio+bounces-30290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E5AD0518D
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 18:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 192E436F3920
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 17:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B1F2BEC30;
	Thu,  8 Jan 2026 17:31:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631CD28B4FD
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 17:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767893476; cv=none; b=NcBTfrvqtPLJbpSVWWFFeq1MPd33LlZNo22K+mfDUKGpM5szNcrbElyPtPXZQuGnls2QL5rfdHQPoZZ9eTC/t3mMdXZneQ0RiJhnMSqVDGHWiNyqjdQ2ayorbEnfLzsJlbKPVIg4KgSXQ6k/jtSTua0OJUq/jnGsqz2LrQOl5Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767893476; c=relaxed/simple;
	bh=6Y/PEiuX8F2nfVedwNRlHLJB8LCK+B2XWyMnAPnOdcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9196QxLg4d87Pr9UkzVdqP5PpRuFupFSXEJA5FtOrz8OJRtU9uKDihTk7l0pdVFDbED0O7iK9yI/8jYzocOiPPAoJltRhyFpfSr8N9m5HqK8Oz6S/WVI9Y031LP8Q4xayh4mSESa0vjbNPkJQmWYFmsgnhJGRfibMm4+U9TWTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-55b09d690dcso1204705e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767893474; x=1768498274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ue0J1j0aj6DWC6mYUAkG3yhlZfjuLnCsNmeQNbfJJJs=;
        b=VZlU+cTNB10nq/pXPCDEhLFVVGLDzg20ZYSicLjUNJ9AhHSv6FbVOudQxRFmZ3XXPG
         4L5JMLSohv/ihqOwUgwWtTL2FamZvEeyd/A17w6XGc1nhzMTSdfPA+To0eVM1C97Nz+1
         dmDya4z+663qkpwB0eZc8RoMFbgCpQaEOX2dfPeSrV8V+lcKdHnsEdDhISivMtl4Bj6Q
         ISeGFRX9OyiYpBW66SzYaK7g6+gmiQ4g3RbeufMUVVWbySFKX+1PV71/7nh4i0BUWvXc
         n2pPnErd+zr4Jc4H8rGxMqjUFYj/0NNrmj4zrupH8b/+yK18aUIHcE5sJxn3SknUEYBm
         uapg==
X-Forwarded-Encrypted: i=1; AJvYcCUp1bFhvCg0iHtbDlIFtyjJ5TYIsUL2zmmKajUSNkFtyCbZe8LKqep6VZDwFQzlRO0R4pTmxLXFfZ2w@vger.kernel.org
X-Gm-Message-State: AOJu0YwBEUtm2e93fVnShwzKVbenrcm85Zl/LOTi4OaJYxAOIIGz8qFS
	TSHSK1DFOVLqVK7YFbw5IyrJcjlxonBh6+yBNtuKzLTGTbNWXe283f5spkU5+lMZ
X-Gm-Gg: AY/fxX4JGoPquc/uwOMcxrh+zWsOh5gFwJoE28rwiBaXQ+4oi7S0aG104t912ugsHPF
	OKOU69crdPY1vD/oDAlrEpnMJD2b40Bsjpuzf5Rv1tpSOTK9bniUDG/CdWP8hfc+dvDADDYMewy
	71t9+TJMqd8gG0MekJ28Rdg1miwkRlAIqvcHtxcaFdXzINahmePL0JF71LSfM6QFUJikDF2VyUl
	m80G6rd1EKh2sCTEbd6W6RHSOt9o1btfOZokn+nHKOotV9UvIKS1ZLoapFRq6lwgXvtC9SmjWe9
	Wb9bsM0HNKNUYnIWkH9FtW/70mGpH9KgNxhXWJdgpDr7PgCt0DRZ8pd8kHfSBaN2l2WW8K/GFAp
	JjbOUAu7IpZDvyF3GLhBm7inRfZj/ixsDaSi/v7XoxDzPI96JZYRkiix5EwFylxul2PHP17x4wr
	OYdvlEsnnu9qx+d78PiCxOLAKDOAAkYD9UiKBSrbIywEfAyZLt6oCHLtFXo60n0Ss=
X-Google-Smtp-Source: AGHT+IHOfCa1pZp281/vlUKVKkVGgrXwzU0XL4RNWukCBbADA2oaZ34ovG5s1QSl/Qh0NEu0VuRJFA==
X-Received: by 2002:a05:6122:468c:b0:55b:1a3d:de28 with SMTP id 71dfb90a1353d-56347ffbb65mr2850022e0c.16.1767893474108;
        Thu, 08 Jan 2026 09:31:14 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563618ff8d5sm1011352e0c.7.2026.01.08.09.31.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:31:13 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5636470c344so5882e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzUA5R5x2f0PUg3JC8tPDg93WACbCvZCxLkYplQun0xQIytaUEgUDNLm7FntSm+yxYQhZ+Ae2bF7ok@vger.kernel.org
X-Received: by 2002:a05:6102:2acd:b0:5df:a98f:ca85 with SMTP id
 ada2fe7eead31-5ecb68d3054mr2835192137.21.1767893472628; Thu, 08 Jan 2026
 09:31:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:31:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_ezZMYc3BRJRLFVwir6NPnxNUPw1Z0+oQDZjx_unJjA@mail.gmail.com>
X-Gm-Features: AQt7F2qqDC6QTfmP9u1liaa7gLEyyN7-59wLYd5yvmPeQ7bjaUsCdlwPUmuKCIA
Message-ID: <CAMuHMdX_ezZMYc3BRJRLFVwir6NPnxNUPw1Z0+oQDZjx_unJjA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to
 handle interrupts
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Add a GPIO IRQ chip to the pin controller that can be used to configure
> these pins as IRQ lines.
>
> The pin controller places the requested pins into IRQ function,
> disabling GPIO mode. A hierarchical IRQ domain is used to forward other
> functionality to the parent IRQ domain, the ICU. The ICU does level
> translation and then forwards other functionality to the GIC.
>
> Wakeup capability is implemented by placing the entire pin controller on
> the wakeup path if any pins are requested to be wakeup-capable.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> @@ -644,14 +650,194 @@ static const char * const rzt2h_gpio_names[] = {
>         "P35_0", "P35_1", "P35_2", "P35_3", "P35_4", "P35_5", "P35_6", "P35_7",
>  };
>
> +/*
> + * Interrupts 0-15 are for INTCPUn, which are not exposed externally.
> + * Interrupts 16-31 are for IRQn. SEI is 32.

Isn't SEI 406, and DMAC0_INT0 32?

> + * This table matches the information found in User Manual's Table 17.2,
> + * List of multiplexed pin configurations (5 of 51).

3-6 of 51

However, the mapping is much easier to derive from the "Interrupt" rows
in the various tables in Section 17.5 ("Multiplexed Pin Configurations"),
as these match the order in rzt2h_gpio_irq_map[].

> + * RZ/N2H has the same GPIO to IRQ mapping, except for the pins which
> + * are not present.
> + */
> +static const u8 rzt2h_gpio_irq_map[] = {
> +       32, 16, 17, 18, 19,  0, 20, 21,

s/32/406/, but that doesn't fit in u8, and would overflow .used_irqs[],
so you probably should translate it in the code instead.

> +       22,  0,  0,  0,  0,  0,  0,  0,
> +       23, 24, 25, 26, 27,  0,  0,  0,
> +        0,  0, 28, 29, 30, 31,  0,  0,
> +        0,  0,  0,  0,  0, 32, 16, 17,
> +       18, 19, 20, 21, 22,  0,  0,  0,
> +        0,  0, 24, 25, 26, 27,  0, 28,
> +       29, 30, 31,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0, 24, 32, 16,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +       20, 23, 17, 18, 19,  0, 16, 25,
> +       29, 20, 21, 22, 23,  0,  0,  0,
> +        0,  0,  0,  0, 17,  0,  0, 18,
> +        0,  0, 19,  0,  0, 20,  0, 30,
> +       21,  0,  0, 22,  0,  0, 24, 25,
> +        0,  0,  0,  0,  0, 16, 17,  0,
> +       18,  0,  0, 26, 27,  0,  0,  0,
> +       28, 29, 30, 31,  0,  0,  0,  0,
> +       23, 31, 32, 16, 17, 18, 19, 20,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +       27,  0,  0, 21, 22, 23, 24, 25,
> +       26,  0,  0,  0,  0,  0,  0,  0,
> +       27, 28, 29, 30, 31,  0,  0,  0,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0, 28, 32, 16,
> +       17, 18, 19,  0,  0,  0,  0, 20,
> +       21, 22, 23,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0, 24, 25,  0,  0,
> +        0,  0, 26, 27,  0,  0,  0, 30,
> +        0, 29,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +        0,  0,  0, 28, 29, 30, 31,  0,
> +        0,  0,  0,  0,  0,  0,  0, 30,
> +        0,  0,  0,  0,  0,  0,  0,  0,
> +};

> +static int rzt2h_pinctrl_suspend_noirq(struct device *dev)
> +{
> +       struct rzt2h_pinctrl *pctrl = dev_get_drvdata(dev);
> +
> +       if (atomic_read(&pctrl->wakeup_path))
> +               device_set_wakeup_path(dev);
> +
> +       return 0;
> +}

Please move this function closer to the location where it is used,
i.e. just above rzt2h_pinctrl_pm_ops.

>+ static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>+                                            unsigned int child,
>+                                            unsigned int child_type,
>+                                            unsigned int *parent,
>+                                            unsigned int *parent_type)
>+ {
>+        struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
>+        u8 port = RZT2H_PIN_ID_TO_PORT(child);
>+        u8 pin = RZT2H_PIN_ID_TO_PIN(child);
>+        u8 parent_irq;
>+
>+        parent_irq = rzt2h_gpio_irq_map[child];
>+        if (parent_irq < RZT2H_INTERRUPTS_START)

Or !parent_irq, cfr. the check in rzt2h_gpio_init_irq_valid_mask()?

>+                return -EINVAL;
>+
>+        if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
>+                             pctrl->used_irqs))
>+                return -EBUSY;
>+
>+        rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
>+
>+        *parent = parent_irq;
>+        *parent_type = child_type;
>+
>+        return 0;
>+ }

> +
>  static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
>  {
>         struct pinctrl_gpio_range *range = &pctrl->gpio_range;
>         struct gpio_chip *chip = &pctrl->gpio_chip;
> +       struct device_node *np = pctrl->dev->of_node;
> +       struct irq_domain *parent_domain;
>         struct device *dev = pctrl->dev;
>         struct of_phandle_args of_args;
> +       struct device_node *parent_np;
> +       struct gpio_irq_chip *girq;
>         int ret;
>
> +       parent_np = of_irq_find_parent(np);
> +       if (!parent_np)
> +               return -ENXIO;

Despite your claim that the interrupts properties are optional,
I think  this will abort probing when they are actually missing?

> +
> +       parent_domain = irq_find_host(parent_np);
> +       of_node_put(parent_np);
> +       if (!parent_domain)
> +               return -EPROBE_DEFER;
> +
>         ret = of_parse_phandle_with_fixed_args(dev->of_node, "gpio-ranges", 3, 0, &of_args);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Unable to parse gpio-ranges\n");

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

