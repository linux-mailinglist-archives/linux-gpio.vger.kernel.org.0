Return-Path: <linux-gpio+bounces-27520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA618C00C4B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 13:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A3593B2AFB
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 11:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE08C30AAB7;
	Thu, 23 Oct 2025 11:31:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD3525785E
	for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219069; cv=none; b=pJuglM+P6zp0tF7nXSgs59+exALg2Bo91uw1HUID6wjhmKswz3oFR6Lnag7ARaJz7EJKTqyGUO4W5TeS9+8y1X0giZCfjDHY7/3PDkp/3g1zj+XUcwmF+Bc7td9BOaHQbmrJfmzK4UA4Z3rpPxx+st25/YVA0tq58hZqdWfLRcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219069; c=relaxed/simple;
	bh=6/N3YiTLQifAY9zz3xwpfpgdh+PsNHV80wg+8+9zp1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OY9uCHiitMj+arp5TzQWGLqzqazCWqaT6nEtEUiA3ZVTRCW5X8Bu4DGz9+4RNf5p3pWEXRy24AF33pRD4HNItGBjQaPHYrE3KhiNuPyyZnTtwtkMJTiQSJrLRGP1Rh6oJX7a+hhEO6cHUnDN5o6kBbQTIwBGQ8p77pKw4V8+LmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932c428442aso623277241.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 04:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219066; x=1761823866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zsBv2UTTNDe+bvN26dCEz5bfw+/JNH9ObmAd3JmbGM=;
        b=Gq7jG7Xk18nas6jwZx9I6rBnzM1GEltT02I9DORNgsjrxA0jXcHqVTl2LAx3HQrNzG
         unviVpGrSrLVYW8XYkbVCfmnFKhl5HahJ89xCiSTfVi7I0hxacE9slBI+oxkvyz6Mxdh
         Lr2DGur9Bs9W/4T9wl95VinR0c17IgBX+AW+9elYUagfKIUNk9Vkco5aeEfiuT3Byeiy
         s4BdOS2jOXYaT4Nmxl1LNAgYoCaLTook0WWMlIU6LidBluILDbYio5jx5DyH+jfeoH7g
         4Kvy1tTSx1xTAp7yPfpOE4JzL0hPKkMD5xtnzgAW5WEgEI4OM616xmJDCdt4yHv19/zl
         ZwhA==
X-Forwarded-Encrypted: i=1; AJvYcCWA0QNW9Xy9kJrI7/qspgOVja3PSmRhNMYZbNEwG7ADk7Qvcdi+FBxHUlWzP6DpJaBIrLDr1FAF/yvb@vger.kernel.org
X-Gm-Message-State: AOJu0YyKX6NC69mKaZNkytYH1oVPzWrfubHdIw7XcfTOfn+sQsiybtPB
	s5Swlzo1GeDFsNjEzGj2HFyG/nS1mazmMKravi5kxDf2VY898LRosrwkTsPONxlL
X-Gm-Gg: ASbGncvZ1KXGLh/HF0oTSFPKBUcNarRUg5c4zGNEWMmo60SUvm5vN8ucbeLFVrAoa0p
	kXfbwCbzwOjDo5ZeX60RHdfHOo4GtW+GZbZcoWZZyn6RL0ktaEGzfCeHObD4h5Gmp20j20tFcZJ
	LkHX9o6J82EW61Xs+ayiMnWPkzk+xLojbhsqehkvhaqkWRIzCoSpePv2Ca8MdGNwv9mQkjW7YyY
	dBBdHL911mGqRRxAwhv+47c2bRUZvjQzJVn7zhIIJvdkj1Z596RcsfXDzDeOXVYN8zuZDmMs9ZI
	kyjUxmADNcN3K4sD9/mrevzV8tcYABW6xUvjZOuw3wK6wAq46Z42kcpgbrGsHi+uK0zjw1DUrqx
	7u2Avy+HniY5I+6rjTFImuQaxPh9BenNV0qRa1Kd7e3XF6LzcAK6qam9ZVNBRONUdnU0PiXyMQY
	00ADQpNvldJ+JaJaF8vz3xiT6gI9rJX9Sy44Nw52ptaoLX5i+Q
X-Google-Smtp-Source: AGHT+IFz69CmE+qHPWVu0os1m5oHsd5gsoZ6CSLRzbOBPsndPvNHRBQp09RyJmqvbW+UsPZiCv9WXw==
X-Received: by 2002:a05:6102:3a0e:b0:5d5:f6ae:3913 with SMTP id ada2fe7eead31-5db1b46ca7emr2467622137.21.1761219066193;
        Thu, 23 Oct 2025 04:31:06 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5db2cca4b73sm719404137.13.2025.10.23.04.31.04
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:31:04 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-932e88546a8so328265241.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Oct 2025 04:31:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgJ6OlmsH3qfK8YuLmYnzYyPLsUKh4p8MeV0tfm2EWvU6gYa8RNnC9KoPEg0hHW173c8uvPZ7DWK6v@vger.kernel.org
X-Received: by 2002:a67:fd0f:0:b0:5d4:1499:99a4 with SMTP id
 ada2fe7eead31-5db238491ffmr1515554137.13.1761219064357; Thu, 23 Oct 2025
 04:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020080648.13452-1-herve.codina@bootlin.com>
 <20251020080648.13452-8-herve.codina@bootlin.com> <CAMuHMdV03D_3b_JA2vzW4tE_QbkkT1bN1dm+zLLLX24oDHMj0Q@mail.gmail.com>
 <20251022150339.4c48649e@bootlin.com>
In-Reply-To: <20251022150339.4c48649e@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 13:30:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY=FbO6YG1jrd0OWfrpPpBzrqmBVcWnw7TnnsKPGgr8A@mail.gmail.com>
X-Gm-Features: AWmQ_bml4kcY7IJK2WvckNb7k-cRq3k2ESGBRnimvIxLnwqyhf2dlX518mVHMZI
Message-ID: <CAMuHMdWY=FbO6YG1jrd0OWfrpPpBzrqmBVcWnw7TnnsKPGgr8A@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, 
	Serge Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Wed, 22 Oct 2025 at 15:03, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Tue, 21 Oct 2025 15:05:35 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, 20 Oct 2025 at 10:08, Herve Codina (Schneider Electric)
> > <herve.codina@bootlin.com> wrote:
> > > On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
> > > interruption lines are multiplexed by the GPIO Interrupt Multiplexer =
in
> > > order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.
> > >
> > > The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
> > > IRQ lines out of the 96 available to wire them to the GIC input lines=
.
> > >
> > > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootli=
n.com>

> > > --- /dev/null
> > > +++ b/drivers/soc/renesas/rzn1_irqmux.c
> > > @@ -0,0 +1,150 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * RZ/N1 GPIO Interrupt Multiplexer
> > > + *
> > > + * Copyright 2025 Schneider Electric
> > > + * Author: Herve Codina <herve.codina@bootlin.com>
> > > + */
> > > +
> > > +#include <linux/bitops.h>
> > > +#include <linux/build_bug.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_irq.h>
> > > +#include <linux/platform_device.h>
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +/*
> > > + * The array index is the output line index, the value at the index =
is the
> > > + * GIC SPI interrupt number the output line is connected to.
> > > + */
> > > +static const u32 rzn1_irqmux_output_lines[] =3D {
> > > +       103, 104, 105, 106, 107, 108, 109, 110
> > > +};
> >
> > I did read the discussion with Wolfram, but the flexibility (and
> > overhead) provided by this array sounds a bit overkill to me.
> >
> > What about just defining:
> >
> >     #define RZN1_IRQMUX_SPI_BASE    103
> >     #define RZN1_IRQMUX_NUM_IRQS    8
> >
> > ?
> >
> > If/when a new SoC with a similar setup ever arrives, you can probably
> > just replace the constants above by variables inside SoC-specific
> > match data.  And if the new mapping would be non-contiguous, you can
> > still revive this array ;-)
>
> I have in mind a use case that can lead to a non-contiguous mapping.
>
> The RZ/N1 SoC embeds a Cortex-M3 CPU. This CPU can use GPIOs and
> some of them for interrupt purpose. In that case, those GPIOs have
> to be routed to the interrupt line expected by the Cortex-M3.
>
> And so, we have some interrupts reserved for CPUs running Linux and
> some others for the Cortex-M3.
>
> Among those reserved interrupts may some are not used.
>
> for instance:
>   Interrupt 103, 102: Reserved and used by Linux
>   Interrupt 103: Reserved for Linux but not used -> Hole in the mapping
>   Interrupt 104: Reserved and used my Cortex-M3 (need to be routed by Lin=
ux)

102 does not seem to  be correct?

> I don't know if this use case is relevant but I think we should be too re=
strictive
> on the mapping and so accept holes.
>
> With that in mind, I let you confirm that you still prefer to have a mapp=
ing
> without any holes. A future patch to support that is always possible.

While that would indeed be a non-discontiguous mapping, I do not see how
it is related to rzn1_irqmux_output_lines[] in the driver.  That array
would still contain the same contiguous values 103..110, right?

Sorry, I haven't been following the development of this driver that
closely (RZ/N1 is completely different from e.g. R-Car, and I never
had access to an RZ/N1 platform), so perhaps I am missing something.
Why does the user have to specify an interrupt-map in DT? Can't the
driver create the mapping dynamically, based actual usage of the
GPIOs? I.e. the first 8 GPIOs that ask for interrupt functionality
receive it, and are mapped to an available GIC interrupt?
I believe this is how rzg2l-irqc works, mapping up to 32 GPIO interrupts
to 32 GIC (TINT) interrupts.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

