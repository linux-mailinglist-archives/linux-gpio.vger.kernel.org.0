Return-Path: <linux-gpio+bounces-39616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hduCOc2KTWqS1wEAu9opvQ
	(envelope-from <linux-gpio+bounces-39616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:25:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDBF720633
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Jul 2026 01:25:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="V/U9e7n4";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39616-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39616-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9CB3302DB73
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 23:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3338036DA0D;
	Tue,  7 Jul 2026 23:24:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF80D33C502
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 23:24:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783466697; cv=pass; b=il2g5tq4Yx1zj52+qe+KhtF0WIjnOugM+R+Isp5wYF41yREWWtcMzYBgplOnd5KUIHXSD3z/+xnsvaDGOfsnQvy5eSfsCdHJH0xT/rzvXgEJUxRm+HAP804844vCoFl7RTRt1OeWWTTgqAYoEFHZ/xvknlf8/TrqqdXvEWWY1/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783466697; c=relaxed/simple;
	bh=ght3OU5cTxidqfAeq/aiPyGBhllVut70rosljM/dT7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQyj5RFwiXGT4D5r8B1JOKEN9ipshaIRck1srY+IJopLPIRG7GtQqRXiNLErPXaqYP4eMvH+DrmmeJOv3lqFGv1q49vrU8yVuFEolY5f5Pc6FWMhHa/YLUbPK6rSFgHl0oVdrqdHaVMhp/Hm5GLQLBUdTTQHcPPyUdxxd4Nmhw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/U9e7n4; arc=pass smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1297f37073so3351266b.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 16:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783466693; cv=none;
        d=google.com; s=arc-20260327;
        b=hXHYSNSJ/RczOXCcPKmN1JJQnozXnOdtyylgGRLIChiWUiLRKab5mD7HniNajkiEDx
         9OGg3NV4f01+qAv9uFd6pEumObiM9zrUhfK+TO43vrfaPQBrQyVCR8Qd6LufH1CTolEW
         D6pae8Lfp65mnhpiF5WbeV/bdX5MDUH9o4yzcn0t6pTHP49ysGuyCGJ1jEkG0ZUsTPEF
         zdLAzwgCJ/DSB8VC0zo5xMHCLzuxElPBZFUsdjqaGMujLAMPNEbs3Dhs8FETaXtanNqr
         dlBswFhXt/n1K8ufOg8FzZ6g0p71VifjLFCCUjqs5r1b0OFtXsUY2k9YtJPaQ7wt5qH2
         MLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JVkdlSz7r5P3k/bGJudAL/0apiHunyiHBlU5StM+YaY=;
        fh=OKKkL1UFC3MjWXwz/Dr1P8kAQJyBhVBnHKkKtxcVhYE=;
        b=JTjV8uN5q3IB8iSi5IM7LBZdFfG2Brjy+KHBpjJvS2+KaBUgtLnmNpHZwyJkCUYfgf
         GXUlpuPFDmPIMiS36WTfRlco6+k2cgMVuUX6WaEQxuhoh+21QJ164ABXY8JPkGJIvpk0
         7elELnCD6xnDgGLM03/Oz71XmYUl5Yb9vwD/t4s9n994GSPdpX06ppnRska+UTiNvxmq
         xVaM8m1y52LOLEJJIdrc7HwN68oh0SaLTV9+dxaNZ9A6/yILRBUEFLpTapWgy1LgQUMs
         F0thWareJOEHojufz5bKlhn/yBZfDzRxkHDsJS2cZ+Tztwnwku0c56VsGoR3/8suW7li
         BKSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783466693; x=1784071493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVkdlSz7r5P3k/bGJudAL/0apiHunyiHBlU5StM+YaY=;
        b=V/U9e7n4QPL+89AZX/8caGqbMqco2K7VEkuEU40ueZAmABDSgfDS6uVTUbGgoEorjR
         cPQO5UugOEWPgfNMHIxc9ParHfJNRAMSJm9PhFvlHROKkdWt96WkQcvGa2DT82QRGs5W
         yV1Nr8kM+6rmF7XqYMrpNPKQBi67i4AFJvZNi6E89EMaJTmSgW5LyC+89ZsJiX87+VJX
         Aji5vBac/ZdH49v6lCVhNbohCiUnXiawL819Tqppp79TyOcIPpuBxPSGBdtaFSbVASzV
         LnQffE+iw9AEUjE+MRKR1pIjHEfxYRDIrHhLPzyCngH4ajbAt5jH0gl1kUvsFlrVstCm
         Kalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783466693; x=1784071493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVkdlSz7r5P3k/bGJudAL/0apiHunyiHBlU5StM+YaY=;
        b=jaXXt6Lrrqe3TbgYY2Ukn9v5lilg8UC06Dk0lUAgpi3buW1TFyp65BwnhynCsky5h1
         Pd0IWYzQP+gG1IAdLLwxtGLHFSUF/5TIJGBGjUXwatAV3oXbpdvtfLEM+BRdTc27RoZ3
         FO+eQrxDossQwcnKjMSfs5YhiH6JJI5RQ5moW+fY0Rx4UEoHYfoU8890tqpCx3YGwlfc
         FM8PkzBpt0V0Vklr6FtqtKMNWLraF+HFZneml25VxbhhADHRsOD2QMelBKBlfcWOAHv6
         gAIh4A0x+DyKSAkRo6XztcJXPcJ7tz4fbLIRIlw7wlRfkBclSxmSfeFWx1oMTc/TkA5k
         eLfw==
X-Gm-Message-State: AOJu0Yz76zFfq7pftWJ9H5q0U+awnN3d8+EyHZQZslOVHi/pwastnFkO
	W7CswkXVgamh6LbJ0z0+Y7aPmAVHp5lMpm9iKPVVFhdJX8BPEXxbS8SLU+yXKn6iOwvrJ5lqcWP
	+ESE0HbvIfC1c23blG5MpQy+I7Hm5mtcn9VlW
X-Gm-Gg: AfdE7cm+n/GTscUpMXK6reiCUdyBbTG0KHuIEoPnUF0v7Cw3btgQrfXCbcUy1mKGRs4
	NxO7hi+cNIaNaZV6hvdYa+uCO+V35Ll6b4ZXzOvavpfHd92orKIVGearBFQPjE2MafAm5uDg4dn
	w3VftHkg7n8LLgHnuXxRNN6S3YOQ3L+ipx9GG5CHnQzxawbwJF3TUz0QpDRHPf024JD4TT3TnQf
	Bwnm8GAt+MOmwBO3DVFw8YZh3WuG6xHQms708A4bsNqnjlg8dJdqP7kmCZqkGb3cAst6OhPnDbJ
	gNwU7Mst5grmqlLOq745zOe+PhoDP+TSBpFjO7fRLona/W5YwD83RF6nMgqKQ5SHZkwnKd4JGcm
	+sTcgta3INqgBi3NBgAJvcYEyMM0=
X-Received: by 2002:a17:907:9627:b0:c12:b226:69ac with SMTP id
 a640c23a62f3a-c15ce2502c9mr5321866b.61.1783466692926; Tue, 07 Jul 2026
 16:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707232311.1214660-1-rosenp@gmail.com>
In-Reply-To: <20260707232311.1214660-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 7 Jul 2026 16:24:41 -0700
X-Gm-Features: AVVi8CdkxaVV3YeGnQztIPXU_yyw6He63aY7zH7ybDk9l-GL5YVq04zokWhOmRU
Message-ID: <CAKxU2N8Q1Coi_Y0wq2jRa2H8q+4kffCSu5HXn-d3JPVeYSFhEw@mail.gmail.com>
Subject: Re: [PATCH] gpio/mvebu: Use irq_domain_add_linear
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39616-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[obsidianresearch.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FDBF720633

On Tue, Jul 7, 2026 at 4:23=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Mistakenly sent. Please ignore.
>
> This fixes the irq allocation in this driver to not print:
>  irq: Cannot allocate irq_descs @ IRQ34, assuming pre-allocated
>  irq: Cannot allocate irq_descs @ IRQ66, assuming pre-allocated
>
> Which happens because the driver already called irq_alloc_descs()
> and so the change to use irq_domain_add_simple resulted in calling
> irq_alloc_descs() twice.
>
> Modernize the irq allocation in this driver to use the
> irq_domain_add_linear flow directly and eliminate the use of
> irq_domain_add_simple/legacy
>
> Fixes: ce931f571b6d ("gpio/mvebu: convert to use irq_domain_add_simple()"=
)
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-mvebu.c | 92 ++++++++++++++++++---------------------
>  1 file changed, 43 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index cd5dc27320a2..1ed6132b993c 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -293,10 +293,10 @@ static void mvebu_gpio_irq_ack(struct irq_data *d)
>  {
>         struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>         struct mvebu_gpio_chip *mvchip =3D gc->private;
> -       u32 mask =3D ~(1 << (d->irq - gc->irq_base));
> +       u32 mask =3D d->mask;
>
>         irq_gc_lock(gc);
> -       writel_relaxed(mask, mvebu_gpioreg_edge_cause(mvchip));
> +       writel_relaxed(~mask, mvebu_gpioreg_edge_cause(mvchip));
>         irq_gc_unlock(gc);
>  }
>
> @@ -305,7 +305,7 @@ static void mvebu_gpio_edge_irq_mask(struct irq_data =
*d)
>         struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>         struct mvebu_gpio_chip *mvchip =3D gc->private;
>         struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
> -       u32 mask =3D 1 << (d->irq - gc->irq_base);
> +       u32 mask =3D d->mask;
>
>         irq_gc_lock(gc);
>         ct->mask_cache_priv &=3D ~mask;
> @@ -319,8 +319,7 @@ static void mvebu_gpio_edge_irq_unmask(struct irq_dat=
a *d)
>         struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>         struct mvebu_gpio_chip *mvchip =3D gc->private;
>         struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
> -
> -       u32 mask =3D 1 << (d->irq - gc->irq_base);
> +       u32 mask =3D d->mask;
>
>         irq_gc_lock(gc);
>         ct->mask_cache_priv |=3D mask;
> @@ -333,8 +332,7 @@ static void mvebu_gpio_level_irq_mask(struct irq_data=
 *d)
>         struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>         struct mvebu_gpio_chip *mvchip =3D gc->private;
>         struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
> -
> -       u32 mask =3D 1 << (d->irq - gc->irq_base);
> +       u32 mask =3D d->mask;
>
>         irq_gc_lock(gc);
>         ct->mask_cache_priv &=3D ~mask;
> @@ -347,8 +345,7 @@ static void mvebu_gpio_level_irq_unmask(struct irq_da=
ta *d)
>         struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>         struct mvebu_gpio_chip *mvchip =3D gc->private;
>         struct irq_chip_type *ct =3D irq_data_get_chip_type(d);
> -
> -       u32 mask =3D 1 << (d->irq - gc->irq_base);
> +       u32 mask =3D d->mask;
>
>         irq_gc_lock(gc);
>         ct->mask_cache_priv |=3D mask;
> @@ -462,7 +459,7 @@ static void mvebu_gpio_irq_handler(struct irq_desc *d=
esc)
>         for (i =3D 0; i < mvchip->chip.ngpio; i++) {
>                 int irq;
>
> -               irq =3D mvchip->irqbase + i;
> +               irq =3D irq_find_mapping(mvchip->domain, i);
>
>                 if (!(cause & (1 << i)))
>                         continue;
> @@ -655,6 +652,7 @@ static int mvebu_gpio_probe(struct platform_device *p=
dev)
>         struct irq_chip_type *ct;
>         struct clk *clk;
>         unsigned int ngpios;
> +       bool have_irqs;
>         int soc_variant;
>         int i, cpu, id;
>         int err;
> @@ -665,6 +663,9 @@ static int mvebu_gpio_probe(struct platform_device *p=
dev)
>         else
>                 soc_variant =3D MVEBU_GPIO_SOC_VARIANT_ORION;
>
> +       /* Some gpio controllers do not provide irq support */
> +       have_irqs =3D of_irq_count(np) !=3D 0;
> +
>         mvchip =3D devm_kzalloc(&pdev->dev, sizeof(struct mvebu_gpio_chip=
),
>                               GFP_KERNEL);
>         if (!mvchip)
> @@ -697,7 +698,8 @@ static int mvebu_gpio_probe(struct platform_device *p=
dev)
>         mvchip->chip.get =3D mvebu_gpio_get;
>         mvchip->chip.direction_output =3D mvebu_gpio_direction_output;
>         mvchip->chip.set =3D mvebu_gpio_set;
> -       mvchip->chip.to_irq =3D mvebu_gpio_to_irq;
> +       if (have_irqs)
> +               mvchip->chip.to_irq =3D mvebu_gpio_to_irq;
>         mvchip->chip.base =3D id * MVEBU_MAX_GPIO_PER_BANK;
>         mvchip->chip.ngpio =3D ngpios;
>         mvchip->chip.can_sleep =3D false;
> @@ -758,34 +760,30 @@ static int mvebu_gpio_probe(struct platform_device =
*pdev)
>         devm_gpiochip_add_data(&pdev->dev, &mvchip->chip, mvchip);
>
>         /* Some gpio controllers do not provide irq support */
> -       if (!of_irq_count(np))
> +       if (!have_irqs)
>                 return 0;
>
> -       /* Setup the interrupt handlers. Each chip can have up to 4
> -        * interrupt handlers, with each handler dealing with 8 GPIO
> -        * pins. */
> -       for (i =3D 0; i < 4; i++) {
> -               int irq =3D platform_get_irq(pdev, i);
> -
> -               if (irq < 0)
> -                       continue;
> -               irq_set_chained_handler_and_data(irq, mvebu_gpio_irq_hand=
ler,
> -                                                mvchip);
> -       }
> -
> -       mvchip->irqbase =3D irq_alloc_descs(-1, 0, ngpios, -1);
> -       if (mvchip->irqbase < 0) {
> -               dev_err(&pdev->dev, "no irqs\n");
> -               return mvchip->irqbase;
> +       mvchip->domain =3D
> +           irq_domain_add_linear(np, ngpios, &irq_generic_chip_ops, NULL=
);
> +       if (!mvchip->domain) {
> +               dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT)=
.\n",
> +                       mvchip->chip.label);
> +               return -ENODEV;
>         }
>
> -       gc =3D irq_alloc_generic_chip("mvebu_gpio_irq", 2, mvchip->irqbas=
e,
> -                                   mvchip->membase, handle_level_irq);
> -       if (!gc) {
> -               dev_err(&pdev->dev, "Cannot allocate generic irq_chip\n")=
;
> -               return -ENOMEM;
> +       err =3D irq_alloc_domain_generic_chips(
> +           mvchip->domain, ngpios, 2, np->name, handle_level_irq,
> +           IRQ_NOREQUEST | IRQ_NOPROBE | IRQ_LEVEL, 0, 0);
> +       if (err) {
> +               dev_err(&pdev->dev, "couldn't allocate irq chips %s (DT).=
\n",
> +                       mvchip->chip.label);
> +               goto err_domain;
>         }
>
> +       /* NOTE: The common accessors cannot be used because of the percp=
u
> +        * access to the mask registers
> +        */
> +       gc =3D irq_get_domain_generic_chip(mvchip->domain, 0);
>         gc->private =3D mvchip;
>         ct =3D &gc->chip_types[0];
>         ct->type =3D IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
> @@ -803,27 +801,23 @@ static int mvebu_gpio_probe(struct platform_device =
*pdev)
>         ct->handler =3D handle_edge_irq;
>         ct->chip.name =3D mvchip->chip.label;
>
> -       irq_setup_generic_chip(gc, IRQ_MSK(ngpios), 0,
> -                              IRQ_NOREQUEST, IRQ_LEVEL | IRQ_NOPROBE);
> +       /* Setup the interrupt handlers. Each chip can have up to 4
> +        * interrupt handlers, with each handler dealing with 8 GPIO
> +        * pins.
> +        */
> +       for (i =3D 0; i < 4; i++) {
> +               int irq =3D platform_get_irq(pdev, i);
>
> -       /* Setup irq domain on top of the generic chip. */
> -       mvchip->domain =3D irq_domain_add_simple(np, mvchip->chip.ngpio,
> -                                              mvchip->irqbase,
> -                                              &irq_domain_simple_ops,
> -                                              mvchip);
> -       if (!mvchip->domain) {
> -               dev_err(&pdev->dev, "couldn't allocate irq domain %s (DT)=
.\n",
> -                       mvchip->chip.label);
> -               err =3D -ENODEV;
> -               goto err_generic_chip;
> +               if (irq < 0)
> +                       continue;
> +               irq_set_chained_handler_and_data(irq, mvebu_gpio_irq_hand=
ler,
> +                                                mvchip);
>         }
>
>         return 0;
>
> -err_generic_chip:
> -       irq_remove_generic_chip(gc, IRQ_MSK(ngpios), IRQ_NOREQUEST,
> -                               IRQ_LEVEL | IRQ_NOPROBE);
> -       kfree(gc);
> +err_domain:
> +       irq_domain_remove(mvchip->domain);
>
>         return err;
>  }
> --
> 2.55.0
>

