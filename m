Return-Path: <linux-gpio+bounces-37350-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJQpKoY2EGoaVAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37350-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:57:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C71B85B293C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 12:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6AC7303B086
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C45D3C98B3;
	Fri, 22 May 2026 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vq9xH96d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FA73C9EF6
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445845; cv=pass; b=PGPdH4s7HSqshiwm81OPt+fUOJFg4yyD+tA2Ot/LTbpp6H+ncym9A2oz/NYNNsGOIHczaTtebPgRGXIP/bqW7AeBOTLJSZmXb8x/IUTSL5EGqy5QUCMFT7T2v3Sf+dYKJow++xgU8xPQxhgjSAcZ/JawxzByPPXCOAxJ/voiAR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445845; c=relaxed/simple;
	bh=K4tbwSbezRfyYr3N4nDa1RB1cSu0UMrrrTf4zcMz2J0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ww6lGdNpDYElUjocVsUROu6LRMmcLyxStVXuurd1+Hvqp8wuRB2foGLIQNbhTGD3fHPG3MTz1ognSVIQxdWs9kRn5vLeWVXs8fdKWt8BCCRb6xjUK0GQW2+WF5uuGgDhl4c9kIOjUMOG4BQm4/e4Sl5BCQ5tcrKeK2R0Q1oRdi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vq9xH96d; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-444826c16ffso6365541f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 03:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779445841; cv=none;
        d=google.com; s=arc-20240605;
        b=J/2uZfnkwv5UFm3vhSj12zuvP7iVnLUMOfBEMdojy5zuRogVha8CEufiHHg+WyMqQo
         Y2SjOAEkbkxxxcpgWihye7GYmbS00d1X7U7n0oP2yfaVTqnPOyffEWH3MNCZYP5u8eUb
         4LeqynmVKVDDyWwinBthcfqNXCoalF1LtHmeTT30PJKT7ItubnUbxGcUdeFK1RlCqskh
         U5abf0mgRuIlmmp84KrEo9t717jpupc85ZzIcM2EdlJvOH3NrmRHyE04dmxcPsx2px0+
         hcI2oXgfLxu98fmTlPgQj7Ri/brKTIFYQF6aqiNUFOLy/VqnI9tZ9feozt+PXoderWKY
         Ijeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fuLZLVypG+ddNF7DwTGC3CQ667NPf/CW9RzkmWOYs8E=;
        fh=ryAwY0C1k5g+i5/WJMlm/9aAYq4bhIwFHZgnYB9CRLU=;
        b=dATOw23D8X6O8Neg+cQcH7cqOpHQaKkmyHuVWo/c4miia/Y41KylhN/XkDXquOQpUD
         Xuz1S3FeucleES7XGNAr/pek6bH0y17JovQ9NqrAChSC5S5MI5jIchCpPp9tBBFAnVqu
         cdMpDd1GzxzO6hHHzyeDpwDl5tXXJAxbH1wlLOw9J5ufwC+e5Dm0i6lmDZ0fxR4X9BeC
         QDDP+THp5inyBtUQHGXIvTYa7kgOEo7OeDicut3IvRxQj6/D+bwh0a4uJzruW/rgdqyM
         HdNFR5FAmHkHTxaWbZ+I2WdJFjYeNGozql4PhSxaDZkXVVieEMiVSl929a1WAnqy2pi9
         0xtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779445841; x=1780050641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuLZLVypG+ddNF7DwTGC3CQ667NPf/CW9RzkmWOYs8E=;
        b=Vq9xH96ddkoIW7keT8lSAFlDjLWhXIj6swcqhnDl2XfvdZ/hhC+ZGQHjp1QRSDwLXs
         8kVx6MKnqJlQT8NrnWA4TebGYq8VTKhNljsn881nd6FZ1QZ7Dw8Q+6ckzoRz/8ttz7mz
         30vLGcd41QDZEZFr6jXAqcBKzzMZ/bbYarljJgavZAovep7OhboPt3NU7VKY6UuO3aok
         dSNim6meGannf9U7FdzKYxlN0zVy6FXs9pz6Wo8+2+Dlu1EoLTWr/Kp9O5pp3LySy6ax
         giRZ1Nt7LmGH2tWw6LA9sAgFZ9US0wSkYt6U0My11a+NEQPitsSyOaFaLQ/70pt0eSj4
         9fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779445841; x=1780050641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuLZLVypG+ddNF7DwTGC3CQ667NPf/CW9RzkmWOYs8E=;
        b=D/oeEZPHKJguM9ES7hlnkKBXvK64z9Z+cdw2bI4SYRWnaF6ysDjT8DqkJB/N8pv7m5
         SFWZ4wO7307XLe7jphto0PYpVYqB7kFDzOUIHyXqPPXzD/oTMIN754x5OJLsn/4izl2V
         lxoHF2L1rqcO4EaK3vOPEDBSMgOhTy9+WOTJ31PywrNnk8dlfmnwFP8fO1RYW9X1Zt8x
         rwo1cB/FLgriKRh79UonweQPMubC4vpS7Ly7a8DBidQMwWr6lc6A4ab0qAAt3G5xdGbM
         kflBXZCc72bgV4QFMQYCnjTTpb2NCVPT8Cl2pZuzt48X6M43C8ejEMSi1yFLNGl3NX0+
         ++yA==
X-Forwarded-Encrypted: i=1; AFNElJ9qWweO68OcOVdtc3Y5WNY344yISSLKWb1Q51TRpeDa8ax9x2M9U/QsHrrl1nnnEoKpc+FFEraHN6D/@vger.kernel.org
X-Gm-Message-State: AOJu0YxWgk5vRKiRuBjF4ZC7JDBHIfpRRQYlbHau9Yadsr3lslZA1s5H
	c+b/O0PqPA8ZJZkltrgeV6JhwG3js+tEKGpGlobFtwzkkEN4YPF/PAmKbx5nJtz7UBYO88W+bzA
	M1YMCdU745Nxe2EdNvFO6TIyHiznJ81E=
X-Gm-Gg: Acq92OEqu/pIDGP/NShQ0uEZOLx6wLiUZZyDf/Z/ZB+VObgAcfy6Nes8l+XjAx9KhDI
	oJ7P0FPtY0khK+tmiA8DKLt8JR/ktJeLKtBbwNsGAdNc4Qi9rWfMidm8Qbo2lsrElEGZ8Am2Z8o
	DQ8jJ1kMYmLNuJkFLNXkM7SRIAOGdEglTsgMrU7Wx3EZWV6gzDtn++GWH5FOSiZ/mplwx7iiOGb
	79QmnT6JqVVJeFklJgGRV+X5kPlpSspyQe9pJmZRGaQGtW1zdwZUqL+dnP3sSWXYAJ6TAh9rVHC
	WMDGGZRe72qp/vfZp9B5e8PAefEKmhtKdWVnsyQ0ZD1VhY3wVS6yaOC/cm16PjlaXamWNA==
X-Received: by 2002:adf:e00b:0:10b0:43e:a70d:7622 with SMTP id
 ffacd0b85a97d-45eb38bafddmr3082407f8f.22.1779445841321; Fri, 22 May 2026
 03:30:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260513115312.1574367-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVcgJ=aG2p-9gx+gtUwM0xcFo+D0NEqBJnqOqSmBEM7ZA@mail.gmail.com>
In-Reply-To: <CAMuHMdVcgJ=aG2p-9gx+gtUwM0xcFo+D0NEqBJnqOqSmBEM7ZA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 22 May 2026 11:30:15 +0100
X-Gm-Features: AVHnY4LS5ywoMrlxo4hvZxmQoPwrCMDqlROtU2eHtPokP68EWcdOGsLnytqTqcc
Message-ID: <CA+V-a8sHUF6-sdnj310E7Ta=4kJO7oyTP-zoOTZ6ZZOybFhT6g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzt2h: Skip PFC mode configuration
 if already set
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37350-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,linux-m68k.org:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C71B85B293C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Fri, May 22, 2026 at 11:04=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 13 May 2026 at 13:53, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > In rzt2h_pinctrl_set_pfc_mode(), read the PMC and PFC registers upfront
> > and skip the pin function configuration if the pin is already in
> > peripheral mode with the desired function.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > @@ -188,8 +188,18 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2=
h_pinctrl *pctrl,
> >  {
> >         u64 reg64;
> >         u16 reg16;
> > +       u8 pmc;
> >
> >         guard(raw_spinlock_irqsave)(&pctrl->lock);
>
> Missing blank line.
Oops.

>
> > +       reg64 =3D rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> > +       pmc =3D (pctrl, port, PMC(port));
pmc =3D rzt2h_pinctrl_readb(pctrl, port, PMC(port));

> > +       /* Check if pin is already configured to the desired function *=
/
> > +       if (pmc & BIT(pin)) {
> > +               u8 current_func =3D field_get(PFC_PIN_MASK(pin), reg64)=
;
> > +
> > +               if (current_func =3D=3D func)
> > +                       return;
> > +       }
>
> I will shrink that to
>
>     if ((rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(pin)) &&
>         field_get(PFC_PIN_MASK(pin), reg64) =3D=3D func)
>             return;
>
> while applying.
>
Thanks for taking care of it.

Cheers,
Prabhakar

> >
> >         /* Set pin to 'Non-use (Hi-Z input protection)'  */
> >         reg16 =3D rzt2h_pinctrl_readw(pctrl, port, PM(port));
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-pinctrl for v7.2.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

