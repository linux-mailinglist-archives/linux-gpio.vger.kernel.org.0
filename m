Return-Path: <linux-gpio+bounces-30061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E01DCEE46E
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 12:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F0A53009F56
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 11:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739CB2E228D;
	Fri,  2 Jan 2026 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atudahxl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B092DEA94
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352220; cv=none; b=N+9vUdxeo7X/I8SX1hJnmg62M/b19d/TAi+CeJUUCHD32GVnHQBeh64tjz3izovFrr0U/UAEnnC9wMavXYfh85SygjnS6t/8d0m1JFH4MdX4FBuVCyizOvl9esXT0Wnxi02JjCs12ObQsbeh7wK9Y0cjZRJgC/u3hcV5BqH9CoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352220; c=relaxed/simple;
	bh=re/lVUHs4kpt0uqKvmFx8BrYvmHm2mzCMHLFeQDYLAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNPMvojRbTPLeIe4C7XjW1LoBwgqvSqtL/J4Psm+wGd+H4j8rYrDSVOm+59tSaw4FoIYgrjGcwYRvVXpDoZktWOqkw9H2IaPZFsIbuJQeH/reXg3qHYU1j5v8aefdPtRxat+1XHt8Pt7BX/kuJ7LNxIY4Kyjkll6/ulH7GnvLf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atudahxl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1064C4AF0B
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767352219;
	bh=re/lVUHs4kpt0uqKvmFx8BrYvmHm2mzCMHLFeQDYLAA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=atudahxlVrUZuCPVDkJ4LwCvR4MFh+fD2126mwB0FEeczqh7nTznDYvwcgPXT2Pi/
	 JWM9Fw4y9/K50w93zEv9j/FEiGk0pmLeN0ovag2Pf9EH30NAINWwrlOn8EDNwl+oC7
	 dMr7nsEMjBJ/T3Dq/KB6JqQp2DeOocRH6cvk5Evnho/W+vsTOMzAv636KTlWaxcwmh
	 mpYcic+vuB6qb8pMPOdqMJOXdmHBJsGeJe2Ca6fL7SpU4uxqos9ueVBixj2xVtJu6Y
	 40PKMvzfRpcWMAz1NyAIvH4Y3Gj2ftrb/+GAvdObafKgfj7TiATaGPqRC4FAhDZct6
	 D5LgdFbg6QbVQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-598f59996aaso14247697e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 03:10:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0RxCyEQV6Hsj+QcuaWsizzlAIvdgYoLV5zIic3DI5N2ZDzpS5G5MeR5amVUGEIUts8AfsRLvcRV4Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3W7GuPiBZeuJeW93Mnnt5d++aAlbALQqGzq1IIq0ylqUi8XjY
	WOFE5qfW7bAtoqWSuSN9vL9PquyXSg7DBJEeYICIi91Q2KKctTGQ0VD1rhpSD5dcSmwVG68SwS+
	opoiQHRBPWLhSsgqj4iPz/+FGoeazHn458OzFY2In0Q==
X-Google-Smtp-Source: AGHT+IEQ7ednqbBJO2VgC95rOeiLl6BCkoGEMSAJg7b+XLLGpVniCILMJvrIy2hN08yx90/CKzL8XK3HVso0oifztYA=
X-Received: by 2002:a05:6512:4016:b0:594:3270:3b14 with SMTP id
 2adb3069b0e04-59a17d3dd2amr13470822e87.32.1767352218463; Fri, 02 Jan 2026
 03:10:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org> <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org>
In-Reply-To: <20251229-02-k3-gpio-v1-2-269e76785abb@gentoo.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 12:10:05 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
X-Gm-Features: AQt7F2pPs6mTb0NBOMkrzh1IIi9oh6OnGyb-pPW3iEvvQf6OlFBF1OVtqlQ2SF0
Message-ID: <CAMRc=MfHzP+xm-uX+jad5gPOGDpR23O6mB+xcSvF6ZiZfnxQjg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit: Add GPIO support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:
>
> SpacemiT K3 SoC has changed gpio register layout while comparing
> with previous generation, the register offset and bank offset
> need to be adjusted, introduce a compatible data to extend the
> driver to support this.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/gpio/gpio-spacemit-k1.c | 150 ++++++++++++++++++++++++++++------=
------
>  1 file changed, 106 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit=
-k1.c
> index eb66a15c002f..02cc5c11b617 100644
> --- a/drivers/gpio/gpio-spacemit-k1.c
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -15,28 +15,19 @@
>  #include <linux/platform_device.h>
>  #include <linux/seq_file.h>
>
> -/* register offset */
> -#define SPACEMIT_GPLR          0x00 /* port level - R */
> -#define SPACEMIT_GPDR          0x0c /* port direction - R/W */
> -#define SPACEMIT_GPSR          0x18 /* port set - W */
> -#define SPACEMIT_GPCR          0x24 /* port clear - W */
> -#define SPACEMIT_GRER          0x30 /* port rising edge R/W */
> -#define SPACEMIT_GFER          0x3c /* port falling edge R/W */
> -#define SPACEMIT_GEDR          0x48 /* edge detect status - R/W1C */
> -#define SPACEMIT_GSDR          0x54 /* (set) direction - W */
> -#define SPACEMIT_GCDR          0x60 /* (clear) direction - W */
> -#define SPACEMIT_GSRER         0x6c /* (set) rising edge detect enable -=
 W */
> -#define SPACEMIT_GCRER         0x78 /* (clear) rising edge detect enable=
 - W */
> -#define SPACEMIT_GSFER         0x84 /* (set) falling edge detect enable =
- W */
> -#define SPACEMIT_GCFER         0x90 /* (clear) falling edge detect enabl=
e - W */
> -#define SPACEMIT_GAPMASK       0x9c /* interrupt mask , 0 disable, 1 ena=
ble - R/W */
> -
>  #define SPACEMIT_NR_BANKS              4
>  #define SPACEMIT_NR_GPIOS_PER_BANK     32
>
>  #define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_=
bank, gc)
> +#define to_spacemit_gpio_regs(sg) ((sg)->data->reg_offsets)
>
>  struct spacemit_gpio;
> +struct spacemit_gpio_reg_offsets;

Why not move this structure here instead and avoid the forward declaration?

> +
> +struct spacemit_gpio_data {
> +       struct spacemit_gpio_reg_offsets *reg_offsets;
> +       u32 bank_offsets[4];
> +};
>
>  struct spacemit_gpio_bank {
>         struct gpio_generic_chip chip;
> @@ -49,9 +40,28 @@ struct spacemit_gpio_bank {
>
>  struct spacemit_gpio {
>         struct device *dev;
> +       const struct spacemit_gpio_data *data;
>         struct spacemit_gpio_bank sgb[SPACEMIT_NR_BANKS];
>  };
>
> +struct spacemit_gpio_reg_offsets {
> +       u32 gplr;      /* port level - R */
> +       u32 gpdr;      /* port direction - R/W */
> +       u32 gpsr;      /* port set - W */
> +       u32 gpcr;      /* port clear - W */
> +       u32 grer;      /* port rising edge R/W */
> +       u32 gfer;      /* port falling edge R/W */
> +       u32 gedr;      /* edge detect status - R/W1C */
> +       u32 gsdr;      /* (set) direction - W */
> +       u32 gcdr;      /* (clear) direction - W */
> +       u32 gsrer;     /* (set) rising edge detect enable - W */
> +       u32 gcrer;     /* (clear) rising edge detect enable - W */
> +       u32 gsfer;     /* (set) falling edge detect enable - W */
> +       u32 gcfer;     /* (clear) falling edge detect enable - W */
> +       u32 gapmask;   /* interrupt mask , 0 disable, 1 enable - R/W */
> +       u32 gcpmask;   /* interrupt mask for K3 */
> +};
> +
>  static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
>  {
>         return (u32)(gb - gb->sg->sgb);
> @@ -60,13 +70,14 @@ static u32 spacemit_gpio_bank_index(struct spacemit_g=
pio_bank *gb)
>  static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
>  {
>         struct spacemit_gpio_bank *gb =3D dev_id;
> +       struct spacemit_gpio *sg =3D gb->sg;
>         unsigned long pending;
>         u32 n, gedr;
>
> -       gedr =3D readl(gb->base + SPACEMIT_GEDR);
> +       gedr =3D readl(gb->base + to_spacemit_gpio_regs(sg)->gedr);

Since you're already touching all these register accesses - can you
maybe provide dedicated wrapper functions around readl()/writel() and
avoid any file-wide changes in the future if anything requires further
modification?

Bart

