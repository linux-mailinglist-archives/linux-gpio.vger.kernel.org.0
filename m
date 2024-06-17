Return-Path: <linux-gpio+bounces-7481-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 638C390A7B8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 09:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7650B1C24856
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2024 07:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C95190475;
	Mon, 17 Jun 2024 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQ3FW2hZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A78190053
	for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 07:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718610712; cv=none; b=hG4BNtSoNBLTrrfAU5AUKK9l3KfW8dv9Q5CNS+dJn4w9LYklg0EIpUvQAg22wXGNl5KOdKZ5nwWoc/hQV3LjV/HHgz2vC0Wai+UHPI1q62oeyamej6WmtP+adrBWanNJPGHB4f6/J2/HVCDseNEHlrx750YwX4C5mghu5zgOoWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718610712; c=relaxed/simple;
	bh=g0pZANeDRi5V04Sm/xo04BLs7+hVY12T5D0Ou5ILcV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNjMSQERgZu/vMdcxo8+WfcjaXyBa4J2bAcgihJH083G0kPZiGrCdK6iq/N01FuXS6lEyLsjrr4bu6gKPUCkgy7SqKpqXz67YbGpXNxKMiZhE3GxxXaAVh54VTx9mBcwg+HHTx4ePhv/DDTEQFXXZBAFq+CD6NTztyJb+Wmy/aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQ3FW2hZ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so39530891fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jun 2024 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718610709; x=1719215509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISYVIi/lQb+EdNOS7i+jRq6ftJin+8z2zfISyc7VAlY=;
        b=cQ3FW2hZh9p6MHhculqdZk2T174iye9bR2nP21hjmZle+ud+Z5A6X3F/E2yses7cIF
         lwtf/a8GQrGa6yBmWPO/KQ2mrjKCpc5FFQ2yCYKq3+enH1Hqtg2rzFh5A7OZ1sOPeOzs
         QOczvIvWDkkonZnf8L9PIyLoxJNlDxpZ1fHllzbW+suirKQBTAhloD//8IW/mXJ71qgr
         Qz+/WUzjg9Ti/bXc+BnOwRDVgE44A/Mvom02oNwj+heNqy0iEUrYDDi5SACgEWLxB+Q8
         VkhHfNQfeFaj809AspqioF1NcdI+CbDBSHckxcm4ACa7mPkBRux045lO5Wy3IOIryTLD
         Cj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718610709; x=1719215509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISYVIi/lQb+EdNOS7i+jRq6ftJin+8z2zfISyc7VAlY=;
        b=QRqjMC5foaP9MTs4zaFDxMfjBQInVPMO1tWNfM3gKBTDMvsYB77kuV/4XVMhaYh3uW
         zAH/mNeAvI3mke1XxuJON8PraHb56FAbjbGg/wuM3Dg2FmnyIz0zqX1Eh+EgBVx3iNDI
         qI5fgbx8/I0VudQrzpMT67DWnduIhckFXrkIbvCHbPyoeFCL3S4B2xPDKecQh7N3NxSl
         T55OXAqvaLdc2LLzAE60wc0Osna2MDKxVYULDXnQdvQPvWUQA2WnpJLN4mHzF3plhbz4
         CBoV2qVoCOlJZopXzWwk/Pmf7pdSQDXfTO/GfY5d+BU+Ojppjf86bcF+KMDqzrJ7SJeg
         8eZg==
X-Forwarded-Encrypted: i=1; AJvYcCUXQ47n2bfbJEZq6hwq+NaalWNKIMZgAD7+r3gUL/vNGsa8wmbQ44COnK6PTECK9rGmv0HZs3AJBd7nNDN0yrdLi8owd8KkN/9QhQ==
X-Gm-Message-State: AOJu0Yx/qctOkXa65s0VNJIoHSzdhrOMjANmlRPrEs65kD9aBGB1ei3c
	DZ6XGC5b86Pt4YhWMjUEKb3Xcwm/zCEJSR4NpcHDK83Cj0McXQQ7x/GZvhuN49P/TbPSJw1hXyp
	VjdhBe6QGSkYCttppVYVVYds/rFvD07HFs5e5SA==
X-Google-Smtp-Source: AGHT+IHSUoSo/T3Bg7/Cf9FzDPegzyCg7mvp+Hy2h2BhAEYhmTt19MrDnWQ6nPiOTHf7gByv+74Bwc0sGtVLwwLOEB0=
X-Received: by 2002:a05:6512:b9c:b0:52c:aea5:9e09 with SMTP id
 2adb3069b0e04-52caea5a347mr7839129e87.20.1718610709329; Mon, 17 Jun 2024
 00:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603181938.76047-1-wahrenst@gmx.net>
In-Reply-To: <20240603181938.76047-1-wahrenst@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 09:51:38 +0200
Message-ID: <CACRpkdZd8-C2uuR4f0T7a19V6KsurUWUXEqYR94HUt1jrT_7+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: bcm2835: persist_gpio_outputs follow-up
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Phil Elwell <phil@raspberrypi.com>, Kent Gibson <warthog618@gmail.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 8:20=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wro=
te:

> After the patch "pinctrl: bcm2835: Make pin freeing behavior configurable=
"
> has been applied for 6.10-rc1, Andy Shevchenko submitted two comments [1]=
.
> So this small series address them.
>
> [1] - https://lore.kernel.org/linux-gpio/Zjk-C0nLmlynqLAE@surfacebook.loc=
aldomain/
>
> Stefan Wahren (2):
>   pinctrl: bcm2835: Fix permissions of persist_gpio_outputs

Applied for fixes.

>   pinctrl: bcm2835: Use string_choices API instead of ternary operator

Applied for next.

Yours,
Linus Walleij

