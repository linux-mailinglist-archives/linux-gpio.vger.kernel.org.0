Return-Path: <linux-gpio+bounces-7777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54A91B99B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 10:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA6771F218B9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 08:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81385146D54;
	Fri, 28 Jun 2024 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OZ7BZVkV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5A1145FEF
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562448; cv=none; b=jp6ToRJFxep3xAjdIGIx+/81nttljNv62gDqbJ//yogqnJkHdNHzTkoVWYCjywuvKNqQ3jpZ7BU99O3n5jNJXgFRYIHPncZ58uX+82yP7whZ61dxRD1NDi/CqPPXX20OWA9At18D6pjgYBgNNrztQDPX1MpaKKrx2jF0FztFO0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562448; c=relaxed/simple;
	bh=nqRVrVZ5iHTB+ps1/W7+ndXdI8MuJhemXqbN2y63NUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miITB4Z5h5PHQChZXl8Vq4qVIGT/nOV1amr7oEwwJTuXOLEZGvDwkVMbtu/JMeNZ+i/K/4w9iO5Smglt4m+UNjj2V0WnVxocrmgBkQoqd1uwxZA7E4LYEHt6UiD/+xx33IVJB8e+5JBO4RMp6w7qXmn8o9Xz93mYSHsZT5UC01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OZ7BZVkV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so235801f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719562445; x=1720167245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+A2p+KZRH/8xvrbpyHuEUhzOc8IOFJevUwe6fDGuuE=;
        b=OZ7BZVkVWwOvMm/H/ywvPbjhfbJxOZNVB/vrrohsdOo+jUA66Rk1aht/Lke9Ml6HMh
         9Lh0U4EozX7mZwFplFdSM5E4S0C0wV+xgw9C8Iu7vvWtbrEeX2xeugxwTi8zVBeaF1Iz
         hh+nCyP3BbGEQ693Z7ghQBsMDN7n8iAi3zYs18BNQPPEYnKceFKJoMsqGMEDXP12p0FU
         wgvdccBGFcmCXtAauko4xYrttAWnYBQzmlwvQpmLZCvrhmnY3Rn1NeJs6l2/LY4Dp0CR
         nWftVEFeTOKDm/t3wV2KRkt+6B6gR0j+u4YKKkZrX9QdxHs62O5gonsa9q9Sw8YzKjvm
         jLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719562445; x=1720167245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+A2p+KZRH/8xvrbpyHuEUhzOc8IOFJevUwe6fDGuuE=;
        b=dEBz/hZuJifxNxileJdN8/02WPt5bMwEuoPP/zMPrO0GazBZU41+59phdptYldDzxi
         ixgQyqBP8bRWRGhyUFCciKwsv9dwI8hbjZ93d1Vu9tHSsUAHTS25TRyPzQBhENE8GdfO
         BzU9WL36FKUrLLcZKN5F/xAqM022GBLCCDXWoNAKJDtNLsS6X7+O4VVgG0W4uh4X9Zcr
         cICYKrUaxIoS3X10QUFO4jAsHexge1rgJHta+2ILn0+uyPOn+/l1VWmqvBfIoXQzpfwG
         cCe2pPvEbrru1jsezrcLiteGZMcE/CQqCv37ARBZBqz7bldy3acx8qOpqfE0G8slNkvu
         T57g==
X-Forwarded-Encrypted: i=1; AJvYcCUhHhgVSjVUm/J+24KroYQrEVQDf4PI114e3YDr7HDsRYlCWigO/dRCQczcVvFHnLl+woUFW4h91T/tWrNVQS0zPt+Ra4gLRN08zA==
X-Gm-Message-State: AOJu0Yxeaj/eXgYbSTBTJtYZV6CBkBqtndsfz/YuAOqm7tjXVp3xX3zF
	vewREvftM8nf7EIhl7rvYpO9nCYswttu5e5ePBVtLJGzZsAyzcf/kuYaNlirARk=
X-Google-Smtp-Source: AGHT+IGdgSQ/Loq0ddkVqf0l8lNw8JF9rgv9IPIxTPMHfTT2BIwjBV2OdOQ66kl/5H+IrO6I9TR51Q==
X-Received: by 2002:adf:fc0d:0:b0:355:143:b5f5 with SMTP id ffacd0b85a97d-366e96bf096mr9758192f8f.64.1719562444843;
        Fri, 28 Jun 2024 01:14:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb92fsm1479113f8f.88.2024.06.28.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:14:04 -0700 (PDT)
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
Subject: Re: [PATCH 1/1] dt-bindings: gpio: fsl,qoriq-gpio: add common property gpio-line-names
Date: Fri, 28 Jun 2024 10:14:03 +0200
Message-ID: <171956244055.25464.5584663942925200358.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627202151.456812-1-Frank.Li@nxp.com>
References: <20240627202151.456812-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Jun 2024 16:21:51 -0400, Frank Li wrote:
> Add common gpio-line-names property for fsl,qoriq-gpio to fix below
> warning.
> 
> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: gpio@2300000: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: fsl,qoriq-gpio: add common property gpio-line-names
      commit: 3550b5db3af4d0ff7f2ad07367af6427534620f0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

