Return-Path: <linux-gpio+bounces-16844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17881A4A2A9
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 20:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E00543B4361
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 19:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4B21F4C8E;
	Fri, 28 Feb 2025 19:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="MmyKNJi5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7D27702E;
	Fri, 28 Feb 2025 19:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740771352; cv=none; b=aJomGL/b6F4+l/jF1tFcWFJ83Q82oSMWM0W4MlB5dZU3LIOz4bBCKfy8oFGdCveFnntokRC0ZYXgSPdTm4ueI1QIDmArOc3lKX46tE42rQ2vD2XvGvd+3/bDMk2mvN3q9pS5YSr8atQY8I1davi5LBjS7eLbvmhHzpHmKt1h4gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740771352; c=relaxed/simple;
	bh=bp6gbMUp3288WL0ToRvNVxjxkQMxQTnl5A0aQxSywk4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZpdmjtsVA3wH5izo9c5Bjm4M2SwmuFepXrG8lFhChIHtRtTsz/4OQ/J05ubJk1WB8hqLtxMWkXmS/PkOscEWuEwkFKIShVsPOYxd3nCjdXPzZyYdbjUf45z2t+MQ1mtyFrp4Kyalgok9j7I6/m2gg5kijwRTASdBkULMFPoJrA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=MmyKNJi5; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B5784258FD;
	Fri, 28 Feb 2025 20:35:41 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0E-YoFxkxdp; Fri, 28 Feb 2025 20:35:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740771337; bh=bp6gbMUp3288WL0ToRvNVxjxkQMxQTnl5A0aQxSywk4=;
	h=From:Subject:Date:To:Cc;
	b=MmyKNJi5Dhjy0uJHfh8yvLRtVRE44e109l5GnaIQQW/dHucAbIZDyuBTP72inZOfh
	 mX4QPOd6d0hpfGH6eAjq0WAwUk/VgnHte4DHsFj5OuY+zKny9NjlwIuKz7n9Hp6DII
	 w1SrSCt/SwoTSbyEE9hfC7LrRUpXWOvDntN9Dq5zfaha3+PpnDnDjlpbnSjpH/y2A8
	 CCnIjnlWpvX8zqLiVvXNmdriIj5Y2GFnte509d/v1zSNd3Gkp55h67hF5s/kxJE0sA
	 jPtEu0GObgMY/melpG8z7CqJM/iz8ZPzQ6k+WzxYK8pbGpqZR17KOTapcyH0nxGXSg
	 BDZptplsDf8wg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v3 0/3] Introduce pin controller support for Exynos7870
Date: Sat, 01 Mar 2025 01:05:16 +0530
Message-Id: <20250301-exynos7870-pinctrl-v3-0-ba1da9d3cd2f@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQPwmcC/23NTQqDMBCG4atI1k2ZiT9juuo9SheNJhooRhIJi
 nj3RqHQgsv3g3lmZUF7qwO7ZSvzOtpg3ZAiv2Ss6V9Dp7ltUzMBogQBOdfzMrhANQEf7dBM/s2
 BRFUaQgkVsnQ4em3sfKCPZ+rehsn55fgRcV+/XHHGReTAiZSsAaiQiu6tDd656ep8x3Ywih8E5
 SkiEoLGSIWgjMT8H9m27QNpOlNe+wAAAA==
X-Change-ID: 20250203-exynos7870-pinctrl-07265f719061
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740771331; l=1455;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=bp6gbMUp3288WL0ToRvNVxjxkQMxQTnl5A0aQxSywk4=;
 b=tCe2GcdQ+1bzf4pENv8Xc7aJ42CXG+7QuHLbOCQmo6xlDriCKCb9GFMvRIcY6vvE51kZQMDqp
 ZUszi2MRbpUAslID4B/9HlVwGE1rcsBGtl2h+Tmm0rMkIPHiBvoUqU+
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Add support for exynos7870 in the pinctrl driver. Also, document the
ALIVE pin controller's wakeup interrupt compatible.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v3:
- Reuse some structs and macros from exynos8895.
- Link to v2: https://lore.kernel.org/r/20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org

Changes in v2:
- Take over ownership of patches by the co-author, upon their request.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org

---
Kaustabh Chakraborty (3):
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      pinctrl: samsung: add support for exynos7870 pinctrl

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   2 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 139 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  19 +++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 6 files changed, 164 insertions(+)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250203-exynos7870-pinctrl-07265f719061

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


