Return-Path: <linux-gpio+bounces-38142-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +BNxFCaFJ2r/yQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38142-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 05:14:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F5165C00F
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 05:14:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HPBx+7gZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38142-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38142-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC8BB30207F9
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 03:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5033655CF;
	Tue,  9 Jun 2026 03:14:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A0F2D8DD6
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 03:14:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780974878; cv=pass; b=A+bmfcV/mHqQBPnbulPod002YhE5KJtDbfwsDY6eTFix407pmUCMiRJB2M6Y/UVW2/snCugdANBrSoKWp8AYcbmjS23NPtVgLbApxxE2I8aSu8sd1ZHuepmySCd7xWVWCiy+BaXxfUhaxOpnXXH3C9Kwd4CgktO8CzemhxXanbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780974878; c=relaxed/simple;
	bh=lje1YIclk3+IMPd0DI44vsnXdHKr7QHAX2cjSXpDkSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLvvAM6k7O42vXFThCU6kEzeyf9CUqCC8HrGB6KGz4qoS6l0Q1PlXQB2L2s//9ryj6yaHNR2ggfu2r0NXFLRNmOcMaL/CpT2+ShhrnxApOT1k+agF+yejdtFfh0S1CsGSXby8Ga6dvaIPQLky3IURqyRskDQXNgM637Z6mrdBlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPBx+7gZ; arc=pass smtp.client-ip=74.125.82.43
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-138129a622dso1812530c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 20:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780974875; cv=none;
        d=google.com; s=arc-20240605;
        b=VlWRbDOO2HFQ7atszgrdn2LgYtUC+Uo1mK88rBHZNHbRjZWqo8hePXF4OUtoxMXkup
         7s80GeMsir8c5nzOwb8WQdEnpvEh08TYTOPnw2bhtKltQf9if4HuD9Oszp6pqMObU/ni
         2XSCFRhn/S12yrItCL8bQHKTIWq1lG6k0m6MZeGLw9a806ejmHZ94Pd9xK8UmwYbKpBR
         XmEjfopYverlu574/FM/dh2NxM+95j1I2r25uWA6QyMRV8F9UzNjMh6oaPwyj27TZhjv
         lYSe7+uTAuPTIb3zRBWz8rCNhUW7bvdLugbi8K/zRQUXe83gM58WJPYbuS4fbBxw84kk
         9G+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lv+20if9o9MgQfEuTCL3yF5zArt4HnnwauziM8mMW84=;
        fh=RgssfKg2F6dfDAlYhwemottYY1QrJJj8gZPub0fxPC4=;
        b=J91RSMktm+Wb9Sf6rFdhLsF4ma1eaayCqVNz/b5lUSuMPcTJK6M6RGI2mhZVJP3f1e
         XAxpX/2f5t4iPSk7dgz072tCgh0qf4cIMDk6NYFoJ/lvtTlsRE6o79wFAkeccqGGQiFn
         IQELykVpaIpizxAphF/w2sHFsZIYq5tfnR+B23CjW7+t2P18qwFV8F7rZej/hcS19gZq
         5VCbjt6BbZNloeaR3ICyep/01/aajWpPLMX6R5vO9VgQ56chixeKDRBv9XCBe7mI7Oxn
         mRrmSznJwcPm/6bOFYcL9NGYPQ2m7o9HQkFoMcv4awgp+87d/AGbt4zORrYWG107gMOU
         xftQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780974875; x=1781579675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv+20if9o9MgQfEuTCL3yF5zArt4HnnwauziM8mMW84=;
        b=HPBx+7gZeKbKt/rVP8mCUICGhQNGfMG9HCPvk2IjG3xxU+q3X8Qcq+TwhtDXb7Mfvo
         D2PQEhC8DbWMvRhiOrU+pPiWiIAFRATLmH2n5jOLqRS7jU6PlTiGxANC7TZSwikJYMMC
         dhJ0mmLhIhbbeyo+S1aKRNHLtF1HhdI1mS+SpU8amLwu56W3b7ymWXyt9+8rEWYxvX/E
         blgaUN+fdYMAAQwkr96rTqvS5iXK3JTJ8wOxY1+sxto8nRKgdjfPx5fZENZOqZocLsCE
         VRHIStM7/TNUG3E6oOYjpwFhEbzuYXSrDvDef/S/9FG4feu0J3Z67frqlymMWQLun6yP
         yOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780974875; x=1781579675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lv+20if9o9MgQfEuTCL3yF5zArt4HnnwauziM8mMW84=;
        b=kwSLGR9QUT+1tItD0mlyUdZ+6QnA7RIXDN26pKyjByKiXmrLujdONPaGfwd5N+Q1WH
         J0NdG/FUyCz/QWv7GWnCiovmq/hXIsM1Ne+PegCiAnnoKK659xZJ+zYDuTF07Wg2Yufc
         Co1qA4ETelNe5L0zFSzBnaNyvXpJCjf2fAXJpOuKMXFgK+D2+FfgQ7o0qnn3S0AI+bq7
         rI8B9i6EmNEdma/5JQBqPD0CTOAAtkrfveZmy6e+LMjTeBQ024cTAQAjA65DFlkBeiOz
         VLmhXIWaf4VFUMWd1d4ctgTkXAV6HUcgbVxhwnnPndkypv57IELB1c4K5DlhBLrlBGJB
         8RZA==
X-Forwarded-Encrypted: i=1; AFNElJ+RcOteCq8hha9VP6BHzQG5VqF7Mg0FxzyYEfa5qORvFNOXKIf/n2tB3RPxfO3noLKCWeuULI+iGTmI@vger.kernel.org
X-Gm-Message-State: AOJu0YzDnAukARuIrN4vWz9/vV0VD48VeTiGcKEvAEm6TDMkuxqQuuYM
	WOBv0GmXf4qO81zoDs2ZYmWMpWiUfuFmZ9lykzjNZRAs+AeCjVplP67Q/Adrei9ujEXsVLcOGeZ
	dY/DIf4TbCRLFdObQ0yHIQO4vhiNmttE=
X-Gm-Gg: Acq92OF+l55LFwy63UhrkFu83xJ1iK9YRaiJnkPYM0QxE0glxHdZL5uRCJiTw5WiQFp
	VIjz0Tam/KpNWn0iBMcRJBiN8TBbdATSaHTkIFxTcoVFGCpsZIF6XlutqGKEDsrytLc2CK5Kyof
	erImc3ICxdHvBK5P/go2NyV+W/biefriZzAvZ8pqmxbkyv3EqhLCOiis+FU69WPFLTLxHC9FqHc
	FXLoCfezz9bNr29SUzHlD0+zDUnrsDH557tF4nfyWX8k7/mkzVruWL1dRR2C/aAUsOtddHi7Jv6
	27ruCPvPt+QEF8k=
X-Received: by 2002:a05:7022:1284:b0:138:1987:7d8d with SMTP id
 a92af1059eb24-13831b9d2a0mr564458c88.18.1780974875155; Mon, 08 Jun 2026
 20:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602142513.2203598-1-sergio.paracuellos@gmail.com>
 <CAMRc=McWvPhKHKYe7SE85eMj5v-tabHyeNrhYXX1u-jph8usCw@mail.gmail.com>
 <CAMhs-H-TXyHCnojKATBzRoU106PW=_tdgag2m3weqmMphbRnSw@mail.gmail.com>
 <CAMRc=MdeyVNd9CZQid99sHoXQiGD=y9USCkUjMT=Sy3nERpAiw@mail.gmail.com>
 <CAMhs-H-dnR7KjOZYv+rSt=n4MwPd5O1g9kfoP99uA7TQASf0WQ@mail.gmail.com> <CAAMcf8CUyF6gr2V0GvwOnm9wE95vu6TQLaoG045xvT=jx5MSiQ@mail.gmail.com>
In-Reply-To: <CAAMcf8CUyF6gr2V0GvwOnm9wE95vu6TQLaoG045xvT=jx5MSiQ@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 9 Jun 2026 05:14:21 +0200
X-Gm-Features: AVVi8CdYG8qmZnPK7b3OLfBbLLIEnfwVZJLxK3-JsyFvSiS47Bmle8ECniYkc-E
Message-ID: <CAMhs-H8QLcdbUQOd=1qUq-PxosoKP3BGHU3ybyxYeiyeDDMo_w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Vicente Bergas <vicencb@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linusw@kernel.org, tglx@kernel.org, 
	grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:vicencb@gmail.com,m:brgl@kernel.org,m:linusw@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38142-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergioparacuellos@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8F5165C00F

On Mon, Jun 8, 2026 at 9:22=E2=80=AFPM Vicente Bergas <vicencb@gmail.com> w=
rote:
>
> On Mon, Jun 8, 2026 at 4:27=E2=80=AFPM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > On Mon, Jun 8, 2026 at 4:02=E2=80=AFPM Bartosz Golaszewski <brgl@kernel=
.org> wrote:
> > >
> > > On Mon, 8 Jun 2026 11:40:57 +0200, Sergio Paracuellos
> > > <sergio.paracuellos@gmail.com> said:
> > > > Hi,
> > > >
> > > > On Mon, Jun 8, 2026 at 11:05=E2=80=AFAM Bartosz Golaszewski <brgl@k=
ernel.org> wrote:
> > > >>
> > > >> On Tue, 2 Jun 2026 16:25:13 +0200, Sergio Paracuellos
> > > >> <sergio.paracuellos@gmail.com> said:
> > > >> > The GPIO controller's registers are organized as sets of eight 3=
2-bit
> > > >> > registers with each set controlling a bank of up to 32 pins. A s=
ingle
> > > >> > interrupt is shared for all of the banks handled by the controll=
er.
> > > >> > The driver implements this using three gpio chip instances every=
 one
> > > >> > with its own irq chip. Every single pin can generate interrupts =
having
> > > >> > a total of 96 possible interrupts here. It looks like there is a=
 problem
> > > >> > with interrupts being properly mapped to the gpio bank using thi=
s solution.
> > > >> > This problem report is in the following lore's link [0].
> > > >> >
> > > >> > Device tree is using two cells for this, so only the interrupt p=
in and the
> > > >> > interrupt type are described there. Changing to have three cells=
 to setup
> > > >> > also the bank and implement 'of_node_instance_match()' would als=
o work but
> > > >> > this would be an ABI breakage and also a bit incoherent since gp=
ios itself
> > > >> > are also using two cells and properly mapped in desired bank usi=
ng through
> > > >> > its pin number on 'of_xlate()'.
> > > >> >
> > > >> > That said, register a linear IRQ domain of the total of 96 inter=
rupts shared
> > > >> > with the three gpio chip instances so the bank and the interrupt=
 is properly
> > > >> > decoded and devices using gpio IRQs properly work.
> > > >> >
> > > >> > [0]: https://lore.kernel.org/linux-gpio/CAAMcf8C_A9dJ_v4QRKtb9eG=
NOpJ7BZNOGsFP4i2WFOZxOVBPnQ@mail.gmail.com/T/#u
> > > >> >
> > > >> > Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> > > >> > Co-developed-by: Vicente Bergas <vicencb@gmail.com>
> > > >> > Signed-off-by: Vicente Bergas <vicencb@gmail.com>
> > > >> > Tested-by: Vicente Bergas <vicencb@gmail.com>
> > > >> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > >> > ---
> > > >>
> > > >> Hi!
> > > >>
> > > >> Can you look at the sashiko review? Especially the bit about track=
ing the
> > > >> GPIOD_FLAG_IRQ_IS_ENABLED flag looks correct.
> > > >
> > > > I got rid of those two calls (gpiochip_enable_irq() and
> > > > gpiochip_disable_irq()) because the driver "gpio-brcmstb" which is =
the
> > > > one I based my changes on was not used them at all. We have not fou=
nd
> > > > anything weird related with that on testing. I do believe that sinc=
e
> > > > we are using our own callbacks for 'irq_request_resources()' and
> > > > 'irq_release_resources()' we are safe here. Regarding the others I =
am
> > > > not sure, but the introduction of the remove stuff for the irq doma=
in
> > > > is because there are no devm_* functions for that. Other resources =
in
> > > > driver are using devm versions so I think the changes are ok as the=
y
> > > > are...
> > > >
> > >
> > > It's about GPIO core: a GPIO that appears as "free" (users can reques=
t it) but
> > > was earlier enabled for interrupts cannot be requested in output mode=
 - only
> > > input works. Without this flag set, gpiod_direction_output_nonotify()=
 will allow
> > > you to set direction to output.
> >
> > I see. I need Vicente to re-test without removing
> > gpiochip_enable_irq() and gpiochip_disable_irq() to see if everything
> > is still ok.
> >
> > Vicente, would you mind to test the following change on top of this v2 =
PATCH?
> >
> > diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> > index c36aa0abd0c6..a814885ccd5d 100644
> > --- a/drivers/gpio/gpio-mt7621.c
> > +++ b/drivers/gpio/gpio-mt7621.c
> > @@ -144,6 +144,8 @@ mediatek_gpio_irq_unmask(struct irq_data *d)
> >         u32 mask =3D mt7621_gpio_hwirq_to_offset(d->hwirq, rg);
> >         u32 rise, fall, high, low;
> >
> > +       gpiochip_enable_irq(gc, mask);
> > +
> >         guard(gpio_generic_lock_irqsave)(&rg->chip);
> >
> >         rise =3D mtk_gpio_r32(rg, GPIO_REG_REDGE);
> > @@ -174,6 +176,8 @@ mediatek_gpio_irq_mask(struct irq_data *d)
> >                 mtk_gpio_w32(rg, GPIO_REG_HLVL, high & ~BIT(mask));
> >                 mtk_gpio_w32(rg, GPIO_REG_LLVL, low & ~BIT(mask));
> >         }
> > +
> > +       gpiochip_disable_irq(gc, mask);
> >  }
> >
> > Thanks,
> >     Sergio Paracuellos
>
> Hi Sergio, test successful.
> I tested the buttons and touch and it still works.
> I did _not_ test if the irqs are disallowed to be used as gpios in output=
 mode.

Thanks for testing, Vicente. I already sent v3 with these changes included:=
 [0]

Best regards,
    Sergio Paracuellos

[0]: https://lore.kernel.org/linux-gpio/20260609031118.2275735-1-sergio.par=
acuellos@gmail.com/T/#u

