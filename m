Return-Path: <linux-gpio+bounces-16205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB3A3A63A
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 19:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9406017783C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 18:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7DD26AA9E;
	Tue, 18 Feb 2025 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="IlJMKq4Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851CC1EB5C4;
	Tue, 18 Feb 2025 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904566; cv=none; b=OCRlG8+UKSZl/X/kot7UM2y8bwaAGXV/UqR4OmqK7nVLViEjl+jEF+axRPmTWE9Jja/IU1O7iZGnxDqesTr0atWVtCRVcFfcdrUh8pDCA+7dDYdQaMhWPEL4mKpnPKUwrG5gm08r1fakzlqxi7AfHdiNSFnV6rkPX0s0upMpWHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904566; c=relaxed/simple;
	bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FYueNuU0ACMlFHkd/+ok+lvxz0i++GLp/ubwTklxJJUmhghayp3ydEAXvkkyfDU78cxxRPTxHGRrU/Q/YjxAwxY4zWqQ9/m4R1Bcx5KBY1OLHS1cpxSmG21UDxKdsNT10/q2oWbFi6hnEFZ0oUa/zRWyve4ZldUiaqdonhdqYvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=IlJMKq4Y; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DDC0A25238;
	Tue, 18 Feb 2025 19:49:22 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqiXdv9AIdxT; Tue, 18 Feb 2025 19:49:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904562; bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IlJMKq4Yf7gYetl44r0zibkUyXH9Wryp6hje63EkHTi3r38a33rGCyqns3iZfmzhM
	 ew1O4nEr2F4xI2ToZhpjeymaAhU/viEPAWG75jiMpmxocnGLncDzM/2GdJFNYP6O9H
	 GFm7TrJSPOH0ydvENhDEq8/AtVxtraV6qC3cdk5D8AEoYbwonNxz0wliVn2lAXHNOQ
	 NTr15U4D0WY8B1f17hOCtC4PYyS99ndQZiE+rcVxI7dqYuFG89qESqSOL4bo4tg2Bu
	 N/jPzY+3kjbCy5/klZibE2GCebAoxllskI1ilPFOLs4UqeRpveV0AGGtugyaBdnj1e
	 tLlserLvTCfoQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:18:57 +0530
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: samsung: add
 exynos7870-pinctrl compatible
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pinctrl-v2-1-1ff9b10bf913@disroot.org>
References: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
In-Reply-To: <20250219-exynos7870-pinctrl-v2-0-1ff9b10bf913@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904552; l=955;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=vsayUdnV9StMUuHh/+GKTiqYHXrS/d0z+VX81D2AnZ8=;
 b=QTyjf6f7xy381oruV4xUh8JPcNi6jnDJi9b2QyosU1Si6+CJYGOyWKAOwNgT0e8laUX0ljYbX
 twch9RwoB4iCD0WpJPf1EeWrHwduKmsBiFtFOifqpafKZ5JoCvWLuYw
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


