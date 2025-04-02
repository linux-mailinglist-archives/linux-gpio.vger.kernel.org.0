Return-Path: <linux-gpio+bounces-18178-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D7A791F4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 17:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF3D91891E21
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 15:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093E0236437;
	Wed,  2 Apr 2025 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwQSPFv3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB902D7BF
	for <linux-gpio@vger.kernel.org>; Wed,  2 Apr 2025 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607061; cv=none; b=B2nIUq2i1GAcjUXqcgx94BJgSE1p6Tf614DOjEEiMXu0WnLUBxyhP016TuDwSaE43niyd/UWSetVGBCvPtn4xgzPnthRAaOBy5wcoJTZrA4KkxAeo6We9g2T0MS9OoEkY0wlAeL4wIZySJ0jveIWiiqR83XEEGE/n8ILfb0OXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607061; c=relaxed/simple;
	bh=NyHdU17b3BYKcxSflMYDwmeiHSv8J8KHGYTpcsjLvEc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FtgB2Kl0NiF8LttMOjqgGmcINrGYyrPRhpgHirf9hBNLzh1VhqV6tCeTcLE5P3sQEZuLSQksi1ZxcZRdkQdDQtiHSmCPWAdcEK0PxU4jyyYO9nLJX3/OazOzMWsMxcMkRbcEeBsN8Z12PEZU11Kxv5KXYGvnO2ArFQeG/koLgxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwQSPFv3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1832832f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Apr 2025 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607058; x=1744211858; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yx2R8pO0Ra3Nc8Y0LIAf122qHZ5vDc7iiej3dPjF8G4=;
        b=QwQSPFv3onTb5O+ZQBcO4g8cTiZjqdVQURhNFiUXFzOIQcCF8pNRoUAfqTmBYUMkUz
         OEaUoMfnvSrLtEXhkiAtPUk4SyTUAV5qJacaS4oLC+cbougR51oRMRrKL+0DdimjP1z2
         Vv2HjPiQRtKsN9FwynTy8HzIzH8igklSs0UCwPylssIJKlNAYFS2fTE/JFBz0ZSoJbp0
         yx8lqy7DDCYEtyji7LhbW8ky0vPanMrDGAPpuXrihHOpYQsBqZnNw4mUOxbyXRRjpxx6
         lDmTD5t+ZZEJPKiot/ki0u9zVNL1i5EjdY3qV4iLp21hfCXC6r0WoibHux6VnY6aTkIm
         r88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607058; x=1744211858;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yx2R8pO0Ra3Nc8Y0LIAf122qHZ5vDc7iiej3dPjF8G4=;
        b=SAc2dD+gBzF0V4POuROKwlybglTxa9mbm/ZuU+2ieWUiA9gUDw2lpkHShdxRGbMJgQ
         hDOH7FKPkHjyrGDQ0ZSfa0VJjvQLXu0ozam8WRKSSauXKRxfcnSP0JekqXt7sakzKHK0
         7oQIgscK0tktds1Jxqey97zQsy2dGFpA/E4CRVIxrke9UcXDQg7GMoYXLPxK1QVmhiz7
         wuKE8reEtdcos1SwJnkfpLQaRVp0q1MBshtaMuQ4k4q4ExNI9bMvQ5EjsyNYOiqTehQ8
         PUYeW3BoW2cHVNLLwd89yP84OByFR9n6an/kVNPWOIv8VBpglV7VOaCy709VlcN/qivQ
         T6Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2siVu6ukW3pU2RStN9pOtQLrIwfCxzfSES4dMnxtyufdq4y3MJgnczl3bgWM/DxMTTg3RJW7SdP2@vger.kernel.org
X-Gm-Message-State: AOJu0YwP+NZmxkBBinYrGE1MR0q619BD3P22a8ymUU25mCxGWjI27oOV
	pVOwNZuS7SR5jzU/oeWa5GRdN82eCcor502pZXUXMsFsY5V7tZazaRK6BEGbUbQ=
X-Gm-Gg: ASbGncsC6rt2ZwomYfUXGSEkrWPeEOv6Z+nkVAfHViVQXchT9QuG4Wv730Eyw/wNQlh
	fe9MXK56HL8L2Xd4H2hpQj6/Cfu5IbfGHvu24WjCg4L77hugSt+Djhe3Fz9buvVxonTwYRAQqqA
	0mm+2Znta+RkpotstQo5gAagnKwyHwbigKzzUt5uJ32dkLiCZiJpD2NLEBvXbWAPE8xLaPGcUDi
	PiU3xyCNKXJYD4TZ/tGGOwrBHH7El0EyZMiuCPsji1tNL3syCi4ZrI28R9sL7va2JQvoeoToHON
	h8I71q9OFr9RUwqLFgiXOLPqtSZHZuL1hK4rZunFu+vWvG8/9LpsuZm8eONVo/DqT9los/iEDQ=
	=
X-Google-Smtp-Source: AGHT+IGtw/YaMynhE0C3M4qaV2783kGrZos1104coVh6+inJZg+GE5x2GivvB2wyhudpC0AEWiHjvQ==
X-Received: by 2002:a5d:6d8d:0:b0:39a:ca04:3dff with SMTP id ffacd0b85a97d-39c1211805dmr13821255f8f.40.1743607057958;
        Wed, 02 Apr 2025 08:17:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm17469190f8f.39.2025.04.02.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Wed, 02 Apr 2025 16:17:29 +0100
Message-Id: <20250402-pinctrl-fltcon-suspend-v6-0-78ce0d4eb30c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAlV7WcC/4XNQW7DIBCF4atErEsFM2OIs+o9qi7AHhIkCyxwr
 VaR716STVNFVpf/k+abq6hcIldxOlxF4TXWmFML83IQw8WlM8s4thagoFMalJxjGpYyyTAtQ06
 yftaZ0ygBEZ1GO9BIoh3PhUP8usPvH60vsS65fN//rPq2/kuuWirJ1vZKeXDHjt6mmFzJr7mcx
 c1c4ddBpXcdaI6zzKH3ngj9k4OPjtl1sDmhd55CMA6Inxx6dOyuQ82B0dqO6WgUmj/Otm0/Ix/
 uwJUBAAA=
X-Change-ID: 20250120-pinctrl-fltcon-suspend-2333a137c4d4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3882;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=NyHdU17b3BYKcxSflMYDwmeiHSv8J8KHGYTpcsjLvEc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn7VUOIpQvmKF+MMYf64vqTmU0WTMgiEeFEpShA
 AynK1joXv+JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ+1VDgAKCRDO6LjWAjRy
 uoeJD/4+BiSfIgPVMI5fRAx6Coxh8/ggZfvF1RkO524nX45fsdiIaMPS1QR+Y7a9CdVb6L4Q3HX
 V+NY7G4o32bDe69CQ20fjklp3fu/QwxXMMENII1Zebp3Mkwt0wAlkTGNwQ/cjsVvRZSlywJUehF
 r5cdRDOGh94HHVuyQST+GQ9u4oMxyoiBardHYbuCLytcuXeieBnVg96fbn/ETxeMdWAkeiBQCd2
 1AX8VGBu00u9VUf3OB4e4X6fVkrp/7wC3MZ3Ty45olPqDf6NOCnLesQp9An9aqKnDkB1i72Gg/X
 U/WsJcAmOLe+Rzw12qSgWtBRGLhCKv/pzfUKsVGzfPRnafo4WJc5fK74OKQg/gN2qzNAbdQ4hQI
 bv5+mDP+IkAigc1yjYm31kZuUnt0kk8iLq6jzznvbaUWBhbI9ir/Tl++qA2iM5+hf1OBzyfEvGd
 XVLwHGmbavNBjHtKWVUVOwVAyx6XPgr2koESdSNiArZ0hGZNiv9mu5HCZkJoxhbu2zlsTcPp2uJ
 DfvD6979BXD2CWh5UBwUz2o/5jJuzeFUYUZLcVO8l3Zcd2wa54LrTiS15RZoR59InWWGEMnH0sl
 +CMBzDDa2i7TdzdRkTWVqqmNTxoqJBRW+5MFzd3+NP0ZHremI3HWNzMsByood+77Rhz+Yz3R64V
 syq/O8iBenmJoaA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Hi folks,

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v6:
- Make drvdata->suspend/resume symmetrically reversed (Krzysztof)
- rebase on linux-next
- Link to v5: https://lore.kernel.org/r/20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org/

Changes in v5:
- Split drvdata suspend & resume callbacks into a dedicated patch (Krzysztof)
- Add comment about stable dependency (Krzysztof)
- Add back in {} braces (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org

Changes in v4:
- save->eint_fltcon1 is an argument to pr_debug(), not readl() change alignment accordingly (Andre)
- Link to v3: https://lore.kernel.org/r/20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org

Changes in v3:
- Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
- Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)
- Make it obvious exynos_set_wakeup() is conditional on bank type (Andre)
- Align style where the '+' is placed first (Andre)
- Remove unnecessary braces (Andre)
- Link to v2: https://lore.kernel.org/r/20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org

Changes in v2:
- Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
- Move filter config register comment to header file (Andre)
- Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
- Remove misleading old comment (Andre)
- Refactor exynos_eint_update_flt_reg() into a loop (Andre)
- Split refactor of suspend/resume callbacks & gs101 parts into separate patches (Andre)
- Link to v1: https://lore.kernel.org/r/20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org

---
Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  52 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 294 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  28 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  21 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   8 +-
 5 files changed, 252 insertions(+), 151 deletions(-)
---
base-commit: cd37a617b4bfb43f84dbbf8058317b487f5203ae
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


