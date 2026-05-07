Return-Path: <linux-gpio+bounces-36333-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFcyG80P/GlYKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36333-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 06:06:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE964E2C5F
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 06:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9747F301F5D4
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 04:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AF8B31E107;
	Thu,  7 May 2026 04:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJPLltLx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F364331A55E
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 04:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778126785; cv=pass; b=WJEWKTVHhI6IbSKvy38n8rJI9sRN2cS5Essj4nlZZHa/sZtQOgYQErgVw39Kd0Izp+jIHB5KsOvzSGmoyV0+eguxF1ZiB0s++QV6hYLeiOb5B+HBatLBynEMLy4cSBbzcqKL8WGJnshoJ9mScsG2dEOt77rHZ3RUb3pfIUnEFGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778126785; c=relaxed/simple;
	bh=FErax+3o6KKy5UlS/K2CnQWpBPv6tYzWynxed/gtqSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5zlH9CkQTOAckf+ZWdu0IhblqJQReZ/kfWANSji7MMdcRoDEfIY2v+nSNExZ6Mfd7LtyV91ql4cfVsKJgI+TP4rU17MKuhmwi8h4NNN2f/H2MILt7n3xE05b99AnGoK0bJ3fhENrQrzxTmW3TnZw0Ls70jo83A7EMSeIqw1T00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJPLltLx; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-130c653cce4so1207075c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 21:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778126783; cv=none;
        d=google.com; s=arc-20240605;
        b=X8o+9+NCyISIm1bmJZvXYoKB4ZtV/VUBZhdX3COq05ByW0WYnZhG4iWM81wfBTY+RR
         YlP2Aou08Sev/pYFe6hGXmlJ7kebzQJlw92r7WMPrXeVRDt1lvf6bm7KGDLcSwldSrig
         ijWhg6S7uPlt3r8wHPc9kk1bUJbpizuZvdQI8YQoN3ejF4yA0ulaj2YFxfQsEMYbl3gR
         eq85wz+319Nr831RTY0PBOd3MMfe3syH+HK/3GCumzzFpw1Zx/c+p0P/ZLkiORpLR1YU
         SJBfdpuTrT6XpwBlmOT4/Ens41ysfFcqSLs6pz5S3NwJyoCDg/69Qest6R3g3X3pCM8J
         6t2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0vW142AYKQD7glFxffw1+WwwRV+R23RbyGCxyOrqMI=;
        fh=+LWg6BPaCxSISi8TEO+GpPn8lgZJUfZcojgIk0ykKp8=;
        b=ZpeMNRyPHJnRlirGYIqSgkUAnk4f2r3U1b7obJD1HOoh6mit+SAJ0tBhXeh1fNOUpG
         izgBLIlRiKg3IsFkZizX6RUfCLx886jBUGVr1Q9Cnbr17EojEt4TJG9sl4egQhTf3MOb
         LQZwIP4DBQT/B0NXI9ZuJeMAOFXFQ7rlMGyA7TTt+hSFNkKygmOr0Rq4DdJvBHaDbq9j
         qNN4JfZBkleIeZit9kJtGhgwQgO20yAYqryitBilYsxT7S6/nuAeAR+lR681FGOu95NL
         wKJJwj2ByR3RX9vXDfokQo0Mfj/SOFl8SDumclr3qjm3fX6SAV9QyWkVlmx/UarOA4aU
         UM1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778126783; x=1778731583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0vW142AYKQD7glFxffw1+WwwRV+R23RbyGCxyOrqMI=;
        b=BJPLltLxvFqgelBfgXiik7ail0B9e7IMJ8pWoZBNolBZOl/Zsh84C0S3blnvCnatgk
         ly72vOLUz75x08s+2khdV9YxP4M/5hi/x2bzWzqmvMDEiXKhqYrGhZhN1Wu+gPX8DvtD
         K8sHnOfzjomQN8rVH/mEwMVJ6K39t3joTSoOfIROs2lGqhXxmx/GxLOHuHFMFqfGRG4t
         EA2Ai+rlVFQt60vRBy/qhxXsTQU7ONIlDDd2+ZmtgG8a2nuHzAjO7t8CyBmEeqxLPnPX
         0p4EsgkN1h2l/hME8EjGXDY4tFZupVJYrrf0sXXzNfE4gKEW/X39L9vYxf2aeiUManM4
         NBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778126783; x=1778731583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0vW142AYKQD7glFxffw1+WwwRV+R23RbyGCxyOrqMI=;
        b=TCMljl1OJRgNI69iIaHqXfRdd/OXh62lVj/Erqgko+vlGITYmcRFjocOWpNZfPDP/C
         FHqW6QdQ34WchQlrjBkwTFU3d3mMCFr0WffTHqrGBjTI6w+oOY7TIkSh+KGjQ+a4Dd9G
         aNaz4TQ7loiaiCp1QTBKkFl26pYYObB4T2J1Wu+r6vaeKaPZzaJ/+zPM01EDPqcwZGNy
         ghKL1MoZM/3K+c0RIbvRU9OiE0DSi+abYD9o2RpOdtPU49c/J4vyBPIddVzgj8QODvaV
         nbYhYi9/p1esBJWVq6+6qRroNXbLuwMqdQ/s/LG0Q58moSzQkG0t82GUS6HATN/ZITq4
         YZFA==
X-Forwarded-Encrypted: i=1; AFNElJ/g183XzsyGjmc14hIjvBIS9Bs6ihgP3jvlIFQweyscYg/uzJ3ecESgXbo7YOMmvY4SZwunX65wVTPP@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ5avw+QVLukhZdb03gXH5MsH8ZNTQp5oacJFnPeloXcBTpOCT
	Y66pc3oeWHSxUjN64sNR7cQLfp18yodxTqkUIki3YKf7wDXVoskBYF2h/7qzOq+fqxS96cOCQjD
	R/9rYUPC+Bq2T/WuEbYdXyEPyjvVJd+8=
X-Gm-Gg: AeBDieuRxcEkG9/zybVxmxVa7BJRStFwiDlhzZsJNXRGYokE+eW95Te1/2QF0t4AAb0
	RH/y/I1DsYJHkHnF/DCo0pF+rWpPquhHfCc2dvNXNn3uXEu//tJHxHWAbRKELtUhbBDpVAbUrnm
	wfvPj9+yY8xaWilXK8vzPLE/UFtGtysoVTE6DTlJdxOcAtVkVS2jeQhPpDAu/djdWDfJAXayFO0
	LYbVwXmHsZTGkwBU3vZ6k3s8rP+wRaOlPFwVBnBwapo6/k+rCuRx2WWdqaXELjythzmsqH8KbSN
	SAqWpa/Gpc/1nhY=
X-Received: by 2002:a05:7022:458c:b0:130:68a1:a235 with SMTP id
 a92af1059eb24-1319cd28b14mr3382693c88.27.1778126782917; Wed, 06 May 2026
 21:06:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
 <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
 <87lddyx7gg.ffs@tglx> <CAMhs-H_FnFGg1LDM2UWCUWC423udcm0dKOaDYJxMae2JdQh5wg@mail.gmail.com>
 <CAAMcf8AdoTsT33W4-HF8VKGDzo0j7nTKGY3f44DDsNCWo1ARZg@mail.gmail.com>
 <CAMhs-H-SM1uhoqQVLU+gmM+ZEYGv=dS8-x-1QJ9kND0dc-JAAQ@mail.gmail.com> <CAAMcf8BJkidsyuFQwsuO5A8iujXVgM=NkHka0eD4es4X4uUCfg@mail.gmail.com>
In-Reply-To: <CAAMcf8BJkidsyuFQwsuO5A8iujXVgM=NkHka0eD4es4X4uUCfg@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 7 May 2026 06:06:10 +0200
X-Gm-Features: AVHnY4KcFDhmeK_7nUePEROqIEdqY-5vgBAXrP91ZNKYQ1WscP3cPAU7rmfIKlk
Message-ID: <CAMhs-H9+BfWWpaEP6UCpQvcSSzphGPre2GB0CeLfoPn9ePVwuA@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Vicente Bergas <vicencb@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 0AE964E2C5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36333-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,openwrt.org:email,bootlin.com:url]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 12:32=E2=80=AFAM Vicente Bergas <vicencb@gmail.com> =
wrote:
>
> On Wed, May 6, 2026 at 7:43=E2=80=AFPM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Hi Vicente,
> >
> > On Tue, May 5, 2026 at 11:36=E2=80=AFPM Vicente Bergas <vicencb@gmail.c=
om> wrote:
> > >
> > > On Tue, May 5, 2026 at 5:05=E2=80=AFPM Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, May 5, 2026 at 4:21=E2=80=AFPM Thomas Gleixner <tglx@kernel=
.org> wrote:
> > > > >
> > > > > On Tue, May 05 2026 at 14:01, Linus Walleij wrote:
> > > > > > On Sat, May 2, 2026 at 11:52=E2=80=AFPM Vicente Bergas <vicencb=
@gmail.com> wrote:
> > > > > >> As a way to prove that this is indeed the problem,
> > > > > >> the following workaround makes it work.
> > > > > >> It just inverts the sorting order of all matches,
> > > > > >> so it picks Bank0 instead of Bank2.
> > > > > >
> > > > > > That's a tricksy bug, I can't exactly see where the issue
> > > > > > is.
> > > > > >
> > > > > > I think to solve this you might need to allocate an external
> > > > > > irqdomain that deal with the three different gpiochip
> > > > > > instances when translating the irqs.
> > > > >
> > > > > struct gpio_chip has this:
> > > > >
> > > > >         /**
> > > > >          * @of_node_instance_match:
> > > > >          *
> > > > >          * Determine if a chip is the right instance. Must be imp=
lemented by
> > > > >          * any driver using more than one gpio_chip per device tr=
ee node.
> > > > >          * Returns true if gc is the instance indicated by i (whi=
ch is the
> > > > >          * first cell in the phandles for GPIO lines and gpio-ran=
ges).
> > > > >          */
> > > > >         bool (*of_node_instance_match)(struct gpio_chip *gc, unsi=
gned int i);
> > > > >
> > > > > That driver falls in the category and lacks that callback, no?
> > > > >
> > > > > Thanks,
> > > > >
> > > > >         tglx
> > > >
> > > > The IP core used inside these SoCs has 3 banks of 32 GPIOs each but
> > > > there is only one device tree node because the registers of all the
> > > > banks are interwoven inside one single IO range. Thus, the driver
> > > > internally sets up a gpio controller instance per bank. The driver
> > > > lacks of_node_instance_match callback but I am not sure if it needs=
 to
> > > > be implemented in this particular case since the driver is using
> > > > of_xlate callback for this.
> > > >
> > > > Thanks,
> > > >     Sergio Paracuellos
> > >
> > > Hi all,
> > > just tested with the suggested `of_node_instance_match` by applying
> > > those changes:
> > >
> > > ```
> > > --- a/drivers/gpio/gpio-mt7621.c
> > > +++ b/drivers/gpio/gpio-mt7621.c
> > > @@ -1,3 +1,5 @@
> > > +#define DEBUG  1
> > > +
> > >  // SPDX-License-Identifier: GPL-2.0
> > >  /*
> > >   * Copyright (C) 2009-2011 Gabor Juhos <juhosg@openwrt.org>
> > > @@ -206,6 +208,18 @@
> > >      return gpio % MTK_BANK_WIDTH;
> > >  }
> > >
> > > +static bool mediatek_gpio_node_instance_match(struct gpio_chip *chip=
,
> > > unsigned int i)
> > > +{
> > > +    struct mtk_gc *rg =3D to_mediatek_gpio(chip);
> > > +
> > > +    struct mtk_gc *rg0 =3D rg - rg->bank;
> > > +    struct mtk *mtk =3D container_of(rg0, struct mtk, gc_map[0]);
> > > +    dev_dbg(mtk->dev, "%u <=3D> %d\n", i, rg->bank);
> > > +    dump_stack();
> > > +
> > > +    return i =3D=3D rg->bank;
> > > +}
> > > +
> > >  static const struct irq_chip mt7621_irq_chip =3D {
> > >      .name        =3D "mt7621-gpio",
> > >      .irq_mask_ack    =3D mediatek_gpio_irq_mask,
> > > @@ -253,6 +267,7 @@
> > >
> > >      rg->chip.gc.of_gpio_n_cells =3D 2;
> > >      rg->chip.gc.of_xlate =3D mediatek_gpio_xlate;
> > > +    rg->chip.gc.of_node_instance_match =3D mediatek_gpio_node_instan=
ce_match;
> > >      rg->chip.gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d=
",
> > >                      dev_name(dev), bank);
> > >      if (!rg->chip.gc.label)
> > > ```
> > >
> > > It turns out that the `mediatek_gpio_node_instance_match` function is
> > > never called.
> > >
> > > Regards,
> > >   Vicente.
> >
> > We are using two cells and mediatek_gpio_xlate() callback for this.
> > IIUC, you would need 3 cells to get this
> > mediatek_gpio_node_instance_match() called and probably get rid of
> > mediatek_gpio_xlate() but I have never used of_node_instance_match()
> > callback so I can be totally wrong.
> >
> > Best regards,
> >     Sergio Paracuellos
>
> I tried removing of_xlate, but then many other things break.
> The following patch makes it work, using both of_xlate and
> of_node_instance_match.
>
> Now, i am not sure if this is the proper way to fix the issue.
> To me it looks ugly that gpios are specified using a single number
> from 0 to 95, but associated interrupts need bank + offset.
> A single number is more clear, as that way matches the available
> documentation of the platform.
>
> Another painpoint of this approach is that existing DT files need to be c=
hanged.
>
> If this can be improved: how?
> Otherwise, i will update `mediatek,mt7621-gpio.yaml` and send it all
> as a pull request.

Linus, Bartosz, any advice regarding this?

>
> ```
> --- mt7628an.dtsi
> +++ mt7628an.dtsi
> @@ -99,7 +99,7 @@
>        interrupt-parent =3D <&intc>;
>        interrupts =3D <6>;
>
> -      #interrupt-cells =3D <2>;
> +      #interrupt-cells =3D <3>;
>        interrupt-controller;
>
>        gpio-controller;
> --- board.dts
> +++ board.dts
> @@ -191,7 +191,7 @@
>      compatible =3D "focaltech,ft6236";
>      reg =3D <0x38>;
>      interrupt-parent =3D <&gpio>;
> -    interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
> +    interrupts =3D <0 0 IRQ_TYPE_EDGE_FALLING>;
>      reset-gpios =3D <&gpio 2 GPIO_ACTIVE_LOW>;
>    };
>  };
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -206,6 +206,11 @@
>    return gpio % MTK_BANK_WIDTH;
>  }
>
> +static bool mediatek_gpio_node_instance_match(struct gpio_chip *chip,
> unsigned int i)
> +{
> +  return i =3D=3D to_mediatek_gpio(chip)->bank;
> +}
> +
>  static const struct irq_chip mt7621_irq_chip =3D {
>    .name    =3D "mt7621-gpio",
>    .irq_mask_ack  =3D mediatek_gpio_irq_mask,
> @@ -253,6 +258,7 @@
>
>    rg->chip.gc.of_gpio_n_cells =3D 2;
>    rg->chip.gc.of_xlate =3D mediatek_gpio_xlate;
> +  rg->chip.gc.of_node_instance_match =3D mediatek_gpio_node_instance_mat=
ch;
>    rg->chip.gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
>            dev_name(dev), bank);
>    if (!rg->chip.gc.label)
> ```

Vicente, I know that you are using openwrt dts but take into account
that there are already in tree device trees that must be updated as
well if you end up updating the mt7621-gpio yaml doc:
- https://elixir.bootlin.com/linux/v7.0.1/source/arch/mips/boot/dts/ralink/=
mt7621.dtsi#L180
- https://elixir.bootlin.com/linux/v7.0.1/source/arch/mips/boot/dts/ralink/=
mt7628a.dtsi#L173

Thanks,
    Sergio Paracuellos

