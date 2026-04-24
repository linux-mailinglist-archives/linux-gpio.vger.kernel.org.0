Return-Path: <linux-gpio+bounces-35469-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMwBIWEq62keJgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35469-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:31:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9845B81F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F2A53003D00
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D96C30DD1F;
	Fri, 24 Apr 2026 08:31:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7F92566E9
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019484; cv=none; b=E3v//XqEfB0kw/7OTdVNL3mdDZu34VALpNcy6NRy+7mssNdNZLoV2hTNEexFN6KKf5coM95Ijt0y15kdg0DWSbukrxVpTHRIczMKmZa+gX2dZR/s55sosKIk3WL78oHTb5IhowTVF4JY42yhTmaYV8/WwJ8ngLO5C3L6en4M02M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019484; c=relaxed/simple;
	bh=ILFx3eaUBJfF3eL9HOmoK0/QMkKUrULhH8Bb5QOooLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aGmWqAlhXTEB3zwtBn/oj5oUsChKkBCyqnBae7XBZDVVqtKJlLYLAxhpS/rDvlcNGFrfXlOFmDrYk8EvxNMpnhHXcDVCnr8wOJnsSJkm8QRdSLZQEkH3Q3WxgmLx/XuBYXr5+JjlnpOmH3hZuSuAeAFwhAtlw5QsuTxr+CrUn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-60579e72ff9so5167900137.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 01:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019482; x=1777624282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aY5lS/bisA7h6KyUeoSyE2LUbPNw5scSAX1hdqhvzS0=;
        b=STZsF3TfbySWoIb5+ARNHXo5LDCBci9MyEyrwwWCtToa7NC0aygbKitnDVNy/4Tz4X
         4GiMpDb9ZLFsxJ/lH6Wm+oe+8AVAK8SXs1KfjJym12kZ+FnWgSa1zYnQGa63WFWkDjem
         AubRC+I5EggC51c/ZkAfX5x+HqpA9c4oM+HfuvvPHbK627tMBr6l2qqAJu+C0K4uZ7C5
         fe1eSKc6yArLNF9A/EUx24ywg3zMl17+Syuj3e3bWo4cZutCo2NseXEZ5iSEr0SwMUwo
         Sve1BxyUc4sfbDtCVrxaYHCMOiZzKBADD9twN2Pkiks+ezl56bogXR6hmDfzJc6kYW5B
         j/Ww==
X-Forwarded-Encrypted: i=1; AFNElJ8iakhZwCiQsLz4c+SwVt7LjBzHka/w/8CbKKtPvbVqRTzcIzLYygS99jyZEcFGgt06iBlCnKujbeMp@vger.kernel.org
X-Gm-Message-State: AOJu0YyD5XcIBYo+RmEc3zX9Wjdmd5nfOXNrpw7hQhyhUE6iwwTdKwKe
	C3JokLeosslVR+liWhrU0A72FzQmd+hirK01HMGQ9dzuxKNOf2jZOoplfS1mTTgrLBs=
X-Gm-Gg: AeBDievmAgZAi2FfujMmBgjpd67cnuECwFyEYenP6b8Ywk5YIDrxUyqjS+J01FdZcw7
	OZAiWniAX4/SOtUhuDhpAjv8pKzlP5vN/5Jf5t/UhnXVFqYlw9fPi1bZSS3+DimhlZohUVKzQ9l
	GIQv74uyVsHHbZhycLJrDddyeQn7rxFu5+14jnWltqoj13Syj61iycky+lsfVv9xNszCJHoEv6v
	cf5BJflfoJRvaI55wHSMJlDMt5AQdd/Ny7OMw8sSWgaNfqn39X8MwQnIg2ZRC1Qzn31xWIy8cHo
	JwBoiOU1PixUepZfhOrSYYBYUpb5EOD38Rf+wUavumtEgmr9EoXngY+dcXM/j1wE1dWtX0SdLdb
	0ooRKnJxAiu4Rv2N9XWC0JZRHQ/FYP4d1Nx39BUaMl2lOjICF6OsgsEE+llI0isTY/Gl3oPDtrg
	UQyO3GqYL2hdQdeELedkRPiGy7X/Cl8uZTZStSA+Iog75bN4euShjaPZLyL/Zkb2cq4wHeLsA=
X-Received: by 2002:a05:6102:5f07:b0:600:3b3e:681a with SMTP id ada2fe7eead31-616fd91b18cmr11074692137.14.1777019481787;
        Fri, 24 Apr 2026 01:31:21 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589098226dsm10506114241.5.2026.04.24.01.31.21
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 01:31:21 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6058a955e04so4811017137.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 01:31:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9AqrR1dWEa6eRx48U5ZlDu7qOmHF1/MQdlQAJ+ZpeUoSgvrCtWlJtUgUbPBdonZphHtuwm/b8MTUxY@vger.kernel.org
X-Received: by 2002:a05:6102:5a93:b0:602:8742:1fa with SMTP id
 ada2fe7eead31-616fc3bb2f8mr11805656137.9.1777019481290; Fri, 24 Apr 2026
 01:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
 <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com> <CA+V-a8suj-QZ57uzUfDscZBbEGBbeJxeiC-ozLt0hBE_pLnG+w@mail.gmail.com>
In-Reply-To: <CA+V-a8suj-QZ57uzUfDscZBbEGBbeJxeiC-ozLt0hBE_pLnG+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 10:31:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8VRNGytQQyDiocZvkLhYK7cOGt5eGP04qqiMV2a0ndw@mail.gmail.com>
X-Gm-Features: AQROBzBvIrFvykv50Fa3U1oGeRUXnGgCDJVcNLsYOGukv2vKiFFFK0CtdeSv0b0
Message-ID: <CAMuHMdU8VRNGytQQyDiocZvkLhYK7cOGt5eGP04qqiMV2a0ndw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH
 configuration in PM cache
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 86B9845B81F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35469-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Prabhakar,

On Fri, 24 Apr 2026 at 10:27, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Fri, Apr 24, 2026 at 9:22=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when savin=
g
> > > > and restoring pin configuration registers.
> > > >
> > > > On RZ/V2H(P), the IOLH configuration is defined by the
> > > > PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> > > > account for this, causing the IOLH registers to be skipped during P=
M
> > > > save/restore.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>

> > > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > > @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struc=
t rzg2l_pinctrl *pctrl, bool suspen
> > > >                 }
> > > >
> > > >                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
> > > > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IO=
LH_B | PIN_CFG_IOLH_C));
> > > > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IO=
LH_B |
> > > > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH=
_RZV2H));
> > >
> > > Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set fo=
r
> > > dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
> > > impact for now?
> > >
> > Agreed I will drop the changes from rzg2l_pinctrl_pm_setup_regs() and
> > send a v3 for this patch only.
> >
> It looks like I need to resend the whole series because later patches
> won't apply cleanly.

No worries, I will handle it (I have just queued the other patches in
the series, and saw no conflicts).

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

