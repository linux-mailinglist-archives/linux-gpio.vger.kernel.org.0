Return-Path: <linux-gpio+bounces-11096-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C395C996280
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 10:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56ACE1F23993
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 08:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B6C175D4C;
	Wed,  9 Oct 2024 08:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTCn+Hf7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E146017C7BE;
	Wed,  9 Oct 2024 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462458; cv=none; b=dvLp7qRbSMQOrHbxLhRoltJUifL0kf3xCdprpmigSXuuGLCbbGjEyPCNB5V5xpobAcGaKwPisuMVwId2x1d/IuzVckugr57/f7xf6sXoL0l1HlBWA/YmNtnY1vm77+kPisKHR7X17wL+S1oiLigQWa1okeCxryf1VJWJ3SHtT9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462458; c=relaxed/simple;
	bh=ivM9Vd+M90dRDTP03IxbfWF6Y0CAENJXBrMa24fKbeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ur7GC5kX4VmnzuCB+rRMNqc+4Za4nbh2smZzJsC/OTm19PU9tXha0YbLJxPhjzHpJ/LYbDuhIoZx1OiHc9y+zKgAw83+AcFrhGz4Cwuj8V88CuE0DE+Sctp9NpZ5ZpzActo7bXfOI78mXGQrsckyiJRa61zjEH5iCHhGgp1Q1eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTCn+Hf7; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-84fb1e71fa6so346651241.1;
        Wed, 09 Oct 2024 01:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728462456; x=1729067256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2iTGnAH4oPPVhBwq9uucgkHJOSoXqq1d0zrLvJo7dM=;
        b=PTCn+Hf79XcawQFimXWNR5vNz0ReJX4Wf25Q5s866+eynw3AU7NiwyK32vm+JOcEm7
         bfiuXwG34DwKhmRO0qBGzJ5YhFD/0vR4nh4xGqlJZeldIFY28+i0Ne7RJ9OYQNTBoiUU
         xI7Y3SqPzvuDKkrNvNu2TdLsnTvvwFTtvASoD0Tki2YUOnEcqJ4cAimhwm9xRUpmnQm2
         uNpU9rAcMSL81FFkzNI/S5V6v80sk5fugpui5avAea9PRqNgZSA6gKW1Fvg/oLbtzYrL
         ljKA759Rd+U69qL6rAq/xPafBwpY4Q3KBgMgNAegiUxqzOowMkqBtA2Usm+F3443q/Vz
         6npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728462456; x=1729067256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2iTGnAH4oPPVhBwq9uucgkHJOSoXqq1d0zrLvJo7dM=;
        b=jN3ZW/h2ZC9HEKUOI8lmvpDn7lDfB0P6Go+H3Pitd4qnf6QE1AeveAa5uOnrnSg+7R
         fXUApTz9TCpnFYt+/o9FtZnCQiRG95hW3NFq6pu1T6tGNz1nAApYiEa7LBHQ+QBU6TXu
         GnmRTimpGiuzI5aQ7HOX/vhAQ3HDFhJnIrKEK67RdI3XhPj0WCGNTWj9eQHdbTCuBhjv
         3E38qedhRn2RxUqhCr60bb7xPK71J4Hlh0cnI5HUfZ+dLkSHMXhSa6D9la0jpEWmlWm8
         XJSsW3gCp/bxi5qOAoywFynIiX4EpdgYQ016/cfN4pyDH3jSj8N/L4hqXU0mmbZui28d
         xomQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQor1BLx8XK4GRv/c1w+rkl1aSBA4a1yV5v07mc+CGjlYuSY306wmFCDOi7RDkPiDoOAi1wVvgQ55X@vger.kernel.org, AJvYcCVjDOJif0OiOd5vf7ntsrrHDv/1q2080W1lW83YfRD91pnG6WeyR29b3vZ6FNX7qquj6+xuOOFzu+gl1BGTJnegQJg=@vger.kernel.org, AJvYcCXoe6W9kqcuCFt+VBcZn1eHyM2aibPkWKouPR+N6EnLTHZofGXAkcrv/rOgpv7wytZtqvcB3KhMtdBnKLi9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ZxdoxAsKxKtFtmnt5OOJYT04lUS8c5VTnIwX8ORJk6H3eWMz
	7b2xJCRKcnPqspccJBEDPfv3o/dwIjAKNj0k7NDxyKYOCavDD1lK/c9xkUJfPKbGXoE3yltcYti
	bbi7mwYVL0ku7LcEBnKsVDdSiqA4=
X-Google-Smtp-Source: AGHT+IE8lqTWvznmUAfIWlHrQPwi3EMSfXcdunNUMBpG1/5WVxLxadRKdZHIqOEbTZMNqZu8X8SC+/P2dd7F7aQL9No=
X-Received: by 2002:a05:6122:c96:b0:50c:eb10:9792 with SMTP id
 71dfb90a1353d-50cef0a10f1mr1035299e0c.4.1728462455579; Wed, 09 Oct 2024
 01:27:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003131642.472298-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <7fe863c8-b883-45b0-b0e9-e376764d0bb7@tuxon.dev>
In-Reply-To: <7fe863c8-b883-45b0-b0e9-e376764d0bb7@tuxon.dev>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 9 Oct 2024 09:27:09 +0100
Message-ID: <CA+V-a8tQ5vYbzhpdoeBFX483DV-nRpARCdWJnhm-vvTLzpTW2g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Always call rzg2l_gpio_request()
 for interrupt pins
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Wed, Oct 9, 2024 at 9:11=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxon=
.dev> wrote:
>
> Hi, Prabhakar,
>
> On 03.10.2024 16:16, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Ensure that rzg2l_gpio_request() is called for GPIO pins configured as
> > interrupts, regardless of whether they are muxed in u-boot. This
> > guarantees that the pinctrl core is aware of the GPIO pin usage via
> > pinctrl_gpio_request(), which is invoked through rzg2l_gpio_request().
> >
> > Fixes: 2fd4fe19d0150 ("pinctrl: renesas: rzg2l: Configure interrupt inp=
ut mode")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Output before this patch on G2L/SMARC:
> > root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinc=
trl-rzg2l/pinmux-pins | grep P2_1
> > pin 17 (P2_1): UNCLAIMED
> >
> > Output after this patch G2L/SMARC:
> > root@smarc-rzg2l:~# cat /sys/kernel/debug/pinctrl/11030000.pinctrl-pinc=
trl-rzg2l/pinmux-pins | grep P2_1
> > pin 17 (P2_1): GPIO 11030000.pinctrl:529
> > ---
> >  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 15 +++------------
> >  1 file changed, 3 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/=
renesas/pinctrl-rzg2l.c
> > index 60ef20ca3ccf..1dceaf8290ea 100644
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -2368,20 +2368,11 @@ static const struct irq_chip rzg2l_gpio_irqchip=
 =3D {
> >
> >  static int rzg2l_gpio_interrupt_input_mode(struct gpio_chip *chip, uns=
igned int offset)
> >  {
> > -     struct rzg2l_pinctrl *pctrl =3D gpiochip_get_data(chip);
> > -     const struct pinctrl_pin_desc *pin_desc =3D &pctrl->desc.pins[off=
set];
> > -     u64 *pin_data =3D pin_desc->drv_data;
> > -     u32 off =3D RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
> > -     u8 bit =3D RZG2L_PIN_ID_TO_PIN(offset);
> > -     u8 reg8;
> >       int ret;
> >
> > -     reg8 =3D readb(pctrl->base + PMC(off));
> > -     if (reg8 & BIT(bit)) {
> > -             ret =3D rzg2l_gpio_request(chip, offset);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > +     ret =3D rzg2l_gpio_request(chip, offset);
> > +     if (ret)
> > +             return ret;
> >
>
> With this approach I'm getting the following on RZ/G3S SMARC Carrier II b=
oard:
>
> [    0.368129] pinctrl-rzg2l 11030000.pinctrl: pinctrl-rzg2l support regi=
stered
> [    0.390426] 1004b800.serial: ttySC0 at MMIO 0x1004b800 (irq =3D 42,
> base_baud =3D 0) is a scif
> [    0.390558] printk: legacy console [ttySC0] enabled
> [    1.601991] pinctrl-rzg2l 11030000.pinctrl: pin P12_0 already requeste=
d
> by 11030000.pinctrl:608; cannot claim for 11030000.pinctrl:608
> [    1.614208] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-96
> (11030000.pinctrl:608)
> [    1.622313] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 96
> [    1.631801] ravb 11c30000.ethernet eth0: Base address at 0x11c30000,
> d2:7b:7f:8f:d8:52, IRQ 46.
> [    1.645752] pinctrl-rzg2l 11030000.pinctrl: pin P12_1 already requeste=
d
> by 11030000.pinctrl:609; cannot claim for 11030000.pinctrl:609
> [    1.657923] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-97
> (11030000.pinctrl:609)
> [    1.666035] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 97
> [    1.675573] ravb 11c40000.ethernet eth1: Base address at 0x11c40000,
> d2:7b:7f:8f:d8:52, IRQ 47.
> [    1.700907] pinctrl-rzg2l 11030000.pinctrl: pin P18_0 already requeste=
d
> by 11030000.pinctrl:656; cannot claim for 11030000.pinctrl:656
> [    1.713272] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-144
> (11030000.pinctrl:656)
> [    1.721496] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 14=
4
> [    1.729209] pinctrl-rzg2l 11030000.pinctrl: pin P0_1 already requested
> by 11030000.pinctrl:513; cannot claim for 11030000.pinctrl:513
> [    1.741345] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-1
> (11030000.pinctrl:513)
> [    1.749432] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 1
> [    1.756285] pinctrl-rzg2l 11030000.pinctrl: pin P0_3 already requested
> by 11030000.pinctrl:515; cannot claim for 11030000.pinctrl:515
> [    1.768475] pinctrl-rzg2l 11030000.pinctrl: error -EINVAL: pin-3
> (11030000.pinctrl:515)
> [    1.776524] gpio gpiochip0: (11030000.pinctrl): can't look up hwirq 3
> [    1.783124] gpio-keys keys: Found button without gpio or irq
> [    1.788851] renesas_sdhi_internal_dmac 11c00000.mmc: mmc0 base at
> 0x0000000011c00000, max clock rate 125 MHz
> [    1.798791] gpio-keys keys: probe with driver gpio-keys failed with
> error -22
>
Thanks for the test, I noticed the same.
>
> All these ports are hogs to configure them as input. Removing the hog
> property make this patch work but I'm not sure this is the right approach
> (see below diff).
>
I have dropped a query [0] to GPIO maintainers to check on the correct appr=
oach.

https://lore.kernel.org/all/CA+V-a8vxUjTWccV-wLgy5CJiFYfEMsx-f+8weCJDP6uD_d=
h4AA@mail.gmail.com/

Cheers,
Prabhakar

