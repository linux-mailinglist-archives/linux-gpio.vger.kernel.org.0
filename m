Return-Path: <linux-gpio+bounces-7970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744D9257B5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D691B2514C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 10:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5021422BD;
	Wed,  3 Jul 2024 10:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hLK23n0o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414C13DDA3
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000943; cv=none; b=Nejz9l3KxZ7N6qK1WxjPGvn5MdONF2H4+0/QkmtgLG18jIHKXFLkoUXFaQrGACWSJkOHaKFXXn2mEydzehhREBaOftqEHXS+tEg5N4IyeK1nXXNaS5jf3wrdumm+K3OAW/NjJHkJXjqkJpcYj+8LQEqprQORshX82WmB44RYABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000943; c=relaxed/simple;
	bh=2BueQlBHNUIUsB9Kn2OPvhoSOi/prFH4uiBvlAu1/5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DyxRXv2WpOhrWGA6/SMkEQ1bAqIVayRTAALyUxbYKciIDj00H2OselLM0uVebHbO7FaUrH6AermbaoKMdSei2HgTMe1raMCk15pwqweB9p4LsRfmXjeDkLhhrPTdKRbAmYap310KJwgckiCVVtew/arItfadg2B+A0cOhAnVGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hLK23n0o; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ed5ac077f5so61764161fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2024 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720000940; x=1720605740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKXjwCiaLg72R2gJ/FT04OGaQAr4J9i9LzgGVlBH+qc=;
        b=hLK23n0onEk1CF3XTzyjr0MjReLqzOfhQzV04LBBRM74og0zmEdpLDvZuk+U4/w5XZ
         Y0UJpyuN0+3YeAukNLedAYHHZ532ImpNIXN1GK8wxUsUK7n8J39tct1yl22o1HFFHmgM
         /OUZ3j6ymoH+FMuNPjhS+zn86aGGHhILS2XzPR/HRLdIrkvdvSj1QhPCw+4WzRhqmS4x
         uTooZFRIaym0Lat8YRHhsBpLdpsWXjPlCyAvJEEJ3K4Yryr5Jljt5vy7DnDADsFgaGPD
         BhhKn2YE/Suq/bIbTzWt+W8axArnpgKlJXMCzESbPBXe5809qYTuoQtUhGZuMWilut1E
         8+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000940; x=1720605740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKXjwCiaLg72R2gJ/FT04OGaQAr4J9i9LzgGVlBH+qc=;
        b=aXVSyD2vGuOr8bJHaBncw4htShnzDfIzWGhVb713JdtnxEm9pTtvaWKmvQ2J88Dpso
         VEx4vLM3pT5mPHcZ8O1j8fHVyYB+rBjMhIiGpP3FyGHMVokYEzevzhevo6EEpgqyWbjx
         B/sw706XaGtjox7VxnKQ0iqB5I2BwmU790C+3nck+ubVjK+e2GPgZVgJaKYvC7Q/UA+n
         9WI+k24nGjezWp5flXp0+smGfGyWEmbZgvToHOwNCE7axDxBVC0NIfyQtQ1sTPM6s9Nu
         Gt9G7AWqMbl0MqAjhFT982xekmB04+wZ+7JX9sMnhHjaW2cMg/JK8QP1mYfllLaqcOVK
         qt6g==
X-Forwarded-Encrypted: i=1; AJvYcCXxUsgNxGNe+IV60quVL3h8/9SdGfdpTxn+zVAamnjSeBRDcYj0Q6TXH9Y6h/jIpO485dBFXB26lXpqUyuXNeM8v++g3tF7MsFs7Q==
X-Gm-Message-State: AOJu0YwtPL3qWTTTy78YbntwmfBIoV34S0XBOETvMAtYd8/4ICKy9JEQ
	TxJK3nFjj83aHf2JU/Fe6enQjtRS4weUiH+ABUw1RkXT3TAeQaDxD7Y9aF9Vu9U=
X-Google-Smtp-Source: AGHT+IHzaRxDw+0xOP288QMyiqj94os0mlDtdORAYbbCky+tos45ZKFz/8bNjlRpBD4147ufyiEMjg==
X-Received: by 2002:a05:6512:b92:b0:52e:7de3:64fa with SMTP id 2adb3069b0e04-52e826feba4mr7443996e87.46.1720000939825;
        Wed, 03 Jul 2024 03:02:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c37f:195e:538f:bf06])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8df0sm15560651f8f.29.2024.07.03.03.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:02:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,ls1046a-gpio
Date: Wed,  3 Jul 2024 12:02:17 +0200
Message-ID: <172000093537.12215.11059064969197754180.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702201724.96681-1-Frank.Li@nxp.com>
References: <20240702201724.96681-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 02 Jul 2024 16:17:24 -0400, Frank Li wrote:
> Add compatible string for chip ls1046 to fix below warning.
> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,ls1046a-gpio
      commit: f2e395629747e718a67b567cb84b49d14792b312

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

