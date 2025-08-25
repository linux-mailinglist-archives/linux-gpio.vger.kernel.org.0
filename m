Return-Path: <linux-gpio+bounces-24921-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC46EB33ECD
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 14:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4BEF203038
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Aug 2025 12:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F208F2EDD65;
	Mon, 25 Aug 2025 12:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mzINJEZ7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EF02ED16C
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756123641; cv=none; b=VGhIdkZR/xJWh7x2H4dSl2zUakgUHHlH6ZCUrzDlBsLN4x6VVBliCzLRDDl4icfc0aUHp4L9t/5kyABF47GEa6dYvVinpyP3dMsKtH377VY7FUeemD2Sn8bemCMGmEoYGZtaBpa+JuCE9/CBgLBJTk36FSqTXc5FCIGRnhYIsaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756123641; c=relaxed/simple;
	bh=1MOqoBka15yf3xGVcrld76SSRGai5t4omy6ZxEYAjyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=jwF6hFsxBFQGQFiAl3AtuqleM1gcB0/qmT+thrYPSGBiZQR/7IaO9RSRibEtv/IyY0X758Vnb98vHS4coFiDJCMfHRfpzkxWVy0o0V0FwjCsin+Zc3Na6n9PGK4JSw+gvXx+wYPG9gSkYHe6nmWP67EOWMbPEhoHal2kgkPW4eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mzINJEZ7; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250825120717epoutp016249538a980ad33d2f80a34b98e0dcbc~fAST1bdGW0276902769epoutp01j
	for <linux-gpio@vger.kernel.org>; Mon, 25 Aug 2025 12:07:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250825120717epoutp016249538a980ad33d2f80a34b98e0dcbc~fAST1bdGW0276902769epoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756123637;
	bh=G3iriXNf200SBhskNtc4oq7XLJZRiYx0ShgqUZlpXtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzINJEZ79zQfGnF2q1ACW2YTcpO9rYEdo3kkOQhSAIGusmmrjoIMHIuAEhYYeWTQU
	 u+FNQswrKOD13ub/lrP8Tnh/dDtFzyWuTqL6/hD0Czl+w6wUKJ4+JSB5oSYVZ+nW71
	 REzDf/MestBBA24w29ijC7cFk83qSzewv74nXBTc=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250825120716epcas5p398639a7dd305f2183935de8f1c3fad52~fASSu9G_u3066630666epcas5p3n;
	Mon, 25 Aug 2025 12:07:16 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c9V0M5ZqGz6B9m5; Mon, 25 Aug
	2025 12:07:15 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64~fASRHTVOa1420914209epcas5p3a;
	Mon, 25 Aug 2025 12:07:15 +0000 (GMT)
Received: from Jaguar.samsungds.net (unknown [107.109.115.6]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825120710epsmtip2a6ce643bee5f1b4baa735219ceedd8ef~fASMlc9nW0172101721epsmtip2r;
	Mon, 25 Aug 2025 12:07:10 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com,
	gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com, inbaraj.e@samsung.com, swathi.ks@samsung.com,
	hrishikesh.d@samsung.com, dj76.yang@samsung.com, hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, soc@lists.linux.dev
Subject: [PATCH v3 04/10] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-8 SoC
Date: Mon, 25 Aug 2025 17:14:30 +0530
Message-Id: <20250825114436.46882-5-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250825114436.46882-1-ravi.patel@samsung.com>
X-CMS-MailID: 20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64
References: <20250825114436.46882-1-ravi.patel@samsung.com>
	<CGME20250825120715epcas5p3a0c8b6eaff7bdd69cbed6ce463079c64@epcas5p3.samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

From: SeonGu Kang <ksk4725@coasia.com>

Document the compatible string for ARTPEC-8 SoC pinctrl block,
which is similar to other Samsung SoC pinctrl blocks.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index de8460856141..9386dcd418c2 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - axis,artpec8-pinctrl
       - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
-- 
2.49.0


