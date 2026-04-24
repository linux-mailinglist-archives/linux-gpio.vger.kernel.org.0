Return-Path: <linux-gpio+bounces-35465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCnfF3co62mPJQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:23:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E021045B639
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 10:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE73D3014107
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DF2328B61;
	Fri, 24 Apr 2026 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqQ8tzoa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803F03148BF
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018963; cv=pass; b=f8zUcpoOqwtsgcMUXKxZhr0kMwjHKW9NyAekVD41kYQdtc9QwcOtpd55Z0RL30fN/RAJepQDdOB3IjWeTOjF74cBbGf6x/o/zyEmLuLHhDONu2rADDuV+pwFOeRjOL7nqXppX+Uk4HdxwkZxxS3XC/fLXyVY81ngyIFCreq5Gyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018963; c=relaxed/simple;
	bh=U15MUQNp/Vg5gRXQmcgEvyxU9xGyfihO8rMHHQH04SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXQV6qzBYe57DxnGSBlYSD3db/8hVRYeYNxIiFdMiZgmsfmpgBB45aTuo3ag8+Ys/7n4JOpFxdnIl7QwYMQAK/C4OpW3jZ2L+ebjORWFA3STtHAE6GqAqUmsVQAAOCwajGsnszSHhgxwSvD/ptIG+8SHuPKomyOsJvcw8W73lFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqQ8tzoa; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d77f6092eso5204486f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 01:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018960; cv=none;
        d=google.com; s=arc-20240605;
        b=FfHwpiWS+qauIVtGD6a+ucTvLxdJRdQcGvpJ9i/kzafWuVzPe1uIQwXR2nBX7WU0ZX
         ul7v1Fqy/VOj7JDT1kOzH7tGoXSSkqsjGGFYhkseInAGlBWD7xkXeGBNE6xyQLnCvQH7
         Ux+JwVPnEDLW1UsGvZf8HklGBDtpX106mrkhXucp+xMLc9pJpuSnFCWk+JaZBmdHvvAm
         XFcakUS+X7lBh1bjmU0tMcMXTQ9nlk/3a+GFwi0t6+0s68StI3OyxABqiwwXzVBg2Haz
         EHimLFem3bDNsU+NhXTBFIjG5rfvzw5efI4ERK3wiXA5myA7LB7QKFXiJ5MDoOKKmZqq
         NXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocfPqMySXfGq9CYZZR5wpH3s/fCoW5ug2WTENUP6b+c=;
        fh=fMHc0jMqUZRrbD0L/P+Qe8yko8/DH4JPzjVjqecWOAU=;
        b=T0oDMGikD58fdTAOGqzqx7oDIzM9Iy45oDoF2KluM6SJFq3e3wYXIcrThkyLOfJJzL
         oURUwJKUteHpQy+5rj6DaIIHBRiJBdkdO/fHM/mz9CmgIROx6hRnP6e8ZXXfVz16g9FH
         nWmnhmliixHSqb8pcV5rPA9mZy55eQiUTNdL5fa+J5ThplZxg76rnPOGJieuHD2aTiYF
         oYf+1bscQpbnDEuzweo5+6YIUecNPiQycut3nEn26x0CEYyjcgXuhHb5remn5GK4Nzo6
         9B4k4HrwOQYaZXP+oRlQh6DkyIBezQlI5Ju/+snyvu/RmiARKETxcCkRlkAomD09FyNx
         08Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018960; x=1777623760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocfPqMySXfGq9CYZZR5wpH3s/fCoW5ug2WTENUP6b+c=;
        b=QqQ8tzoas9Dt9+AgNDTF8Kck8ag3HZ5xHmH1tEOrR91AtAve4hopdo1N7E8kIfk6/+
         ACPvzcDghGz61hQ0erc8R/8NpBDNzzTC/YbLD2EIWtSabnHJFk8POmb+A5QhZFziHUkq
         iEQWc6Fs0cL27BO1SY91O5DD0OiVOv2myrVcUCkI7EoXUb2zuAnfI+Muy+9hvJlFuOsp
         Nlk7ndpDLFT+srz5KHDgDaQRNyCS0P/I7KhKDZd0yIK1e2CzXegjDuEXX70KAZs3WhZG
         gL0/WAfknufrHhVqOgoLNbK0K/PWEDM7cNwwzwTWsxqY0CXoK+Z1AmFuAln+6glBg8ya
         7n9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018960; x=1777623760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocfPqMySXfGq9CYZZR5wpH3s/fCoW5ug2WTENUP6b+c=;
        b=CexuU55VSuSBaAj+FOne/eq/BXfuSn13M3b1l9p8HhZdchMnJT5rTD3w9xdEFKkl2A
         BUVGk5ElwZR/1m269+wguy3t7qX7tjC3y5Zmb4RS3ztCihstAmBnnSQy+OYbd+9ttxU7
         bpt90xaJfakXhe7i4p9z7WlLZdSJFftomNwTHjvfG/bOKr5FPc+JM710Uo5Tt0ljlSje
         EJXnnh/oE0x/6mubCjbpPclDUHE4zhYtR4yVJQr1aV/tvJY2+1Q4/Wu6ULhk9UhMtb2/
         M2KqsQESWqN8e3Zliz6K56YZqdz/N00D1NfG5Ki/yKdt1PMFDt3tee728BpX3nucgIF4
         kxZg==
X-Forwarded-Encrypted: i=1; AFNElJ+6YxmCtJAtTPlIP5SwHQCJvm/bNwE3u1DvqOiaQb9zODhxkTkGH0BEmhAzSObhAFUrsFbrahNSfUcv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6CyzgxgbhzIOCNa+9sQuE94OhFhtHhU0Fq8jM0VQ9Ap/kpsWu
	cv+o2buAvifKxr6qyRzLXbKO2dcumOuCEXMj/U+h3rxvLjKCm7kMwbRu2gKrmj/SmG6kHQgdosd
	QzptrO8klEcFrczUrbX1xs0mjbE/XlcIhEXcJXC0=
X-Gm-Gg: AeBDietuRheZ02OVeaHvM+/kxzGkOsHWmKshkk0ECVFMAs22F3UDFWJRIat+Okq2hlv
	Q2k4uAk6BXfOb9iJA16Ji3w2TwIDOLRPY11I+BSRbBAVbbeL54Sw6TM7QfoMm5LTYcqyJZAAOsf
	95m2Cb9a/27X6Tohsy7lVIjo/xRrN53UwPBOhwadtPA6y1nM4woxvoEIRVdQiuNwM+LY3Ufiq8p
	SzuDoFgKxilknJJTa2wibh4GNehU5ImLj6FCHce+MmH5OTnp1WXPVVAfwnaRqJlmn3pDmmvM99C
	MHROcNpO7wnYLDTalzGE/cfSqcu6Kj/KLeB2s+mcJTHYH/J72Hi8p5ZbvzIYVDxXdti4kPUV1AE
	Uzzg=
X-Received: by 2002:a5d:588f:0:b0:43d:1c7a:8b5b with SMTP id
 ffacd0b85a97d-43fe3e11665mr46548982f8f.40.1777018959695; Fri, 24 Apr 2026
 01:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413182456.811543-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
In-Reply-To: <CAMuHMdWJCyurtvXfUFw8NA7RONgtf9XqqWvrcg0iWjPBCutSEA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Apr 2026 09:22:12 +0100
X-Gm-Features: AQROBzCe_y0xJkh_iknnWGLgTWBp15MEf8lCfi-JNcPd0UMlYdHSQ3OhKSAYFFg
Message-ID: <CA+V-a8vpkh_+Ka5mk-kewRXJc34oXFc5_4VgHUY=RU5YAFS8uw@mail.gmail.com>
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
X-Rspamd-Queue-Id: E021045B639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35465-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]

Hi Geert,

Thank you for the review.

On Wed, Apr 22, 2026 at 1:04=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Include PIN_CFG_IOLH_RZV2H in the IOLH capability checks when saving
> > and restoring pin configuration registers.
> >
> > On RZ/V2H(P), the IOLH configuration is defined by the
> > PIN_CFG_IOLH_RZV2H capability. The previous implementation did not
> > account for this, causing the IOLH registers to be skipped during PM
> > save/restore.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > @@ -3033,7 +3033,8 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rz=
g2l_pinctrl *pctrl, bool suspen
> >                 }
> >
> >                 caps =3D FIELD_GET(PIN_CFG_MASK, cfg);
> > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B=
 | PIN_CFG_IOLH_C));
> > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B=
 |
> > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV=
2H));
>
> Unless I am missing something, PIN_CFG_IOLH_RZV2H is only ever set for
> dedicated pins on RZ/V2H and RZ/G3E, so this change does not have any
> impact for now?
>
Agreed I will drop the changes from rzg2l_pinctrl_pm_setup_regs() and
send a v3 for this patch only.

Cheers,
Prabhakar
> >                 has_ien =3D !!(caps & PIN_CFG_IEN);
> >                 has_pupd =3D !!(caps & PIN_CFG_PUPD);
> >                 has_smt =3D !!(caps & PIN_CFG_SMT);
> > @@ -3131,7 +3132,8 @@ static void rzg2l_pinctrl_pm_setup_dedicated_regs=
(struct rzg2l_pinctrl *pctrl, b
> >                 }
> >
> >                 /* And apply them in a single shot. */
> > -               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B=
 | PIN_CFG_IOLH_C));
> > +               has_iolh =3D !!(caps & (PIN_CFG_IOLH_A | PIN_CFG_IOLH_B=
 |
> > +                                     PIN_CFG_IOLH_C | PIN_CFG_IOLH_RZV=
2H));
> >                 has_ien =3D !!(caps & PIN_CFG_IEN);
> >                 has_sr =3D !!(caps & PIN_CFG_SR);
> >                 pincnt =3D hweight8(FIELD_GET(RZG2L_SINGLE_PIN_BITS_MAS=
K, cfg));
>
> This part LGTM.
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

