Return-Path: <linux-gpio+bounces-15074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C3A1DC51
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 19:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC06A166169
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jan 2025 18:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014DD192B90;
	Mon, 27 Jan 2025 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SNRH5SQG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A53191F83;
	Mon, 27 Jan 2025 18:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004339; cv=none; b=iAasn3DzXFZNnGoVGTcusXCN8Ql8CpRwN2HkGB5JRSAgZHbDuIXia2Fg4jv/ZEXixIjFZ3wrPxk+uuUZYVeXvlZnAKRWlSx5ZxckLZbekwI/FQo2NawVm/RAhGcd6yCcEai4aCtkD5MCjg48cwQQGSZYGy2DiieQUa6tmWn3DiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004339; c=relaxed/simple;
	bh=7g3jvbADtbe5s/p0RNXa327Skqom3uwY1sXN/keB+tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGC/BkSTHADdyqC44d3TbKgCkRTH0vBSz1XQstZYKZzyLNBewADyj6QiJIByfXR7+Ag8oBi7UFK0DqLNuAFlwSb1ICF8cnajp+eNEA0F9TbpfhpD41Sdz7GnebWhBURaw72gmSF2ehNXgM/SuDlNaG/0H2rQ4TQUzUFnZ9bMIi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SNRH5SQG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso9016760a12.2;
        Mon, 27 Jan 2025 10:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738004336; x=1738609136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7g3jvbADtbe5s/p0RNXa327Skqom3uwY1sXN/keB+tI=;
        b=SNRH5SQGX8/A+/oAl3jnBWnbZK7PytsMnJ5vkFgCyX+q/MzYO4zoMsDW5O3mOyoN/t
         PgqPmNSpHToCobr5CAkJ17xLNj700CD8dE+iNAeF7LlwgJrrIxPsoH/dlO/2Ad/oadE6
         N9IQy5oPM55AoZ6y2NHIqWE3JF8EoFILI7ckSJ4W6UNyxTmqrrvysgWQscD0yTYXk2ZQ
         BqDrbv/eeXqsHfo9eP5pWyNIHqrWdDp8I8YNbMysL5ex/N1sIYhyv9jlRuJYG9vho4u6
         3lK8LfK9V7YOuqVCQF8xmxquuDY6+0PaMLiw/x1Vp682uNU96o145rJm+/UapN2k/QuB
         MsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738004336; x=1738609136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7g3jvbADtbe5s/p0RNXa327Skqom3uwY1sXN/keB+tI=;
        b=qKYEutSIZEWXFtS6hO1g5k2lxJb2daY6q5zYKJV2nh0w0qQhRBOJ3uX30fnH8gK0xU
         c/tkHpKJ6iskfG2YqhqmaUP3lrYb+09592tuh0WCx5995jMKKyd2XHGgpx7PRURss6jy
         v03JD70+KlCQicoIWjnA3mWwKiFaOugsqfXEJjXNHBMgylY+ch6Itgfm9ZFCHC67z6FP
         5mabtva1l4dfY4GCY87nY5uKRcEc0IA5n022OXJDI6uqbXXcqd0Ef+6xLPUX6JzAz0/E
         BygeQKfoS1+1ifLW+2ejCdflNGzKtNlWroLRG7zLRlD9GJuX4Sskic0S6USjqWVk571N
         RZlw==
X-Forwarded-Encrypted: i=1; AJvYcCUToJfSN6LqMZTWs9f/Tx4hjILq/H2xj6qdsHl+FvjNe7C2tk1bo+Cet0YGvRhxyrlVvfPBC8i4moNe@vger.kernel.org, AJvYcCUZwxIMIAioacb+Mh/stlG39PS1oBmZnyfWPkXGidFq83tWJXMMsRowgyKTDiNt7xu/E1lsj3bU3/pgIVi8@vger.kernel.org
X-Gm-Message-State: AOJu0YxrnpTzzLqZYOGJJOcLsDcBjq7cawqMEmsPJSOSf+omUfDxGAgy
	+i6G9Owf9SZbukQAzBUm54ub+1Hl5uZNjCCW8tUSlhQy1oAoFnAKUSd97qfpT/GMEOlrvFRHTO7
	Es+IV6kPZCMuCU2aPiyJpB2ewGzlGP4fG
X-Gm-Gg: ASbGncuuQfWZDWEYyOXHTLJ2XqJ3d0QtyVzgbjt6ye9pTn+VIHTxIpvVgXojCtcj5ha
	3Qy/3DFNjd4Yw+K/5PilIr0K3mweO6t9WPwhk0VGNFZ29m7Pg2FRgrSTqNWeBKg==
X-Google-Smtp-Source: AGHT+IG7ArVw+Wxwp3IWFFbn5qH55qvWt6HMA46PXuIA+lg6QueMTBlZ10Lt8O5coO5eUEsqsTdpXTLXiCCOSfpSgIM=
X-Received: by 2002:a17:907:268e:b0:ab6:6018:df18 with SMTP id
 a640c23a62f3a-ab66018e219mr1959082766b.6.1738004336104; Mon, 27 Jan 2025
 10:58:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
 <20250113220221.13545-1-koute102030@gmail.com> <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
 <CAHN=yabQB5jYDd9iQ7s1dMWTScRf3c_zuNtXL8U283+vvenfNA@mail.gmail.com>
 <CAHN=yaaZ3L23JbsQ+fugG-iXdtt9dOss0pe7yT5EG029nsfXFQ@mail.gmail.com>
 <CAHp75VdCwyJhYD9rtxf8H5mi5AfcPOhvSYx2MOqw3==3mnxoSg@mail.gmail.com> <CAHN=yaaYiyPOM6-T8_126N=rBdS-Qzf7_yAg=oWB_DxBsg6fuw@mail.gmail.com>
In-Reply-To: <CAHN=yaaYiyPOM6-T8_126N=rBdS-Qzf7_yAg=oWB_DxBsg6fuw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Jan 2025 20:58:19 +0200
X-Gm-Features: AWEUYZknzneTedgEq7XOmfNvp1xbbVDad0h0BGFBXxYYraG171iX4C3fQSKuwjc
Message-ID: <CAHp75VcUoLnXEypFuGF2Tzz3ncOi9daEVLdg+Vp4BwkFyGM1hg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
To: lakabd <lakabd.work@gmail.com>
Cc: mark.tomlinson@alliedtelesis.co.nz, brgl@bgdev.pl, 
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 6:45=E2=80=AFPM lakabd <lakabd.work@gmail.com> wrot=
e:
> > On Mon, Jan 27, 2025 at 09:47:17AM +0200, Andy Shevchenko wrote:

...

> > Meanwhile looking into the code I'm wondering why we can't actually use
> > just input port register data with the logic as for PCAL. Nonetheless t=
his
> > can be optimized later. I think Mark's patch is good enough as current =
fix.
>
> If we accept Mark's patch there will be no difference between PCA_PCAL
> and regular chips in IRQ handling.
> Looking at pca953x_irq_pending() the process for non-PCA_PCAL is quite
> slower; there is one I2C read in addition, plus multiple bitmap
> operations. I think that the solution I proposed at least helps in
> keeping the leverage for PCA_PCAL chips.

As I said, we can do optimisations later on. The non-PCAL code is
widely tested, so I prefer to have a slower but tested approach. On
top of that bitmap operations for the chips up to 32 lines are just
operations on one register, which are quite fast even on slow CPUs
(like Intel Quark), in comparison to I=C2=B2C transactions.

--=20
With Best Regards,
Andy Shevchenko

