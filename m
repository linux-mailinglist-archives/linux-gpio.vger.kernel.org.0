Return-Path: <linux-gpio+bounces-22264-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9278AE9EAD
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 15:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E600188EEBF
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 13:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063982E54A7;
	Thu, 26 Jun 2025 13:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B2URa0mm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0CF28B3F9
	for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944321; cv=none; b=mtBKn/VVZXqWtENzlMjAtWdnevbcVjm/JaAFo3eCgOMMd6tVloiC1iWwtOF3LmcuDHwFKGTL8krVnqENNYQAnVXW00TeQQvSBt5YiDaKWa07tAMFTtA83Z1e8Pd32q8c8JiIkb21yK3zYBFbCwhyziTTbBtVEtX4nBeXDGA5v2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944321; c=relaxed/simple;
	bh=enT5vO2ALcAa/LZ/Y3Lm+uixPZpZ0NB8EkbAOpe//TU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rl4fnhFsvsRUkM0NC4zMAY5psYrflT/4ynaz4KyiFpOsPr6gcl3lvWai76b6nKa4O68DlesFmRG3zlX46jGGZH3cdjxfQOxGgb7sU11eWhrtZDUKn66f3OVjsmjuGuLMMlhPKANAPcFPld8wOeldGTXWhW9IUDVGT0l0kIeII/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B2URa0mm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-555024588b1so1222796e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jun 2025 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750944318; x=1751549118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=;
        b=B2URa0mmUHhnUjza7rK4696DHHQRqzZPsZe5TYKZKfgX+wCd+wRPV2jMDwS/ZdKSLd
         GG29e4E2LuL+S6ctn/2NS4m/6ZIE2g0iPL6B8QpKy3nOO5WwKcDTr8e1HuUw2uq42BYs
         VwDUidPE0YGep05ZnMAO/6qTkLMKYq6p4E1qlVkEwyO4CkhyfQSXd88NMQDxTBba7RWJ
         D5CmwT6dZt+QP4retuQYMnXxS26f5thUFxNkgLK4Odj+9rxPKwiziZ0xMnrF9a75+8aH
         7x2ei/oncy3TeryRSUA3mkUn6WU37Lr9LqHWN9rimDXlFPf9y4NV9WSUoJgn5+gYBKG5
         ic5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750944318; x=1751549118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLwSjoUY7m1Ln7Qu4AWMnTKuJMVdB5FurphkXRXpBRw=;
        b=UImNtU25F3EqIjRxMWsyLiv6vhA3v65yzwXyHMJHVh8BSQ/fuh2hI3XBK/6gwdUc1R
         ICwt0Ndf4UJK/xRzBQ2TjmVxtFFotG9jTDQY7W07n63+MZwctSDPLqasI82JS9CKg4ZH
         cJhQzDwIb9xO5+r5KG2jhKWyff3eqtf4p4XcRye17ZWDy6Qhjah54p260Wu12lH8Eiqf
         wh36bk3ECtEnw/eqfXN5hn2trrBrgL7MVZlrecgXYny1wCnkQMmMFiWhcL7xRbO8qcn1
         P7cf4VGly/Zul6hOmbxPpyeseQN90lq1PptdHHUnD68F3I4KsCB68YqW2YEdXc0+VYls
         16sw==
X-Forwarded-Encrypted: i=1; AJvYcCUSKLDndCBE/Xwc9HOzXLG0HP1C9y6bHHh2IzjydLKKS4WlEeLh3wSvguXwAJQx6jBHi4WwmZKbGnfm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe7+X08HetM2EUuGMND5nOe8F1Wg/okVtZzuFd6u3BeMvOivfM
	dPGzEWItc1F27KihDJx8XKNbJSgGbir3UF6ymnQEDBAaLtpYH3PHrPdAtaEEPjzop3NVn47kySQ
	w13cf5ViGeRrlc4mEeicQCsQSXWrKZiXcovXJcsJJkg==
X-Gm-Gg: ASbGncu+1bTTe8qQ9zzBv8NDZ5zZplO4jg6v2vljcAAC7f27eVW5GS3Aq2LSxFf+H86
	P+vkdvM9BqvHCFVIwSSiZbgWgl0Ac3xNzOrZsKQp//s/E4DXwajOFMghMOolKX+g/h/f+cFCRT+
	2lzkCII2MBuaUQVHf8mfNmfgv0YihhWAG/FMNpDvTa+xeE/Flyh+FpLD6x1PIr2bfzoZQ+m/Aws
	g==
X-Google-Smtp-Source: AGHT+IFZCHpg6dN8jQOP4LGMeE8N6TdaxL+CR37n8aEWMLkZ46xkrupRdz8U89iquKgLZ75BaGxTbVJfXxSWy4Rbayg=
X-Received: by 2002:a05:6512:691:b0:553:aed7:9807 with SMTP id
 2adb3069b0e04-554fdcc531fmr2571744e87.9.1750944317960; Thu, 26 Jun 2025
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org> <20250626132257.GE10134@google.com>
In-Reply-To: <20250626132257.GE10134@google.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 26 Jun 2025 15:25:06 +0200
X-Gm-Features: Ac12FXw9b1Ua2nskF_gKsApdHRnQVgOC-Rscq226tK5vt_NGX_5zRRRras-l-hs
Message-ID: <CAMRc=MdBipydUjEKXDufMAWNZjMA18RKj0XcNofrn1oR7bXTZA@mail.gmail.com>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 3:23=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 24 Jun 2025, Bartosz Golaszewski wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Replace struct bgpio_pdata - that we plan to remove - with software
> > nodes containing properties encoding the same values thatr can now be
>
> Spelling.
>
> > parsed by gpio-mmio.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++---------=
--------
> >  1 file changed, 28 insertions(+), 18 deletions(-)
>
> Can this go in on its own, or does it have depend{encies,ants}?

It will break the MFD GPIO sub-driver without patch 1/6 from this
series. It would be best if you could Ack it and I can set up an
immutable branch for v6.17 if you need it.

Bartosz

