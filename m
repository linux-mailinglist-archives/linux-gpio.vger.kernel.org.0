Return-Path: <linux-gpio+bounces-16165-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584EA38A91
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 18:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E5587A1D8F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 17:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7F7229B12;
	Mon, 17 Feb 2025 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rmqFTt/m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EAD228CBF
	for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739813382; cv=none; b=aS1VjrVmkrfSGm+aR19ciHMlOuuSGqIc3xs/88DNGZg2ReQ+zUykw4Ee/gSICwNv3rdkxzD9QlBS4A+1FQiD5h/00qD7HGrV+fRsCkRuf7DrdiCOiDiQZaDAW4Xc81ZUfx6y9lLEaGC4QcVS1AtJKFRq0N3GBDROYNtJ5nufxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739813382; c=relaxed/simple;
	bh=s8dzY5m0DbaSWfX0zyqEIlUY/J7cVRud2RuXtwGN0hE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E+l1ZvTX5EPRhxcijbtOVJ4VfwtyFZ2y+q6+fVXVuj7UqeArnOYWYtr5xbv6lT+fDcKnANAaqo3ZX0ILuYSNPDq6TPaI2lxLSX4phVTt1BP+6P3e1cHBkgoqKXOHP+TABFBtspw9rbmct6TZF0g9LE6paT5NUsqG/DkT7edayII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rmqFTt/m; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5452c1daabeso2616307e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2025 09:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739813378; x=1740418178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8dzY5m0DbaSWfX0zyqEIlUY/J7cVRud2RuXtwGN0hE=;
        b=rmqFTt/mrS84iRmLCwppxeaJvyD957kbtaLsZxyaJc6PMCcstsJcCDQYVqxW2dBnpc
         XCqsfK5M5RJwrlNORQwziLtshr8I7TYBI6uySRIfSu9ViOCTlAbLlMwFymDUmbPUtw7P
         TdpgBBAPjtkTNh8mIUAWHiacjHwR2j5HLFnUDpi++0upYyreiBXYEL0BD5uacEtmOqvv
         mTdPw/XkHhEKz70v47pxOd4e/Z66O4MRNUK9Xs+gtSPeUnh2sYHlvv4H3hH3qBSImJum
         SEithWz8VH7Owqr4fHcYIzKgGyFXtyVZn5qFF/tzEzdCkb96iYXIwuhAzs4yzWoMr+d/
         Ghrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739813378; x=1740418178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8dzY5m0DbaSWfX0zyqEIlUY/J7cVRud2RuXtwGN0hE=;
        b=fCWVqeiOn+dNz9Y70+L101CmygZUboIJ2Oz0vVkgUx5xbzfCOgmcj9H2dlYlVPqVoU
         ee/5aOuxrPuaZDovnjvsfqoFDPntIHkHecutjRL0k25I8drDzwgKkQE7N4uYPJz7GHk5
         KShiSMZg+5BHjLXIoYqUsomlXRZc2hmNHazTTGahfHlPPO93NAbM7l/TIFJj0JLA6MhI
         syHYzfQBVUFVsQixwaq7L2ZqvgUXR/dYYl0p5MKXpFTmD8fQ15jxnNfUbMcsm4dUeQ0U
         OlHgsRXTt7yWQN24mFLTV3jOkgCR3fqqJ2Ji8zYNISvcG3at90bF16uO1ND9gNluL22Y
         BeGg==
X-Gm-Message-State: AOJu0YwPPybJnrcSCDVXoIzREIRZNsj977kZ0+m43UTKE2cpJhrBk2Dq
	8DvjBC134aW/zG1GawJ9z1l8qFRxywFS6EtCYohsD7QfztkvGa1qdfYumFus03u8JCWfsBjXb5f
	HKyXY7rWIE4Ck92xoZtkUqvs2u/yOR1fmy05Huw==
X-Gm-Gg: ASbGnct5X3V6Va//zltqQKUtLvSd1BzwPS38p68k9W2j2RkwjBEOVFTEdErKWAfKpbD
	R6wV5Z/CnJjuX9rokRWzbl9Xu4tAh+P2J/tkLKPb9+6iSWeweE5f4KxeQwm7JFhuv5wVxoocDVs
	Hv5OYytMghIyfz4RZLoqdE8AAcFQ==
X-Google-Smtp-Source: AGHT+IE8QEuhEYZ24C4MMRyD/iBuHqWWRbXusKYLKvI+f/pb9+H5RoRo7m8dxQTfwNFT6k/Rkn4el4mFMHaELpJojog=
X-Received: by 2002:a05:6512:308d:b0:545:2d80:a482 with SMTP id
 2adb3069b0e04-5452fdb7516mr3492740e87.0.1739813378119; Mon, 17 Feb 2025
 09:29:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217142758.540601-1-koichiro.den@canonical.com>
 <20250217142758.540601-2-koichiro.den@canonical.com> <CAMRc=McB0bcG4jERmUyrQ=eTP+kcfLBBAOaT7mCMKbgUB1W5nw@mail.gmail.com>
 <d2qdoq3f3jk6gzgsjeqszgaqk7z523r7cfnopxfq4ghsbsqgp3@zjw67ewqzi5u> <uogv4ckqo2e2byspffvfayu44v6fl46sxtu7eudweoye62sofi@5iwsumpttpca>
In-Reply-To: <uogv4ckqo2e2byspffvfayu44v6fl46sxtu7eudweoye62sofi@5iwsumpttpca>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Feb 2025 18:29:27 +0100
X-Gm-Features: AWEUYZkUECy20dI1_GnljHzFs8Mj0vatIPhRinb1LxPTtf-RSOskSmCP_32n6aA
Message-ID: <CAMRc=MdNtDW_Gbd6dsG345110SCWe1vD_rNd_QaWBYRApHBoxQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: pseudo: common helper functions for pseudo gpio devices
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 5:21=E2=80=AFPM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> On Tue, Feb 18, 2025 at 01:12:17AM GMT, Koichiro Den wrote:
> > On Mon, Feb 17, 2025 at 04:46:30PM GMT, Bartosz Golaszewski wrote:
> > > On Mon, Feb 17, 2025 at 3:28=E2=80=AFPM Koichiro Den <koichiro.den@ca=
nonical.com> wrote:
> > > >
> > > > Both gpio-sim and gpio-virtuser share a mechanism to instantiate a
> > > > platform device and wait synchronously for probe completion.
> > > > With gpio-aggregator adopting the same approach in a later commit f=
or
> > > > its configfs interface, it's time to factor out the common code.
> > > >
> > > > Add gpio-pseudo.[ch] to house helper functions used by all the pseu=
do
> > > > GPIO device implementations.
> > > >
> > > > No functional change.
> > > >
> > > > Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> > > > ---
> > >
> >
> > Thanks for the review.
> >
> > > Looking at this patch now, I've realized that there is nothing
> > > GPIO-specific here. It's a mechanism for synchronous platform device
> > > probing. I don't think its place is in drivers/gpio/ if we're making
> > > it a set of library functions. Can I suggest moving it to lib/ and
> > > renaming the module as pdev_sync_probe or something else that's
> > > expressive enough to tell users what it does? You can make me the
> > > maintainer of that module if you wish (feel free to add yourself
> > > too!).
> >
> > I had vaguely envisioned that this might eventually contain some
> > GPIO-specific code for some reason, and also it's just a tiny utility t=
o
> > reduce code duplication, which is why I placed it in the neighborhood,
> > drivers/gpio/. However, of course you=E2=80=99re right, there=E2=80=99s=
 nothing
> > GPIO-specific here, so moving it to lib/ makes sense.
> >
> > I'm not really sure if this method for synchronous platform device prob=
ing
> > can be broadly accepted as a general solution, but I have no objections=
 to
> > making the change. I'll move it as you suggested and send v2, setting y=
ou
> > as its maintainer.
>
> Regarding this series, I feel that it might make discussions smoother if
> you submit it directly. So if you're okay with it, please go ahead. In
> that case, there's even no need to mention me or CC me - I can track it o=
n
> ML :)

I'm not sure I'm following. Why would I submit it myself? You did most
of the work already. If you want the changes to gpio-aggregator
merged, then I think that it's time to refactor this code before we do
that because repeating it three times is just bad programming. I
probably wouldn't have done it otherwise at this point.

The code looks good other than that, just put it under lib/, rename
functions to pdev_sync_probe_init/register/unregister() and send it to
the list as usual. With that it's good to go. Just make sure to
mention to Andrew Morton the need for this to go through the GPIO
tree, I don't think he'll mind.

Bart

