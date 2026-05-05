Return-Path: <linux-gpio+bounces-36244-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBH4KNhi+mm3OAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36244-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 23:36:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D514D3F36
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 23:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7BDFB300C270
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 21:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3F548BD42;
	Tue,  5 May 2026 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1+oytjc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2696C480978
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778016980; cv=pass; b=C91a1/qYtVcuSlk4AFrnkyrNaOxiKrBcmVrPbgcTiN5fj4sLIdR3OcpH2f+eiqQElxJ0D8e5bEoTV9RToy9+ZO17ylxUU1+S6rmOHSVYZQmcjEAnEQ/x7HWWfIZiz42mf+yaMxg9/pDac6cXC2b0KbWeytDiAb0WLo9OqkEVD8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778016980; c=relaxed/simple;
	bh=fW+zF7xNaTSfqWS8+IsQ070xX9BIC1V1qZPlKgcVtLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EcM3UNfOKb6RiQAtaKgA/akZh9kslBdpu/E82vxtHfv3dFnBd+cB5sSF3hEobYVc8bM7HSCBKs/ZkAAmJ4Zv0giva/16cdFjOlavY67y1Uf/mqHsktG3k1iafthmen/sJVqXdnbpdNv6+loKoko3oSYjXtCVLI2j8/0euTuyYvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1+oytjc; arc=pass smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-62f390b8df7so1698567137.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 14:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778016977; cv=none;
        d=google.com; s=arc-20240605;
        b=hwU3mNeb/HSzO2FEy5/wSxFFcCDFUbpwisrAC9y9HWqrnnO2FwmQNENFa2Oy+EXPeR
         ZrBjkPSM8HsAJiMMNZq2kl07gPiaezGUaOrHNAl/ElUiIqS1XCN3H+eLpNAEbtfXLILv
         uB0CcWuPb2gmk7QUyYT7VzXroi7tK2rI5foQb2LWLWIlYekPOnoZppKmYm1Vc1ZPTVZo
         5CoIIWRocBImoFVeEGsN5RIRyTDdWLrDudUMIS6elzDoz+VWfRsj/4Dj7Z2bLSto4FqB
         jGy7AmPVzNC/CgBzXPQOHK9tyZ/RuAaPoCEhgrBJJBGy9/vCpvPVMxbjGSo5PwDVlkbR
         YmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77VLf7Pi16YNHcoam3ES9v/dTnHFhf5j8AGZNd1SMIk=;
        fh=lPuxiO8tdXxJMTuByjVR3uWTNBFhgMzHMSL3ET5ImFY=;
        b=UOeynAr63gxoBl2MSmGLOAeuE0IGQyceEvzNRn4QONmJRtkmk9lPvbwEa066WL9br7
         LYns7LDtUw41RjeZqj97rwZKSRg0U22WSlmYAdDxu/8WfExyEfuMfm1xDnoJ3as5NpjB
         0BksStnzK7faw8EDLlp0ytrLrHpTyen16KwsdyEmSB3dcdvrrRZGrJLcpQPzZB5LjbsI
         GjexXsCCpB05zOuLP0WPBjlKxPjXdrc/RLgQbWlDX350KK9+l9GOVAUUyJqgFsHqDaz5
         by0nf6XKtuqbLc1vqmpk/UUJRByYsFXZFUUmi+VskB14GUxYuW86RsGURrcuTv6NQAbE
         7dBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778016977; x=1778621777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77VLf7Pi16YNHcoam3ES9v/dTnHFhf5j8AGZNd1SMIk=;
        b=b1+oytjcP4kMZ62sSQfmW8cxLuphTDI6MyakbIs3gbl4NUZJ2oUNt04/7oBDkUor1z
         AOdApLsJlGI11m19Hvp2LpA2iGr0wHNlF1rwrKwNqhrDaw4tedrArYKuYK++ElaA6j8p
         ItHOOtvDjgMRPmRygKMJpq5hXArdiD3NBerA7hrwpvD/dsxG2k9vMc094Qqaht3vjQdc
         mSME7Ng2Vjcbx1uKQXKO8x8dQ+9maP7f5AvCs16RtpSYwTMrq9PSPfhYTU7b55GtbRfu
         bmoBtoG/FlHNNPr/K491TcZPm+NF8ok6wmdcSkYhrx/ZpTLUC60E2X9WAW8a8QAW/DLv
         Txxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778016977; x=1778621777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=77VLf7Pi16YNHcoam3ES9v/dTnHFhf5j8AGZNd1SMIk=;
        b=LlYkm9GfKu5yaQzsNESXHhMMWG2m9k3fnkMCu+H4G8MPHWjMtJR8MP1mU48A6wyUvQ
         hzmSs1afG9/7UltrvF5q4beeQu8NuG+F603uDQlLScSi7TbVTPjDAQOa8/exolXJGE1j
         dOjZAiT384ORvHx7GZU3WwSTqC5XgzxPpv/2NAB5/m/laVlBrfQtroYJFx4Movaf/Wdi
         gWypXFyTeuBczTqzJ5Fol8vyJJv2SRYklbn2VjKZ+nUKFni/dVSV30rJXhMVQyk83ROV
         i5qmXFBesWXc3bpgLvg40zg5IEczPtq5ae1V5s33mcSUkpCa1GbtTRMjrW7M/a7FXXA3
         7otQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Ak+sNAe9v3LZsASCPkaOQz6V+XoiKmwf3AK6onslYVPOgk+JHDjsUSgjPnSmEyCOTkVhJaQcj0X/i@vger.kernel.org
X-Gm-Message-State: AOJu0YyZtSXZJqK7XFlKxEP5C46/4kka5OU6q568WnA2ybGAaWwFjrty
	nJKz8wwY+DBcxKJgTdpVBGNb7Ja1j9xznR1jjsBH2/cIdCFRpLRdKnOgUg99vCs1ChcBRTNLXi5
	XANT0J3TsLcZPV2vYtKbjSpdlOipQb18=
X-Gm-Gg: AeBDievTz9IZgg+LI3hbF+rIrJ5X1Yjy1rQ2GGGUNxI3GZGzxmrHZ3epMJqLyhuY1bH
	ly8Pj028LezcVbSvUtyRIi4CFU4UmP/gR+nXVIBWVEjJ4hxt0wGx2YitCfZT9aUlCswvehXgBw2
	oarvc9pqQIjhseovz8+dJy8oi/Z3y1Hq33TWcoA3jzYWECqFXz9Y+b00s6yZ90Mhxd2Wk9azxDU
	3InZHIaW0blvRU+nQcSwAjxUuMSXnAFz2PRwyIhXcdWHtc5OMjLrSkz8OTjf3SfOLfQMoDAT7o/
	QAC4b3bxLyRH3tyxxP+7PHMhBwd7WcgHXIQseazKnLbRuGib
X-Received: by 2002:a05:6102:ccb:b0:62f:5075:4336 with SMTP id
 ada2fe7eead31-630f8eeff8fmr295776137.11.1778016977057; Tue, 05 May 2026
 14:36:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAMcf8C_A9dJ_v4QRKtb9eGNOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com>
 <CAD++jLn9DpaknOm3S9ZUOY6Jyo=SuhVSv-vzNaw=S1uuOeYoRg@mail.gmail.com>
 <87lddyx7gg.ffs@tglx> <CAMhs-H_FnFGg1LDM2UWCUWC423udcm0dKOaDYJxMae2JdQh5wg@mail.gmail.com>
In-Reply-To: <CAMhs-H_FnFGg1LDM2UWCUWC423udcm0dKOaDYJxMae2JdQh5wg@mail.gmail.com>
From: Vicente Bergas <vicencb@gmail.com>
Date: Tue, 5 May 2026 23:36:05 +0200
X-Gm-Features: AVHnY4LUUpNUM4mCMdHYLCUCcpVMWsGc0OrDsi0JA8Y-KsAtQJyK0tqS1vhztKA
Message-ID: <CAAMcf8AdoTsT33W4-HF8VKGDzo0j7nTKGY3f44DDsNCWo1ARZg@mail.gmail.com>
Subject: Re: gpio-mt7621 unroutable IRQs to bank0
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 38D514D3F36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-36244-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vicencb@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, May 5, 2026 at 5:05=E2=80=AFPM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> Hi,
>
> On Tue, May 5, 2026 at 4:21=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> =
wrote:
> >
> > On Tue, May 05 2026 at 14:01, Linus Walleij wrote:
> > > On Sat, May 2, 2026 at 11:52=E2=80=AFPM Vicente Bergas <vicencb@gmail=
.com> wrote:
> > >> As a way to prove that this is indeed the problem,
> > >> the following workaround makes it work.
> > >> It just inverts the sorting order of all matches,
> > >> so it picks Bank0 instead of Bank2.
> > >
> > > That's a tricksy bug, I can't exactly see where the issue
> > > is.
> > >
> > > I think to solve this you might need to allocate an external
> > > irqdomain that deal with the three different gpiochip
> > > instances when translating the irqs.
> >
> > struct gpio_chip has this:
> >
> >         /**
> >          * @of_node_instance_match:
> >          *
> >          * Determine if a chip is the right instance. Must be implement=
ed by
> >          * any driver using more than one gpio_chip per device tree nod=
e.
> >          * Returns true if gc is the instance indicated by i (which is =
the
> >          * first cell in the phandles for GPIO lines and gpio-ranges).
> >          */
> >         bool (*of_node_instance_match)(struct gpio_chip *gc, unsigned i=
nt i);
> >
> > That driver falls in the category and lacks that callback, no?
> >
> > Thanks,
> >
> >         tglx
>
> The IP core used inside these SoCs has 3 banks of 32 GPIOs each but
> there is only one device tree node because the registers of all the
> banks are interwoven inside one single IO range. Thus, the driver
> internally sets up a gpio controller instance per bank. The driver
> lacks of_node_instance_match callback but I am not sure if it needs to
> be implemented in this particular case since the driver is using
> of_xlate callback for this.
>
> Thanks,
>     Sergio Paracuellos

Hi all,
just tested with the suggested `of_node_instance_match` by applying
those changes:

```
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -1,3 +1,5 @@
+#define DEBUG  1
+
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2009-2011 Gabor Juhos <juhosg@openwrt.org>
@@ -206,6 +208,18 @@
     return gpio % MTK_BANK_WIDTH;
 }

+static bool mediatek_gpio_node_instance_match(struct gpio_chip *chip,
unsigned int i)
+{
+    struct mtk_gc *rg =3D to_mediatek_gpio(chip);
+
+    struct mtk_gc *rg0 =3D rg - rg->bank;
+    struct mtk *mtk =3D container_of(rg0, struct mtk, gc_map[0]);
+    dev_dbg(mtk->dev, "%u <=3D> %d\n", i, rg->bank);
+    dump_stack();
+
+    return i =3D=3D rg->bank;
+}
+
 static const struct irq_chip mt7621_irq_chip =3D {
     .name        =3D "mt7621-gpio",
     .irq_mask_ack    =3D mediatek_gpio_irq_mask,
@@ -253,6 +267,7 @@

     rg->chip.gc.of_gpio_n_cells =3D 2;
     rg->chip.gc.of_xlate =3D mediatek_gpio_xlate;
+    rg->chip.gc.of_node_instance_match =3D mediatek_gpio_node_instance_mat=
ch;
     rg->chip.gc.label =3D devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
                     dev_name(dev), bank);
     if (!rg->chip.gc.label)
```

It turns out that the `mediatek_gpio_node_instance_match` function is
never called.

Regards,
  Vicente.

