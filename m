Return-Path: <linux-gpio+bounces-36327-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KUG1J3/B+2mxEQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36327-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 00:32:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 002D24E13F7
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 00:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47EC23009142
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 22:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE403542F8;
	Wed,  6 May 2026 22:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTE5XNMH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66931922FD
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 22:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778106748; cv=pass; b=O8Wu91D7mqYurQPOxAOZqctadrcR5twEeREYP0J3tWP6oAPjGsKbhFFc+KsIM4oRh9rAa0aYs6vDavl3NwPq0Qbf3wJV915rt+pgBUXsJMB3d3rrZkeJLLcQMHIxwUkF4Qq8a8HVeXjoXTOkyJAfjnA+LRfqAeqNXqbhTcdh3D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778106748; c=relaxed/simple;
	bh=IIyMH2L9NaIzmAX4lQXZDQQ/DSsdSJ+7BFvOSzBhotE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmuKI2N4GFjEB0p+zXgTRaSLz2IM0c6Jwg8WZfbh7bpD5+nB/rRwHaD2TXwKN6SM3UC+On0BL7guAWoiBf+wcRC2UXuI9hyDOxC3C2PFJWJO7Ay41PwhxjmZEAE/PQrusHRBpjImumMDuikptz/bW5VkgnjoDIBgEkPSnSyg7UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTE5XNMH; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso262387e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 15:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778106746; cv=none;
        d=google.com; s=arc-20240605;
        b=ZfgZl7j9NS4LDXnLCVgeCeQk8j8DqYVLtPODRxy4wUUI4cTDExoWyg3b27UsG2GZ+o
         rPqaWlVrfdXELG8e6aWQq+J89KQasDbISO0Tx/VHwcp7Mh5TW6zYlcCGBDOkXsLsY76W
         DWOLhVwrw1frxlpA6IrIyKF2JZ54IGYLVXi5IQj+0raOTfF68GEE52+t4X7F7WvDNx9H
         2iJciJyX78ffXlzZHDf/vBoUabRSVY4svH6F2sGSlTh9yWBNu8HvOAU3UZOXAeqLGQWg
         oMObCoEH2LCKnHoh7pu3ECx9vS1z0q6N5a/e7Z1PRuA1sSeoRJWe612kAz0UBLucE2EC
         l8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sirLSc6ZqIC24tGdrw1myuHgWC72yv/RY/NXGew/46A=;
        fh=U17y5L9WsALMd7Qviyqs7f3cJQJEUKlGTrqahXgA2UQ=;
        b=C10o1ATXenJAEuQL5o/HEo2+wDdYHd2kfc2EnlviVhuw9CJ7P3zrKa7CEo/okqpu/X
         FEFkgjq8EB3RUeIM6wWCetiirlk/1cwZ3ZB1L1EXtqCwW4+jgD9g8RbWj/kgKE9YtUNb
         F5DjmRJrP/Wr3kwCpfW+L1O7XfeF7sqY+Fw/u/x94pNX8d7m2je+kN+8TNi/4+gCLUql
         VhQ1h5zVwllcgY2mB+lsjkunNDxGj7TbRYeozcCTe4oxT3nmkzYpa4Q5z1oiHGFgumD+
         hVU5vbNwPL24bVib2uPPhEVOCrlMGOZEzlmu9aeWVpbf/4yBR+oBQscHFAzFDV3hqTAq
         Lxlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778106746; x=1778711546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sirLSc6ZqIC24tGdrw1myuHgWC72yv/RY/NXGew/46A=;
        b=jTE5XNMHhKru6uKKaOlJtxw0uG3BJKylibAUhTzRJHzIpb8tKv43Y7eLLHO1g1bK+1
         Ldx63EB6DDlZ7zwrawfKSdqcw0muMeBKq1jdK9a9bbaCuOmM0U4ubqNupz5ul8HULLki
         uz4OEzMFyWRYGtyBTU5+cmCBKziD8cSF4UJdfPCJ70Xen7GfzDnR0KUVCLuZoG6gZfD7
         KVFAAlj2l0qsLyHtSNakWHx77XrXZbVtK8zgrZKghUkmXcsTCRKQMritjCGn0fGMxpx3
         DOZL1kpBYL1XGaZravYNAVqKdAzQYYQiS0bXq7LcJpxv1ug+EDzOpLcxol87Hq5/UhX5
         sfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778106746; x=1778711546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sirLSc6ZqIC24tGdrw1myuHgWC72yv/RY/NXGew/46A=;
        b=QHT44sOqj4/V4HJyxtW9EAEFzNIlrcTPnIwkueSkm1HqP4wZ+YJECq6rKUK8eIbjpL
         yJnj/yvn7eP1N+1ANkUbf2e5EHhXH6JeE2GZ7ZiPWY+6QVyjQkwLKE+OODb2/SCxW0o/
         S899qrO2XNgKFIqqY845mW6wt9Ug4MjCGvfJDtJPW+BOlUZCHlb2uL9UTPy6jXtkwzBn
         HfEPYTDetMAvSLNH5ZcLMid2JIai2dAutvfhHv5AWrsHQrvPKqdQEoWVkjezpOgmUnsO
         kdJjKtsTqn+67dFWtC/bZZo4WFcuUGyCE0nzKhBVsgNP5YVLKirYpz6BFiS+daCoY7m4
         pEpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+B+suPMR2QnF0Yfv4kq7RFyxuvsYTsuz9Zp3e0fX2qXPphyBkA35/6anUPlg+/0Nue8AEp1jsaMr4s@vger.kernel.org
X-Gm-Message-State: AOJu0YwDdFuxfI/AeQL73XuOBbLqWl5Kl0EpCNdQXIZgqKUY4QE9hjqW
	/HBC3arktXkzWqXAHbqpbYkNR1Iq+7hs9OhU2c8e/O236nR/ax9UvlecH5iNPAIxmFvg/CQ4ui4
	UoDEPN6cC2lzlMVRVWmumR8lbDnzgam0=
X-Gm-Gg: AeBDievvJ1LhzPdniOWFmLxHgOLbXcLy0CsdYAkhhM/dqRBz9gpWISrcR5peLktCTuV
	rE8d48CsTVzKzvDTT8u8OdB68HPPhIOSIxghPeY6iSgF2PxasXAVqlh8aDWDBgnnD0NaTvcjtuV
	8GyckT6pXS2A0+2s8GDxazuacQGCssMMY5KMxYMuuShq3/QVlnI38mQ+jB/IM+9aiBBvsx+jx2R
	Vdtasr0lsYUwcDk2xBNQy2dWInD3tsLzu5LcU7P/q7SKEK8zpHA+AuGUNltD6IwE6ktg++aXuYV
	cEDvgWPA+ViP2LfHfK5kKEur8YJ/xKT4QEa+sOZLBEocFoEeel1pHKCGoB0=
X-Received: by 2002:a05:6102:8098:b0:607:b901:5d74 with SMTP id
 ada2fe7eead31-630f8edafdfmr2980410137.9.1778106745704; Wed, 06 May 2026
 15:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
 <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
 <87lddyx7gg.ffs@tglx> <CAMhs-H_FnFGg1LDM2UWCUWC423udcm0dKOaDYJxMae2JdQh5wg@mail.gmail.com>
 <CAAMcf8AdoTsT33W4-HF8VKGDzo0j7nTKGY3f44DDsNCWo1ARZg@mail.gmail.com> <CAMhs-H-SM1uhoqQVLU+gmM+ZEYGv=dS8-x-1QJ9kND0dc-JAAQ@mail.gmail.com>
In-Reply-To: <CAMhs-H-SM1uhoqQVLU+gmM+ZEYGv=dS8-x-1QJ9kND0dc-JAAQ@mail.gmail.com>
From: Vicente Bergas <vicencb@gmail.com>
Date: Thu, 7 May 2026 00:32:13 +0200
X-Gm-Features: AVHnY4JCddHgtWsTbdSwNx1RrqAlA8WQQPg5CTgv9BjzqWJuEq06gbtumAyPEF4
Message-ID: <CAAMcf8BJkidsyuFQwsuO5A8iujXVgM=NkHka0eD4es4X4uUCfg@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 002D24E13F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36327-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vicencb@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 7:43=E2=80=AFPM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi Vicente,
>
> On Tue, May 5, 2026 at 11:36=E2=80=AFPM Vicente Bergas <vicencb@gmail.com=
> wrote:
> >
> > On Tue, May 5, 2026 at 5:05=E2=80=AFPM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, May 5, 2026 at 4:21=E2=80=AFPM Thomas Gleixner <tglx@kernel.o=
rg> wrote:
> > > >
> > > > On Tue, May 05 2026 at 14:01, Linus Walleij wrote:
> > > > > On Sat, May 2, 2026 at 11:52=E2=80=AFPM Vicente Bergas <vicencb@g=
mail.com> wrote:
> > > > >> As a way to prove that this is indeed the problem,
> > > > >> the following workaround makes it work.
> > > > >> It just inverts the sorting order of all matches,
> > > > >> so it picks Bank0 instead of Bank2.
> > > > >
> > > > > That's a tricksy bug, I can't exactly see where the issue
> > > > > is.
> > > > >
> > > > > I think to solve this you might need to allocate an external
> > > > > irqdomain that deal with the three different gpiochip
> > > > > instances when translating the irqs.
> > > >
> > > > struct gpio_chip has this:
> > > >
> > > >         /**
> > > >          * @of_node_instance_match:
> > > >          *
> > > >          * Determine if a chip is the right instance. Must be imple=
mented by
> > > >          * any driver using more than one gpio_chip per device tree=
 node.
> > > >          * Returns true if gc is the instance indicated by i (which=
 is the
> > > >          * first cell in the phandles for GPIO lines and gpio-range=
s).
> > > >          */
> > > >         bool (*of_node_instance_match)(struct gpio_chip *gc, unsign=
ed int i);
> > > >
> > > > That driver falls in the category and lacks that callback, no?
> > > >
> > > > Thanks,
> > > >
> > > >         tglx
> > >
> > > The IP core used inside these SoCs has 3 banks of 32 GPIOs each but
> > > there is only one device tree node because the registers of all the
> > > banks are interwoven inside one single IO range. Thus, the driver
> > > internally sets up a gpio controller instance per bank. The driver
> > > lacks of_node_instance_match callback but I am not sure if it needs t=
o
> > > be implemented in this particular case since the driver is using
> > > of_xlate callback for this.
> > >
> > > Thanks,
> > >     Sergio Paracuellos
> >
> > Hi all,
> > just tested with the suggested `of_node_instance_match` by applying
> > those changes:
> >
> > ```
> > --- a/drivers/gpio/gpio-mt7621.c
> > +++ b/drivers/gpio/gpio-mt7621.c
> > @@ -1,3 +1,5 @@
> > +#define DEBUG  1
> > +
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*
> >   * Copyright (C) 2009-2011 Gabor Juhos <juhosg@openwrt.org>
> > @@ -206,6 +208,18 @@
> >      return gpio % MTK_BANK_WIDTH;
> >  }
> >
> > +static bool mediatek_gpio_node_instance_match(struct gpio_chip *chip,
> > unsigned int i)
> > +{
> > +    struct mtk_gc *rg =3D to_mediatek_gpio(chip);
> > +
> > +    struct mtk_gc *rg0 =3D rg - rg->bank;
> > +    struct mtk *mtk =3D container_of(rg0, struct mtk, gc_map[0]);
> > +    dev_dbg(mtk->dev, "%u <=3D> %d\n", i, rg->bank);
> > +    dump_stack();
> > +
> > +    return i =3D=3D rg->bank;
> > +}
> > +
> >  static const struct irq_chip mt7621_irq_chip =3D {
> >      .name        =3D "mt7621-gpio",
> >      .irq_mask_ack    =3D mediatek_gpio_irq_mask,
> > @@ -253,6 +267,7 @@
> >
> >      rg->chip.gc.of_gpio_n_cells =3D 2;
> >      rg->chip.gc.of_xlate =3D mediatek_gpio_xlate;
> > +    rg->chip.gc.of_node_instance_match =3D mediatek_gpio_node_instance=
_match;
> >      rg->chip.gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
> >                      dev_name(dev), bank);
> >      if (!rg->chip.gc.label)
> > ```
> >
> > It turns out that the `mediatek_gpio_node_instance_match` function is
> > never called.
> >
> > Regards,
> >   Vicente.
>
> We are using two cells and mediatek_gpio_xlate() callback for this.
> IIUC, you would need 3 cells to get this
> mediatek_gpio_node_instance_match() called and probably get rid of
> mediatek_gpio_xlate() but I have never used of_node_instance_match()
> callback so I can be totally wrong.
>
> Best regards,
>     Sergio Paracuellos

I tried removing of_xlate, but then many other things break.
The following patch makes it work, using both of_xlate and
of_node_instance_match.

Now, i am not sure if this is the proper way to fix the issue.
To me it looks ugly that gpios are specified using a single number
from 0 to 95, but associated interrupts need bank + offset.
A single number is more clear, as that way matches the available
documentation of the platform.

Another painpoint of this approach is that existing DT files need to be cha=
nged.

If this can be improved: how?
Otherwise, i will update `mediatek,mt7621-gpio.yaml` and send it all
as a pull request.

```
--- mt7628an.dtsi
+++ mt7628an.dtsi
@@ -99,7 +99,7 @@
       interrupt-parent =3D <&intc>;
       interrupts =3D <6>;

-      #interrupt-cells =3D <2>;
+      #interrupt-cells =3D <3>;
       interrupt-controller;

       gpio-controller;
--- board.dts
+++ board.dts
@@ -191,7 +191,7 @@
     compatible =3D "focaltech,ft6236";
     reg =3D <0x38>;
     interrupt-parent =3D <&gpio>;
-    interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
+    interrupts =3D <0 0 IRQ_TYPE_EDGE_FALLING>;
     reset-gpios =3D <&gpio 2 GPIO_ACTIVE_LOW>;
   };
 };
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -206,6 +206,11 @@
   return gpio % MTK_BANK_WIDTH;
 }

+static bool mediatek_gpio_node_instance_match(struct gpio_chip *chip,
unsigned int i)
+{
+  return i =3D=3D to_mediatek_gpio(chip)->bank;
+}
+
 static const struct irq_chip mt7621_irq_chip =3D {
   .name    =3D "mt7621-gpio",
   .irq_mask_ack  =3D mediatek_gpio_irq_mask,
@@ -253,6 +258,7 @@

   rg->chip.gc.of_gpio_n_cells =3D 2;
   rg->chip.gc.of_xlate =3D mediatek_gpio_xlate;
+  rg->chip.gc.of_node_instance_match =3D mediatek_gpio_node_instance_match=
;
   rg->chip.gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
           dev_name(dev), bank);
   if (!rg->chip.gc.label)
```

