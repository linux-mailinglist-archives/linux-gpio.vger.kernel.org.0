Return-Path: <linux-gpio+bounces-20032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0660FAB5355
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 12:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436693BF684
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 10:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D4428643D;
	Tue, 13 May 2025 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQUXizoj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E023FC6B
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133989; cv=none; b=onnyj1oTWAbABhIRjVa9W1eE4hcQdMC5wv9SwLxcBk1w/F8UOWBpOKx4g+27k8gFUemr98ZtWLPW2J9qW34haVWISgqf8QqQ+RzH1V66xZncu6ixRIRwmDH9FgYb70NpcrGsmUXX3xO4JWVpRsIpQ5MBbU87qvuzZoumRz+iNNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133989; c=relaxed/simple;
	bh=GAD0kFJ5YJ2FK8mLZ5w9P8zRKTWeWXXWX86RwPrS390=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxnZRZUy1zjn595dmtyNP+C5+dVnh1EJuO+TFpqEINUOZAFwEghGPwfBg809ney2u4IbRO37+ZlA/YCtIpXl0N5x5WSWxwy/S7mOz+t06/2Nnghu+MidHFmK/F2D2DV7Ryt9BjnoBrQcCLsTUjba3PdUJRmn5k83/i5ZHyHWFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jQUXizoj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b5b90b7aso636688f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 03:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133986; x=1747738786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=;
        b=jQUXizoj0s8tXQLdH4D/428a8dG6y31jd0Ts82QycPUYpPMD8QOTcNSaNsD9QXGqaQ
         N7EJtnF/1sXZ+zyAGfVvTU8Z6AvWpTWtUAx+JQi1hBU8L1FgaW945syqGhi5yYbOVACd
         AmTHpIHncEHrWfjd+0C69PC2qRfCv+6OYYECgUPn4uBhDiN8OcctKblOtSrnew00cew/
         MnB6jv+0/OiDLxKijrCOXcxtXmKGAkB7vEpo/LQu+dFQrMqyJsIO0AtO+yjWK1Czfptg
         StKYg/o4Tx3IBVCG1uF2QLgQp10cJX9kBUPW7eF2lGkZG3Al3BNUybnyRqWC9j7rZ21t
         CzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133986; x=1747738786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=;
        b=QweJfVMR3wBQkiJMzv0BdRBoDGmzlKsSeVANi7fWpwXGJrmRRrU5qprlBQthxfufkH
         NB8vCKr/ReUWQeegvgt2cGzpNKCwo38ilr/VoLeNOUuropXnyLt/Ek0mwgi9pe2ezH1B
         e/PLHpFxJmiJHFClt2mCJmOrByBpazbFwElQdDX2daPoXKVKh5KgQXfoodiPmUKE4cPx
         YwDeQC8c2kL7WRCUKFULZtAJnmu3qTP7fElPBvcPwawYWLSDC+bVhir5GBZPW2OiCh+a
         9KLVCy5AFuSraMyx8iX2A7is8CobRKfHBF/an+fW3DereemhDILkQMEbEyXh55R0iRWc
         XdgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4A5A6siswhiEelOPdOhaUDJYfpLKSpqSczkdFMCEZm5MFDUQNr1tObBiStLMtbPS7FUP2SDP1U5ig@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5svS1gehV7eKYB9WhadYgL1J4+tYCRjrxNKjFt+4K4HbKKgDC
	VDz3IgLjZmJpaCzW9KxX3n0IL+Tt2kQ7lL0d3OPkoqDlRJEK+ysCE1ArtogK5/A=
X-Gm-Gg: ASbGncstd9eGp6Lo6+caW4/o4iYqBgRlsm58zReA20eVENYqS3RkwnqCBs5H0R0+xGL
	Z2XrAWvy/EfybctSLZmFFk0lpE5HbpYv+EPb/lQkXpX5ep9k7af+mV3SD1lJ0EH0kZqqv7PjOHI
	u3C8y31CEOrcibFiyoKUQQZK96zRsGWcmmwIph2sMOhElQK1dp9a1jlayeKOoZQBMu/88stKouG
	+CQsGQVNyoCT7xwIITUerRWhJXDax1pbhxW/3NsFs7mWu0rFFM8Oprxx6AT02T/KULJtuxBgqPZ
	fX/MerusyjofRfB3wFoq1z+eV6iWFDMswNh9pMwYv+Fj6lYeyTBj+4NSghli1nZei2Nv6fHKFwC
	YRpU5keg7WnknZclaxz7h617Cz5neixGirp0SqeY=
X-Google-Smtp-Source: AGHT+IG5fKMxvjjltTJpP1VGWjmB/2GOQg7Z1BsjigMi3Gmj35E8GZ5+qOXlM4koXQ1T7HjcmVC4nw==
X-Received: by 2002:a05:6000:40df:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a1f6423590mr4776881f8f.2.1747133986123;
        Tue, 13 May 2025 03:59:46 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm16078670f8f.60.2025.05.13.03.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:59:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.16
Date: Tue, 13 May 2025 12:59:41 +0200
Message-ID: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=GAD0kFJ5YJ2FK8mLZ5w9P8zRKTWeWXXWX86RwPrS390=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyYeXGYfRXBpOgZAbyMyM0G0gXfP7x4rVhaNG
 ZNlW5kBi1aJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMmHgAKCRDBN2bmhouD
 1/mMD/QJrD+uVxskUSpR2WCT2iO2+zMLNh2Y105Wpicr6Ppz9U1EayRxH/yzRm4FqlVITLwSXPi
 J7Wutiaf6sSE2g+LRG5mvicN5kctLn6jeKpgtCr7chJmHsffzJ24bC4MPO77a84H/0pItzLZYss
 W5bzXLsjUr8VMg/22ALBMREsx+wfGlD5wzSXf/eTXoPaIWktsTOaSMC6UQ1+kC5zLgUZHXVJdW3
 wf4gOksiN+SxVyQw1831nBdb4d3o68a5HtWw/q620FAkMOmKrur4T2Jow9E2eAaC3xjcE46cynw
 m/FXrz42LMv6FeI+6oPdkx1gn00Eeg4pM2LRIyTK9htDCTkC5DvNZvOwTbvobADJgAxopW8riR1
 9yEWXP0hQOTaoLnmWmatCcKRPhvFh3mScZ7aWEML5Vh/AVRVe/2vA2tyPqBi9kxePyQbTJjAKiE
 PkRTZ7gAgGxy2W6y4oXv85TbJgt7FYIQknSg4xPjnmkhrAcOXi77Q7hGQxDwh0bJzxL4bwgBikx
 ZO2Zh5Yi2T2TzlEffmT/iaq5GtwUtRkOdwuK6byXJJpRAL6GFlyAVKdXqxtRJzLR1EncdtF9c2i
 x3BO0yWGmDqHJXPZ6Ge0SoVyGhmn4vq+eo5UsX+5n6NqJwlqI5f+3YqjebieP9OZmVRz21iaKm1 VIdZZ7f5Bry/C
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.16

for you to fetch changes up to a30692b4f81ba864cf880d57e9cc6cf6278a2943:

  pinctrl: samsung: Add filter selection support for alive bank on gs101 (2025-04-08 20:57:51 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.16

Refactor the driver suspend and resume to handle Google GS101 EINT GPIO
pin banks and add the alive pin bank for that SoC.

----------------------------------------------------------------
Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  52 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 300 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  28 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  21 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   8 +-
 5 files changed, 255 insertions(+), 154 deletions(-)

