Return-Path: <linux-gpio+bounces-1934-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EC78203D3
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 07:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70813B21621
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Dec 2023 06:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CE417D9;
	Sat, 30 Dec 2023 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rg6ANxG8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1D223A5
	for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 06:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cce70ad1a3so20989671fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Dec 2023 22:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703919025; x=1704523825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/xJpDluF9vMSNFsA15Ny0kWATOE5X0H0JeyEDwxxk8=;
        b=Rg6ANxG82ox8w8/sfYFZGOJhAHQkeUaJQ90fvuodyJkZiwfc8riC4m5iqfqK0gc9s7
         h3QJCV5gy11yT5KraGQQw9OaxeMwh6ymNbPRHqoDAlxKhLgtiUY/d8IoI+fuN4/sTHjP
         SkX+ccwxyeEQ90jOrvMbSVMI7DCwE+6sfELyS5Sab5eSz2+sNitW+G80sW/r1hj3OlH9
         fpeQVyLJQbH6lYA27id0Ka71PiusWB3rAQMaZ5NQTHOPGGAaXecNZE5XlyhuT2ixmSuL
         ND3rHPmErNJvD2K0MIEW2YGIA2AcclJoJO+6d6j0H1Z5IEyFWA4CJqXAAVodcR8FJqf2
         8Mdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703919025; x=1704523825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/xJpDluF9vMSNFsA15Ny0kWATOE5X0H0JeyEDwxxk8=;
        b=ua47wX5mg+9jB0PVrXAkFR6cbCh/PHxNiwG5XmlFD/X0wBy1n07UwShrouLyon3Kcu
         0qBDX72WS6ZS25kMMzM3SdI3CShhsA3Ccuy7M4B2tb9WNKfNWBuJFlL3TZgpOMgpcqJW
         DV9seTiSbEh47N4NsUBb9a02npyTSpAt4kvh/9h8F7HNQCp0IUyheHgkcR1DXu950SIy
         hrhhfAyW0FuV0bObfhRAj6rbsmn0jtCit9CRxxLftVBgSpEegnxLepJ0Ng8SaGZdGv0i
         21pbzIktWqPVU6j2My/cRd0UBw032o7b3+1cAb8SzdHhcdoRD2Qj1KjYUCZh7vUy5RNB
         6/aw==
X-Gm-Message-State: AOJu0YxhVIi0uW2GAaeIxOTrQXt4Hx4CXCR/eU+efazlcoMmHZFdo4oL
	q3Kl0q405yLgZFugjsxu0CZCsKI+U4Ooi6P+TBc=
X-Google-Smtp-Source: AGHT+IGm/fA2VnLDBacWEUsoX72mEq5tiAEfA9oS97837jcJJbzlnFE4lPz51TcFbavtt9XQEfIpDFyJeOGXWDWuZa8=
X-Received: by 2002:a2e:3a03:0:b0:2cc:75c0:47bb with SMTP id
 h3-20020a2e3a03000000b002cc75c047bbmr5815598lja.4.1703919025120; Fri, 29 Dec
 2023 22:50:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231229155837.GA103278@rigel> <CAJ8C1XP2xeTRvJRpvmd8VD4RGYQTH4qWQdMocmNVgRWkmSDscQ@mail.gmail.com>
 <20231230022136.GA19799@rigel> <CAJ8C1XOCdVu=111XP0xAh9g-67zd7v8FKPrtphzZFA4YV2qBaw@mail.gmail.com>
 <20231230050325.GA40096@rigel> <CAJ8C1XPNV0Wn0UEFZas43-9LzWkg2=m0RE+cRXVsvPfgANMC4A@mail.gmail.com>
 <20231230055330.GA47174@rigel> <CAJ8C1XMDjS-7E2huUPcQ9peJnwyeuJHYMWOuFEETwPbrwCwe=A@mail.gmail.com>
 <20231230062933.GA52702@rigel> <CAJ8C1XN71bsBkXgjdq0=2SZuJqs2tONitz0vv_OPzp4na6LofA@mail.gmail.com>
 <20231230064345.GA54180@rigel>
In-Reply-To: <20231230064345.GA54180@rigel>
From: Seamus de Mora <seamusdemora@gmail.com>
Date: Sat, 30 Dec 2023 00:49:48 -0600
Message-ID: <CAJ8C1XODp8FKbEOqreAUQwKdXw=QgFQxF=KYXEC_zpeCSALa1A@mail.gmail.com>
Subject: Re: [libgpiod] help with GPIOSET_INTERACTIVE
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 30, 2023 at 12:43=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Sat, Dec 30, 2023 at 12:36:37AM -0600, Seamus de Mora wrote:
> > On Sat, Dec 30, 2023 at 12:29=E2=80=AFAM Kent Gibson <warthog618@gmail.=
com> wrote:

> > But NO - NOT un-burying the hatchet, not un-downvoting what I didn't
> > downvote in the first place. I clicked a button three times: first was
> > to up-vote, next was to take the upvote away, 3rd was to restore the
> > upvote.  That is my total recollection - honest.
>
> In which case trying to upvote it again now would do nothing.
> I'll bet you that isn't the case.

There's only one way we're going to find that out. Edit your post &
remove "the remark". Afterwards, I'll **try** to upvote it. Warning:
"The system" doesn't allow dual upvotes, so don't try to hold me
accountable.

