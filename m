Return-Path: <linux-gpio+bounces-33775-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oId+O10au2k+fAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33775-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 22:34:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4332C30D1
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 22:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73FD0319B45E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 21:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6877938944D;
	Wed, 18 Mar 2026 21:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ziw9kxCH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F199A31352B
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869435; cv=pass; b=De83mxUkxh5PE+afSsftXb1HTWnBXtk9QAcPrGymcWeL1uuMnKfUtwY0MpMGiRbryjgmn8FiR/bpap3FDTmIqYyu+HbqaxeTm2hV5eq5/m3ewqvqWPIaTjJMFt4Ifr/wazWJVAdCqGTveHFKq6yeUPNncmN4G3Ak82uUltjXqPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869435; c=relaxed/simple;
	bh=c459NjjylC4DFrFzhntCSH782/XOuifEBUc6ew3uGZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVuoVH4pYyVIU7V97IG3AziBnL4kWaQ7l4pxWn9AHF2DeBEgWlKCoAGOfFstwfCWaAhXEys/XYTqVEnp3Vo1oBfOe6lGaxhXfxBezOWB0Gl3IzLnT0fu8Q0RP5iRyKvcS8guDj8HbAKLBpe3dm7w9uCzw2eoi3D7MLijxd5Yblw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ziw9kxCH; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso2110375e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773869432; cv=none;
        d=google.com; s=arc-20240605;
        b=fhVMEUILjHS+PRHGV7q7NQyEgyzRmM6uZbKfuECo++iD9tkbiOWMOIs9bdl8v4TLtu
         5j/56mqA5HsfTOZRMzxDQif/jdbAQ7/eZ+n8q80cu2Kdhhq5IkDu82xjkR9VrmCHSxdJ
         Iq0dxjdPObTATCXrqwRXBTsZNmewOVB59NIBHqGUGl2xE8mv6UEIxzyffEyAdnejd60b
         TWdx8ofkdaFiEzRA4IERlxp5Tkyqv8Q0QuhTgqqPml1ubtqnjkBgf28Q5MleCw0r0APM
         g0oKuL+JVgsxuRQTqUBOMDRNoPn47Dub1+s0KuQkYxKt6uCtDL7Wl8X4v//SPTBhi0hT
         qVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZyhjZuvEaxXX2v5n0TSA0ikgRXGcSbp95m6O9R5zvps=;
        fh=ZuAHFEidUp0cgh4ZsEFqnK05y/MkxZqHwBPoMlIaqHo=;
        b=PRbuSlM8zJsfSsf4X+nDS4K8R54H3NxzCyV3MvIuJxATvYETROIRvWTdXJWiFgCg9K
         TYa55bwPOoOqJmTP4NwOXnJ+3C40EmaT+Nk50hl9VXxWiTdrmStOIGlNB4BUFsFyCjjb
         KGMvyuQTAI1kyB2Cuwr8TQNabKk/tBZP1eIco823/YrnsiGwHtVGYmZ+fAE/dWimtLTr
         48sOruXUquPE3pWp1EDgsuQhRxQdctCwLjNcyZL0eZvgSn5j7hrWB09tDl52VvvRX7nS
         Nff0w2G+ZiNSfJ6uhRQvHW9ogm8ceJVDtPt30RpxvJh6YY9z48vw3DZUkslpFz9qh8Nj
         iq7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773869432; x=1774474232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyhjZuvEaxXX2v5n0TSA0ikgRXGcSbp95m6O9R5zvps=;
        b=Ziw9kxCH5t9Bf1X5SXh7I9266pOcavsdA87ayusUBpL49bN0QXPTNl2WFkt6vVebVk
         2BixmEmpqBtXODPG1yhGruMJPR1t/c+CJ6cFAixg3MPe20N7dIoOgiYD2fJ0KJrkWP1R
         FwhF2xZe29Gklfw/yYrVkoNvcyuB9awfkFCOwkaOji+9I1C7GoL4/aYlMxgNuUBPuL6E
         segZ4TLYgv+FVsfKCio3A1U/IRNi5rHkmmIWckaXNUoQYzQRXDBIgZZybihnpGBBx6bQ
         2ZsFzbtXxtLOj9mboqeufmDm72rITgW0GRF9t1cBJtf5MVeUlIW8KNksLaql+KiXjLK0
         x27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773869432; x=1774474232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZyhjZuvEaxXX2v5n0TSA0ikgRXGcSbp95m6O9R5zvps=;
        b=jw86XyBOxe5te9snlRm1SlriWKgebsIT1z2xN6FvRrogD7WrqSYhlWuPUaDAmOFjsz
         8KCyhi/atsg7Sv8eY0tvTW6SqZcauTPYl8OTzhdAc+bSwNx9eJ3zR5qJSH3+u+2d6Kqu
         IA88CL6zOUAR/N9KcrwIIxjaQOvizIlrUPluktstXHz1m2pHm+NlcIgPrp+FnQ+S3P3B
         CFEeXzpUSt4im5k/+WMlMQRX/MvMW6LQumr6CmXEpU1IGll+QyLvd5BgNSTzvjIOpmLG
         rIl6IYV/lfYR3AdKMo+49nbZhwHwmkEkztvHCYvF9FAYVvJKqplHZw5DHJEbOXXJLRLX
         RLqw==
X-Forwarded-Encrypted: i=1; AJvYcCVYfIbu0/v6pxhAx/DynUm5pqMLjHMZanrWibfnuCvK/GF3Vtw/2T0YOR2lNq3p9lBmgqS0LjhGFiLN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz68j+HFtAR9NJnVhY+YPQ3EBdChpRfo8DblsHa3Rg7m8fpnLnv
	KCdLY4pYEpGtKYRcAYRveyE36vcCZnzyVlY4wdNAz99XvMRytcXyNDwF/s8me7KP4pZSzQf6Q2K
	iXT5lBhj9nzYy8hqCEZXxAYcpzxgxGbY=
X-Gm-Gg: ATEYQzw2h1vrX9DMXSnATi5krs+G1dZei6hfVb0L0FmjP5fgcnGweA/Ru0xaYhpZQRK
	OydMb9CttWjLIHEZbi7IZL5bTLg2r6fXqAyPujgDIRw2xTg/nOcihn/vRYUkeIx4L1X8HHolzcG
	uu0fzQK+azCvwCTWBzTxF9ubtxkPncgtmxQWcGCrgqg+s7EAIRHnxKjEYcWokNOomT0S3n3Myrn
	2v6kRXZl07iRMrtdJY+evx0AxGW+ThgQ8oHDP9wWQ3o6cCJhbtT7fTdpPj4f53matXsug8R2UPp
	NQnOCacW1H1AABBlKZc+oFHe91KHR/BXqSMk+dqDpW4eSA8qDIVL6e+IUzcKN6yxfBVjltg=
X-Received: by 2002:a05:6000:2403:b0:439:b991:5c07 with SMTP id
 ffacd0b85a97d-43b527c812amr7998467f8f.40.1773869432250; Wed, 18 Mar 2026
 14:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud> <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com>
 <20251208-headgear-header-e17e162f0f52@spud> <CA+V-a8s0gPbe2ffmN1G_7ibVL4+=FKUEQZu3_CwQL=U0T3--DQ@mail.gmail.com>
 <CAD++jL=J2UpxQSNrZhCMw2fJ0umM8NRtNys2zMBouAFBoK0m2A@mail.gmail.com>
In-Reply-To: <CAD++jL=J2UpxQSNrZhCMw2fJ0umM8NRtNys2zMBouAFBoK0m2A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 18 Mar 2026 21:30:06 +0000
X-Gm-Features: AaiRm50eA_D4E1jWsVINHhsu8y7aHr1MUbAlUX-x9rRsI1Rjgut52QbZHmen1d8
Message-ID: <CA+V-a8vNeJdbjJ6K9QkedHgAprC=Z0ckUztwe1ZapSiqjPKEsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33775-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.559];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E4332C30D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

On Mon, Jan 19, 2026 at 12:10=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Hi Lad,
>
> I think this back-and-forth must be a bit stressful. Sorry about that.
>
> On Wed, Jan 14, 2026 at 9:53=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
>
> > > > > > > +      renesas,drive-strength:
> > > > > > > +        description:
> > > > > > > +          Drive strength configuration value. Valid values a=
re 0 to 3, representing
> > > > > > > +          increasing drive strength from low, medium, high a=
nd ultra high.
> > > > > >
>
> > I got the feedback from the HW team "The RZ/T2H drive strength
> > (driving ability) is expressed using abstract levels such as Low,
> > Middle, and High. These values do not correspond directly to specific
> > mA units.
>
> But they do correspond to *something* electrical inside the
> silicon do they not? Then what is that?
>
> I think it is just 1, 2, 3 or 4 driver stages.
>
> > To determine how much current the pin can actually drive,
> > the engineer must refer to the electrical characteristics table.
> > Therefore, the drive strength in RZ/T2H is a parameter that switches
> > the internal output transistor mode rather than directly representing
> > a physical drive current.
> >
> > Consequently, expressing RZ/T2H drive strength in milli- or
> > micro-amps, as suggested by the reviewer, is inappropriate. To
> > accurately reflect the SoC's hardware specification, introducing a
> > custom property is essential."
>
Sorry for the confusion , there was a miscommunication regarding the
specs, but it=E2=80=99s all been sorted out. The drive-strength settings on
this chip are 2.5/5/9/11.8 mA, I will represent them using the
drive-strength-microamp DT property and send a new version.

Cheers,
Prabhakar

