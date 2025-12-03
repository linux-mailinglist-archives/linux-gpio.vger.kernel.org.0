Return-Path: <linux-gpio+bounces-29236-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC06CCA1928
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 21:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DEC5300FF80
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 20:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A63C72BEFEE;
	Wed,  3 Dec 2025 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4Aoviyx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036822579E
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764794095; cv=none; b=E1T1fjaXti7nANXJx0mRDz0xzKflobO9WgkJwW1Yh6CAf468nytXVfPuqKr48w6m0c/HfMCzR7tIzFpxEG6STsilfEr0IHdwaE8wryf2cEKYZ6g7rEsWIaSanqI80EPrmhVuk649ObkmcQXx6TgCav/sd9FGL7ECJbTZ6SzWufM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764794095; c=relaxed/simple;
	bh=w4rJsR6Nh9mBwGuX7cPM6OeDmZTGHWrh6UMAszCQTbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MNFBCOZNDa893+ZGT/D7EP8D8erkfTltcYWLeC7sMaG4/Sw0hZiP2E70+503DfVERIiMmhVLRLW1ByaAlOLZGIfl+fhptprGMq3t8AfKVMwhaYlUAeu1yM47eXZ2Ua1fhiLLXL+VaVRvltvk8QHg8yxve5AA3AoY31L4IsWzIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4Aoviyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0386C4CEFB
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 20:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764794094;
	bh=w4rJsR6Nh9mBwGuX7cPM6OeDmZTGHWrh6UMAszCQTbU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J4AoviyxUz3ir8e6jQibgl24WzBB4K9hTrtCJqcI8SsMYkleuFvvkDvCmo6CnF3Xm
	 oPt4drbBSHY3wPkJzEW2ZzTBx/vy833FaSNQ1vEcJn0hogMWl7eQM0qW0lvfeUFy4+
	 d1FAt6PyDLnv4oYwwY4rF4OVeHhfltoRF5kqDWivwPNkbWPBKpEF9WXBJoBHWHKHDP
	 S2f87trI/Q2/h9GVLfGC9xCmAqDISFXearmSZamOSJJs5DqqBLE+nptrUQT2EA4KT/
	 b/vSqWIigtgZwN7g+h19NyvjfxDYfHlsW+VCcFwJVtPDUWaSl4j1qey/LzNjQMjPWU
	 Te23cusq8GuAA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959105629bso123559e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 12:34:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVoO0ABrJ90SfVHiNu8YDa+QPzj3OoauseQICuSXDj2amW4OA+7iuQIhj5K8qMTvk0It2wEfBzpjkYV@vger.kernel.org
X-Gm-Message-State: AOJu0YxGxGO7VauxlAAbzsM9GnpvzDSJTbFiL4RqgHXGWAFoyqHpNdNY
	gfHyvwIPpA1cAih9JTo9LInocSnvHA4sb3g2nXA4TRFHsS76XVd4qYTx1QU5yo8fCvg9n5JIz9S
	a0cqriq9eo+zWyEBhhkGf3Q9FF9fqYMJea5lNOFxDyQ==
X-Google-Smtp-Source: AGHT+IE+BNKrUOoMXLuIoRmuuo8ss/Wv9Xz5yxCLX+K55poKLP2x5817aLeMLJnQIZjt50NOX0PRARaAt6Mw+fQvypc=
X-Received: by 2002:a05:6512:39d2:b0:594:2f72:2f7f with SMTP id
 2adb3069b0e04-597d668278dmr129045e87.6.1764794092607; Wed, 03 Dec 2025
 12:34:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026114241.53248-1-alitariq45892@gmail.com>
In-Reply-To: <20251026114241.53248-1-alitariq45892@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 3 Dec 2025 21:34:38 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mce0V0agv--=Tn0efG7+ehDM4H0Ks1dQ5h+X3dOxYp-TQ@mail.gmail.com>
X-Gm-Features: AWmQ_bm95AF8ytOQY3Yk124GiWIiT9iiYb5Drj3E3s4l-iAUbXrzMyjFaoMTmLc
Message-ID: <CAMRc=Mce0V0agv--=Tn0efG7+ehDM4H0Ks1dQ5h+X3dOxYp-TQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: starfive: use dynamic GPIO base allocation
To: Ali Tariq <alitariq45892@gmail.com>
Cc: kernel@esmil.dk, hal.feng@starfivetech.com, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 26, 2025 at 12:44=E2=80=AFPM Ali Tariq <alitariq45892@gmail.com=
> wrote:
>
> The JH7110 pinctrl driver currently sets a static GPIO base number from
> platform data:
>
>   sfp->gc.base =3D info->gc_base;
>
> Static base assignment is deprecated and results in the following warning=
:
>
>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>   use dynamic allocation.
>
> Set `sfp->gc.base =3D -1` to let the GPIO core dynamically allocate
> the base number. This removes the warning and aligns the driver
> with current GPIO guidelines.
>
> Since the GPIO base is now allocated dynamically, remove `gc_base` field =
in
> `struct jh7110_pinctrl_soc_info` and the associated `JH7110_SYS_GC_BASE`
> and `JH7110_AON_GC_BASE` constants as they are no longer used anywhere
> in the driver.
>
> Tested on VisionFive 2 (JH7110 SoC).
>
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

