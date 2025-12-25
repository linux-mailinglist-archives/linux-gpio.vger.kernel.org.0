Return-Path: <linux-gpio+bounces-29889-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DECDDAE8
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 11:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CB9A3002527
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Dec 2025 10:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC6131A814;
	Thu, 25 Dec 2025 10:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NTRHxfdV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53A2319852;
	Thu, 25 Dec 2025 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766658987; cv=none; b=bgdRAvle+c89CrdJwDGJpbutZoIm9UIM8ARd/te/84MHwL0OFl0K4q0jgXbcuNk4Zv4+p+yYZ6bgHmBiyPcYzaeSuKMiHqnEnHTm30c+pWO5e6UzwaPJ/+2+uCxApQ0B76j3H7jpx2sAZlAWs0AgO7w5c7+SzTQccbQeb0R5J0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766658987; c=relaxed/simple;
	bh=nlLCiQO+Jd5EFzOAjqev47gE2C5HBxNmZ+Q+P9RB/aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAJhZQKTjJbZv0M/ZlfyVXsh0HRXqRasewHMTRwpHSxQye2pn7z28pPMSUgSToPEi0GQuDwyY0Hh6hV2H5taBy/y0jC32lB2P5+8lT4cD91gYJXMyq7RupJZ1CPEdJLDyo65+vl0Ms7DZORdXy3wxdwegt7Vjs1SOqy6FNi+dr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NTRHxfdV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B19EC116C6;
	Thu, 25 Dec 2025 10:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766658985;
	bh=nlLCiQO+Jd5EFzOAjqev47gE2C5HBxNmZ+Q+P9RB/aA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NTRHxfdV9D7oDpdWum5fKtI8CIv4U09+qQzHbnMmi0BWxFQmRkJS3q4PSZq1b7eiZ
	 Ds3r0jCPlaD37B4twJClhWvo3IIb9QNPOmdP3yRcrTOTU15pCFAdCFh9IU0SfWKA6B
	 XgXgy4Seq4S4K8GplGSV+4iI+WCHsyKcClQ/vt8ubBgSi3iuyDsAL8WoCO+btwu+6P
	 VPsg5Hy4DmkQ+UMQA+ia/KXsDVzZCSKiB56KyevwFM+I1Lab4n7A60zefN0dN0Rl2c
	 j73ikEoaraBrDfERitRAlJrM/WeisG7F9fiikx6CN2T2fL1qCVy6jy7RgPH8PpnuLL
	 CDLvIcd1X6lXw==
Received: by wens.tw (Postfix, from userid 1000)
	id 764255FF6D; Thu, 25 Dec 2025 18:36:22 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linusw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
Date: Thu, 25 Dec 2025 18:36:15 +0800
Message-ID: <20251225103616.3203473-5-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device tree bindings specify using "fail", not "failed".

Fix up all the ones that are wrong.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts | 2 +-
 arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts | 2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts      | 2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
index 63e77c05bfda..f2413ba6a858 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
@@ -112,7 +112,7 @@ axp209: pmic@34 {
 
 &i2c1 {
 	/* pull-ups and devices require AXP209 LDO3 */
-	status = "failed";
+	status = "fail";
 };
 
 &i2c2 {
diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
index c32596947647..e0c7099015da 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
@@ -96,7 +96,7 @@ axp209: pmic@34 {
 
 &i2c1 {
 	/* pull-ups and devices require AXP209 LDO3 */
-	status = "failed";
+	status = "fail";
 };
 
 &i2c2 {
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
index 5bce7a32651e..5dfd36e3a49d 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
@@ -170,7 +170,7 @@ hdmi_out_con: endpoint {
 
 &i2c0 {
 	/* pull-ups and devices require AXP221 DLDO3 */
-	status = "failed";
+	status = "fail";
 };
 
 &i2c1 {
diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
index b32b70ada7fd..fefd887fbc39 100644
--- a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
+++ b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
@@ -90,7 +90,7 @@ hdmi_out_con: endpoint {
 
 &i2c0 {
 	/* pull-ups and device VDDIO use AXP221 DLDO3 */
-	status = "failed";
+	status = "fail";
 };
 
 &i2c1 {
-- 
2.47.3


