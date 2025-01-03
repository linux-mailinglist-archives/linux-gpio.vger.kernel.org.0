Return-Path: <linux-gpio+bounces-14483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8E8A00F22
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 21:50:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3B663A4D5A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 20:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7889184A5B;
	Fri,  3 Jan 2025 20:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="CXT/fWHX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7FB1BEF86;
	Fri,  3 Jan 2025 20:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937381; cv=none; b=fgqh9SAJxhHprZgb0fTxnC9iRACmRk1FIC3bRE957B9kOwKNH0CryhQSYC8uGm8FxYOrDXTsUNGO14Qysj0DXu4nNp//L+ifzG9B9I3ZLl8n/qHCbtkc9fuazV+FrwylLdsTAUU0vd1uGS3+ZrnG1ATnt5sBf8O/8gmx5/pAkQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937381; c=relaxed/simple;
	bh=ljbsvbPoHRqbc3TRpW2CsS66WkpHPHtjrTyzbbqkFrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UeJBc7d6ptyWnnJjrumQ0UQTZRv5Raijr5x1OEJDExLJHWgf9f1faMk8PSUvbdJ3GMCpxQSJSjUtdE8RILJTDGYG2I6edNdXzU9NtRrIDMx5f3rCbmT/kzXDpzUm0EZTuYgOBgrnshpXVP1k7MOCA6mIHH22UkV12HOXHj55RBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=CXT/fWHX; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=Pce2DdCTncrOdzX7qPApVYKMrquNOHsZcFa01GvWLtc=;
	b=CXT/fWHX1iFmomf4uvxMoDoueEw+QFWlyShNaENdxUfc2Di2ylmRfBNGnn1cUBlbR6uxk03Sbhtm+P0HtWwvT3vel+KfwzKkZD6XOu7RJ2AWXVixQxGhEw97QzW1PQaPmaA3gCMyI0PDh5jW20fAFyd8bbySO1tlwayqfHes+Xo=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Fri, 3 Jan 2025 21:49:36 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: pinctrl: sunxi: Add gpio-reserved-ranges property
Date: Fri,  3 Jan 2025 20:45:19 +0000
Message-Id: <20250103204523.3779-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103204523.3779-1-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index 450240570314..24b90a5538d6 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -83,6 +83,11 @@ properties:
 
   gpio-controller: true
   interrupt-controller: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
   gpio-line-names: true
 
   input-debounce:
-- 
2.47.1



