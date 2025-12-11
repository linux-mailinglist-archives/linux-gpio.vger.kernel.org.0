Return-Path: <linux-gpio+bounces-29429-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEDECB4537
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Dec 2025 01:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B39083002141
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Dec 2025 00:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51E8295DAC;
	Thu, 11 Dec 2025 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIvjmRPM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB935CDF1
	for <linux-gpio@vger.kernel.org>; Thu, 11 Dec 2025 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765411255; cv=none; b=pat7aYtVfOIux5NySdG/Cw20LFOblqiWlVT4Own/UGlEmbfw1WwZPXiDk9uVZETEt3xcROm3BJ74tt2+hoOkfCdpJXGMhWFlr3GAA5ViAKyWAkqSBOWknes5esElCYPgosOTv+iXE/QCYfCmwMCdq2/3SNWGsGrRJ1HsS/9yjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765411255; c=relaxed/simple;
	bh=MUedD+3YAiiPswMjQy2loynuhb6leoZiy1y3+RaZw9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Irxn/fvru+vw8RtuYb89lC/RBwW5vQZdy2B+oJzQnno1VP1IGk3847LU0ZVvsbkiBVvDoO4EWYnJnDT1wE84VFvj2Vfpo2khfhSbh7m2Zldt4xM+S1HxIwaLvn+6/orXtuqi+wwuTRAERB0qe2IDJH8/8ceWqX8jncI1jo2dHsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIvjmRPM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A68C4CEF1
	for <linux-gpio@vger.kernel.org>; Thu, 11 Dec 2025 00:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765411255;
	bh=MUedD+3YAiiPswMjQy2loynuhb6leoZiy1y3+RaZw9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sIvjmRPMkXbmF/JBrzCZG3h2tcvc9PipUea8WgVjqrFYoXI6XeerTOraHjzVTBBba
	 6dpk7NHP2XtH/X+Xmxn98OmepMIHGqzaEQYBlh3YLY5q6bV+YBO4jd2yqLHGTBifYe
	 kn5j96onLrQs3aJk51ZajErCTEGGJzem6DkkP1xA92YOZpaiExnXqzDQDG3qzXBoLS
	 fY3JBub+ek+LapHYIA84yxKZrnisV2BcWmmfJVE/MyHdHGM1dKwjTt6Ur/BirPLr0t
	 ziKK2yVt9A45VwuZb2dpNyQuR2sEHzbfU2I4H8V5eiI4mlx/ZIPH9Mnod/OLLS2Yw5
	 DY0P14sbN37hA==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b5ed9e7500so34457385a.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Dec 2025 16:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7J1iohNGMpkdDS7iEC0gYbLtPpEj8gsZtIDV0v7MTlq3neBJEfjv4UhZSygndKA/2D6pCX+7AqnfA@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7gIZWYs7vCAH0m7ypBJf77CPzwgEcqy3kOimLNkNulIfFj+c
	yXjalTsvVcTMrhyPdiWl4+ipUuPmhlUZlbmG3Xe3W8UCNnq16NqT3cZi5gdZsiTWlH8WrWRKl0U
	7jCElh5gaf8yd+8znEnB4mFfblCuGHkw=
X-Google-Smtp-Source: AGHT+IF5ILxbPzEO8srko4P9caJRjZ8oYRRPnfGYYyAQGSJvhbE0FCvelM56QCi20m9DjJ9S531E6IS5WiEjEjZOdVE=
X-Received: by 2002:a05:620a:1989:b0:80e:3af7:7a0c with SMTP id
 af79cd13be357-8ba3a471ab8mr569354985a.43.1765411254276; Wed, 10 Dec 2025
 16:00:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014191121.368475-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251014191121.368475-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251016-dimmed-affidavit-90bae7e162aa@spud> <CA+V-a8un1cF=acNjG=79_v7oaR8gzBQ+3z1As8AqrJnOnk-OUw@mail.gmail.com>
 <CA+V-a8vq2EvTb_hXxRzW_Rbp+BPLSaLsEVkvaTjc1zRin-RV=Q@mail.gmail.com> <20251208-headgear-header-e17e162f0f52@spud>
In-Reply-To: <20251208-headgear-header-e17e162f0f52@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Dec 2025 01:00:43 +0100
X-Gmail-Original-Message-ID: <CAD++jL=rp=_J7vN4E9hUqu0Fa4H+1E1EhMFAe79Tc8jMtNHTcA@mail.gmail.com>
X-Gm-Features: AQt7F2qjFqdAydDyHnMgE08WSEx2LkQdlBBvzuD4aPVzhMGo4v0plMBG0U8lGBA
Message-ID: <CAD++jL=rp=_J7vN4E9hUqu0Fa4H+1E1EhMFAe79Tc8jMtNHTcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Conor Dooley <conor@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lad,

thanks for your patch!

On Mon, Dec 8, 2025 at 7:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
> On Mon, Dec 08, 2025 at 10:36:04AM +0000, Lad, Prabhakar wrote:

> > > > > +      slew-rate:
> > > > > +        enum: [0, 1]
> > > >
> > > > What are the meanings of "0" and "1" for slew rate? Why isn't this =
given
> > > I'll add a description for it (0 =3D slow, 1 =3D fast) and the same v=
alues
> > > are programmed in the register to configure the slew rate.
> > >
> > > > as the actual rates? The docs surely give more detail than just "sl=
ow"
> > > > and "fast".
> > > You mean to represent slew-rate in some sort of a unit?
> > >
> > Based on the comments from the HW team, there is no numerical
> > definition to represent slow/fast It only defines a relative
> > relationship.

Then describe relative to what, so we can understand when to use
which setting?

> > The current value is determined by the load on the external circuit
> > and is not affected by the choice of drive strength.
(...)
> Remember, drive strength is the current that can be delivered through a
> pin, not how much it is delivering at a given point in time.

This seems to be the core of the misunderstanding here.

The setting defines the cap. How much current *can* be delivered.

If the pin controller had a fuse that would bust if we delivered too
much current, this would be the grading of that fuse.

It's the current where the driver stage(s) stop pushing in more
electrons, it's a very real thing and does not depend on what the
circuit look like.

Pins usually have protected driver stages, so connecting an
amperemeter directly to ground and driving the line high would
actually give this value.

Yours,
Linus Walleij

