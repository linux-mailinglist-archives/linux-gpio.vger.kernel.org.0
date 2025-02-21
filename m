Return-Path: <linux-gpio+bounces-16348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E46A3EED0
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 09:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A8371784D2
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 08:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE7C1FE470;
	Fri, 21 Feb 2025 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N2CLjoRF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5C201004
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740127051; cv=none; b=NOca0eVju2Td2olOniOX9+DOehjCuquTA6oYVajhOhXzyt2852GT25EnY5xqOC/IywgrLg3DUlEaEl50+35SCOcss+8MzQ4u0H5z3IrwFoOzTV+wDAAoYhyJVD1E4JzAj/evR2xucWWJi35FRGfUscFBtr45cjQEnv96fFL7Jqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740127051; c=relaxed/simple;
	bh=1Pyc5XSXk8/KpOI0I+Y0iOOSNDehTqvQGNhqxWmM4TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZ6o2ojMuTysOqAjcHnHEL/gD2MabyYnD1qG473sp1WOPTMnFNrgbWSgxxirOXhC7zAd0QB/+XOL0P6dlBlg7h7CaEqCBKO/k05x0NEeKPkEDVL5whoTJGmdcw9iFUQPsqoqgO6xZcxy1tGTPtODAOGQudwDjrBN+cBVYCrgxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N2CLjoRF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-546267ed92fso2145593e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740127047; x=1740731847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW/FAUY+BtuxgqThnl6ySpYQqHb8f9LhIhu4HPMnZ10=;
        b=N2CLjoRFHcoshO2ncCSOlJbY+mx4oO6D0aFI5TFfFT6oe01+/VcP0Kq7EfOrOR6+nE
         KDfo4RhqnXmSYSpsdrX69MTYP33TAXvGeN4HBtGKpoMkXAEZI4pGUcolWMIyyP4e/kT4
         RfROlg08rffd2AWfCu6nFhiTp/rYYcXjMKvF4cA37ECEhSM1penkRhlJw/HBD6i6BTCc
         5HG1dGQ0JGdcPnYS5iMFM/omdul/l70eKl6NfcUTratis0zsYyTftkTF6Yq1+2XpDV6Q
         hLmYRqba22AToEmwjvyHnszwJba0Wutkg6XNonuq1e8ae/poJRHOdxw2Gi+nfCrFl6x1
         Fp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740127047; x=1740731847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fW/FAUY+BtuxgqThnl6ySpYQqHb8f9LhIhu4HPMnZ10=;
        b=fPShYDwPTb7KYvckOPSO31y13BrUq/gngEct2FnOmE4+7v5dUt6V6Cy5ZnbAex1iOM
         dq1fhuCfQ6QNBVk9PzcKYlsdi1c1smy8b+bjko0Pj74V7Gd+vYD77MjqwDYC4PUJPJGm
         HxlLGHhKETWvpizLpI69rCJdrtcyzbWmu/XgSiCrNaoXT/SVNkCVAChxcZiavMRK6JYA
         RU4ZcJ236ssVZ3kkXZQaNyNmPq9kkGIv7JOqTReuYTEKq/Z3mgrW0S4Oi7XN8WiE2dhF
         N+etEd60SuGb7AB8SRt/3yP/dkp08g3LyMQeo51mc6xWGyiTUJ5c4y97brs8mOmH6N3Z
         +ICg==
X-Forwarded-Encrypted: i=1; AJvYcCW70nxHapo/L28LcmOdkHJuzSqm5kHPRTbNZIoUPd+OwtI9kzTXpoWZpqh5ShQlwaFgGqLdVWLFXyjx@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhwojOtlWKREv7TF3XOCuNn64Ahl223JS0tmty12dxl+fh1ww
	gBRhxK2MKeZ9iopX+KR8C2evmTeEnXCrm5IpVSBnusJ8cSJlIKo+YvAoIiL8dSV9lO8OF7ojxG/
	qXMg6VfE5omAAGJGUAPXSxvAbNbbBf6oQURJ8ig==
X-Gm-Gg: ASbGnctTgG3JE5mhKJwEK+3+bMKlCMwdVEVyGGWKhivR+AD7Tk+Eu8cK/xYYjRsBSKV
	+zfxBTYqLTy7TxBWtPKfHjpoPiwVXha4JQbxTvsHaMV59sRZZ/yqnahgF3gDNJE+cpjSoG77pis
	rWRMEtfpGpE0cdUNtmpPwEaNwE3R2WPhlMN6FnUg4=
X-Google-Smtp-Source: AGHT+IEVJYqpV94JpnSSmFsbKfheCNp8/0iZB0ZSGoVT/MInSsid5S3N4SwldmQ4L5O1E7gpGonbz4t6nSMa3dwR6i0=
X-Received: by 2002:a05:6512:230a:b0:545:17b:3cf9 with SMTP id
 2adb3069b0e04-54838f5c910mr744359e87.48.1740127047367; Fri, 21 Feb 2025
 00:37:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org> <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
 <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Feb 2025 09:37:16 +0100
X-Gm-Features: AWEUYZkPeZ_f9Qkm0Zlcw9GzT4Sb60CF7RDIsxK-TmMLrjs_ajHOShwiT4OIdzI
Message-ID: <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 12:36=E2=80=AFAM Chen Wang <unicorn_wang@outlook.co=
m> wrote:
>
>
> On 2025/2/20 21:34, Bartosz Golaszewski wrote:
> > On Mon, Feb 17, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> [......]
> >> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gp=
io_bank, gc)
> >> +
> >> +struct spacemit_gpio;
> >> +
> >> +struct spacemit_gpio_bank {
> >> +       struct gpio_chip                gc;
> >> +       struct spacemit_gpio            *sg;
> >> +       void __iomem                    *base;
> >> +       u32                             index;
> >> +       u32                             irq_mask;
> >> +       u32                             irq_rising_edge;
> >> +       u32                             irq_falling_edge;
> >> +};
> >> +
> >> +struct spacemit_gpio {
> >> +       struct  device                  *dev;
> >> +       struct  spacemit_gpio_bank      sgb[NR_BANKS];
> >> +};
> > Please don't use tabs in struct definitions.
>
> Why not=EF=BC=9FI see
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct=
-declarations-and-initializers
>

This is for the tip tree, not treewide.

It's my personal maintainer preference. We do use both under
drivers/gpio/ but I prefer no-tabs in new code.

Bart

