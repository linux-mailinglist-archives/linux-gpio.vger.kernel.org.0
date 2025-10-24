Return-Path: <linux-gpio+bounces-27578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25E6C04B64
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D7794006A3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 07:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D93529B8DC;
	Fri, 24 Oct 2025 07:24:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ACC2BCF45
	for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290681; cv=none; b=plW8p8BcRDFVH4anS0e4EF5R2jRC4i6j16FXdJm7NVz2kJPyD0KlxtCqyR33U48LfU6sH1GfKt8La5cGCHfsvIBJ8rkQReRZTdP+DRe7eq88bk8acP8LcOXcq16xrfHAGW1cDSl7Bb6GQ32NL2la1oE2z5FxxXkg+C2NeW0ojF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290681; c=relaxed/simple;
	bh=TYYDo+7DxkUKjmm+P+3sxJh+gjqzjUwg71o/dX7xBWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRE1YsfewHJywjdD/seF4zpXgbG+xVXU8QNBciLKT6f73PV1GFCkIE2UjcIQlF5CD39wAi93JeEoNnhY2gnenG9ehOins/diiHVMhIzrXW2muAWbkgCArFy+43GzKgCG+aDxA2/sYbiSyObfipQpy43Orb6zUoXlr+PS5oE+kJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-551b9d94603so547902e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 00:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761290678; x=1761895478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O3WV+VoszRFKObS+2w1jR5z8x4F6hvRxXouyKsJGXVw=;
        b=ws5aMt8A7dQ6tFg2gXajcotOz/lTofCsOcFQVi7JZFy7woEsf1CmfZy2WOUXEj/8Yt
         do9knyj6DZIBkVN3kaf4D1U/VcAvg7czBZB/+QEzst0yEbDSJv8rzOP9/eod/osbaycL
         ynSa8PZCOluYb0/gwqAfAq2CRty2HsjSBzqBFpACEJRyCGYKp9+XnT0ESrA9A3UBNqkp
         wVsBFeNxyTGoELYv3917gkxa4veUS46YpLnFCrx2nFFYU8THCu1vcFFcAdK+2zPL48+S
         RnO+BhUXAPTvpRW1Jx1Cq7lnU85ls0/a9i96xnCtmhrE4JVPIyQghXqwm1S5CqbIPVR1
         CbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDcdDVu9iX/RmfJIEwat3FrUE3Mk/eyRxRNyP4aP0ZqX9aX419YFNGb7rSgFKYQ3qY/A+LHScR8mUa@vger.kernel.org
X-Gm-Message-State: AOJu0YwHSGIM6gVTkIIiYDs02haCTPxQ4tzS3j6uDwLcr6+0doiBbX9Y
	uxIrGZQZIqHK3rcfRC0ybecayM5zFSUozTt2SA0LdQgBuLU8n2/A4Uy/zDZgw5ig
X-Gm-Gg: ASbGncttIkpHf7+DONUTcYeSOMACYHfzNk626ODme1pX+reKOvVcRxotCSYXEmoNUUn
	si17GKD7MmLF3QDYSvvC7EtzBzD5zycxz5GR0TgiRoUhZuq/cT0mDNzXJFtkFum//RMsBUos3vr
	AQaoVq0IpWH2+ua1N5B+6hO+eTvMfBsgGh9Cuu/hM4LXhfiIVVMSRQdFZxi7JRggFQREKasJqd5
	KrYRQjbc2989UT/hpASfZo30qDMdFIp9V7itVnPwrzSuEgy+m+tirkK60tq3F4MrvGWezCj6WRo
	h0wf0HEoVsNDj76eECkl8kA0Lpe3/pMRoW97jEVlzrbf8aaSukBAqAiZZ0bBp71B+pBFiDa5ebB
	QCXBUp+hTRq69zniNf1ronnyuxQbaBiW5tFk081go5jaFaGP5M9AQuE4BiNYgw67+V3WR7p8Peo
	OzXWZqsVvaOngNAHlAepcUWXGEtRivUc9SOB6a37ZVoVI8KPSk
X-Google-Smtp-Source: AGHT+IEmBoGJKXr3mUH7VkJaKN+GLafrPR+AGQpK9051Dtgu+Z/qBq/dXgLYpdA7JbTMIgacYSJdZg==
X-Received: by 2002:a05:6122:4147:b0:54c:da0:f709 with SMTP id 71dfb90a1353d-557ceac3fa9mr305786e0c.13.1761290677671;
        Fri, 24 Oct 2025 00:24:37 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bd8e5e87sm1791575e0c.11.2025.10.24.00.24.37
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 00:24:37 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5db374c282dso488109137.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Oct 2025 00:24:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVdDY4Zv1mzG57jFXBijhvffGZEAcNKZYXm7Ny/9OXc0nyYBLzZ+95vbzvHJyb4CO9lKsShrm7pwKQ@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:5d7:dec5:a464 with SMTP id
 ada2fe7eead31-5db3f8bbd6dmr232329137.10.1761290676888; Fri, 24 Oct 2025
 00:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020080648.13452-1-herve.codina@bootlin.com>
 <20251020080648.13452-8-herve.codina@bootlin.com> <CAMuHMdV03D_3b_JA2vzW4tE_QbkkT1bN1dm+zLLLX24oDHMj0Q@mail.gmail.com>
 <20251022150339.4c48649e@bootlin.com> <CAMuHMdWY=FbO6YG1jrd0OWfrpPpBzrqmBVcWnw7TnnsKPGgr8A@mail.gmail.com>
 <20251023152048.0e70a362@bootlin.com>
In-Reply-To: <20251023152048.0e70a362@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Oct 2025 09:24:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=_6MGgti2NEL6FaChBhefFLBdjeam5Zts3+Yf-Ps3Gg@mail.gmail.com>
X-Gm-Features: AWmQ_bkc6C0U89yGzgj449WFrjiYqIBguZky57fXbpHAfhiWelGeFgRG-a9YogQ
Message-ID: <CAMuHMdX=_6MGgti2NEL6FaChBhefFLBdjeam5Zts3+Yf-Ps3Gg@mail.gmail.com>
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

On Thu, 23 Oct 2025 at 15:21, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Thu, 23 Oct 2025 13:30:53 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > I have in mind a use case that can lead to a non-contiguous mapping.
> > >
> > > The RZ/N1 SoC embeds a Cortex-M3 CPU. This CPU can use GPIOs and
> > > some of them for interrupt purpose. In that case, those GPIOs have
> > > to be routed to the interrupt line expected by the Cortex-M3.
> > >
> > > And so, we have some interrupts reserved for CPUs running Linux and
> > > some others for the Cortex-M3.
> > >
> > > Among those reserved interrupts may some are not used.
> > >
> > > for instance:
> > >   Interrupt 103, 102: Reserved and used by Linux
> > >   Interrupt 103: Reserved for Linux but not used -> Hole in the mappi=
ng
> > >   Interrupt 104: Reserved and used my Cortex-M3 (need to be routed by=
 Linux)
> >
> > 102 does not seem to  be correct?
>
> My bad, my example was wrong.
>    Interrupt 103, 104: Reserved and used by Linux
>    Interrupt 105: Reserved for Linux but not used -> Hole in the mapping
>    Interrupt 106: Reserved and used my Cortex-M3 (need to be routed by Li=
nux)

OK, much better!

> > > I don't know if this use case is relevant but I think we should be to=
o restrictive
> > > on the mapping and so accept holes.
> > >
> > > With that in mind, I let you confirm that you still prefer to have a =
mapping
> > > without any holes. A future patch to support that is always possible.
> >
> > While that would indeed be a non-discontiguous mapping, I do not see ho=
w
> > it is related to rzn1_irqmux_output_lines[] in the driver.  That array
> > would still contain the same contiguous values 103..110, right?
>
> The array rzn1_irqmux_output_lines is still contiguous yes but the mappin=
g
> defined in irq-map property no.
>
> Looking back again at your proposal, indeed I can remove the following lo=
op:
>         for (i =3D 0; i < output_lines_count; i++) {
>                if (parent_args->args[1] =3D=3D output_lines[i])
>                        return i;
>         }
>
> With just
>         if (parent_args->args[1] >=3D RZN1_IRQMUX_SPI_BASE &&
>             parent_args->args[1] < RZN1_IRQMUX_SPI_BASE + RZN1_IRQMUX_NUM=
_IRQS) {
>                 return parent_args->args[1] - RZN1_IRQMUX_SPI_BASE;
>
>         dev_err(dev, "Invalid GIC interrupt %u\n", parent_args->args[1]);
>         return -EINVAL;

Good. I like simpler code ;-)

BTW, please invert the logic, i.e. bail out early in case of error.

> > Sorry, I haven't been following the development of this driver that
> > closely (RZ/N1 is completely different from e.g. R-Car, and I never
> > had access to an RZ/N1 platform), so perhaps I am missing something.
> > Why does the user have to specify an interrupt-map in DT? Can't the
> > driver create the mapping dynamically, based actual usage of the
> > GPIOs? I.e. the first 8 GPIOs that ask for interrupt functionality
> > receive it, and are mapped to an available GIC interrupt?
> > I believe this is how rzg2l-irqc works, mapping up to 32 GPIO interrupt=
s
> > to 32 GIC (TINT) interrupts.
>
> I think the main difference with rzg2l-irqc is that the RZ/N1 irq mux is
> clearly not an interrupt controller.
>
> It is just a mux with 96 inputs (GPIO lines coming from several GPIO
> controller) and 8 outputs (connected to the GIC).
>
> It is represented as an interrupt nexus node and has an interrupt-map pro=
perty.
> to describe the routing.
>
> The interrupt-map property cannot be dynamically created.
>
> Also, the routing is necessary even if the related GPIO is not used by Li=
nux.
> This GPIO can be used as a GPIO input interrupt line by the Cortex M3.
>
> If the irq mux driver performs the routing only on Linux GPIO usage, it w=
ill
> not route GPIOs depending on Cortex M3 internal usage.

Thanks, makes sense!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

