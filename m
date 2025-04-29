Return-Path: <linux-gpio+bounces-19482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C79AA397B
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 23:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0334A3C46
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 21:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366B3270EAB;
	Tue, 29 Apr 2025 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EV9jhv1/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AF125E47D;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962427; cv=none; b=SeCP0HyrOn0B8WpDSgf84lhQK0CgWNHZUxQwfRS9X4miSZRkDGQ8OnzgFT8i+pEOCDwxnf1x2yeFHLif9acgI8yci3LIVXipKo7Jx1mjAIoAmWKkAOt/JzllxQoNgwyGGiFytLmLULW+CJ9glfybdxJBSuGT1+PrOGkrokZkjyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962427; c=relaxed/simple;
	bh=TCAoEH6w3IlwJVDcE+8zZX58CauilAlUMkvXHUu/S50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMoCSVy+wAQ2U+W+cIK5TmMlQcvuZuABuSrsCMPvtM0466EKtPsH8NroZAxTPjbNTuy+eNYsx/OsPnM7JAyQDZNTUdhM6HHtPYq97HzSkI46KSeZRGiDNrLbzAkuD82a3QKY8Ki8Z2/koKzA9U2AnaYEp7wYeNj2xmCDx2MfGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EV9jhv1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B0A9C4CEEA;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745962427;
	bh=TCAoEH6w3IlwJVDcE+8zZX58CauilAlUMkvXHUu/S50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EV9jhv1/NTFT5zWWzTFT+eD29fdPzGtNGQA+/M6IwYd44/cHcMyOdXu9TsCcVdmaM
	 Q699eJe/Bw9w4FlSuFiYGxxXJPxSgNvOGSkFvaJojY1PkLosYVzoeZE3hs/2FQtr5b
	 dpmNTS8UpUYhb+Jhb8A4c0MNpVCTBnZ9z/TmzNhYqArkr2M5IkRisLiZZXNh6IubJS
	 gaYTRygo7RU1Gw0UTfFrGIfdUOyGDEGyQheZZBWLQ97fjEzO++DzuAgA/tMuO8zLBr
	 618SW+3nnmTyZdlVpbRCQP0nHPLFyMxZNKd8RXHiJ75eYC230WkYMNY5kayTlm8T5A
	 tEY97JPB6Rv8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D077C3ABA9;
	Tue, 29 Apr 2025 21:33:47 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 29 Apr 2025 16:33:31 -0500
Subject: [PATCH 2/4] dt-bindings: gpio: tegra186: Add gpio-ranges
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-tegra186-pinctrl-v1-2-722c7c42394e@gmail.com>
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
In-Reply-To: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745962426; l=832;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=Wl311uxZwU0cPpD42k7mMpBtBfmhP2gvdwX4d/QrBw8=;
 b=EyJ3/CJnhzAuVJWSJI2G7LrgO6QcbHlVkZ6h6DfEgvgUXROCOOpDiVgLfGn47OLvE1x/JFs2D
 uJIOiGc9cqdCzglXLHOFqTJog5uWX5SKvnNkvvwibNm01ulHiKKvJ7r
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

Add optional gpio-ranges property.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index 4ef06b2ff1ff04c38801b621b8e9be2ed749861f..065f5761a93f61d6b2c501102eadd492026a64d0 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -111,6 +111,9 @@ properties:
 
   gpio-controller: true
 
+  gpio-ranges:
+    maxItems: 1
+
   "#gpio-cells":
     description: |
       Indicates how many cells are used in a consumer's GPIO specifier. In the

-- 
2.48.1



