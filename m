Return-Path: <linux-gpio+bounces-24041-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C01FB1C895
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 17:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EE0D563B4A
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 15:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A61D28FAB5;
	Wed,  6 Aug 2025 15:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMttFlnu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98671DAC95;
	Wed,  6 Aug 2025 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493692; cv=none; b=fOi9y6KrXTjfAN2znqKw2OIYOKcv7QqdG5zbiEk2CvXvnkMVfyN1Hi2fRoUhjF4Akqy6IVurI4wSkgyWQfrZqw3ZD9D9fAFoJK1Ldl7vpyTLy4iWiy0ruka6QnelNvfPX5xcSEKLZUN6RnEFhjhGkU/u7hnd976aYFbfthRyxLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493692; c=relaxed/simple;
	bh=m0IhUDbwnwIxXj8HGR/C1DGN2Ji4DzA0FRtmgjoHkZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DR3l7ki9FN4dmGvPDbV+V25bC6UvLUCln/W//q1+L4MAxRl0ye3N5p8MP5cEHc0ZuQmaR8V7seSGSBrFjNFO5Ox/pANgSusZ27pXhF7eemy0yvwNh+2ex8a2AUVGoHt0Y73FqrG5P2CKHwK4w81qWXle5lES5NRUHcNQeRLC/JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMttFlnu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b788feab29so4022077f8f.2;
        Wed, 06 Aug 2025 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754493689; x=1755098489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovq5ZYrsQr6oqXSFU4+ux4eS8vVD1VZuE6lNskCnLCU=;
        b=VMttFlnu6NF+H7R15ftYMDjz7uyyBJPN4qVuoKS2Yz4frqG2UMgB2ylmRqhwtGf639
         /JUOcFMmGDK8K7Rz6idszm/WFOsafhrO7NGWsXtUk5Ptv73rcRFa66l9bdJEv1mu+O2f
         W4TFjmxyFoM36AcavJYfgLMTsP47379c7CK5M+UVtAjfIyltM+t9st70CNrBt5d+1EXC
         r+7nRRZIoh0wWT+d3O0KxqYOjFqJZyJvorjQP1tUvNhUcygRxldBnF5cHcaMsZLltbIn
         FdRALm6N/NTJrnuBFz8oYutDBsyLI6JAVdvPJKw/fRvJhKK/rphUHoyjhx0B4sygp3Ck
         +EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493689; x=1755098489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ovq5ZYrsQr6oqXSFU4+ux4eS8vVD1VZuE6lNskCnLCU=;
        b=YTN56A9JI9nYYdw6pg1+hQ5uZHgxo9skNGPIL7f8HukMn1jFoyPF3G15IIWO+GBc+t
         iK5BbRF9N6SOwdzFmEshVIg2rPRYwk2k7OVz7iIau625OsdrbdFam/STmKcmQaAWZpAb
         Urygcrlwg85SAcm+TOAQU5VghorS/Pm447oGX/WIML/hGF1Wh2mxX/d1pMbg8+r7l8/6
         R49Y6LYBfGgoR+XSZMCksCEF2lC8f50LEDLJ+Wo6inLPAgduwK/g8ZZ2TeNjqRGG2znW
         3uFyRvWwvXDo5ctdKGjfc/lsF+lcBwR9FEr8Rhq5YnA/I894pBSCApJPBsEb6y+6fbyH
         R/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU0zTyy6HRvAMcq60UOr7dc0+G1FNJlbLNhCyUNaLAkNePRoPw1J8vLVHkmfOUaQLWXSfoTyAklwvKW@vger.kernel.org, AJvYcCVKbNl1p1dJUHHeUwTbYko7Bmmzr0L7yxiMUgeOlIGjbD5QCrE2Xi9AE0tIECgHwjYqqJQkXiXQ5Sb7qsBNRvWjeJ0=@vger.kernel.org, AJvYcCVO+y5/vUn4cZC3nvwvFeXDpuo+IjAi084BNDD7jLzPedsH2BIHU5cdl/cRaGqblsKRrNhXsyXPpZcaDRF2@vger.kernel.org
X-Gm-Message-State: AOJu0YyQN8ap3WoTFA3G+u1z8Yzui80+oMnyjDWz6aL8IC7SN9NTpDGs
	MGAU8fTzuJ+okDLqhwxtAzIwVvl+WceV4bnpnQE2oeBMhtavqvcggufEMtJ0ICGvH4jbkMF+YjC
	anoxRGKxOrWlpWsnYWUD2ZsuaxIrFnFx4ZyEs
X-Gm-Gg: ASbGncvXnCnfoyVgaIjHYv2f9vfzpQ/pVyxv1FgnIgBNEoCGa5tUNrD2XRNHHwzd+gT
	Ps641TeL+Ky+xXCOqXPHUPvOLMa67Y81RxQo13PFcA/V/Fvqn8UUBwjFOggUS3X8ZLwIR6w7MoT
	lAsSZBG3Trn6hbzekK5yPHT1Ny9/mGHyvWRkjRVkxty8P/sccHFYHSXNbXRluSERE/Qo9IYvOKn
	AWXBA==
X-Google-Smtp-Source: AGHT+IHrZhqPwn/cmzcp5cTvZfKufWUmScOM5Ycy0tWU/yMacmzrQvOiORCMOcY73Blvy+g8BiLxCzZXmUDqdhXVzk8=
X-Received: by 2002:a05:6000:290b:b0:3a6:d7ec:c701 with SMTP id
 ffacd0b85a97d-3b8f41c8278mr2015575f8f.30.1754493688799; Wed, 06 Aug 2025
 08:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250709160819.306875-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXu+sYNO2=QU+9e7E1pMFpgWBPEh_VoWgVPb-5aDG6D_w@mail.gmail.com>
In-Reply-To: <CAMuHMdXu+sYNO2=QU+9e7E1pMFpgWBPEh_VoWgVPb-5aDG6D_w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Aug 2025 16:21:02 +0100
X-Gm-Features: Ac12FXyHRNqw2UamgGxbwVkgbuVIjj0ApqTYSanctqwRDOOgjNgu4YdixwkGDNs
Message-ID: <CA+V-a8tkPVoe1Q0cSdzjTMKyrdkVsJnUzXBRvb0DO1s-h5zrxw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] pinctrl: renesas: rzg2l: Unify OEN handling across RZ/{G2L,V2H,V2N}
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	John Madieu <john.madieu.xa@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Aug 6, 2025 at 1:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Unify the OEN handling on RZ/V2H(P) and RZ/V2N SoCs by reusing the exis=
ting
> > rzg2l_read_oen and rzg2l_write_oen functions from RZ/G2L. Add a
> > pin_to_oen_bit callback in rzg2l_pinctrl_data to look up per-pin OEN bi=
t
> > positions, and introduce an oen_pwpr_lock flag in the hwcfg to manage P=
WPR
> > locking on SoCs that require it (RZ/V2H(P) family). Remove the hardcode=
d
> > PFC_OEN define and obsolete per-SoC OEN helpers.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > @@ -270,6 +270,7 @@ struct rzg2l_hwcfg {
> >         u8 func_base;
> >         u8 oen_max_pin;
> >         u8 oen_max_port;
> > +       bool oen_pwpr_lock;
>
> While u8 and bool do have the same size, please keep the bools grouped
> ogether.
>
Ok, I will move it above `func_base` member.

Cheers,
Prabhakar

