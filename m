Return-Path: <linux-gpio+bounces-29484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E81B5CB8ADA
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 12:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60C4D3010AD9
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 11:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FC631AF07;
	Fri, 12 Dec 2025 11:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAaP+jy4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83671314A9F
	for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765537922; cv=none; b=dzQ4Dc5KkTCV3EkX+vSgMVJ1tAcxumwg4ivaKQ5Vi9p+MXRAxwhisENEpvbSkwcVFamU8bTKE3j3AA3XF75hQRawVMuyvDjz8VTWPW8NFdLHD4MtadYj5nkzfjSdgRBH0acdOobBdmHdxHuGP5j5Zu3OE5eZqDXUOMdWMGpL1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765537922; c=relaxed/simple;
	bh=2gQhg0m52l1J+h6DLsaszgrLcV0l+qbb8vREvFeUzYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=losHausV6UwG1lMCymzGThhGJycZgMR2hPcZRuX9P7M5sMTRBkszh2Drx0bcHOmJb54wZzv+2tKXKlQwI5DNZdUUHEEl5970VsJy0uNE0pKrfYHLh7FWDxf4QcOJSsLCiCRUXiCkxU6LvAcnagifDOTIfpTmgmA1j2nm+k/YRoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAaP+jy4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e2ba54a6fso412452f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Dec 2025 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765537919; x=1766142719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owa4AYkVBH6Oi8vgGHHw2NSIxT8lUbiInmR/cjzPZ24=;
        b=DAaP+jy4zpTrIb3E87wx4Y8znHkU8o2ZDo66LwXuQdxkR3ZHfnpPYk/NL408laJh/D
         dd+VhiEvJVCmYueuNIRVGO4vmPnpS/IQXVVPFmMDBAX0pdTWYIf7izzt05vDwPOONGVt
         ZPaSUK5uS2b9GrLz9iDisTVlS38IkNKR2gRZk/WDnmzISgYAM+bsLE6H+Itr+R1pzqZi
         ruf0lalKRAREwjYmJHLmtX8gKPj2b/DD8m+l7OKS5mldfZznXzY3fiEqYesMxqAaFRrM
         /Pzs6g1pg1vTNaov/HeFFP3pMvXpnMduAY8uJabS2fNRDlqS2aYfFYI/R7+b5zy+FKSj
         HfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765537919; x=1766142719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owa4AYkVBH6Oi8vgGHHw2NSIxT8lUbiInmR/cjzPZ24=;
        b=du1O+6t4YDU/0qzGSTRnlU91w9oYIqKarK6HEAXd9iXsDwEnvWZGOJGkK/qQ+4opmB
         zyqv9oQ2jJ+k7DiGiqr8lRbiq2cniO2FmcGcrz+20G4igyCYEv2pkk+cO/mQlO4LcV/k
         ombfXh3UsTsMt1qC9IUZedD5OShgnXhJjaze58IG8HlyAGjEsGA75V+D0D0TIBV2wzr8
         RCkMD9DtHZSkaXiU0xddSP4ka7qmBSEwwfNmv8jCPKBd2ogwZNynRRKyrN3hRc8+ZeMp
         qOtn+Sl2NhviBjnFQG/NLhWvwxbotviTv+9ltEb5QUFsvlOoYIEVRUGE1otg85/M7rMA
         3M/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSie/fciZ4HjVguFx3MvICtU1/VOgqNwHKvJVH66hsbKdUJ2XzqzMDQ1/8ovdwUf+4mPsbN2FrBJcc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7J0C+DHBh81EhKFiRGXSBMn3yOX0jCpAaw7Uf93MpE78cmAi
	HGohJbD/XSqeDPjOnok9K2mbySgj3W4u/7yjd+CyMY1TwcQ2JWgVHn7FZ+xFiFggZTQM5GyMjpc
	0YfB28AZhAM1DRAqzgqfx1soqAKNZj/A=
X-Gm-Gg: AY/fxX7rwkvfgjcuk5gwptBvGAvD6n+Vp7kFiIgxwsgLkb2RiHL4kI2K14meww0gKlz
	ykMbnueWIDPTPP7giHiuCQQS1xYQUaKvVIkxcq+qRtR0yFtPqEFHeB6cshQjRxMbOneP71QgXTD
	p5ZwcsC2f5EcBWpHKWi80F0v1e5pX+dx432gVski1mMgqODxuqi7PZy5swCMWeKhSdTNJwR31HZ
	Jvx7VPogshscqQLcjhwEGerzxy2CavlZBTWOJRhO2BX71fChP8jIHeSuPzir1ljSP5aj7hieFaJ
	Wowls74h0AtUHh2Yt1amzxXqw/g=
X-Google-Smtp-Source: AGHT+IH/n6HDi9XTcEJRBWKGIz10PedulThRJ7x4uv71nP8DoCtZCymA1rkQJc0aCtpHQMfFqqVYkRiC9tDijK7BBRo=
X-Received: by 2002:a05:6000:3111:b0:42b:3e20:f1b2 with SMTP id
 ffacd0b85a97d-42fb447ae67mr1628114f8f.4.1765537918745; Fri, 12 Dec 2025
 03:11:58 -0800 (PST)
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
 <20251208-headgear-header-e17e162f0f52@spud> <CAD++jL=rp=_J7vN4E9hUqu0Fa4H+1E1EhMFAe79Tc8jMtNHTcA@mail.gmail.com>
In-Reply-To: <CAD++jL=rp=_J7vN4E9hUqu0Fa4H+1E1EhMFAe79Tc8jMtNHTcA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Dec 2025 11:11:30 +0000
X-Gm-Features: AQt7F2o0nVnOaR9-qVNKrHWb9R--8lodJV52Di2Ea3o66whanMp8URPFhYip6eE
Message-ID: <CA+V-a8uEk_SYcbukBNz_sm7-giuGeg8V7kMUtXsiOYfbFFR90Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document pin
 configuration properties
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Thank you for the review.

On Thu, Dec 11, 2025 at 12:00=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> Hi Lad,
>
> thanks for your patch!
>
> On Mon, Dec 8, 2025 at 7:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> > On Mon, Dec 08, 2025 at 10:36:04AM +0000, Lad, Prabhakar wrote:
>
> > > > > > +      slew-rate:
> > > > > > +        enum: [0, 1]
> > > > >
> > > > > What are the meanings of "0" and "1" for slew rate? Why isn't thi=
s given
> > > > I'll add a description for it (0 =3D slow, 1 =3D fast) and the same=
 values
> > > > are programmed in the register to configure the slew rate.
> > > >
> > > > > as the actual rates? The docs surely give more detail than just "=
slow"
> > > > > and "fast".
> > > > You mean to represent slew-rate in some sort of a unit?
> > > >
> > > Based on the comments from the HW team, there is no numerical
> > > definition to represent slow/fast It only defines a relative
> > > relationship.
>
> Then describe relative to what, so we can understand when to use
> which setting?
>
I have made a query regarding this to the HW team. I'll respond as
soon as I get any feedback.

> > > The current value is determined by the load on the external circuit
> > > and is not affected by the choice of drive strength.
> (...)
> > Remember, drive strength is the current that can be delivered through a
> > pin, not how much it is delivering at a given point in time.
>
> This seems to be the core of the misunderstanding here.
>
> The setting defines the cap. How much current *can* be delivered.
>
> If the pin controller had a fuse that would bust if we delivered too
> much current, this would be the grading of that fuse.
>
> It's the current where the driver stage(s) stop pushing in more
> electrons, it's a very real thing and does not depend on what the
> circuit look like.
>
> Pins usually have protected driver stages, so connecting an
> amperemeter directly to ground and driving the line high would
> actually give this value.
>
Agreed.

Cheers,
Prabhakar

