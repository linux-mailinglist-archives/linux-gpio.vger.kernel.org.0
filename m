Return-Path: <linux-gpio+bounces-35467-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLPrCogq62k8JgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35467-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:32:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE545B855
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A223301B72C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD1C32ABCD;
	Fri, 24 Apr 2026 08:27:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F6347C7
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019245; cv=none; b=QPwro6PUcYg0wJ6KO9ZCqAWsf3XtanukjiF+VgUKQEpLB7pnJ6KQI746f8wI81oxe7v7DGtLg2fbdj1e3Qi5D0Qd6Wgve8bWtIFuoo6UeVqCfkjb6HX3RlCynmzdyN0/AKcQcRzsedkA8gJhSVProhH9DkacUWIIBZ68svJsyLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019245; c=relaxed/simple;
	bh=HdPO24Z5Yel3WWWATSnqh/w3jYk5D89p3OAm02/rzXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WKdmIcEvUgZ1+A/93Qo+qW5P4Ktn0/1XrXNzcPFoLX0lXzpZSnxigFLLgV00O8j6QAtgCHMO1NSbt0TenhprhmIxciIJU7cQhi7+inBQ3vZLZmSn213afKczQ5XkuuvWRf4Lr/Wa2Fo5CEvebOQdZDOspBAIcIVJrCwELg9NaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9568159ee07so4624505241.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 01:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019243; x=1777624043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftmVM3tRj/ijAMz+d8i4NYfRMF8TS2LtamFj2CS43Ck=;
        b=pfREwkKC4ZSQDNySVIFNOvOTVTBYLFJFWLIZhwA1zry1wqumKpt9BZyKDakyn39cEO
         37GFNbCM+kkm0iz8jsULeBw6NuuDyBNMw22lHuebM+qwa2g3JsZMltfmFwoJeAwUWL31
         +uE2aIbk/8OKQ1j3KWzrTq5pUhGFf/tDEO/68TWvELkYOd1X6WGJRINC0cN/6Vs6pQog
         hF0Y38JHK2di6MOESD61e5jeWyTHtHyqs6W3MPDx+kyGt4pkMxLMQuhv/XSYN/I8Q7au
         jr/PhjQinCcZ4OLZwFJrZmI/eJQsNAzHQJezHbwLOcsnl/Dh9rlKnevAx9C0OdzT4K8o
         ZubA==
X-Forwarded-Encrypted: i=1; AFNElJ/3PldpuuKBscYDmMHE0D4MzqR0tmmIZpBNSjnQD1KBg/jZhYBoCftjm9AXzUoNR4QgkrcOFLP8OX2i@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6YZtLf9g8rFE+Gn294eswBxPKCyRoAN62YGDPDvvdP9nXDgHE
	ukq2THTUkRZW3C7U2uIPQ7lexbJdXSg4YTf9V2wQJhoMnDzrCCBA1oFvNqJfIy5B/Ws=
X-Gm-Gg: AeBDietjzVscGEKN9ZJEZnOVDCJdW/wa/lfCketnaL/ShIYptHhqA9ifEZRQMG8//Y3
	D4P0u4pj5t+PFvrhvZrp6K2P3gtCtICSsuxyqQzXZYAq9cCa8ixjioFp9ZJoANdRCsPbMbjyW3y
	cx3g+DpJiGQhcNOMGpnX5N4ZOBArJjHrrjD2VRwBz7PspY2nzieU672nwX09nJ+k5QBtNRQzgba
	p4KLwEKENO9zueW66k5Op0Fc5iWPrfReNxbsGowWlc9GQKEq/Um3fRUC/wYlo0BFwltpALRMiEz
	7TIvQ3bgIgXCYePCbmx+s1gPSH6fARs1WL8c2My9QdbQy5NDPFQ9C0MUlt35PMmniAETLuvpV/7
	z2UhtZYmd5Zd3TRGjIuZBY4IH77x0fKPh79Iwm/B+H3MGNp2ZYHb+C1PEC4qalCEkQuQowL08nt
	xwLJYC/+iIte6BtyasFjzB9jlxvBA+1npq9iCkFKbME6W5ohXOGh38i5gwflIhexJ9G6wHKkk=
X-Received: by 2002:a05:6122:6610:b0:56b:9b7b:83e7 with SMTP id 71dfb90a1353d-56fa5929467mr16061344e0c.7.1777019242685;
        Fri, 24 Apr 2026 01:27:22 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa91bf90fsm12983297e0c.1.2026.04.24.01.27.22
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 01:27:22 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9568159ee07so4624497241.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 01:27:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+tYegZ5lx8GxuMdsUhIRvoH0xISnUVj5ZKey+tDlqQL948SiXz1Y1jDiY4LI4+Bb5xqvvxdb0xj3S7@vger.kernel.org
X-Received: by 2002:a05:6102:ccc:b0:613:6b44:3fad with SMTP id
 ada2fe7eead31-616f783ddf9mr16006995137.25.1777019242187; Fri, 24 Apr 2026
 01:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com> <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com>
In-Reply-To: <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 10:27:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtccbEZ0Bd=A0kvC5sg3YzMdKmVuiYrVpJMXpT2zqUYg@mail.gmail.com>
X-Gm-Features: AQROBzAzk1FIfpdwLdzmR64056j3IGK12kH9Eez-F6PM4uTeq1WUC-B30qC_eAI
Message-ID: <CAMuHMdXtccbEZ0Bd=A0kvC5sg3YzMdKmVuiYrVpJMXpT2zqUYg@mail.gmail.com>
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
X-Rspamd-Queue-Id: 93FE545B855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-35467-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid]

Hu Prabhakar,

On Fri, 24 Apr 2026 at 10:22, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when saving
> > > and restoring pin configuration registers.
> > >
> > > On RZ/V2H(P), the IOLH configuration is defined by the
> > > PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> > > account for this, causing the IOLH registers to be skipped during PM
> > > save/restore.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > > @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struct =
rzg2l_pinctrl *pctrl, bool suspen
> > >                 }
> > >
> > >                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
> > > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH=
_B | PIN_CFG_IOLH_C));
> > > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH=
_B |
> > > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_R=
ZV2H));
> >
> > Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set for
> > dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
> > impact for now?
> >
> Agreed I will drop the changes from rzg2l_pinctrl_pm_setup_regs() and
> send a v3 for this patch only.

No need to resend, I will drop it while applying.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2 with this fixed.

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

