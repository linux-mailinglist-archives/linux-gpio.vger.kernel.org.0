Return-Path: <linux-gpio+bounces-25384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7477B403D5
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 15:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DE53189C503
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 13:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AF131AF1B;
	Tue,  2 Sep 2025 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Pqx7oMJZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3052D8DC0
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819788; cv=none; b=CSzaerpgsKvI1cPiezP+0Le8FxwHwwoiYySKG7hzI0vhcSNJGJGjLKsBZXD4NHyzbBu7M63mxr5QnrOUoaq0zoJxKsRguGEVnxId6reTjbXF/6YskiaeuCdIfdbsSe7XwJTgyBFlPHqx7AMxpOzmctixESZ1O1mPvMvl5FQ7+mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819788; c=relaxed/simple;
	bh=3QlkS9Ed9gmuv+futXyyIrRTd0WcKtKmub0+uBCFWn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwHmqcvecZ1+f2HOVJxZ9MYSilS4Bwuu9dbMhmXc7wcQs79uQAxXpNyUbdIOt2tByjQR6JUe0mKHVltGX3jSBaVM1h8mpQE+ZJPagDKrgvjUnBiZaS6wHuPFYmk93OwB16FWQAwUT5eqcj251b67mBgjVHL8aOVjhQ/UAb6RB+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Pqx7oMJZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f716e25d9so2797642e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819784; x=1757424584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=Pqx7oMJZ8qmUS++jRYyyhqdtBvKrDhz7thM/sP/AIUqNiNpmHftLPYJhhVme284dqw
         RAdtqlFKT7FrZ3Rz1GX8xhGW+BBM2QY5VPYjbSIWJuspwmGwceeFVM3b2ynGB3qctMRL
         idvbLeA23uCw893n0faRQHAcJdXUOueZbbg3Q1uyM8rjLhN9n/JEH56hN41R7v0yIyE2
         VfSbUISln8Tf8hmVMNHM2iy6fBq4WeSjxD4NMa2DBCpLD6n19eKlCuCMmEPLAedCr82s
         sQQm6i+QzNXR90VfLxaQp7REQlM9F3sBlV2+DmLu5DACOk0Vfg9QLZB7yUEkwZJVmSA1
         mNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819784; x=1757424584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=ZoQN5xQsbEZ+MpuD8Fy015fbzmWIKJTzUYGAJO32mCa5IjEyBkfnVV69utc67VB6B1
         OOVPjoIdILd/zC+wBVzbxdMZjscXS9GPWytu8wNajUrn8v8ND88XeY4i5zlZUtNFlgzF
         MDwgJ3rJni8a/fQ6Vq+SHhh14UKRz5M2mIQ4FPCU5MZD+644qNue5GFG/xz38HfKCCy3
         mnWezyhz1MQa+TH+Hm8GHJ7YVAnsaIiW1BZDN/D6lslVs9FxrOPV6RzRMoPagxH2KAMh
         pgsgldMT588C+ILRlfgsMjMzigk9jEWGsm4KupoK0dUzqL5AIaQtDm7izKEjFPL9tG9/
         GhnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB6Dh7jwahoyfdOt6A6msN1dtCvhW3PD6EECJN3gVi6Kfn1uL4KWgH2IurKkBXwj1YUOWy4a/qoSRo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+/fxqDKk8z5/ZXnsrNyVD2YNhG1Kg1z1r7Onec9eYOFuzpuW
	5Ax5qGPRCRF/WycWsu9i9K4GG0oXWUpn29sj4mMR9Agu3JE4t89G3+DvcWNhjNKUU0YVJ/K2IDN
	RjhJ7SBfHAqfg8uV4ur26CPPsizaiErUoWStiH7iVNQ==
X-Gm-Gg: ASbGnct1vOZqh5zjYlnsza1mWPw/Ydzai42BaTTasNDlRTC2QPrUPY+QuaVE/d86fiE
	QV4Voc6PuP3Vx1gmrYe9EgNxftyx1+8HboIDZmFjURRiezi9vxtd1LngUNxE0ZyH1FPzWhpJ8XU
	N2lQvjtdUojM2jcoNHwuCs8L7eTrYIinC1/eUUeDQtjs6sJEtHiXOUJ+nUvui4vDHmonmFaIjI+
	DEHwhs+Xbgtm4hx3fWBV/skMWTr6OkhTvJJisy15qEDaDvqWw==
X-Google-Smtp-Source: AGHT+IEokI8/QdZgrQf6Khw+qmZIKYKiiUgjGe2BsWGspCY5PLtcBEV9VcspomwVXiAZN5jhrLGIGNRfYpYegqH5QMI=
X-Received: by 2002:a05:6512:6512:b0:55f:4760:ffc4 with SMTP id
 2adb3069b0e04-55f709953admr2780344e87.29.1756819782757; Tue, 02 Sep 2025
 06:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org> <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
In-Reply-To: <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:29:31 +0200
X-Gm-Features: Ac12FXxptM2x0FIw3VzAD9gZWlHPceo9WcRvgcocpGcthnkDE6yjXmv7vVmpP9U
Message-ID: <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of pinmux_ops::get_function_name()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > While the API contract in docs doesn't specify it explicitly,
>
> So, why not to amend the doc at the same time?
>

Because this series is already big as is. That would be another commit
that can be separate.

> > the generic implementation of the get_function_name() callback from str=
uct
> > pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> > NULL. This is already checked in pinmux_check_ops() so add a similar
> > check in pinmux_func_name_to_selector() instead of passing the returned
> > pointer right down to strcmp() where the NULL can get dereferenced. Thi=
s
> > is normal operation when adding new pinfunctions.
>
> Fixes?

This has always been like that.

> Reported?

I mean, technically Mark Brown reported my previous patch failing but
I don't think we do this if we're still within the same series just
another iteration?

> Closes?

Ditto.

>
> ...
>
> >       while (selector < nfuncs) {
> >               const char *fname =3D ops->get_function_name(pctldev, sel=
ector);
> >
> > -             if (!strcmp(function, fname))
> > +             if (fname && !strcmp(function, fname))
> >                       return selector;
>
> I would slightly refactor this:
>
>                 const char *fname;
>
>                 fname =3D ops->get_function_name(pctldev, selector);
>                 if (fname && !strcmp(function, fname))
>                         return selector;
>
> >               selector++;
>

You can do this in a subsequent patch, I prefer a smaller diff personally.

Bartosz

