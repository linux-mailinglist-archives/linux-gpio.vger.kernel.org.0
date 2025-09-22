Return-Path: <linux-gpio+bounces-26459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE16FB91A50
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 988611902B66
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0698B1EB5C2;
	Mon, 22 Sep 2025 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u+xzBCaA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21A1DD9AC
	for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550950; cv=none; b=vCcdZCmdKeUt1XtLPJO/GJqdTnO4Ca37jnVvsF4KS7TiOpelIg3WrEkJ/eCLDkJYAAoPq3TcOnmaFBKaw85r5smbq2xRV14xrk9BlhVnAgEr+XQ0ry6DkpVujeX1vxxg2y/4GB6QeUGJmCwFUIOSvV42afCnkKjmNlSaYYBLi/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550950; c=relaxed/simple;
	bh=SjkP5yGz/xRxx4pQdR4vQflYXtDB494tBUDB3Z6Py1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IP8xVjkVWEXPLR/oV8Tela/ebORC3FiisqEVL+IWKma/I8/9p5cJmsgLOzixazcK9KvLe+QUmYIPCdaDiSV8luYqiRGNQUYozzfHdBOtNXL/IgTYG2Qgo0tyqw0VZeA2N7+FJjg28FPL2w3ilOv5Bzbp2kLSTPqWf4rj5gWarwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u+xzBCaA; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36620862d27so24463741fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Sep 2025 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758550947; x=1759155747; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjkP5yGz/xRxx4pQdR4vQflYXtDB494tBUDB3Z6Py1E=;
        b=u+xzBCaA1koPlaWuSNuCzf3dtOMkZ1fjgzQVN7T9x3fjLpbXkZHK5a3F7IcaPgcUwD
         AXORU/H16epV44OXJQJov35BZDrIIEJ7FsYT9lXyeXWLtxILytdQnQboCyi0EyV4aJZz
         +pfAwsuZXowlxDMJR4uWAaEYARjy2pOQ6U/MEx+wtMP6otxhP/Ulc2O937UJfjB2X4Z+
         SWxrfwzSCIje+FJHpOXz+r5AMTummOOcWXOrnplSwMzZPeA4reqn9t46jR1oGpCs2IA4
         97RmaweRg1Yshe0ECZT+NRdfyay7MLfkp147NEsBUNaMWcLDWd6ZgECiodYKQOk+KAXP
         HHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550947; x=1759155747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjkP5yGz/xRxx4pQdR4vQflYXtDB494tBUDB3Z6Py1E=;
        b=Y13M5JrmNyGH6VIw93jGlJXmojVxLe6QhWTMv348fqaT9flXF6YSq9i4d1bqpZsKuH
         8MlY/Xv4L/wckIaz87O5Qr5SVXPqIFFLZRklrcDYDkBTzTwGSIUR7jZXMHsB4mRdeTCm
         F/f6SzOFduawfaYxbXyydncGcYfrQ9xwv6y7sF39D+hvRTUwMstA5uszwn2X0XZLU3GW
         J72VJ7Euc31Ovt30B0a4vZDDFa/xkVpJnzVLWxW1MH2WWhLytV0xianhAkzKx0EOhtSH
         Obq48LzYuCH5NDV2qu2XHxQGtvHxGitSxDuY9+4tE83ZFJ4lS2/zLkRAUaxjp5t99vla
         Z/FA==
X-Forwarded-Encrypted: i=1; AJvYcCVTQJex7NuBApKYl12BlTULsGIPwiWSIJ3MePW8ZRl6jXmwL3bm/PGnkE6LYDhzQ91qedwCsOpcDQTK@vger.kernel.org
X-Gm-Message-State: AOJu0YytfroXEsSbveaYflt4jZaQlc+Q8ogPyjIoyHt5Qc4KIrl3H5Ji
	bJ+KeFLp5iaRjYO+as6H+E5vGNsFIAgkDYqrmKElTf5h2xFpDCmUc6VGf8ixtJ7fR/525j1oE7x
	QRsw5+H0pln5jhKRzsK6+inlanKLrCgW0z5Jhw0Qhww==
X-Gm-Gg: ASbGnctPVTVOuG+LXBOfnD+rena7WGyLTG/iTtPQQzjHNq7edWxbCAc4vrV3JCkEHK6
	IQqeTGbHQZAaJOjRjXpSmfnCLPf6PeT7bFiGYROYGdQxzgiVyhA6pQD5t9YRoo/xq4LYuiXNgtw
	/gAup9CwIXCt9jr2r4QY5lJo77eGLQPcLwqN2EwFYnXAbMUmfiT9H8ZjjqW6l7gom56tX1cBNva
	sR2LcYCRoVTztxH96b6CxpYdqmHJDsLbbaXJkIRHJzl+XjV
X-Google-Smtp-Source: AGHT+IHM84ueQYZ9iZ0Qa4Qm9CUg13Hf0FdD3aE1fsoAwS/ftbhluR15FvogGC5XBgUTZZOIIabAnpI8Xb0tC2gPGbk=
X-Received: by 2002:a2e:be2c:0:b0:336:b891:18db with SMTP id
 38308e7fff4ca-3640783d62cmr42506421fa.2.1758550947438; Mon, 22 Sep 2025
 07:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918104009.94754-1-herve.codina@bootlin.com> <20250918104009.94754-6-herve.codina@bootlin.com>
In-Reply-To: <20250918104009.94754-6-herve.codina@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 22 Sep 2025 16:22:14 +0200
X-Gm-Features: AS18NWD1ipwVFTExS5bz_jzcAnlunJqilyv8xe6onY25Xz_C9hqGC8HY_m9G3Qs
Message-ID: <CAMRc=Mf9OB03FXEpSXG8XeJhtd7MkwJTH=rY11SBb9SazCMqJw@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO controllers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 12:40=E2=80=AFPM Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
>
> Add GPIO controllers (Synosys DesignWare IPs) available in the
> r9a06g032 (RZ/N1D) SoC.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

