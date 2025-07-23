Return-Path: <linux-gpio+bounces-23684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C00B0F0CA
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 13:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55A351888545
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 11:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EF82E266C;
	Wed, 23 Jul 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O4UJfqe+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B452E1733
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753268931; cv=none; b=b0TcRAe956/f0xDjuT73QmRjy9/nLHFRHx4PAFT6S5scnd2F7u6Bzxuc4VcDOKS8U/pQ4bga0+BfsZEk5wJ/6GfSF43mnU+oYe0qvcfyEko+eOs4GomXgg/y87rsDGODskSBdnCpjEoCRSOS36YxJC8o1r4gEJ+jxaXShJw15Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753268931; c=relaxed/simple;
	bh=3B0D+GxZIdTFezM7wUdeHc2Z7x4Bz95ATZb5mHcRHNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWGg4nAY2h/t99TzXfpb3iIrEqSPEsQpD9HqDIxBz1c6UJuRVmNhSzrt1corWGztO/bmHv4nppWn13DH9xmGm0Eir76QYWPlj2phq/pNGdNBaJEL4inWzhDoK2FjH7FCZgOzH2aojuBn954UsYmvtaFU9ApIv91AiA+YbyMWxs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O4UJfqe+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-555024588b1so6901606e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753268928; x=1753873728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3B0D+GxZIdTFezM7wUdeHc2Z7x4Bz95ATZb5mHcRHNs=;
        b=O4UJfqe+a1uRJFOXYrDAfuQgdI3nruGymy2J58oYxaAIvgXRTPnWm6NGiDYJFUdK1n
         3xrS76FPfUfK8BHVVfS15hKXkVB/J/xh9354WQQXu+70RX6odvPSeEUhT1AsADkzuP5I
         kdyXiqtxzomhvnTxl3yZyaN5X6sSAPo52+QHDOwRjHjhZ8iSxJtT8mWdJdVsD8zWt/H1
         tecHpGmhygnVsY0QgqgAWGgYijcdJ9k3Nv6NHM0bDCmcwoHySagHnVTle3m7WZDslhkH
         p3e8gBcizrZWvAFx41f50XVsUBPi7vstLpUApiNZNRh/2JYSxzaaSwBiM55RhbA6WQA0
         PpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753268928; x=1753873728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B0D+GxZIdTFezM7wUdeHc2Z7x4Bz95ATZb5mHcRHNs=;
        b=tjqqhr6OXtPl/lSCRGjtq4e7cLt8KVnYSkoEnaETtdZQ9N3a2tYAq1B1FnMMbX35eX
         9p2WvHFYciUPpiNjgtY+0QlhV7JC65Q08f4PyJ4gvdrOlkIqUOXvvwxwyNw4+f7GYsyW
         HKqC7vdDtDRtHT/1pOv4iYSYGudeXyFZK7UrMrigc9+0S6Hsol+2TES5Xd4vJYKnpW6r
         UeoehWh2VorLgsCtWZZLYZf8k2zMhv+XxnIbXKOvSRsV58fDRGvGZ1DSnudXIGjIl6Go
         RV71/rUAnK3PcgjtqVMaMjOeRcu/yCJGscQmvV4Z9OJHhO9an3uKliIWedJG7inKaVqh
         DGzg==
X-Forwarded-Encrypted: i=1; AJvYcCV5ckEyQv2OgXOlnOzWrO1OLnabSF/pygBRp2qwQXWwRh0GYmg7bs6GxwIQSq7acIGokh/1rWlADdAg@vger.kernel.org
X-Gm-Message-State: AOJu0YzUb4/V2kbVYOjcu5iqEkw/tJoD5Sa4UuVwonVBtoMCj0tYjDlS
	hRkP13hv7aC5EDS+zRCXUXpf8r3F0HAeaPd/9zqolLTNKjts3+zg4ByX7yAXXwXNF87y4UHC4w3
	o0Ym/OUw5igAeAzdgB0M08WB3kxC3RoMrBaXpuTPMAA==
X-Gm-Gg: ASbGncv1X0ossQCaI3714hl4tc3zqCnwKhyGJTpBa38m+gb+y81x2XSD1KngahlPgkP
	4lHqDlJKUp8fPQuri30jsO2stBuADXdtXtmobI5zWpO0T0XGW3XXpvYGlmRcdXeSR44NrnlpW6C
	rtBOrvNKD9kB/zqiPf7RGdUREzqcpzRhw54v6dUg9J7/W0cJWOyTvwbgH0fLoyT5x/asG7Bg9Cc
	CtDjdE=
X-Google-Smtp-Source: AGHT+IFKArCYdHOkQCTFcXAgfJ76l45O02eVn107esIDRp4PDEtys19CbwegoUBC08sGUKe6rDVxbL8pTwqzpc2cdT8=
X-Received: by 2002:a05:6512:39d5:b0:553:2e59:a104 with SMTP id
 2adb3069b0e04-55a513e983emr851506e87.37.1753268927568; Wed, 23 Jul 2025
 04:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-tegra186-pinctrl-v2-0-502d41f3eedd@gmail.com>
 <20250608-tegra186-pinctrl-v2-2-502d41f3eedd@gmail.com> <yw2uglyxxx22d3lwyezy34wdniouu32zppfgwqs5omny3ge5zd@iuqo4qmi55a2>
 <CACRpkdZha_ucjWvP_NQ+z2vbD65Y3u7Q0U57NYbJ=vqQ6uPGGA@mail.gmail.com>
 <yslfabklduaybg255d3ulaxmzpghyj54zdfeqkx3oxgisxf6fo@2wecuqpvvefc>
 <CALHNRZ8jq++KVKxKP2-GwMA6CauP=cM2_wt==MRAV4mOzK2kxw@mail.gmail.com>
 <xc72g7j7png443pjxu2wpsuqofgrpxvn43emkt3rv5qrjzf7vt@qzvsiy3eakub> <CALHNRZ928+=85FbvfKt1c4VX7RudU7ehuOa6wwLj8JJNz+=W-A@mail.gmail.com>
In-Reply-To: <CALHNRZ928+=85FbvfKt1c4VX7RudU7ehuOa6wwLj8JJNz+=W-A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:08:35 +0200
X-Gm-Features: Ac12FXyYD0AJUEr7X9CzcjA1Pj4U-nYzctmGPS86PrlZzjvsb6lrpBvI2Km-UA0
Message-ID: <CACRpkdbLzAJS=iqgOEzE9kD-fM9tx22JTDPgQeLwbTFKiStrtw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 7:45=E2=80=AFAM Aaron Kling <webgeek1234@gmail.com>=
 wrote:

> I started looking at the pinmux scripts a few days ago, but updating
> the pinmux driver import/export for the t194 style spiderwebbed out of
> control quickly. I expected it to be hairy, but that was an
> underestimation. Doesn't help that I'm not the most proficient at
> python either. I'll continue the effort later, but if someone with
> more familiarity wants to try, it might be quicker.

If this means people with 186 dev boards cannot use mainline
Linux and they would if this driver was applied, maybe we need
to apply it anyways?

Yours,
Linus Walleij

