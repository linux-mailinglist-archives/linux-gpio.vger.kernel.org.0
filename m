Return-Path: <linux-gpio+bounces-20366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D178ABE63A
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 23:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C58117DD2F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 21:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CBA25E81C;
	Tue, 20 May 2025 21:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phq8wHBt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9A921D5AA
	for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777234; cv=none; b=r3cM32j+57AcINfNhLJUe26pb3XzB+yZ2cX2iPnfIUyXIcPe6uyJnn19ooYV9InoGIZT+VIK1+VDCeYfmHKddHrXS39noPC8HjrPkRuoFJhI7TkcWUT4NiNvHEzj4ope0j7V77ByC2coANfSc5Rm2wAeha24cRS2ztQyruzvnWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777234; c=relaxed/simple;
	bh=oCgewP2Dk7ae9CV7K8C4fa2fNf4DN1qFq9tYjptuES0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldgVUZ2BGayvUmzLQVUmZ5ZbO46QEWYTwef9nObipI/7DEVq8XjE42hVlhROqwb2G+O9Th5HKE6dkXUI6TnHItZyshkhRjV6VzVthPJo0575l1hyjRfxZSmg0SSIn3HWnR79o55TnZMmTgbIBymtpqAttIUKQZ52mMcXa7ukDVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=phq8wHBt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b0d638e86so8755365e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 May 2025 14:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777230; x=1748382030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCgewP2Dk7ae9CV7K8C4fa2fNf4DN1qFq9tYjptuES0=;
        b=phq8wHBtbVbFPvBY1LhFPxhhKVA6oWWC5DSQxDRj2BggOobkM1tjMRw9zG7Y5c6atp
         i49GjT9q1bCdgYaykzCrr7j/FT5a/visRdWoneRbkWHwlLERxyPenna/aD6gqpH9Z3J1
         3BSQy7Bh2KoPvU0GXEajgxeMoZoWB2bA1oztrogWgN96Ob8dtXieM8B61TWzqqYqGyWS
         Dpoc1A2Cd3UXIHyEhlCrXbpZ5fGsRc2OveqhwMdEVR+3rltaI0ZDX43QJJmoh9mXShgo
         ax7tdkvksH3EBjom0njHL1lQbho2oO3njY0+WkDtRmRWAed+K3qS2t2Vz4yykOpFoH0n
         IxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777230; x=1748382030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCgewP2Dk7ae9CV7K8C4fa2fNf4DN1qFq9tYjptuES0=;
        b=dfL7UAiX1IZoszTb9tOXiS7gI7Y04UYyoXkM/2NiVk4y/HZt+XQiMWj7ijfvdcuVcR
         335DMB+hyKscG/DT9JnHElS3VfmFQBOs6WyUHZdQX7SNLamqQ5Uoc8dvDo6fI3u4Vx2v
         AevnOHqbr+pvZ4WlW0JXtU//sK5kX9xqIxTKrX7vK4k3mXjXAorfTTwMKPS08sfS2pXB
         xS6XFk+UIROFXzOAaRIWjQpjaIMTMMisLf5nQEt2sxPSQG8rDHb8eRKPAuu5boIzfzs5
         6pZ4oVqPDdDFn3WFs8AaeF9KucDTEmND4yWAuAe1uwMTa3uKx8UnAyfsL8vTuhIy03ci
         ghpg==
X-Forwarded-Encrypted: i=1; AJvYcCWuS+626Vc9kuLSmzl2GTo+5hUKWfJjRmgAgjPtliteQ7+1QWS6IyuRYTTNOPw8W79WJaxGf7ABHTn1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lH5m/qZLZ5L6c4ECiIBPpIqwRTcZPCVgmSorwE64amVxfgIt
	LwuyhGMO9BRRQBcFOfPvmVPQA1SWGJOzv5o4nZL9reo4+hFh0zm8MBwygwFiDeBaJOt/A5fnnBc
	373rkjVwFkMkjWg49tEVNIeQgjiCwrG1wN7L8dcRA3w==
X-Gm-Gg: ASbGnct153f4iJSRxD3Bsru7ezdajDY1heZ7LxsDeSXEG3h/rkCa4GTTU/Cjan9FY0A
	XgSWSakUFyxtJuebMLxnTzQ1JWoIoexMgYuct8n72CPQfPCfmRPSppYEseHayT/GDvdE0Ogvzx7
	wz0wwLwBpdTttrkomaNEs6izF9adncY19G0kVdMNM4dl0=
X-Google-Smtp-Source: AGHT+IHzVYJxuTgrgs6K8x7YKkYpNRse35+6uNr28ZJ3LfuVJa1uRT/W2mPAkpXkEEI+sX0vS8ApdkMNSAaanvKv3vA=
X-Received: by 2002:a05:6512:6805:b0:54f:bf00:6f38 with SMTP id
 2adb3069b0e04-550e99045efmr4388422e87.45.1747777230153; Tue, 20 May 2025
 14:40:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514131342.755840-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250514131342.755840-1-alexander.stein@ew.tq-group.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:40:19 +0200
X-Gm-Features: AX0GCFuUSwW_4O9obfFKQvmdKYpuQp-SLx-d_4JegFT_41aqCgC4BS-UTD5YyXo
Message-ID: <CACRpkdbmHjan9ifg_hs_2qbjBS=LCKenMbvnbCDX7zOsM0TvQQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pinctrl: freescale: Depend imx-scu driver on OF
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Esben Haabendal <esben@geanix.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 3:13=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> Although the driver itself does not depend on OF itself, it selects
> PINCTRL_IMX which depends on OF. So only select PINCTRL_IMX if OF is
> already selected to ensure dependencies are met.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Both patches applied.

Yours,
Linus Walleij

