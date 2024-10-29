Return-Path: <linux-gpio+bounces-12288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E879B5575
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 23:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04A461C20DB7
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 22:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B0120A5C5;
	Tue, 29 Oct 2024 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoW+GWGq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658792010F8
	for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2024 22:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730239410; cv=none; b=pVMeDMIIzNClXt4nd5ejm0N2iPzAcXbyZQ4KbG+5KnhEKNJYHZzGvxtHzRCbPr9aqiI//JA3eDV3zdL+UtBC+r2e3EgAD5z61kuIqXOGloWm4WAtIwjgAk+U8vKpjFRGrOHdnhb1dCyaWRLWwyuXMVN0lt8dOFf8xiFR85c9j8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730239410; c=relaxed/simple;
	bh=2pAo8yXwp7EZT+YMqcaITNqvg6hNd8KJ9Uj2bnSqyIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo6CtYeUO9JinOxro80Hvu0pGPflKJvOfMwpSE+sqEWDvwsxBG0u9FTS86wTdQ12OLDpHBkwairw3Y8iLMNYd9ey+fH/8bMKCKxpfxpk7brRDtVC762s8vW+/7L4QOPffaAAtCTPPrPpZJpeY7pZEVyb169l8AEPmO+aC8eVjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoW+GWGq; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so60075241fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2024 15:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730239407; x=1730844207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pAo8yXwp7EZT+YMqcaITNqvg6hNd8KJ9Uj2bnSqyIs=;
        b=MoW+GWGqFYb18C38tw767NGzbRWH7mPLNINeizqDuRC1iYBwICoZ4QfVIurrWPclsd
         JNCRZpHd+mw/fjfA1+vcs4BefNK7vBgCPG3ecRoB4W5KMP744EcEq6/rN2ck5YGDLSk8
         KZlUCr0X+o5F+vg1zqHE3n7012CcBvpEJ59RuGb1R4xK8maLJGQcDc2OUNnaBCrQdxay
         YqFbvri7MJ1OEaYi45IgM53jTIlYOZz8uSA065IwKqGERX5fTsc1oaOEH/YZ4qMGXDHW
         LtmdL2WyrqrTks5fkwLOO2Fio9zAFoQETN2YcXgIMrrPrG6ixiR7ZApvOiF64y+WUhnZ
         LoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730239407; x=1730844207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pAo8yXwp7EZT+YMqcaITNqvg6hNd8KJ9Uj2bnSqyIs=;
        b=VNHp9kULAyzpyOjgXxn+RAWjKZErYmUmz1EKSfL2601W4t9nZDshTtG7t636AMXPnZ
         1DNN9spVs4gJ47EaCGk+ACVgEbcp310qG3TdNUDBXa9Zsq2R9BFGhCSQAIGZOky7t/Ap
         djoksJYeOQMyN7hW13iXXv3lwyhmNnwrd2LRoeJb2mvvj/+zv/zpf25HNOE6SeGW+YiU
         FrN97PDtWIWPXtPGHBH5hgYcXY5UffXiJWh7p8V37A4zqkWry+xMlU3xPKO0NwSIYv4Q
         oTdznrPJI5lcaovYX8DNfjXkUN7P7GwAR7mS9U4d+/wDqfRxdKQRFClqSbo6bBPBRDxs
         148w==
X-Forwarded-Encrypted: i=1; AJvYcCWHRMOZZW3VZ89cHV2DFhJ0QR890V10E36yjmXTP6sqsNcp2lmY8O5rB8nHAJxR7bTtVeacLr1+6nM2@vger.kernel.org
X-Gm-Message-State: AOJu0YzkKiPQhig1SlPjORalLptpNhugqxSwkiE9fLPihRW2mCImuVtd
	UXxkjp0IbVLXPhsiTnb5JkyL/ZhUCmY6mGaZmmNEChX7Z/oARDSSGWsez5Kcen2sMn0gvznFzei
	ton8SOL1RGqUXB71lq+z7VCY7ijotLltlwTzriw==
X-Google-Smtp-Source: AGHT+IGcZQz6tTz7pENhFcPJcjvryEeZRAirjIXuUi7C7dPCymNJLcuzkHhPfZv22aI+RYtsi5iRg8Bn14ptPLiFVos=
X-Received: by 2002:a2e:be9f:0:b0:2fb:3bef:6233 with SMTP id
 38308e7fff4ca-2fcbe08cf3bmr61215001fa.33.1730239406513; Tue, 29 Oct 2024
 15:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
In-Reply-To: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Oct 2024 23:03:14 +0100
Message-ID: <CACRpkdaEQYBim8TuDCCw15QDUWhHC-VqhGq1Le7eOd76k56zwQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Add mfd, pinctrl and pwm support to EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:21=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:

> Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> needs to access the same memory block (gpio memory region) to configure
> {gio,irq}_chip and pwm functionalities respectively, so model them as
> childs of a parent mfd driver.

OK someone has to merge this and I suggest that I merge patches 1-5
(all bindings and the pinctrl driver) since the different bindings have
dependencies between them.

Then Uwe can merge patch 6/6 (the pwm driver).

Anyone against?

Yours,
Linus Walleij

