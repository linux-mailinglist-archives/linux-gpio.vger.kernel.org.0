Return-Path: <linux-gpio+bounces-21438-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10436AD707E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908BD3A4E76
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2BC2F430C;
	Thu, 12 Jun 2025 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="q6UflVGZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFAB1DDE9
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 12:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731593; cv=none; b=Z9Lz/vgA3YtGT3AIcaehKMTFQ8uFV+vl4lbOo5zbuAwOLaIwfTjKCYEuWJkhPmidF+tG2Bjm9e56LkOSj/uhTx2B7p6sHq5w1Lw3PRaH9rMWL/+Gah3WTuyGhCXvwCSYzKXNdsf59GArgd4xP+YgDFJ2Rfgo46rOQap062T9cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731593; c=relaxed/simple;
	bh=8Pota8dkR02wT49S2HF4L/MTLN6ujHuKIgNCMs+APmE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r409Z/7MQstdrso+o/dlNGg6Rhm8R7rZWwtwmHDttHdPpwuxiP16RRZnWl64gzyNuzObJ9CRBujNBi3TsGm4xZzsgR/65R92z36Fi5YJ+cNYZa3H3sQRKJcYry10/tARk+ieHFrnRmo6C5fkvdEjrSjfNrYAbUAzhybyns6LM1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=q6UflVGZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 823FE446FD
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749731589;
	bh=Afhp3MnDZ8YSz90JTIix2BbrvKztAqO/KlIyy5S9co0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=q6UflVGZ7dG9hwKRD2omMg+HIJ6C4l8+IVdxMXrAGTt4tsrYzFGJGTgf0cogCdQq4
	 QX5wXJ0MkALDuige0eYCisp03v7U90PXbQY2AVTr8RKQeMrigFENehe5fgh/PiVXxm
	 Ot2aMUuDwrrdWBpuycFDp34EXbfhmDxQZmYJX8UOss0Jyjgm6JY+MK6DqPTudTB0gR
	 XulHFcdMA5TGJT9oo0EeP4RdOzEdJ2rWLo8nFmlKd1KwOUbQyu0uYzDZ8tnLIWBTiT
	 xKnavyWKQmqKQMGWkUNs+h0oWxs7pMtIVLkTyQyAsRPDJ5nEzOR9b6gRSfn0HSrgOB
	 jw1sBtxzYd4EQ==
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4064a7f003cso761990b6e.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 05:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731588; x=1750336388;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Afhp3MnDZ8YSz90JTIix2BbrvKztAqO/KlIyy5S9co0=;
        b=Y+n7w4uCys4sJA8UBjUPSw1AfRuk+f+R/UjeNM3e8CdC7Mg6IPWayCSoF+0x0KN08L
         h4tszmJudrjcwOQHSsyd2adhfg+dOfIeocYmOVhh7oOCNlWuwR2/RDgzvaqgPaRZEQjx
         T5wX3agXVRxViqNswGZ7vM4Np5/ljNQUCvydBKeL44+CuCXuow0bh2Zo4FyFgpRzvN1r
         ok2oNMQUHLHGvX9zDnoOXt9myMFFORISe/sxypdIiSWYL15kVzejBbVSlJNh0jqgHNUH
         2+UuH4SCu6G8q2Q7VS1QnJm6uxrJeclQnAeLEq39ZptsdRHLfljE68wE3NnB612qjJbp
         qBrg==
X-Gm-Message-State: AOJu0YydyHKzcRPWuxH7Hulk57+NfnZ/7ceixBFG+J6On7ykD/adMZsk
	gaRDAb/0dqhiOs5MI5Ot4XITPrGAwmwtOwzIGw1Mz8HzBlkw1C0XO5HHzqfg648hPfny8cVYT0Q
	a2qz9FJBGXI213v1B6dlTRtSZekqU852JKFWdQXJ9/wS2tLqtQlmRb0pUiL1BxMoocpmHtoZjQb
	eRg40N29SLbHZBj0aQie/3yw/LzOIOOvzXul2sujZAAl3LdXOKtvumGZV5jh/Tgw==
X-Gm-Gg: ASbGncvjebpM3AoC5wQDJ9hW29Vvos1/it6+WUSmSDjC61AnFlVfV9vSf5mpJn2eclF
	/O/IqUhgaUzxv+78xxLN0gcGvi9QrgrpmOUaMOjXVeJRjJzZOd1NBiVDKv/pj+QJOyLHyQr3tAv
	ByGg==
X-Received: by 2002:a05:6808:16a8:b0:409:f8e:7297 with SMTP id 5614622812f47-40a66904a25mr1784591b6e.0.1749731588029;
        Thu, 12 Jun 2025 05:33:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9HuVD3Y9Nh7ECoxqwi5r1Xuu8Ah9JUblEg9FqkvPNVWpQgNLnrb5MDLjHD3iYqYF983yf9ar+8ttzysxtSzM=
X-Received: by 2002:a05:6808:16a8:b0:409:f8e:7297 with SMTP id
 5614622812f47-40a66904a25mr1784576b6e.0.1749731587697; Thu, 12 Jun 2025
 05:33:07 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Jun 2025 05:33:07 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 12 Jun 2025 05:33:07 -0700
X-Gm-Features: AX0GCFtdm9VbqPFJLvMDFhcnx6E9vLWf-37xaveMuUbtcRw4xMIIZFLi_WmdP6o
Message-ID: <CAJM55Z-a19+wXSQtLbEgJDvFDuXCc=Q3NsJzLC7OS40FxOUuZA@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: starfive: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts all GPIO chips in starfive pin control drivers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> Bartosz Golaszewski (2):
>       pinctrl: starfive: jh7100: use new GPIO line value setter callbacks
>       pinctrl: starfive: jh7110: use new GPIO line value setter callbacks
>
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 8 +++++---
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 7 ++++---
>  2 files changed, 9 insertions(+), 6 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250612-gpiochip-set-rv-pinctrl-starfive-89120203688c
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>

