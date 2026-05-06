Return-Path: <linux-gpio+bounces-36317-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKRUNyV++2mEbwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36317-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 19:45:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 462E04DEF64
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 19:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFBCB300A628
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 17:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7B44A3402;
	Wed,  6 May 2026 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIKnv3WB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447984ADD9F
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778089437; cv=pass; b=tvn8Q6+JmKP3Kp2Jwfe57E+au4ELhDuOMJnuFPys3oPtBv3HRRUbdxMr6N4omZDWQXsyXE/IX7QE4keOigH5vpNdpDQzqJd9qwukDPLHYRcUe1OSuRTW3hTJQaqEgj1jVT0S9VGuvfuJCeBkw+wYUkkYPJlYVMhamy02gCfrwbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778089437; c=relaxed/simple;
	bh=jnqowZGojrc1O96X1AH15YYwVlxx/QCHWosHLJvdwqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXeKvGWlOJVu6twVPmOY8WzZY6EFtc4LUEtOLs0G5MNhllkDXIISshIpQO/SUgCcx5sSuv1Sdn2eHacYKt6x5lhlCwbmC43T1xhUrBt7xQuFYiP5l+sJSC/aMQQyWXWUlYuKAzMK/3YqC1RfIEA/Jt1zFaaySGki8kal9ZkvyW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIKnv3WB; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1309f4ee97fso4146879c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 10:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778089434; cv=none;
        d=google.com; s=arc-20240605;
        b=h+WYQBUReu56Vxybp5jAmq816Ij2+Vz86PKpTPB+DgN3Q1lWQe8f+uIxBY1qBapzFa
         3Yokbqk5zxcTW1JV/KxIASX+E0zyWTXh22B0ixyMug3qnulfephc+xVZAu9eMrgAYVGG
         6mPli4I+IAKr6hgiZUZg1hxaPjJWe9KRpZuXU/KCTC7PGhDMB5TegtrNJ/zeZZqpRgiE
         fsbjiFITfkKwSVrOLvwfsTa1iqfCO7IYs15Ihym9qVgLh9puokHuiWbvuWpcflfObZ6X
         zo0d33SxZp5MKkJIvRRpNGfIUXEQ5u+hdVfmeFKPaYtUXe/gpJhZxiTOdaQ9b/fMk9OY
         /dWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=639FRA1/7GHge+G+L2MMlFKm8sYYU+hJ/F2tDDApRnw=;
        fh=srrYmlhaI61Yp7vkqyGRnPLKR49cWW5CItU/VvIMbow=;
        b=jR4GDae6ZC7WSOLeWbrVXkIkgYjkS7aJkgY+IOJTbyisQJ7vod40vUpwf9TM7SOaqi
         7w6jAtaHVls6cvRlR3uwn2NC5EogP0dX7N8n+vTfExFP97rj7LnuI7q1orXlB+3HI+NV
         C5YhJrw4ZxYDLlVNrUNSORNpfuP7S9R1EILcwKkosZpwT5QWo1q4v2blSrBac612H+W2
         azc0MK82OVIaneGObfAnDpSNRUR9M5RlzBE32QPbtlJ3aK80HniSttA/q21MUUcSpFWp
         ZCVIjhHRTE4IihcNjiy++f3wtql/9RzqRZybkFHo/KarQmJ8iKs+EZt2MNM+/inwXgk1
         P5FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778089434; x=1778694234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=639FRA1/7GHge+G+L2MMlFKm8sYYU+hJ/F2tDDApRnw=;
        b=HIKnv3WBFhjgQIgn92mrtlqsbZ6cAYqS5nnCsmM8H9Oqdaos7bvpkfQJS86s09Irff
         rVtWwrfSNFNNTU+7hbbw4VDwRAV3atUq2jJ/fP56QenAffKZSVdWmGffLjlhzNWP++2y
         BNvp7M7hAsp5vB+GtfjiKn7KNUVuhps/ecbWBALJ3rThggll+fXtn+w4uxolBGRq6i5G
         NbNQqoHeJMtdg1GCwxRYHOefz2brHboGYqR9aCNK8M6mBqten16IrFNRtnzRzWdi8jCc
         qY67j3NYlQ/Q0lhoOf+YwCpDKR4DHmopLfH5ez5axGHh/Ts9RR/Mn8L7lHMF77D7UJ3w
         Hiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778089434; x=1778694234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=639FRA1/7GHge+G+L2MMlFKm8sYYU+hJ/F2tDDApRnw=;
        b=APIMfW46ZojqruqwOLvQI+S8LoLW7+bmpzfpSjqqqE03PPb/U+ja/HSZjjwHu580Xk
         yBoelfyWtG2+6SaB969tXoSTIM44Cq4WebQl5RsGuAsBw0TX2y87jBG40DMCnyuQjOwM
         Q3O2LHUJks+ZlboiEz1VQ3JLKkBwsF+x8m1Xo3JMNn2qHR1k3dmLe3qP11+eNzpjWR0i
         7BUoNba3iR9Lp8Q69Pm3X4Z2qdY+x6TuP8URU6ato7fJsUmaixbt70Uy+ZcjHCo8aElt
         btlHW91ADtd0e907hyeavktvsLCy33Og+3tFTek6nNU7f9D2wN4g7+1+Y4fYqH9bFDOr
         Mjog==
X-Forwarded-Encrypted: i=1; AFNElJ8/d2SCtW3xcp1GKCsKp6wbaoYOrJ0PVHxHSAvcrg3OXSAAXJsbEC95UfVCumprsV09Jn07TVku5LDt@vger.kernel.org
X-Gm-Message-State: AOJu0YxFxL26Ok1lWojXBMd+WZUhBK8n0oW+7bv+LBvx3vNewat0aeEB
	ar++OjlfgPFtaBurdOzTTdHlTpJiJH8UzMcoUbA0ivehkQjiPYKRAXHhEeHxZsXfCl7FU7tfxm3
	q5OoiNLNlTxaJfFGdL0xC9E/QldhaPGA=
X-Gm-Gg: AeBDievQvoiWZoTwPX/hbwi+JXR7NV4wqDtErZbMTM3XgReZUF36xk+XtpmfvsV7Mh6
	6E74cDHh/wtooaKcVT/2YH6TZSUxo6hpTEtEtnSTYjJ1JU6EeMp1I1+tgpcgfPPIC050F68RsAI
	MnF6/wfmikSjNhL2QEDNVMAs83pvXXJNQsVt+5D8Ui+bgTyOwzi2iFhSaZ6Wvz4PCY5ta5sjAyR
	G1eMftxtsW3jZfDhFGbwjKp33CBuWKOVykLzfBRPaxjfOLYrlRtCxASPZWE62mmVOAQfoUAqUBj
	ghySssK1DVfa7p3WSPFXARZkDA==
X-Received: by 2002:a05:7022:48f:b0:130:ab97:9bd7 with SMTP id
 a92af1059eb24-131a6b0cfd0mr1930235c88.43.1778089433937; Wed, 06 May 2026
 10:43:53 -0700 (PDT)
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
In-Reply-To: <CAAMcf8AdoTsT33W4-HF8VKGDzo0j7nTKGY3f44DDsNCWo1ARZg@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 6 May 2026 19:43:42 +0200
X-Gm-Features: AVHnY4KI1dgwN9cGaD_Saj_rFpSrstLxrIhh1aM56hu77GspzsbcqQ58RiUceoU
Message-ID: <CAMhs-H-SM1uhoqQVLU+gmM+ZEYGv=dS8-x-1QJ9kND0dc-JAAQ@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Vicente Bergas <vicencb@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 462E04DEF64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36317-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,openwrt.org:email]

Hi Vicente,

On Tue, May 5, 2026 at 11:36=E2=80=AFPM Vicente Bergas <vicencb@gmail.com> =
wrote:
>
> On Tue, May 5, 2026 at 5:05=E2=80=AFPM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Hi,
> >
> > On Tue, May 5, 2026 at 4:21=E2=80=AFPM Thomas Gleixner <tglx@kernel.org=
> wrote:
> > >
> > > On Tue, May 05 2026 at 14:01, Linus Walleij wrote:
> > > > On Sat, May 2, 2026 at 11:52=E2=80=AFPM Vicente Bergas <vicencb@gma=
il.com> wrote:
> > > >> As a way to prove that this is indeed the problem,
> > > >> the following workaround makes it work.
> > > >> It just inverts the sorting order of all matches,
> > > >> so it picks Bank0 instead of Bank2.
> > > >
> > > > That's a tricksy bug, I can't exactly see where the issue
> > > > is.
> > > >
> > > > I think to solve this you might need to allocate an external
> > > > irqdomain that deal with the three different gpiochip
> > > > instances when translating the irqs.
> > >
> > > struct gpio_chip has this:
> > >
> > >         /**
> > >          * @of_node_instance_match:
> > >          *
> > >          * Determine if a chip is the right instance. Must be impleme=
nted by
> > >          * any driver using more than one gpio_chip per device tree n=
ode.
> > >          * Returns true if gc is the instance indicated by i (which i=
s the
> > >          * first cell in the phandles for GPIO lines and gpio-ranges)=
.
> > >          */
> > >         bool (*of_node_instance_match)(struct gpio_chip *gc, unsigned=
 int i);
> > >
> > > That driver falls in the category and lacks that callback, no?
> > >
> > > Thanks,
> > >
> > >         tglx
> >
> > The IP core used inside these SoCs has 3 banks of 32 GPIOs each but
> > there is only one device tree node because the registers of all the
> > banks are interwoven inside one single IO range. Thus, the driver
> > internally sets up a gpio controller instance per bank. The driver
> > lacks of_node_instance_match callback but I am not sure if it needs to
> > be implemented in this particular case since the driver is using
> > of_xlate callback for this.
> >
> > Thanks,
> >     Sergio Paracuellos
>
> Hi all,
> just tested with the suggested `of_node_instance_match` by applying
> those changes:
>
> ```
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -1,3 +1,5 @@
> +#define DEBUG  1
> +
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (C) 2009-2011 Gabor Juhos <juhosg@openwrt.org>
> @@ -206,6 +208,18 @@
>      return gpio % MTK_BANK_WIDTH;
>  }
>
> +static bool mediatek_gpio_node_instance_match(struct gpio_chip *chip,
> unsigned int i)
> +{
> +    struct mtk_gc *rg =3D to_mediatek_gpio(chip);
> +
> +    struct mtk_gc *rg0 =3D rg - rg->bank;
> +    struct mtk *mtk =3D container_of(rg0, struct mtk, gc_map[0]);
> +    dev_dbg(mtk->dev, "%u <=3D> %d\n", i, rg->bank);
> +    dump_stack();
> +
> +    return i =3D=3D rg->bank;
> +}
> +
>  static const struct irq_chip mt7621_irq_chip =3D {
>      .name        =3D "mt7621-gpio",
>      .irq_mask_ack    =3D mediatek_gpio_irq_mask,
> @@ -253,6 +267,7 @@
>
>      rg->chip.gc.of_gpio_n_cells =3D 2;
>      rg->chip.gc.of_xlate =3D mediatek_gpio_xlate;
> +    rg->chip.gc.of_node_instance_match =3D mediatek_gpio_node_instance_m=
atch;
>      rg->chip.gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
>                      dev_name(dev), bank);
>      if (!rg->chip.gc.label)
> ```
>
> It turns out that the `mediatek_gpio_node_instance_match` function is
> never called.
>
> Regards,
>   Vicente.

We are using two cells and mediatek_gpio_xlate() callback for this.
IIUC, you would need 3 cells to get this
mediatek_gpio_node_instance_match() called and probably get rid of
mediatek_gpio_xlate() but I have never used of_node_instance_match()
callback so I can be totally wrong.

Best regards,
    Sergio Paracuellos

