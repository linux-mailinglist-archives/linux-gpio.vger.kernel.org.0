Return-Path: <linux-gpio+bounces-32373-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFYXLEFcpWlc+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32373-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:45:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9481D5B80
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 182F8300A8FB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AC138F63D;
	Mon,  2 Mar 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gF6det0y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A177F32FA2B
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444697; cv=none; b=bSqEpLqgifns929KJ7FQdquHBXYT+PEGIxmIASOkYiOuAiyPrzar3NWwnuoTZ4UREagXyn6vHTWCAOmm1lKh0DqRAXLuzh47OUBrayl/Qt7P3UElf2c+6ZRO1NeomYBglgXwtczds9V40Z5CQjPCTvhSuT/kSwtWBP84Cufd+qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444697; c=relaxed/simple;
	bh=KtgZoRvJ0nh+HBWT+KzjiQv/JSn/meKDvckzfxiJPZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sslG4oi5Uxz+GISRPym6mAhq8qHM5EixwM3AzY8q0qGMvM+6PWODgvjcELSCYjp0uEbQZ8zWklHcgmNWRy9JCCA9QxJfpPPjbht6+NEogtpWRo1WOhd1NlNulvjJHyw79zvBf5VAJdYLk7aHh5iy44OXselAH+g+d3kynFsLv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gF6det0y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739DCC2BC9E
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772444697;
	bh=KtgZoRvJ0nh+HBWT+KzjiQv/JSn/meKDvckzfxiJPZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gF6det0yvwTW7FoOa9cMo5EFngwACw9WvncrYKSrC8DSQWESzMAFoI3rni6fXpcYk
	 l8lQzh8H5tSCSpXHQRB/W2O8yXoXYpjwSFzMJsTOXB8SD6hm6oMEp0NaEGK6GtA6h1
	 Ew1X3iCj3uUNO2UTzb7NxSh+/hqkj3uGs2pj2rVBCGHGqpLKG9byAG5aChKr/UkGIP
	 BlZpt2SZMadp+jM6GGqG6VgYEdb8G03MancppsawjyT5G513JjFEtmO/qG/xmwnvSx
	 ZkbOG5cRQZCilEM3cOarex0KNOEyIpUfBOII44SmG+yDB35KoRk/YR4nuLTEhIPaKG
	 nyjjbhXIXX1Bw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986e0553b0so35105357b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 01:44:57 -0800 (PST)
X-Gm-Message-State: AOJu0YxqSrOuQwTCN1WOiIMJXJWJKyY1ZwRoi3yOWqLYG02bTIJiOBsX
	4eG2fdh9SphmmjX1+mEWLsgHWhh7dKSRqS6hgo0oQxbILTg7FRmJp8Xhf8f23l/VTe+uTa1St5L
	wNCWwUadCbMX/qlKEVCLOCEuWPZTuyhY=
X-Received: by 2002:a05:690c:4884:b0:797:a162:f7fc with SMTP id
 00721157ae682-798854a4831mr78300347b3.16.1772444696576; Mon, 02 Mar 2026
 01:44:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227-ajar-wolverine-7ce1ebd79821@spud> <20260227-divinely-drift-93307c6763d8@spud>
In-Reply-To: <20260227-divinely-drift-93307c6763d8@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 10:44:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLn4MP41oLhJfc5gjKh=n_RBDA=EMQ4vN8avM4KNCMATzg@mail.gmail.com>
X-Gm-Features: AaiRm51-O4cXM6imi0U2BVf4r9igtWiiuA-2J8jrQ61OgiEpKoBDiD9pA6ep1Yk
Message-ID: <CAD++jLn4MP41oLhJfc5gjKh=n_RBDA=EMQ4vN8avM4KNCMATzg@mail.gmail.com>
Subject: Re: [RFC v11 1/4] gpio: mpfs: Add interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32373-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5B9481D5B80
X-Rspamd-Action: no action

Hi Conor,

overall this looks okay, but one detail here:

On Fri, Feb 27, 2026 at 3:53=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> Add support for interrupts to the PolarFire SoC GPIO driver. Each GPIO
> has an independent interrupt that is wired to an interrupt mux that sits
> between the controllers and the PLIC. The SoC has more GPIO lines than
> connections from the mux to the PLIC, so some GPIOs must share PLIC
> interrupts. The configuration is not static and is set at runtime,
> conventionally by the platform's firmware. CoreGPIO, the version
> intended for use in the FPGA fabric has two interrupt output ports, one
> is IO_NUM bits wide, as is used in the hardened cores, and the other is
> a single bit with all lines ORed together.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Doing the chained thing kinda covers all the bases at the expense of the
> "direct" mode interrupts that have a dedicated connection to the PLIC.

Chained kinda thing, OK...


> +static irqreturn_t mpfs_gpio_irq_handler(int irq, void *data)

static void mpfs_gpio_irq_handler(struct irq_desc *desc)

> +{
> +       struct mpfs_gpio_chip *mpfs_gpio =3D data;
> +       unsigned int handled =3D 0;
> +       unsigned long status;
> +       u32 val;
> +       int i;
> +
struct irq_chip *irqchip =3D irq_desc_get_chip(desc);

chained_irq_enter(irqchip, desc)

> +       regmap_read(mpfs_gpio->regs, MPFS_IRQ_REG, &val);
> +       status =3D val;
> +       for_each_set_bit(i, &status, MPFS_MAX_NUM_GPIO) {
> +               regmap_write(mpfs_gpio->regs, MPFS_IRQ_REG, BIT(i));
> +               generic_handle_domain_irq(mpfs_gpio->gc.irq.domain, i);
> +               handled++;
> +       }

chained_irq_exit(irqchip, desc)

(no return value)

>  static int mpfs_gpio_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> +       struct device_node *node =3D pdev->dev.of_node;
>         struct mpfs_gpio_chip *mpfs_gpio;
> +       struct gpio_irq_chip *girq;
>         struct clk *clk;
>         void __iomem *base;
> -       int ngpios;
> +       int ngpios, nirqs, ret;
>
>         mpfs_gpio =3D devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
>         if (!mpfs_gpio)
> @@ -157,6 +243,39 @@ static int mpfs_gpio_probe(struct platform_device *p=
dev)
>         mpfs_gpio->gc.parent =3D dev;
>         mpfs_gpio->gc.owner =3D THIS_MODULE;
>
> +       nirqs =3D of_irq_count(node);
> +       if (nirqs > MPFS_MAX_NUM_GPIO)
> +               return -ENXIO;
> +
> +       girq =3D &mpfs_gpio->gc.irq;
> +       girq->num_parents =3D nirqs;
> +
> +       if (girq->num_parents) {
> +               gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
> +
> +               girq->parents =3D devm_kcalloc(&pdev->dev, girq->num_pare=
nts,
> +                                            sizeof(*girq->parents), GFP_=
KERNEL);
> +               if (!girq->parents)
> +                       return -ENOMEM;
> +
> +               for (int i =3D 0; i < girq->num_parents; i++) {
> +                       ret =3D platform_get_irq(pdev, i);
> +                       if (ret < 0)
> +                               return ret;
> +
> +                       girq->parents[i] =3D ret;
> +                       ret =3D devm_request_irq(dev, girq->parents[i], m=
pfs_gpio_irq_handler,
> +                                              IRQF_SHARED, NULL, mpfs_gp=
io);
> +                       if (ret)
> +                               return dev_err_probe(dev, ret,
> +                                                    "failed to request i=
rq for line %u\n",
> +                                                    i);
> +               }

Why do this instead of letting the core do the multi-parent chaining withou=
t
explicitly requesting the IRQs like e.g. gpio-dwapb.c does for the
multi-parent case?

Yours,
Linus Walleij

