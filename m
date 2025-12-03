Return-Path: <linux-gpio+bounces-29239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B756ACA1F5A
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 00:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEDCD300A377
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 23:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB812367D5;
	Wed,  3 Dec 2025 23:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTGqR2Rc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCA52EA154
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 23:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804854; cv=none; b=pNMlmtajywzRMmFJj/jXEW+G/d/Xqck0H2qrnO78u2WSB6RGvGJDDCC7W/Bc2Z71ybQtN6IFjbzf6IuBiEOM1S9ov0BJ7RJ92sCUPHdRSdG82wQNZWJF1ISR/mcupM4Pu/8983GD5aktCTRQ/yoDROYkj9G6QJG1J8Tr0ztXIfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804854; c=relaxed/simple;
	bh=u+LWk+ysyom9mJaM2PkwZ2eIKREM/Y9c6qmJUKpC5Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8K9a0eVmZR4a/PDCUHhADSS5UqVHvNiKd4E60UoZ/MGHhExlHz5eRKEtM5MV2xkx1VsUmrqQSr7sMlhVvcjwu43D80TM4og7s85l4LZmQ3UxjuUSTe9qrbockHn+FajwaJVcs/w7aLkuCgyNYyZjGEELfgGl8VyvGtBfjJFCXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTGqR2Rc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50264C19425
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764804854;
	bh=u+LWk+ysyom9mJaM2PkwZ2eIKREM/Y9c6qmJUKpC5Bk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hTGqR2RccQDGAEcZkHeKq72FKFgtrO96PzRkz4csy2AxATGlW34Ne/cOre5CYpsx6
	 mNPN5wRXtvWfjQkViUFANQ6m828joZ1GnjxAQBL6oiE77DRjvfPKTQ+lFwmsoJCCGq
	 Bp3Ky205iti0V6CW0YAoRTxkQ9I14ABjmeC7dxcJRbmeQXKEs12TQwKIU4yLhSuWfv
	 zyLjraEcsG32IzuihTonYl9i2LHHbT/3aza+W4KV8uZS8Qz9Jgj6NgoHRPp4Q2gihk
	 hB+WLJZJyLrgEiulDNn5GcEkN7cGMixNNktkwbAZt8k+OktjMyVg4Mw9jHeGdnEBVu
	 Zi4Cq4m86EvcA==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-640f2c9cc72so226124d50.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 15:34:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrdZNMDJJyyFrU9Z8Z/G4y5uyVENm3NehW9Net4/d4emkbok7k8gPHWHxXtcGEe+LCSVOgVfX9a17J@vger.kernel.org
X-Gm-Message-State: AOJu0YzQYvewVzygpApoVq7kTVNsbsaV2LY0yvL6sojmflu4ZCuP22mp
	s+Zz01yLoVaHqV/68PzzT9VltFB0PQOnLIHLYr/m5oMzf65zWD0yZSlIgA52vDytS4YLhLZ5DBX
	5/xZbIsJ3B4MTeJVtE5jjjCDCkQvtnDw=
X-Google-Smtp-Source: AGHT+IEcHfvaOb5S969V+TGgkAT9i54KHFx1CR/gCX/hEJeFvl1jabhvHplkUWRwEt3mIqu2dyLHnOM9O1u8pDT2cgo=
X-Received: by 2002:a05:690c:308a:b0:788:e1b:5ee6 with SMTP id
 00721157ae682-78c1894c129mr14570627b3.70.1764804853630; Wed, 03 Dec 2025
 15:34:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251121112626.1395565-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251121112626.1395565-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 4 Dec 2025 00:34:02 +0100
X-Gmail-Original-Message-ID: <CAD++jLk9Ft3oRGUTyqgbs55Vii0HVVnO7mnaHfCJivwT1Yv=4g@mail.gmail.com>
X-Gm-Features: AWmQ_bleOJb8iDoFuFxkogfUlyPOtvU4DcbHlwWafHSyLBZKTuzXCFI7OtWruEI
Message-ID: <CAD++jLk9Ft3oRGUTyqgbs55Vii0HVVnO7mnaHfCJivwT1Yv=4g@mail.gmail.com>
Subject: Re: [PATCH 4/8] pinctrl: renesas: rzt2h: add GPIO IRQ chip to handle interrupts
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cosmin,

thanks for your patch!

On Fri, Nov 21, 2025 at 12:27=E2=80=AFPM Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:

> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Add a GPIO IRQ chip that can be used to configure these pins as IRQ
> lines.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Mention in the commit that this is achieved with a
hierarchical IRQ domain please. (I really like how this
was done!) Also mention that wakeup capability is
also implemented as part of the patch.

You probably need a:

select IRQ_DOMAIN_HIERARCHY

In the rzt2h Kconfig entry?

> +static int rzt2h_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
> +{
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct rzt2h_pinctrl *pctrl =3D container_of(gc, struct rzt2h_pin=
ctrl, gpio_chip);
> +       int ret;
> +
> +       ret =3D irq_chip_set_wake_parent(d, on);
> +       if (ret)
> +               return ret;
> +

Add a comment here:

/*
 * If any of the IRQs are in use, then put the entire pin controller
 * on the device wakeup path.
 */

> +       if (on)
> +               atomic_inc(&pctrl->wakeup_path);
> +       else
> +               atomic_dec(&pctrl->wakeup_path);

BTW this is an elegant piece of code I think a lot of other drivers
need...

> +static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> +                                           unsigned int child,
> +                                           unsigned int child_type,
> +                                           unsigned int *parent,
> +                                           unsigned int *parent_type)
> +{
> +       struct rzt2h_pinctrl *pctrl =3D gpiochip_get_data(gc);
> +       u8 port =3D RZT2H_PIN_ID_TO_PORT(child);
> +       u8 pin =3D RZT2H_PIN_ID_TO_PIN(child);
> +       u8 parent_irq;
> +
> +       parent_irq =3D rzt2h_gpio_irq_map[child];
> +       if (parent_irq < RZT2H_INTERRUPTS_START)
> +               return -EINVAL;
> +
> +       if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
> +                            pctrl->used_irqs))
> +               return -EBUSY;
> +
> +       rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
> +
> +       *parent =3D parent_irq;
> +       *parent_type =3D child_type;
> +
> +       return 0;
> +}

Complex, but easy to follow, understand and debug.
Good job here!

Yours,
Linus Walleij

