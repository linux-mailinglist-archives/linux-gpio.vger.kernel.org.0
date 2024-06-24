Return-Path: <linux-gpio+bounces-7638-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBCF9146F4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 12:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A4FC283C27
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 10:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711EC13665A;
	Mon, 24 Jun 2024 10:05:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE92134410;
	Mon, 24 Jun 2024 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719223513; cv=none; b=bdS0mPLWnqMMFMkQGUq5ka6NXWeT+Bl+aC14UfEMZ7cRXCjVlckuSJaNDp3bSFe/wQ4lGKCT199GiditRM3k1P/4bKwEEKUfbx+tTW6SViSP8lH4vNuzR12xxVFZgk4gXAIC3KWqYeGfvEYWjnk8vsQrxpYTA6stgyYJdeSzogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719223513; c=relaxed/simple;
	bh=A7Fkj4mBCK5mp/zDLv2TuxMKh/LKlaVUT5j1NNeP9x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueJhFPijpt9mw3b+43qy7obemHsqPsSTbw1EbcM8bz7NQc5uEBkEy49xjINBa05AMhqIEDBcV4Ki3g+/T4RucsklQWPl4H1CD9IOX2PUnaHVUYSeGUExcD4uChKbmArbrdasjzfm8sE64/rggFR67Vos6SKFj3RQuwJP+Xp1gCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e02da9b2db7so3614801276.3;
        Mon, 24 Jun 2024 03:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719223509; x=1719828309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjeZCMf2tIUIgStBOY6HxHTekamYnDUVhCcCFqii2pA=;
        b=naJMCh2rkdG65jJeFWJlM66rOb/XWfLIIBLeY6Uwz7yo+nyWhJYhnhA3o8LBeBHBy1
         5IIGeYLOi+s/2US83DcVR30obGwsHjzfJqqI7eCGWW6+TftgkAUjdeN4Jl6FRJxIhiTF
         1K2ybOm6tT+3RE3aJi1HYhDQwLOUDfDCTRt2dVK9UeCZakN5X/DYa3DVPFceeWw2rCuk
         n4WDF0NXbtHpdUeFDM3yLvJ/700khubhLHYcoStB04/BhrIwkIYltACNWg2f/PFXzKKP
         gJ2HDHnQZaVDFDZgaaEAppZZS/QxqmCzdoX3qpG94snk37pOQSr7UAEUORneZ/VLSiXE
         W62g==
X-Forwarded-Encrypted: i=1; AJvYcCUE6ZaWtbU4QtKvig+M674lXpR2amTh/l0aRApsPHpBRoj7XH2ljN/C45FwQeTRDexku/SIqgagJDXiYDK29+QbehHl6Sna7Zs1kG9WQCHzHrRJ+MWmSIe6dxX2yg8PHljWxcI31t6SHilON53wAlrPrrKGmkMdQIrD4HpgDcryAeVxv3/L+c0N0a2v
X-Gm-Message-State: AOJu0YySwrZgPYTJfRRBLuzL3tFoZQCDp9fSewojgVsaPCP+9dHYw1hr
	5CQG2gRCkE312aLMtgVrwT3XRieZbWp6MjDU7qTBpn3xlCKx+r6uCw4gsVV0
X-Google-Smtp-Source: AGHT+IF5Fu8GfgflM96x7irF6dr1JRaHjDrM72MKILWv5cFGAJEkWcPhSbUQbExxlQdABwl8wq1NMA==
X-Received: by 2002:a25:a28b:0:b0:dfd:bd4d:c0d3 with SMTP id 3f1490d57ef6-e0304042deemr3569599276.58.1719223508697;
        Mon, 24 Jun 2024 03:05:08 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e6116b08sm3081467276.13.2024.06.24.03.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 03:05:08 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-63186c222eeso37677567b3.2;
        Mon, 24 Jun 2024 03:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEdK4K71Qrm8zsVr4L0+uVdmE5yIeqQMFftyKFpu71nIULk1/2Tb5VW9maImuT9myPL5d5Cz+xm42d/pGTkADz2flkF5xzIZFcr0UeO3euRZF0hWyGzIdY7HDIbhb5v7R0qg/BVKMOdKFPI99FvHsg4QMFBiTkn6rGg+lsMGQnN0aOta8h50ei0wHJ
X-Received: by 2002:a81:7241:0:b0:618:1034:f4ef with SMTP id
 00721157ae682-643aab82db0mr33174677b3.16.1719223508049; Mon, 24 Jun 2024
 03:05:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb6b85722d80d665779e3043d1499c4fc38f0ff3.1714562004.git.mirq-linux@rere.qmqm.pl>
 <CAMuHMdUy+e1vQRBUfo2paBJi4pro-tKf9hOe3YaddcB=OtRfJw@mail.gmail.com> <ZjOJyGQE1ze2WXh8@qmqm.qmqm.pl>
In-Reply-To: <ZjOJyGQE1ze2WXh8@qmqm.qmqm.pl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Jun 2024 12:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWKcxh4TY-4=drdTDegUy_WYHFXm6g7dWaXH_Yh0j+Nvw@mail.gmail.com>
Message-ID: <CAMuHMdWKcxh4TY-4=drdTDegUy_WYHFXm6g7dWaXH_Yh0j+Nvw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas/sh73a0: use rdev_get_drvdata()
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micha=C5=82,

On Thu, May 2, 2024 at 2:40=E2=80=AFPM Micha=C5=82 Miros=C5=82aw <mirq-linu=
x@rere.qmqm.pl> wrote:
> On Thu, May 02, 2024 at 09:56:39AM +0200, Geert Uytterhoeven wrote:
> > On Wed, May 1, 2024 at 1:16=E2=80=AFPM Micha=C5=82 Miros=C5=82aw <mirq-=
linux@rere.qmqm.pl> wrote:
> > > Replace `reg_data` access with the official wrapper. The field is goi=
ng
> > > away soon.
> >
> > Thanks for your patch!
> >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202404301218.URkWO6dj-l=
kp@intel.com/
> >
> > I am not sure these tags are needed, as the issue is not present in
> > any tree yet?
> >
> > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Do you want me to pick this up (for v6.11), or do you want to queue
> > this with the other patches from the series that removes reg_data?
> > Please let me know.
> > In case of the latter:
> > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> If you're ok with it going through the regulator tree, then I guess it
> would be easier to manage as the series would build without observing
> additional dependencies.

I was wondering how the rest of the series is doing?

If you want me to queue this for v6.11, the deadline for that is
this Friday.

Thanks!

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

