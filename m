Return-Path: <linux-gpio+bounces-33249-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKUFN7ansmnwOQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33249-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:47:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D626271408
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 12:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E31C43095C2C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 11:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B7B3A168C;
	Thu, 12 Mar 2026 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1h/q5jO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4D43B7769
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315783; cv=pass; b=bUQG2+3E4VzcTDQbouc0LY+K6QvCH3aelplaQ2tmf4slrI/sR/NY6SguTO7fpmXNqaiSETFfng/eXoCq4cA/jfWoeL78pa4geNugdhlAX7qp0/I0VI6vEEk5vEw7tZsLNxY+WWzPZU7gwUp8or6z1zdxtLy9syPT4eHixfGYO+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315783; c=relaxed/simple;
	bh=RsAdZW+SNrysKlGF0KYpi9oK13tnuvg/Wgv68rH1S9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUHc+fC7RrTcSqOLismm8MIvHpEw5qf0Un5FGKu/xazo+X4ySFMQi9f2weXhZXghJD/VVzjBo9gkI4WbkLP/otC2K7T/af2EDcA3ng3xRgMCCRpyndQlR5xQ5zigHv6AFGIXa/gpad27X5ZUN+FHayqtq+sehCYDQE9gfJ3jyqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1h/q5jO; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso747895f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 04:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773315780; cv=none;
        d=google.com; s=arc-20240605;
        b=AIhCx1ujKT4gUvYG0fSxgzBS1YpV50JxAMkpstoZgi68j3bQJHG/S5bQfawPYHeUDt
         7ohabFxiBJ24Jnwkj1P81ix+Hjy9/bPnaUcj/B7gJ+TLAWGxROt/TG2T/S+5hz5EtZ/M
         dLhAPtF8XTXPF4e2mjkvfLH/D5AM6tKx9tuwSB+463i2nTQ9unT/cYsocwWHbXfy8INN
         eRAn56Pmh0wt8stXaovroPNRqGqGNFjLxtxVgfsB+t6d4d9jKJhfvS48beFJBymNNF+S
         Fz6LmhiuIITAU279asYAPJWFekRQk7wvXlq7RU+lsq++/5NM8wPaNeLmusC7haEtFL6t
         GMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHVMKXPO7fhC3aitzZrQw9ifuMfBk3M50PCScMu19BE=;
        fh=MPytG8BtH0A10tuQX3WgQbERZBBm0K8IuPOHdAeof6g=;
        b=AvFmnxwOZKDCeIewjqI41SuLtZHqEf+YuWaiQ9HtMdveAOR/ELKLwBAlXs/5R3oz1o
         wwHUHSHVqcFeLOTE/vW7FA5cEMyRR+d3JRiRLk4EXxd9V57ILmQwUNFyFNjdokrMGNV8
         2K5RuWI4U7gJ3N4nS20SDCW27GsRQwDsgZmZyz44yYOzRkNKUC58E6vnQqJi/xcWY8qz
         wizB3DfXm6tGvnGKaxPetwnc0epX24eyaoJbNV8h8vo/nPVCZIdxTLpAbloHnPnaVG4n
         QUcysDsmeb88NvujTTsMx2Z6+mQYvgEvwT8MLf2+E7kPSk1fC9+mmzmBlbBQi4fc941l
         HA8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773315780; x=1773920580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHVMKXPO7fhC3aitzZrQw9ifuMfBk3M50PCScMu19BE=;
        b=S1h/q5jOCVmiLqHqHkIGTdcwQZST/B8kO+UgK27OMk9n9KUaCRpB8+WMVortuM2jhl
         oEgzIrhIg/L0aDeFwJjSKDaSS+rV89hqt0EpnsyUBCUGP+x8uX6ki7UF8I8mfGGgDQbF
         MKpS2PMQYjETDJKo8orRfDfDvVxQJTnFIIbTEk8OU5UAyyYVVyl4ipIiCF6ejdckFV5Q
         11mp+GZWjVDGNMWfbrtbRFA7/wbB9pjuh7w7A7fkd5nylsmTY7/911LJ6fNGmGGYg5wP
         OvHA7E+IhSh+GYKA1+2t3/2V7TO+ZjRmoH6AJDk+12sIn5o43YTWJAnXKmv6YKtqS42R
         JEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773315780; x=1773920580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CHVMKXPO7fhC3aitzZrQw9ifuMfBk3M50PCScMu19BE=;
        b=wk9BADVmk/SE3fpJUB+rxF462brUn7xIhWJbBLhtuLislLpdvoBZAKwuDgrsA9Y3TP
         D/SUBOxoDMjV8VtDDjkMMW8Jc9Yohwr9Oi9kk5E9WwOO4hbNUgl0SmmGEp/KO7EV+89D
         yAWUvTv49P/rh0gxIy+pw3D4v3JgcCKo3HL+7w9nA6VXaXyLiBuFWWS3CQWNK3I01oOa
         OoLaqQnQ+Oo41SvT7A12S4r5lqip2WN2luLVQHBjxcaF+4bjFj6jCbqADQvyGlYbbar7
         tyenBLwtI+HQB0MPCtM+00Na07S2kWtVFpcBId8zxcIUMANwZqfKvKqSMPDr5YkEUAXf
         nTfw==
X-Forwarded-Encrypted: i=1; AJvYcCXRpTE79+HfyYY6YjcK96nWWGBCbEXSIj4Om46GqN4VQsdQd26FTun21tGUu3T/7ey3WfecQzzLKuku@vger.kernel.org
X-Gm-Message-State: AOJu0YxkiC5b1ITmu/7PCyx9Bs1vM0OlQtGpGqcNBMQp/hgObyY77Dkq
	FTrvhk6Gvmh8635KkFv9HZaMEAm6vZxxPZwX1aD0ked9gI8YXzG8xAiqNPui5aPUDRa00uky3IG
	HYblWdRUFvbCVdDXUYY3uCnera6XaHP8=
X-Gm-Gg: ATEYQzxyeky5CevoCIoH1jEVlHx3xIkvt2bDrOg+64DVelmD0FNq/hzSFK80zLPzWxp
	EvKJD96l8AZdBRshUji0WfYhl9wwavY0j2LR6F/HrOtMMQHZCOwqLc03Y+xF5LSeYHyaJrorW8f
	pHNkl624dSLmlB6H2+QQtGMcB5kWJT+UG3KT+gnYYRDTl+w2Qq8dSV9bvaU26J+OvtmfTpQEnOP
	jlCj3U0nlZAAPglmaHSk1MmfH/c32mVZ7zxWItESZOOa2ZkEMGQi/h5f15YybnCtB1TPYIuMABj
	axbPgIsF3wRp2QEkKtv4OYXVuNqOy6Qhb83h/kHBfcdcnmktaVgwQONaHc3sm5fj/TO51w==
X-Received: by 2002:a05:6000:18a9:b0:439:ba4d:bf53 with SMTP id
 ffacd0b85a97d-439f8423d74mr10803375f8f.52.1773315780042; Thu, 12 Mar 2026
 04:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWQeOa5L9QAMDMy-KSH=HiZeOpLnq+VewSTVbvWHosygw@mail.gmail.com>
In-Reply-To: <CAMuHMdWQeOa5L9QAMDMy-KSH=HiZeOpLnq+VewSTVbvWHosygw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 Mar 2026 11:42:34 +0000
X-Gm-Features: AaiRm51_ssk7vGH1f9YJGjAo91zvg5snVrOTShKiwdxkIaJ0-47Q0oGg_3OsmGM
Message-ID: <CA+V-a8sqDAdJMGhjFi-HsdEvHj=6FaquyLhFvLUwXVp7Jk0j9g@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33249-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 9D626271408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Tue, Mar 3, 2026 at 1:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 14 Oct 2025 at 21:11, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H al=
lows
> > configuring pin properties through the DRCTLm (I/O Buffer Function
> > Switching) registers, including:
> > - Drive strength (low/middle/high/ultra high)
> > - Pull-up/pull-down/no-bias configuration (3 options: no pull, pull-up,
> >   pull-down)
> > - Schmitt trigger control (enable/disable)
> > - Slew rate control (2 options: slow/fast)
> >
> > The drive strength configuration uses four discrete levels (low, middle=
,
> > high, ultra high) rather than the standard milliamp values. To properly
> > represent this hardware behavior, implement a custom device-tree bindin=
g
> > parameter "renesas,drive-strength" that accepts values 0-3 correspondin=
g
> > to these discrete levels.
> >
> > The DRCTLm registers are accessed in 32-bit mode, with each port split
> > into two halves (bits 0-3 and bits 4-7) requiring separate register
> > offsets.
> >
> > Implement pinconf_ops to support:
> > - Getting/setting individual pin configurations
> > - Getting/setting pin group configurations
> > - Standard properties: bias-disable, bias-pull-up, bias-pull-down,
> >   input-schmitt-enable, slew-rate
> > - Custom property: renesas,drive-strength
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Just a minor drive-by comment for a patch that is still WIP...
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
>
> > +static void rzt2h_drctl_rmw(struct rzt2h_pinctrl *pctrl, unsigned int =
pin,
> > +                           u32 mask, u32 val)
> > +{
> > +       u32 port =3D RZT2H_PIN_ID_TO_PORT(pin);
> > +       u8 bit =3D RZT2H_PIN_ID_TO_PIN(pin);
> > +       u32 offset =3D DRCTL(port);
> > +       unsigned long flags;
> > +       u32 drctl;
> > +
> > +       /* Access DRCTLm register in 32-bit mode */
> > +       if (bit >=3D 4)
> > +               offset +=3D 4;
> > +
> > +       spin_lock_irqsave(&pctrl->lock, flags);
>
> Please use "guard(spinlock_irqsave)(&pctrl->lock);" instead, to match
> the style of the rest of the file.
>
Agreed.

> Note that that will become "raw_spinlock_irqsave" soon, due to
> "[PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context".
>
Thanks for the heads up.

Cheers,
Prabhakar

