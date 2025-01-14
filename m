Return-Path: <linux-gpio+bounces-14780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0A4A107F1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 14:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B31F163EFD
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C98620F982;
	Tue, 14 Jan 2025 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ohd/sM6f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7323244B
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 13:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736861730; cv=none; b=PZVihS0ExnFEj4QyRz3xIoJuR9hpS6Y6f+BtIbYMAuxJURexosbEgTAywiKwWPSjePB3lnYyWMXG8IpP54788ty1Rn/yhEoxS8k/YKuE5QrCmhTVFhvjVz7jDRWs4bmFbq2vqExGYpsvAbXq3K3e/miwmbTR6c3XWnhADIGfeNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736861730; c=relaxed/simple;
	bh=OGs8Hc9IWWzDksFLp2i0aEV2PzIcvKtjUvmP8qDGIAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeyEidBJbSFgu/boocpA5qJANqsrW0oAa+3Wvt149fBbc83/l3PmQtVcMouWXqdCB4aAozUMCjSGB33K7JCrwGkDFc1mBXLVvx6qkpV/mCYAz0Lyf8Se9HkZavi4znoyCj9+NgrWphDSHyv49j9ybO3/jjge/ZR/rBUTKSSEOFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ohd/sM6f; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-304d760f118so40038481fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 05:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736861727; x=1737466527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGs8Hc9IWWzDksFLp2i0aEV2PzIcvKtjUvmP8qDGIAc=;
        b=Ohd/sM6fwMjm07V+BzAT2mg/Y0aVu2DxRowEf4yacckX3jvgUsaBuI8YwG+4cYIxbI
         pSU9qdIYp6KmiWTCMnVPoGiiVVm7AF49gUQBLWuaU60R6tpdrptDsvcvU2AWYGxs3tra
         8t/JVWsNs8i2bySL5uFov/WkmSbvvyEzGnRx6gLwBNm6Ue+xpjqIuZC+N91Iphb3EFWz
         neVteWeGE4MaprPSDXF3EgStFOlFUa+ykRBtZqIMU6E6kYwjkCLlZvN6LqyxfY/GQJwn
         U9fJL23uCNTKkQUkxHtOH7cgtY2nUMkx9ux3Z3+L6CmJhvWxbfE4aveK+vZknKeUCxs7
         H20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736861727; x=1737466527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGs8Hc9IWWzDksFLp2i0aEV2PzIcvKtjUvmP8qDGIAc=;
        b=LthIAWzMo9bUkz+x8p8u9G/a2aZMP3rbYyLk6H6MHHuJTdWjBi5EFHfIHoF62hPOWn
         ZFGpI28Ye3gkidm5LUY/X4hYT0o+6AmYz0MI03r4gqh/G8NZCy9HRH2OppJw8SYF62uC
         UtNK/aSYhdqjG9+tQwuBCE3SaVIzeLTEx9ciBrfkiSW2GhDGZA2ZKbeHIWsHfzaxuIF5
         YFz7g6qR4IJRLAw6Ve2BMh8F8tBnPq1Ch3MO9GpMyDlK56vYjpSsH4Rx07IuMsJM1BYh
         6qYawYVyuFg81YXND6kWSLcco0NQvQ6KnMIiJa2knGZW5cep3XumgHHukvNtZXKo/lMy
         immQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+ySOVq5YXjad/5YB0ppbPoeJ5Ks+pLZLKxps0zs4o3w+uR1I4uJNF/+Lwr/upZcEvilPUYrvY5hJU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2zqoqXPHUMUmFVzWkfSxkvcWrjzQ2lvgoGGZVaFAT7BYq+aG7
	5PlgGD8C58j0KKJPZiBT1aAhpjzYyouOxAGB37BYNtga9BiCCHHNSUcQZV7xsBiWXjTRQ89ZXoA
	xZQjW+X6rS3cMoJnfXR8xdzvlow5I7KtE+OAAAA==
X-Gm-Gg: ASbGncubYxsxVO528BI4Q3dpIedKVfVVoU2mdgRc1L6K+Wu/PZE9IePj0RaXL1zb5CO
	m01ba0EXYZ8q8aIRxhhorvBvAi/2rK+tGsIhe
X-Google-Smtp-Source: AGHT+IG7Hggf4gHs1sBOINfllEm+fWCjJrV3nbiC6u53gxsntmmds1ddpINilGP1960h7CCebrmf239bkNUwC8sCGGY=
X-Received: by 2002:a05:651c:2222:b0:302:1861:6dff with SMTP id
 38308e7fff4ca-305f454ff85mr87745811fa.9.1736861727092; Tue, 14 Jan 2025
 05:35:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d4b2d076366fdd08a0c1cd9b7ecd91dc95e07269.1736184752.git.mail@maciej.szmigiero.name>
In-Reply-To: <d4b2d076366fdd08a0c1cd9b7ecd91dc95e07269.1736184752.git.mail@maciej.szmigiero.name>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 14:35:16 +0100
X-Gm-Features: AbW1kvYAJnzRu51j3qTmHBMTwwZ-0eBN7XtFz0GtoWTLyxew_rXiWIITgL-wUUA
Message-ID: <CACRpkdZVihBHrYEEq+_-X9HstKsN0x_RWjUmLm68Q3B=6d+Dvg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Take suspend type into consideration
 which pins are non-wake
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 6:41=E2=80=AFPM Maciej S. Szmigiero
<mail@maciej.szmigiero.name> wrote:

> Some laptops have pins which are a wake source for S0i3/S3 but which
> aren't a wake source for S4/S5 and which cause issues when left unmasked
> during hibernation (S4).
>
> For example HP EliteBook 855 G7 has pin #24 that causes instant wakeup
> (hibernation failure) if left unmasked (it is a wake source only for
> S0i3/S3).
> GPIO pin #24 on this platform is likely dedicated to WWAN XMM7360
> modem since this pin triggers wake notify to WWAN modem's parent PCIe
> port.
>
> Fix this by considering a pin a wake source only if it is marked as one
> for the current suspend type (S0i3/S3 vs S4/S5).
>
> Since Z-wake pins only make sense at runtime these were excluded from
> both of suspend categories, so pins with only the Z-wake flag set are
> effectively treated as non-wake pins.
>
> Fixes: 2fff0b5e1a6b ("pinctrl: amd: Mask non-wake source pins with interr=
upt enabled at suspend")
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

Patch applied!
Right now it will be for the merge window (v6.14-rc1) but you can
ask the stable maintainers to backport it, sometimes they pick
patches with a Fixes: tag on their own.

Yours,
Linus Walleij

