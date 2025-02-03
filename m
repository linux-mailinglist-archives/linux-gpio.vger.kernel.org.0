Return-Path: <linux-gpio+bounces-15294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F89A264A2
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 21:36:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 654293A2933
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 20:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6596120F099;
	Mon,  3 Feb 2025 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Eu3xLt+I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F3720E71C;
	Mon,  3 Feb 2025 20:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614965; cv=none; b=QdY41nVBVtytU/qA9oirYmXmFORPCU8sC5vgiT9SwovDcroqyyYf0Nyx2XXzTFQSQaoeaL2j2598WZh6I52kpOLG/zPFxg2juSAs6EVKtc4UyfDd4E3xL0yHVkjefLtJcHKkM2nurLIId8ykH0ck6Gc/LJYy5K8SVFHK/XVM2Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614965; c=relaxed/simple;
	bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1PgoYTrBDFVV11IMtwB/2xHojC/45VUWdJtZfRjTI4L3+5RS2hqhYu6cSryaAmEzI44hxgj5deva5tuz96IuEpbnJA4ndeFqhwXUMKvG8U9KO4E2RKd2sLE6YZ4YRsK6p+jKaiF55rI/pU2U6nVo6Q1oBR5rr46/TSydgtdPEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Eu3xLt+I; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 349A225BA2;
	Mon,  3 Feb 2025 21:36:02 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cY7WUBvz-TSF; Mon,  3 Feb 2025 21:36:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738614961; bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Eu3xLt+Ie8n8/VAoXLQYQA16ehOHiV97RnZOhbWSMmqcTCDP6491piXY56+UYrB97
	 HMQehOMQylHqRMnlfWoJGMd67L6uOzkSuZWw/C85tP6CpgxX30/XgX80OAVPITcT9I
	 S69drDop9L/DMWd08LILVnb2WTmpGaPMGN4HbHtBwG50+/YpoF8UQF0rFxxDMNFI6G
	 h+kJri3xfsp/uWom/s+liATh6rQJKtTl6uUMmsWzC2IHtH18Jckd87VD0S5/h3sP/T
	 FRl0O+rrREqKn5JKk4vUeNW+5vG9bNVThVuQUoH0e0Bxyp+pamP+mpfWw66RLmutjM
	 +CD+P5ynaPxmA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:05:43 +0530
Subject: [PATCH 1/3] dt-bindings: pinctrl: samsung: add exynos7870-pinctrl
 compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pinctrl-v1-1-77b9800749b7@disroot.org>
References: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
In-Reply-To: <20250204-exynos7870-pinctrl-v1-0-77b9800749b7@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738614951; l=955;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
 b=NWAuP1IB3NJ/GHXlWqRoK1gI7/0dpwKwcGdirIJLX90VccapCbSzYHKuxt9oHkjxDXT6LyuKO
 ISnWvJxs0t1B7ZiiKT97fQqRg+3Rlk8vI/v/okuwsO8yu8mYJTLNwZU
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Document a dedicated compatible string for Exynos7870's pin controllers,
having 8 GPIO pin banks.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 5296a9e4faaec691994cd567bc3805f870aaebf8..bd7e04a108ce03a86f062b515306dd785189a537 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - samsung,exynos5420-pinctrl
       - samsung,exynos5433-pinctrl
       - samsung,exynos7-pinctrl
+      - samsung,exynos7870-pinctrl
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl

-- 
2.48.1


