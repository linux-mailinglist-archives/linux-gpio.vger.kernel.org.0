Return-Path: <linux-gpio+bounces-12283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1FE9B437C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 08:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E9211C20F05
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2024 07:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86269202647;
	Tue, 29 Oct 2024 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AIQguSIT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58A200BB9
	for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2024 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730188148; cv=none; b=oSYDLt+adnKFlWsaU/Cgntkrxr+9hzcV4BBCj9k4XexWHwrI5iFXTSOrCrYGF4Nzx3HCgP2+jyxAt3rcWkzHfbbR54oto488W0M5GAQs/vniWZTUJCZ+yfl+UO90rDZTXItnTMZK30T1w0Ecbxtz4Sr7xHafcYjQBwM9tTZTaJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730188148; c=relaxed/simple;
	bh=/CAb9CWG2VL00UDttR3CC27k5GrxZSUxeuBJJdbzOQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzGcLTA8XeVQxZ4LH78L1lqbU11eTB4u9nlzaT78OEBschA1bAJwqVBY5xI4beh3DSBIyPlSb26Bp+hEysaczXigkAcZIP9wArm1sfspdh7H1c6lTUp7x2tzFdGMonKDPPdZld4rO3SwT1Xas/yoxDhu6nbBOVvvu1Wc7nTN9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AIQguSIT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43159469053so5638475e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2024 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730188144; x=1730792944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XhfsmwUj+X8iEqSXpw7DJyfNK0UwrOSOb7rXfFCTvk=;
        b=AIQguSITWieIXw+eCqNq4R8ni2wYhxmUi/2Y7/mvwjWA2aF4yI/BFLLsdlUdcGV49K
         Fk57cdunGqXl9uVdD4hY+18/MHxJH4T4y1lvRgPp82vbSt/K057CYX0pwK6gB4ZzIgSG
         LW5/4zZ7+7RXZDy8HS1XDrTKbMmFXg7Mx5Id6UDaLZIRtUkZEefl1jUllD3q76eaLAWO
         nD8El95HFEMpBS6WNXkSCJ2JvPTJVyNS+bd4iwGHv0M37RMPayhTA9NryE1LwTmtbVqM
         0fQADlw8pdyd9jlOYFenPAy3Rw2P10ulxzaJqb4jAIMvWzZ0f0Kg3JO6XjCahHmO3qiI
         yZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188144; x=1730792944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XhfsmwUj+X8iEqSXpw7DJyfNK0UwrOSOb7rXfFCTvk=;
        b=W/Y7CH3Re3EFTfY3Za6ErCu+qkcqH6iFHMYZy9qV4ZLdCqcxMUGVGCWXrQVPYO+mQH
         Wzw1pu914vR7x20tzTwUUuJDSKnSzumAeYX3QEp8ckmZLFa29ouhHHa3G7cG68LnuKW5
         kWFKn94/e0DChOi/V+SyuHXp09Tohn3+x7JkgSNWsiy8ctMGBp8/oLJt9eIlutqM0N9/
         sY234rsbcAjhW0CZw3DIQMUixhhz1i6XWvlzL2fKj8WveAAiqGXUXEQI9fWc60qDO7LB
         oo0e3IXTQNw5h4HFZRySNhTcj/L2ISc/x1IrhzfxHEo9c1O9zG6MQO7Oe+n9dvzmInlL
         y4ig==
X-Forwarded-Encrypted: i=1; AJvYcCWldAKoR1JPJ6lV9vURDt0XDqyCs8XhP03k+TBP1OynS02kpW1JBkHopt4QOnuR8TbOqaFIY9zdOhgH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69JYCn7+Q4t76OnhIsmRq6JaPgVrsgDslI0qT10qiizuZGw/t
	UrIdkwzyIQLnAs0+0h+Jd/iq6XcFXgB1PtX1HrscmCzibTjVBmsJeUTvZ2/SoPk=
X-Google-Smtp-Source: AGHT+IEjldluzPS+mbSRbpzoiA8QHGhxGv3xtNxXkaRT5kOdZUeZudVSGvXVTF69IiXysRbTVe04jA==
X-Received: by 2002:a05:600c:4f10:b0:42c:ba6c:d9b1 with SMTP id 5b1f17b1804b1-4319ad236dcmr39811725e9.4.1730188144508;
        Tue, 29 Oct 2024 00:49:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bdafsm11691358f8f.30.2024.10.29.00.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 00:49:03 -0700 (PDT)
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
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.13
Date: Tue, 29 Oct 2024 08:49:00 +0100
Message-ID: <20241029074901.18977-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.13

for you to fetch changes up to 6d2dbd4cec8939ad2b813b8052eb12406db528d7:

  pinctrl: samsung: Add Exynos9810 SoC specific data (2024-10-27 21:02:08 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.13

1. Add new pin controller drivers for new Samsung SoCs: Exynos8895,
   Exynos9810, Exynos990.

2. Correct the condition when applying further interrupt constraints on
   certain Samsung pin controllers.  The condition was simply not
   effective.

----------------------------------------------------------------
Igor Belwon (3):
      dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos990-wakeup-eint compatible
      pinctrl: samsung: Add Exynos 990 SoC pinctrl configuration

Ivaylo Ivanov (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
      dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
      pinctrl: samsung: Add exynos8895 SoC pinctrl configuration

Krzysztof Kozlowski (2):
      dt-bindings: pinctrl: samsung: Fix interrupt constraint for variants with fallbacks
      dt-bindings: pinctrl: samsung: Add missing constraint for Exynos8895 interrupts

Markuss Broks (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
      dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-eint
      pinctrl: samsung: Add Exynos9810 SoC specific data

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |  23 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   3 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 431 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   6 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   3 +
 6 files changed, 468 insertions(+), 8 deletions(-)

