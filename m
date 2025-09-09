Return-Path: <linux-gpio+bounces-25812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A10EDB4AC39
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 13:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E4221896BA2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8731F24E4C6;
	Tue,  9 Sep 2025 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WM/w8K3Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDF32EB5DE
	for <linux-gpio@vger.kernel.org>; Tue,  9 Sep 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417719; cv=none; b=HZ22id5kSdlWKbanBhQK4Kb/coUmySOwWfyKtnyD0l7hvQGmE7olfeMvGWqhOWZ4vWyvo/wDJ40pc+VCD3JToN+7GntrYt9iPChy5WU2CrPSaiAByZy07JiQ7ajx84ea8rCPBqROb3mh0WiN1Onz52AAw+yTNi1yJbUncp0OmWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417719; c=relaxed/simple;
	bh=JRXEj2Vi20oWUI/zgU4BerivqZ3hoKieY+gD3mRHVac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1Jlf89I18cW6awzbjm1foh1jemuB3QIl0NPgSOCNTktvepM0bB4l7jjdHwOC2UybUxHdRX0ptRreQ405UNlgR4YEvlSBFHguW+n4h0IZJBraiL08Tn7342C28V9n8m0ACqmv7AwckIcuHY49xZJeSkO6oLy3ZgdtpqsnV65sK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WM/w8K3Z; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so5647977e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Sep 2025 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757417716; x=1758022516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=WM/w8K3ZxVHprReJtOWBuv8Y8GRaFaiGHBd3ha2kEzCn0dDlW1a1Dw2fJT8mq9yzJl
         iIBlEig5VfQyrvvgCJlyXnbNnztnN2U0+Fy4T8nVANarItOdeIR8Y0Tz4MMwTDDzpZ75
         qdB6H8HQQIZHzIr/+UqyL/8KLJ6BOrEdW8FGEzJ5sNZAcYggPUawtCMqbNA/ZPz3eUIl
         hTHY/SLcD1qyYBaa4Ju5fXrfoiW41uPOd+PaPAhBY9TG2RRNi4L3Wk5MiA0iAbZBMAaj
         1LgBcG7Ci2BXd6YdKK976a1BGclFzsgmB0ke/26YEMn4vAcb2xQhttiPRMhVJZ4m3Zhb
         1DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417716; x=1758022516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6eCnKOXIsJYGPMWl3D4Jhjj+0Ieti5SchV9n8g8z8A=;
        b=kWaQ4UVaDW7OlIAV4VpsIGitMdETMHXYh4HBFW6ITLhgxdd1SbrL1IBveswS+5xlc5
         1mNQ7oEuSOFNeX2vm/O37DZ2+juugsKRgWBRwtmwNYY9n8/+3RHD0MWivUF/+QVBCJSo
         IeVjGINlPQvGUJhl5+pokUCa2ElLou7Egx2ZuB9OWKbrUQXYUOThqOcusfi6bghl0idb
         WGcY1QUK3Lt7WmSZX5KxTYMTCrWemrfIY/qijGCxJvQhtnfbjDWVeCQUP4N2EvtnRbfM
         yjZ0QRg74qsmeEgLvBGqD7hS17lPwims8pQ6Iwsv8+l9XZSkOf3c3WLQYs72AgKXuNFU
         1hiw==
X-Forwarded-Encrypted: i=1; AJvYcCXVYX2qcLXhGMryVBkNuiSL+tdqWV387XjAPs+tWljzS/HymKCZHKjkVk5w9BLlpscN6w2DjNf1DD5B@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc88R4Q/nguSoFEPjeNTzoXOoqUwZWzoCzso72+Sfb0vpUvQz2
	I2K0l8WrVmg1nHSod7rOdaF6cpreTU+uynDmBuEjrF4jD5tJ31DvdJFIf6kcNdf9z+95Ugk3pGq
	xR7LszM+gvUa9nPdo1FvqWH4DOWKNNE5qsOSDSe97Sw==
X-Gm-Gg: ASbGncu4wVn/W/3s/FzfVUe4Z2BNdgcbEkpERb6fEeqM9CMdPoKFDzKWNYVYHSa733L
	Fi+ba7CfS7oCgc6EB2OhF3o3ZoI/Hihy1UZVABfPf/GKvKEbU2GJn0ze/COMZC3/5Jc5UAUzUt8
	XqugDJI/Of+z9ntKZQXUHqs9w338ffj+O3F2nGingeU5pRHGamUZ/WhgjUkyM5pbaR9Kxrq1nM7
	9Q4lJB1YiU0bGLcdfwEFY/8w8dtERGCBeCdckfjw7EXfYcJGA==
X-Google-Smtp-Source: AGHT+IHWd+/2o3jpP5pFKotnmfcWTA0FpdlTJ7xwTNOp9WJ3bLpmlAirprq1zjBteK7SqJBfI4YYAjx9R2Xs8MJv8vM=
X-Received: by 2002:a05:6512:639a:10b0:568:4ae7:8371 with SMTP id
 2adb3069b0e04-5684ae7fda5mr659891e87.4.1757417715746; Tue, 09 Sep 2025
 04:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org> <aMAP9hAWars0T83r@smile.fi.intel.com>
In-Reply-To: <aMAP9hAWars0T83r@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 13:35:04 +0200
X-Gm-Features: Ac12FXwO2LcDkWGWZohqu8ChVnTISfR-cQj8e5EdoM33wEcP1qEQLJ7mzcbrqVk
Message-ID: <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 1:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 09, 2025 at 11:15:40AM +0200, Bartosz Golaszewski wrote:
> >
> > Convert the driver to using the new generic GPIO chip interfaces from
> > linux/gpio/generic.h.
>
> ...
>
> > +     config =3D (typeof(config)){
>
> This looks unusual. Why can't properly formed compound literal be used as=
 in
> many other places in the kernel?
>

It is correct C and checkpatch doesn't raise any warnings. It's the
same kind of argument as between kmalloc(sizeof(struct foo)) vs
kmalloc(sizeof(f)).

I guess it's personal taste but I like this version better.

Bartosz

> > +             .dev =3D &pdev->dev,
> > +             .sz =3D 4,
> > +             .dat =3D sd->gpio_pub_base + GPINR,
> > +             .set =3D sd->gpio_pub_base + GPOUTR,
> > +             .dirout =3D sd->gpio_pub_base + GPOER,
> > +     };

