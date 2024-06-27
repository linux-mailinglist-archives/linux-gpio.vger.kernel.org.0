Return-Path: <linux-gpio+bounces-7770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5891AC39
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 18:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4A1DB26315
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 16:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8AD199254;
	Thu, 27 Jun 2024 16:04:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AC01991C3;
	Thu, 27 Jun 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504294; cv=none; b=W7g1G+aPwJUWAEorbkThg82pgRyVC9BHmD/vwuycDsUIrII5/xCgWZUEgEcBzDilKX1OktaASXraVFY1M1dsB4OmugjLy1VEUxQxoQUTX05Qh/jFUqUjHEzuMGM+P4aXem+0W5FS6B0rdfmn8IIPohqeH2l7ZqORY3ZKeNyuI7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504294; c=relaxed/simple;
	bh=WXMv8DGovo7IhUKMrCSpcT9xvNeg0bJGp5ZjNFLkin8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJG9pNE1vVDb0t+PvQdAZ1KfSz+L6B6/Tg20s+LxHhLkQ7BXqeGK4fXTERMZKm3mWHzBbbJJgEHymiK3a+x4hvWJGSXH3I/aDWoT9ARGsZlj3T3v2N5ycvka3+/Raxhj5AsEuAInITSdnwFS9E/OW3NfnXWBFAyhg4PVf0k1KPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dfac121b6a6so1526598276.0;
        Thu, 27 Jun 2024 09:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719504291; x=1720109091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJX5K/ZEa2Ih0T0xqVH52hWcckqFO0GZ7ag7aCkhSho=;
        b=Rce2Q3wUblHWkvfOUX0rLO6P5GtTbuTiDIkiOlyHyd6MztcxRE4oLeVgXNNH2Jfvrc
         ixDev1U55P/KCqBbqObEJOjfGgkghFechmzZHdW3pm7bOn7EINylavNa52/DPqBYNYdW
         9O2ioXmaPyLnuhtjv299Qfs64Tng7npm/mGQjCeYXhmBVmf8StojlVR8kfaFHt6K7TNt
         9kVYzsoEFptopCk6Ho/LXqCeh/xFAZc0ha2wMYbWF90Dc1CPHrtzgd26/3VWUErNJT1F
         Q+XlrTx7HZNl1tiBs/V9drXpltkn9lzElhJmeHxiVXSeokkRZUKtaCI+cBD6mZWK6m/C
         tAfA==
X-Forwarded-Encrypted: i=1; AJvYcCWebe3fr1Nnn8aP2/JvoyNL5pZGYV08iwBkITrPShQrJRs9T7UBldfi2WGbjkjk+xTCl/2wN3PUxrNLF8HONGLb4MWg6dyNh/a+5fk5RWnzc7TKvC8ZTplkWKOWxL5GVwRs3LFreWZLlwtZA4JwGVmTc8+bwBb/W706/73ISbe7lmN6glyjSxbiZNkW
X-Gm-Message-State: AOJu0YwAhCAPjx9kbp2N6UsYUu5zsD+x9ROMipNHQbnHV7qC5MxqdSCp
	M7t8sWNhcRQCaMmxN/8XStCloakc5TN4YrtfBj65gd5CF93pTpw9yWu4dCUF
X-Google-Smtp-Source: AGHT+IGM0wcwkCh1pM7r4umsMK0lxqyt9xLM1Jxb+pu7XYtZIzhIQ1srRD5yUyuqk2DlWwNGrBNS+A==
X-Received: by 2002:a25:ace3:0:b0:e02:c2b6:8733 with SMTP id 3f1490d57ef6-e031bcb6d99mr6857013276.15.1719504269460;
        Thu, 27 Jun 2024 09:04:29 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0345bd786asm302260276.46.2024.06.27.09.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 09:04:29 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-63bce128c70so16270957b3.0;
        Thu, 27 Jun 2024 09:04:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWoe/VjaQaeVr2dKmV0fcGDJRLx1RlXHRjHiiWc7ORRQRRN9/lMB9/I4Qm9C+Up2Fv5+y/1HVvi9d9jVw/+Od5lP50NwwwHRuUR71yNt3tvZsLwdNv+1NX7kuVlLXHRYS8moZKpz0egsfIuRA1ftJSwpzcP2yj1mdXqh27nb0NGTQWsOCZ6FbbQNTCe
X-Received: by 2002:a05:690c:112:b0:618:498f:9dbe with SMTP id
 00721157ae682-649a06c6660mr16920317b3.10.1719504268794; Thu, 27 Jun 2024
 09:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb6b85722d80d665779e3043d1499c4fc38f0ff3.1714562004.git.mirq-linux@rere.qmqm.pl>
 <CAMuHMdUy+e1vQRBUfo2paBJi4pro-tKf9hOe3YaddcB=OtRfJw@mail.gmail.com>
 <ZjOJyGQE1ze2WXh8@qmqm.qmqm.pl> <CAMuHMdWKcxh4TY-4=drdTDegUy_WYHFXm6g7dWaXH_Yh0j+Nvw@mail.gmail.com>
In-Reply-To: <CAMuHMdWKcxh4TY-4=drdTDegUy_WYHFXm6g7dWaXH_Yh0j+Nvw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jun 2024 18:04:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb_qLbZJR7ngNZkOH-XRJ2hYpmnLv3NJp8V5_=tjKS0Q@mail.gmail.com>
Message-ID: <CAMuHMdXb_qLbZJR7ngNZkOH-XRJ2hYpmnLv3NJp8V5_=tjKS0Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas/sh73a0: use rdev_get_drvdata()
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 12:04=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, May 2, 2024 at 2:40=E2=80=AFPM Micha=C5=82 Miros=C5=82aw <mirq-li=
nux@rere.qmqm.pl> wrote:
> > On Thu, May 02, 2024 at 09:56:39AM +0200, Geert Uytterhoeven wrote:
> > > On Wed, May 1, 2024 at 1:16=E2=80=AFPM Micha=C5=82 Miros=C5=82aw <mir=
q-linux@rere.qmqm.pl> wrote:
> > > > Replace `reg_data` access with the official wrapper. The field is g=
oing
> > > > away soon.
> > >
> > > Thanks for your patch!
> > >
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes: https://lore.kernel.org/oe-kbuild-all/202404301218.URkWO6dj=
-lkp@intel.com/
> > >
> > > I am not sure these tags are needed, as the issue is not present in
> > > any tree yet?
> > >
> > > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Do you want me to pick this up (for v6.11), or do you want to queue
> > > this with the other patches from the series that removes reg_data?
> > > Please let me know.
> > > In case of the latter:
> > > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > If you're ok with it going through the regulator tree, then I guess it
> > would be easier to manage as the series would build without observing
> > additional dependencies.
>
> I was wondering how the rest of the series is doing?
>
> If you want me to queue this for v6.11, the deadline for that is
> this Friday.

I'm just gonna  queue this in renesas-pinctrl for v6.11, as it's good
to have anyway.

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

