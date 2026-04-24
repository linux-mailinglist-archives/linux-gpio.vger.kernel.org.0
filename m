Return-Path: <linux-gpio+bounces-35468-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNp9HKYq62k8JgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35468-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:32:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01345B873
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3FA13024535
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A641237A494;
	Fri, 24 Apr 2026 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pBKA/R5X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9311619343E
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019276; cv=pass; b=FlkpYpoYPH/jpq2lZvzOV9Tnx2FFBekOgcMkjj4IB9FEug8gLuSGd203s96bSG/hryBlXNBM6OJggVvsXbDx1KPu/eGb63WlnKY7hsvznkXvejg0CjhIQzj/qOrBv5on8e3rNC0OWCnoKaufBvDTai7+fqjU6/BAqMlVdE2mscc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019276; c=relaxed/simple;
	bh=abEa2oo3LWroecIJ0K5+AP3rKYBkm2+VRT5wYlo8ng4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hn7Gu8CxGvdFZYcCDN8wcDn6depfit51OeikI1+FPRREOHpcdlmiq6a1gtoGOshzCdeW+Az0hzJxTIvjoaNgnTL9rkos30pTbGWvCXz/7RQNrIVbUT5rgDuwK5swlW1z7TV+Lk8gFt4YxWQ8P8DOYCAugg8eLhPR7b6ApmBmTnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pBKA/R5X; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4411e1eba51so4095705f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 01:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019272; cv=none;
        d=google.com; s=arc-20240605;
        b=UDo7PSkSuiZDv9eV9gRZcVZs3LUUmPLSP8HIa+6wMEO3LdJa8u64Ob7f7BhxsPpHNH
         0uJ2OG1DteMhqMOq2SyMqWA9EZWfyUmUgCcLKQXLUY8Bam50MLY12s+2XkPDhSw0WNLt
         3JrDN896gfDETpDcbufSAm7wox/oGnPKYCxk18QZdM13nFsc8NpTgobpAe/S/rLjcxRc
         0PZB1iDhY0ZktIn9ufCRGO6pNO9WPMoFwpgX/iTxAoHU070kGynBU7pVbXB//jWl36/B
         l2MfHHC3cmXLoPAfhhEAaEQyP6VAjRVbJWqfFnf/EbwVb8FhXKPS3toF3jB17FVfs+/u
         0CgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2/10k5kXVT4tbnl3kLu0KzcprQXFXDT4Zcypjq4Ejw=;
        fh=lqeaisyt/4iXGRDmYQsrB1hf1cJWg0xDrKTTmokjPmo=;
        b=DOJ8N7T7+DqEQJfxoGl7xbDgRyf0/IuvcDkWCFzHWagxJiohh/+3f+jw0F/6EXJrfv
         rMYVAF1wppECLQaB5/Hc3MPnPU6b+5cZeBVjimHMny6m3UTv2Uol7rmmS6RTAuW2bXzb
         sR9/NcJPXDhrSi7g3UE1mMRBeRjpjLj4UiYHxeycxxrzhDeceUBpYgy681HyUM6oCt90
         C2DP9WNVatLCmb68OfFmpzXXZDJGafv8c/BEJgH7BvJC71qoJSCHj9CU8ymr5vp7MMaG
         yjKXup4VyVzOrwhsqQoh3LRNfe14E1h+w0Y5cFylyh9ws2hBVZfB4gHtF7k1ySectQmB
         EkLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777019272; x=1777624072; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2/10k5kXVT4tbnl3kLu0KzcprQXFXDT4Zcypjq4Ejw=;
        b=pBKA/R5X5rIKkTJmpQviA6cfARDPI3J2lOZt+SGAnMu7noYO7Gq8rfQpqJBCfahvp+
         6TzdPZkjcBAp9HrAAHYu4mdtMuyzvKY9etN1Kwr0rP83K0YWPhK6gSNzIm/rJKpmT3u4
         rYLtjAn2FFs88P2s1DgReBhLrAKMTBl/+RHna4wS/GUKd23nL9YDV/HN+Twt95xFCem4
         DROGrii7uTJXXJnPqTtB7CWcKgrg4t/5oDWj/8/CULmZfkLJ5/ND9VhgV2TdDYD7oTBv
         I1tp595gMIs0wEoP2802fYBr55FXjwVDsspJaGDdNUDBDf4/wvXJ9JpOWIjT97vVQIk0
         xycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019272; x=1777624072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2/10k5kXVT4tbnl3kLu0KzcprQXFXDT4Zcypjq4Ejw=;
        b=ENYikb/r4QaJDkW1eut06WGupIRi4ngLAw1OpsEq7b2Jjlp6hKoem1uUGAiqvdN+mr
         zntzxaKJyj8IwBKtpnnf9XgKuO9LGIlZX5uxREYNMapn9r0zQVGsRU/PnE33oGfW8AUp
         BCZ84Gm8FWKUoowph5nObiVg8vQ+yx1yrIjBYo8/mpzlJ8TAQPOfkRNaGNUJEUMyb9SM
         zbn2+9jrv7yPVpOT3vD64hBC4i/rMydIgEK8c2mfGjyFSIKWY6hfycVCzj33k+BvXIk0
         JaMJ9oCnBGqyqJ7p9b2v3HQYzEiOTGnaQNV4cIKb9QSesM5AOy/99gnDkkl/ix3XkYcW
         /mSA==
X-Forwarded-Encrypted: i=1; AFNElJ+pW+f4pZeA/2Hih95w+APsqLuRU6saYH6nj7Ait5GBEZglPsd5WEdZ0jrgUzevtZGL+Jdd/8UcaiNI@vger.kernel.org
X-Gm-Message-State: AOJu0YzDN+IRS1bBYK8uu/t/Z8QpDwja6kOPZrZaBhWFlxDu0wPTVYSL
	ykegP2Jkyq1rG6EFcdFqPG+8xNndbSOzm1KvavbOFPLNin4LbJAJIYIFpec4Bp5I5ay/BZMjlUG
	cAxn/pZuvaVarQ2+AGPJu8bkGgp4fG7c=
X-Gm-Gg: AeBDievH8Mnq2eEuUNvENvAWPd8qT1yJRutI5bUemz8KWnZ9gBBUyVz4HW4R5vsf0Ic
	WUqC+e+BndNp4O0sxioWyubWqscoVMH1J+8Ecwb3ZxruhaUvNFDIXvdL7kjYBvnCGwEM6cB/9lG
	BPsVmeSlgrzYq28WUIScX6WJsN5bqxlhwVAICfSV4yklC4HRXkJCz9ioZpHgn5A7aOAWgY4P583
	qwQ2ZZsR/ZmJIC+98NuvRo3Cjej2gMaVMjrluSFVjMo9SEXpbKJxXCidQjde7l1E3Ca7fOXY468
	pFEajIvml+PS755aF3NqeQKDzCk1iybZcL5ChkCUEVtWC11P6C/MESNXMsIxpJbkabooiHkkLIh
	3qpA=
X-Received: by 2002:a5d:64e4:0:b0:43c:f7e5:817a with SMTP id
 ffacd0b85a97d-43fe3dd4b72mr47541014f8f.19.1777019271852; Fri, 24 Apr 2026
 01:27:51 -0700 (PDT)
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
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Apr 2026 09:27:25 +0100
X-Gm-Features: AQROBzBklweav6Cadl6bvx-k8sOTN1rEJNQHnGNe-6bPGl1U0IHT8EAXdfgKu2c
Message-ID: <CA+V-a8suj-QZ57uzUfDscZBbEGBbeJxeiC-ozLt0hBE_pLnG+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] pinctrl: renesas: rzg2l: Handle RZ/V2H(P) IOLH
 configuration in PM cache
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1F01345B873
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35468-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email]

Hi Geert

On Fri, Apr 24, 2026 at 9:22=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
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
>
It looks like I need to resend the whole series because later patches
won't apply cleanly.

Cheers,
Prabhakar

