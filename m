Return-Path: <linux-gpio+bounces-24541-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E988B2C086
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B449723FE4
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA50132BF55;
	Tue, 19 Aug 2025 11:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5NNZKBS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E1E32A3F7
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603012; cv=none; b=nx6mlXjZuxStLrnoS08URdptm/xgBDmRAGweN2/FMojqFewbPNkHyNp1J9Hwu0BF1wU1xotpyyx/rAasDwM/ekaGiR4nUQVn6623xFoDODRz3LAtAtCVSAfPGEwhhHo1bsliDXGqF78llLt46NLOdvBXt4p+h9M1U9DH30zhD/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603012; c=relaxed/simple;
	bh=lMubVHIOYZHjuIy4jzyQtspupuCgz8Yv3TMEP2lh7GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIGGNpqI2LfP6EJEIrWRgINQlhZb7qJ7msdBLJ5abGhHK0WYuYon+Gn41TVrTyEXex6NyMhmBSVscX3lg2BMlugMfYkmksS4URCtmTe1wUrntRsxYlCYOFZ17g0fRH3z2d3HYikYruuExtbH9BsSFLJtUPkU7RzakZRC/XdX4jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5NNZKBS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce5277b8eso5343965e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 04:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603007; x=1756207807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8Zt8RWp0BgkL/argy/j/Sx1Y0JjzJHgLTbPSG2Iyz4=;
        b=Z5NNZKBSSh4otR1Jge/1ROUAWFsBfwWVaD9qPmacpgOb5ZO//S+Uz9uQ4viMMAWFf9
         YGTi6/Hw96RChy+2MA8q+Oow9fBuLUu1lWJh6yqDNP1Qk6U3mtjoB/ia4IVYAg6VDGtI
         tBZd4WiOknuv7ZyQ627c/KXO5CywOgF2CP0lE0hMHi239W9i6+lrmVtiCCWpyFu9D3sv
         FCRSn17nHEQKkVnENzYFyzu/Yb5OiWms933FV8UD9pWcAPoNf7DmIJizSzyjtHIGcNS2
         HOrtPhfOLCh5OcBGUFswsx0NembOxLaTOFt7FCyobj2JwkJOZj4zLOgVooysdXPcDBxe
         aK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603007; x=1756207807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8Zt8RWp0BgkL/argy/j/Sx1Y0JjzJHgLTbPSG2Iyz4=;
        b=D3B+zcYftwyzL9KWi4xr5w2ofJlwxZIpQwA3jz0Ln33LJtri0z9jgiORdsMe65LYDR
         NOdh12aNQYjPBz5fC67UvDZvc7P1YMhb40UJksYeSMjLmUUmyCqd04RuYvHAusUSBJwg
         RyFa1+gy4Z9/xXFz7PfJzISJQPcMBQCghPkkwV7vw8GfTX6nQCtn+lfimtofcEhOVsJ/
         +/hFeduTWL4QxbT1cD/s4qneZgdQAgPXL/ufQZimQDDeMb4s2yIGbaC2TL/DV8yYMRKy
         ZySOWVC84jDlim3hZTLePeiWJ0xw0o0HZ9p9KRwLEjkBmiTuOHu/dVuJgTXTxUYCqiww
         X1ow==
X-Forwarded-Encrypted: i=1; AJvYcCWJn4A9K9jCpH519R2rLCMVNV6lw+WN/zmtkPU4RkTOITVruRbOc+56EcuLcCx8S1iMTFViCLDqlFnP@vger.kernel.org
X-Gm-Message-State: AOJu0YwYviUIcUiPZyZLcukRvuZgIhuIXllcGI8vHUidNzGISheGRD97
	yIburh+gtkCMmBNQQHvundcV+tIUXCIkzfDFPCk5Zns3hNVCDSXPKTuObuLvRFr0G4DfNzvEdJl
	/oaPwFmxVQ7IzbD3dnJDj6538s5s+q+iFgZbh311O7A==
X-Gm-Gg: ASbGncuEDAoD/7RN0BlonwKMfHg1UHPnChB7z/Tw2suUB3P369swf1zVJGVzUpvRzPG
	x7cbbIZ9fu4lO1WFbaaMXtgpXjxoupH3ZPwSk7VHunGDh1pvjqgz8mvBz0sSMEBpjlFpF2askWm
	s1jqTNl+EQqBiS8JtOqo5vrV5K0scg1xrRMGiY26xqfWNyg1B8q+KTfbE+YyoPPY/UpQNcESxEp
	NF2yVAUCq/hvxxBng==
X-Google-Smtp-Source: AGHT+IGIQkeqWSXk6UW50B0lvRJ9yh6Ui0meCyjjUOq/i3AdK3dvZnjrLz811wrbO084+jFl2Soan4QZclj+LnmGujI=
X-Received: by 2002:a05:6512:318d:b0:55b:9460:2a30 with SMTP id
 2adb3069b0e04-55e007959edmr704413e87.11.1755603007489; Tue, 19 Aug 2025
 04:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
In-Reply-To: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:29:55 +0200
X-Gm-Features: Ac12FXyJeMR015VuulCaDAkb5ecQnwsNmUlrUKxO75YDJ_lmXPNInWa--QpmnnU
Message-ID: <CACRpkdb=U=h5OguMuy9G6avCCN6Aem=2_60C+_uBsrY+UvD5ng@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: tegra: Add Tegra186 pinmux driver
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:

> This series adds support for Tegra186 pin control, based on a downstream
> driver, updated to match the existing Tegra194 driver.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
(...)
> Aaron Kling (3):
>       dt-bindings: pinctrl: Document Tegra186 pin controllers
>       pinctrl: tegra: Add Tegra186 pinmux driver

These two applied to the pin control git tree.

>       arm64: tegra: Add Tegra186 pin controllers

Please funnel this one through the Tegra SoC tree!
(I don't know who managed that, probably Thierry.)

Yours,
Linus Walleij

