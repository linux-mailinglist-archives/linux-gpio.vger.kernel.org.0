Return-Path: <linux-gpio+bounces-24039-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E16C7B1C879
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 17:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6DE16C730
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 15:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB632290BBD;
	Wed,  6 Aug 2025 15:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqNcQ64H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D791DB125;
	Wed,  6 Aug 2025 15:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754493243; cv=none; b=Bwm8vhM6RMBV10lCZIehEwtK5K+HV9TcrPGHNyJiEWqEZ0mKNRakapb6BsbWjCEzZ9tRP2j9Z3shvqR6W+Yi3DJq4ZeV39UoUAREiMz/mN07MvCcNjow0rAPAac+0ttWlXyGTKyiGtJ+pTsTik6zzxMaqmUiIhBDEcQg6afDdVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754493243; c=relaxed/simple;
	bh=9ERol8VdA/XQ7xbJUduOEd56Sme57asyPVQgVtoHoxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvgYxUqp/M0t/8038UWextzNJucsdnnKcsb1C6ZCCYHf+wg2p86TyxIC0sS4Zrf+i6W5Ibhf3CWQt2FefGiq2yyt7J/c++MrrHV/LOWkBNI6+2JINEBwlSYnJQtp49tVxdkNjQ9S1fwK9PL8TmLjFVzN8udUDZrJQTBmwjyrmf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqNcQ64H; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b790dbb112so3842248f8f.3;
        Wed, 06 Aug 2025 08:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754493240; x=1755098040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvJPvdgfRcVChw2kImar7s1Fo8bzb7WBM+Qe+kX4BGI=;
        b=TqNcQ64Hr/wWQTTWirmgIZ2JemIGwauWoNigqaX/QVzs7OI59pHTql0QBGR8fHRXrO
         LjRzF19jGfogxd8g1AOOdKCOytPWvC129py9hMARmviK5Tx7RhXEoDuTMXuaSaK05WkR
         fE4gBc3+WoV7U2elK5wrmyD8A3iOpapUz81m8A6FlceTgo+l5eLaq2OXqwdDYH85Mq+k
         xPH1ejGUUqEKcw57khewq9wuciBKXlK3FJ7UNPEYN17ayGLQmUMKNRQeLCGqIspy82+N
         7DirmhcnkpGc6hrDM+syo4cB5xPwK3Xyskc54qnndXLnnjvaE897ToVxJrIcKE7me2Eu
         Pe7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754493240; x=1755098040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvJPvdgfRcVChw2kImar7s1Fo8bzb7WBM+Qe+kX4BGI=;
        b=BIzjLs2G0/DSR9ovc5qO7Ut5nGg8I1AVpdX8hfVpyDhDQdDLOjfCPz2UJGeSHuXqqn
         xIkIaOG/geNWsAHOegvRdin/48nxnI2uVO9SHN9I/9ljIdUBB+FtoKYFzQYWkYqLOdY5
         3B/fq50pQx6xLO/E4YwcSor4PavIouhYy17Qjp9i/tX8SGONT/xmGm8mqw+u5A7zmHLp
         j3EFok1F8xUdtNRC5NAhANXqKwz0g0fGY4Qi6nz07nNa+HKrKDqoWRhutkK6VkxkmdyH
         HTtCs8W7FlEm8vM7q7znCxCxlp32QiszOtJICqWkApS66PMZXFpEIQwtF6TFt3pvnrsj
         MlzA==
X-Forwarded-Encrypted: i=1; AJvYcCUUcx84goJSZVAff1J8aNObMo+ArEctYFHCZckB8dqln485R4OUP80lwUMo28nPNfbfKW1fZSZqeKF2D2rcq9Ab6qs=@vger.kernel.org, AJvYcCWRcbUBWg/rn9C6YJsIBYPO6O6/y2SXC7zMSdjYI7YxqIgOUPlV8gSxHX4fjSBVwDAeWVSMmr/1nQY3yh+J@vger.kernel.org, AJvYcCWRiErJXb+zHTpwL4la/XrULUlqrU1kajtxiX70r6D+nh4mmHzC4lkJBv99tLDrslF1KHCDLPHEjEFD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2tsyIQ2Gp65MXrO4Xx9lJ6IL1Wn5Z/KauUP0W28tm/Br29Rn
	vLOB9kMRYf90nPpBnlTE4MuUqnkgxroZQFLpzJ+PtMpJnHoQtwOn/AH8jN3SxtA/P/aPu4yweVh
	1cqy9xIwoTgQdN3GG2aTL5p4cYgGfiSEKBA==
X-Gm-Gg: ASbGncvdc0+8ObUYPHd9JlDV4N6eURtDCkKrXHnIZ0BPJRKII3f3KwwOZncGH9vYEUM
	8T6XZAA8bnSwMCMFMdD6REVZ5gTOW3JY66WhjAqoWOtKLGH3WCHoBCKpWzZf6xEObBZ3gaioW/P
	Nc8Y1sZR5r6h3NTs29wuJUcUV/sE5mbHGckLSNYBXfy7W/oeoGySIzuVgyu4LWLreFk3lucd14R
	DH9qQ==
X-Google-Smtp-Source: AGHT+IHnkUocwrhOP5a252hhVoh+2rVNWQu9TGkLdl8izlvkc28Zzj5XsLklolyVAQzmgEPJfiYPKkYbg9BsOModMb0=
X-Received: by 2002:a05:6000:2c0a:b0:3b8:d15e:ed35 with SMTP id
 ffacd0b85a97d-3b8f4198e56mr2932111f8f.23.1754493239886; Wed, 06 Aug 2025
 08:13:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160819.306875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250709160819.306875-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUGY6tVb-WayHL1c=HUNgnnHA_UHWLr7=oYV9Ah2F2HFA@mail.gmail.com>
In-Reply-To: <CAMuHMdUGY6tVb-WayHL1c=HUNgnnHA_UHWLr7=oYV9Ah2F2HFA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 6 Aug 2025 16:13:33 +0100
X-Gm-Features: Ac12FXyArZ97mtraOrLoJ0JSdJ9r-WMLcqL1uyvaDjz1_-ewx6v5cP1R7N0SODI
Message-ID: <CA+V-a8v8VQ_wBv2zHKS+LTrAM1oeyNWauqda2W-Ahvsco257GA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] pinctrl: renesas: rzg2l: parameterize OEN register offset
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

On Wed, Aug 6, 2025 at 1:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 9 Jul 2025 at 18:08, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Prepare for supporting SoCs with varying OEN register locations by
> > parameterizing the OEN offset in the rzg2l driver. Introduce an `oen`
> > field in the rzg2l_register_offsets structure and update rzg2l_read_oen=
(),
> > rzg2l_write_oen(), suspend/resume caching, and SoC hwcfg entries to use
> > this offset instead of the hard-coded ETH_MODE value.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>
> > @@ -3164,7 +3167,7 @@ static int rzg2l_pinctrl_suspend_noirq(struct dev=
ice *dev)
> >         }
> >
> >         cache->qspi =3D readb(pctrl->base + QSPI);
> > -       cache->eth_mode =3D readb(pctrl->base + ETH_MODE);
> > +       cache->eth_mode =3D readb(pctrl->base + pctrl->data->hwcfg->reg=
s.oen);
>
> You still have the eth_mode name in the rzg2l_pinctrl_reg_cache
> structure; probably you want to rename that as well.
Agreed, I will rename it to oen.

> In addition, it is saved/restored unconditionally, even if regs.oen
> is zero, which is the case for RZ/V2H, RZ/V2N, and RZ/G3E until
> [PATCH v2 5/7].
>
Ahh right, I will add a check in this patch and later drop it in 5/7.

Cheers,
Prabhakar

