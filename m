Return-Path: <linux-gpio+bounces-16574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D4A445F1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 17:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D16A11884212
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 16:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BBE18DB18;
	Tue, 25 Feb 2025 16:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjR4vTPt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EA318CC13
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500610; cv=none; b=i4GtUmohFUbLreCJGB21p7BM3e+ZUcRtHq6T1oci0XGy2Q0X/oZop0iRt1Ss+BWI/Y0I35eWgcmPpitPgJxjJXrBrQ+P/PNQP/tmGTxORDbI6Vgv6rhEhyVVkAGOcOpGmfZva/iKUXZnV18IEy+vhkMfn6QhkBdW8Rfw35kJdVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500610; c=relaxed/simple;
	bh=p2muOdipPBPelc0G8QVVmxLLKm2ZUwbsy/AC035S7AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mm8Cs9CeH0uVrbSCvP6F3GVji72SNKrbhShTI9oIfmsgw5UHy0kQpL2TStLGJvafF7xuMjVo1s8OOu59e+1Z5DRPt0C57bu9TJO/t3vV9MgsqfIJudKIqlPENgqxJFI1HsNAygPb4pWhq5og62zzQwHhYB3q8Uyraamxq61qjDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjR4vTPt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30615661f98so55773451fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 08:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500607; x=1741105407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwTVpdV2JjSXgTvzENZ9IyWWdkDRBnMKH/dfCxaMyOU=;
        b=JjR4vTPtJb+aSd/emRscX4dnrfsdPwYtvgOxAf2m2Svb2hmq0M2xEHL7ozvDoYvYRr
         riA7s8EgWoKSELiz0tcR3oyCoRdCXzY5z09UswE6k2HTTWhCcfLUp0O3tGBTGw7hyfRU
         idLAgx53TUGigm0EZI/O+olk+Io9FwvOE932BAtG13Kv/4LB6P14Q5GmoY1lYolJ+7qC
         wkR+qhv+EEy3uLmcpxH40huSqEj6AFT0Zwyofx8dBy+Vs54+t+rwxkJrPmpD1D82geMq
         +xX3jQfKXEzcE3gsODdspdYuVpPyGVHbtOzM0sX/fyWOnX3tWqqOS0lgUwZamhojEh8R
         1BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500607; x=1741105407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwTVpdV2JjSXgTvzENZ9IyWWdkDRBnMKH/dfCxaMyOU=;
        b=und5qgt0PdT1hQz7PCHXyBprrjIiPhnsWwdHBvQi5uOxl78QtCWb6b5bf5+G7FSHZf
         ykjsOx/7hwH+NmMC74/ibQu04EfIdXAvWhlh6NxOTF8HTH+7chkvCUEP+PvKzkrPRQg+
         LOZet7quo7zuhdRqfR65BwnsUSOJjkrfYXBXnQ1yWZPlMS7Zh2N9MxsXXeqA7YXTNGmK
         cVIQJBbqxomyIjKXHum7Tx7JJvd82YDKcFheUcCS/4QxN8Wilii8BGCnLDi7eORQNzaF
         KpORl7GTb35yrB6ZK22N2iE/Yk3lr/AR0XQe/d+9NBouYddOndr/Rz4Kefs9yy076v8x
         XTTg==
X-Forwarded-Encrypted: i=1; AJvYcCVoh6Dj075vaG8FII/5OQX4FzfxO11tUMd6fb1UlJzX4lQN8VjFO7CCAKzFPzXezSD/AEIg3UVoJ97c@vger.kernel.org
X-Gm-Message-State: AOJu0YwzuVPbpeSW3gIGukJsDBD6tlObA9LRbNh8pPpN3LTph/kaaxMn
	gJWxcwkx9Gbp2JMoNNCP7qcVOt5bYPpb6QRpublitzALaPh/s8jcennRzy+Ay/cro8NGeVSmDwQ
	8klr1g6nhSwLG0Cn0MsM9BIXQYPOAZYCRQPY7rQ==
X-Gm-Gg: ASbGncsNiFueLYVv5fJKtSKFuDWxDTquyNrd8zcbN+5BDnAw0MBlWWFNNtvwwPlxlnf
	VUgdE+lIN1H3oQm6jtbwncoFMxMCPhiw7yqnh/PqIfGkRCokGQkgKu8Lccv6vde2GF/bStU4rTX
	R+f75Edmo=
X-Google-Smtp-Source: AGHT+IH1cSBiJaqWZBQz+1oq5/PChixqiVALnH9bhFgTe0md4+MN+IzZ3AEODUq6QzG1w0FaEprZGS9Czr6Kk3AzBSQ=
X-Received: by 2002:a2e:9ad3:0:b0:308:fd11:770e with SMTP id
 38308e7fff4ca-30a80c0f167mr16005611fa.5.1740500607109; Tue, 25 Feb 2025
 08:23:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org> <20250223120638-GYA39613@gentoo>
In-Reply-To: <20250223120638-GYA39613@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:23:16 +0100
X-Gm-Features: AWEUYZlkLTGEHvbrZyxHu4Q2yRspVFfhcab6__rjgENXWUAEaf3SKXErwl_alg0
Message-ID: <CACRpkdZLAtxOdF5TkGtdrbXB+S2jV8Lh_47vMdiwUt74Hez7OQ@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 1:06=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> Hi Linus Walleij:
>
> On 08:31 Tue 18 Feb     , Yixun Lan wrote:
> > Pinctrl is an essential driver for SpacemiT's SoC,
> > The uart driver requires it, same as sd card driver,
> > so let's enable it by default for this SoC.
> >
> > The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> > 'make defconfig' to select kernel configuration options.
> > This result in a broken uart driver where fail at probe()
> > stage due to no pins found.
> >
>
> Can you take this patch via pinctrl fixes tree? if possible in this cycle

OK!

Patch applied for fixes.

Yours,
Linus Walleij

