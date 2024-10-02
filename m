Return-Path: <linux-gpio+bounces-10699-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8E98D597
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F94D2888ED
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 13:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063171D0486;
	Wed,  2 Oct 2024 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Qwp8/qXr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E452E1D0948
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 13:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875897; cv=none; b=O4QTLDeCGW1kTlrVzi1dXw8iChmCq60qvJuV0zilHCH1j67hcD6BuKisjqgb8V66GKG3rA5Qbt3rg6LnaV9E4d2PBUmL/CjXyL/dTfm/YFVvzfEUgq+aIRolPZ7EHZaUeuDiksfc9oyDbRs2Sw6d3eBmdQaPGigPosAmKsy0HOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875897; c=relaxed/simple;
	bh=DWcKxEXlfUrsCLQTqfiYQf33VepgOn4uUktXC2fuLPA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JPhgolEyDG7Kaf01hGn4u6NFJ+/UzsAso1Z3boQIvnhSzHhCyN5pJ+o5+CUakAVlHidr2MSxOeZIXMkiI3LJxKeIZvXWAWzD7dNpGhlxjVTYc/Y3mFjaRd8D6o2Sbr0kHvwh0muSdwP+kN+fx2q2CZeWSYM1zGxr04aT16Ndwdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Qwp8/qXr; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fad784e304so26659001fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 06:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727875892; x=1728480692; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DWcKxEXlfUrsCLQTqfiYQf33VepgOn4uUktXC2fuLPA=;
        b=Qwp8/qXrEPmvWG+0CsPvieI9uB01WlfURfVcAhsRlBUMU52sx6W1UXEHUf5QD9grkJ
         54X792Iu2mZLympdD/JQtTXcQ/5aJxiVIJ/TRwqaJlRX5Dhx6DWTEezo+92dtFZ/zdt5
         oLP8nG1FOA6jr1kcomowWCIlY/44lvPEHYBKfgtfxp1Ez3baoFapLLcRl48STw1jfiAf
         vXj2OLFmyMaVJVYNecMLnzaaLR2RoonSeBt7fhDIwRc20Fam4J6RS7vOT1LTaMUPwE5J
         euAOdFakjKoU+KjvQED6rY8oBlurEXNVOdfDXMSV8HrPA+25dtMlyBluvK06lNFGpjdp
         OKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875892; x=1728480692;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWcKxEXlfUrsCLQTqfiYQf33VepgOn4uUktXC2fuLPA=;
        b=NfEv3/kzpaK8JnzqBmztGOuQ/94Rm92hkQXgXsMVjIAjD5wk+jsYQ75+Uohbcks46u
         TYG1W/nTvZ7z0aFzU4nluFaKZd4PWuxiuxSeoXZCc1lnxIoshnh1K7NMNyde6X6sL+QC
         Udhg/Ft2Q6cUbcUqdTSs9IIxV8m2wy1RBcJnZi6tx7lwEjd24i+oknzBRe/mIn6wh+Fy
         sgJ4A0Klq9j9wtTqsbhIhYJSQASdlimgztZyxk/7y+jXkewNOWWa8Vho1UcjKm+Akujc
         TxK/5uqZogaAnJWeSlHP2sEv1U4UCEKJxffKlpziPd5+d33DZJqgV7oyTQ6mvN2jyQyM
         YC0A==
X-Gm-Message-State: AOJu0Ywb32S9a4Su/wpzztJHz5IuA8OR6tqEEsGkH5x8d1T4hl5szUsf
	MoMMz1ZnR75zGn4sTz8FwDMMxJgnCcgNf6h/1v6mK0q4wkp+jQnlXtxPaJejN+mSBrIF+yIcIXX
	1SqGifXFFI54aB7ZgffAo5X4a74qsncQEB+yCToTfmVqgP+zxakk=
X-Google-Smtp-Source: AGHT+IGfhbpcvFTgEa9QTZPMMYFq993hkgAgju65u5YlxPpERmSBUuIF8VIs3rcQ6Sn9QW7YdTGm+vfAZKn6i0lbVDM=
X-Received: by 2002:a05:651c:2207:b0:2f7:64b9:ff90 with SMTP id
 38308e7fff4ca-2fae1002a33mr20954041fa.9.1727875892137; Wed, 02 Oct 2024
 06:31:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 15:31:20 +0200
Message-ID: <CAMRc=McgmBnY5vTKySyjS0OX_wFEitDYX-GQVtsaaYEsozPt2Q@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.2-rc1
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="UTF-8"

I've just tagged and pushed out the first release candidate for libgpiod v2.2.

It's a big release that - next to an assortment of smaller
improvements and bug-fixes - brings in a big new feature: D-Bus daemon
and command-line client together with GObject bindings to core
libgpiod.

It's in good enough shape to now focus on ironing out the creases and
make it available in the following weeks.

The tarball and git tree are in their usual places[1][2].

Bart

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

