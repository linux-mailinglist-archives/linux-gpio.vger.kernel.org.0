Return-Path: <linux-gpio+bounces-24748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158CB2F869
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98363562350
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011B631E105;
	Thu, 21 Aug 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Fe/TUYtt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B043D32039A
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780057; cv=none; b=WINcaP5THljNoKSGr/a7ZWo5wHCRcbjz8kltO137KLfxlzMXbLuuwYgNMF9RfUitP6bE7AuBV+flUTQLjUDRilBte1t8VkcLlXWw11AfIe6hcD1N/waGJDt6AWi3hc5eJhlxf0F9zsKfwM3IWXaWX2o3uS823EVVEFUACSm7SjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780057; c=relaxed/simple;
	bh=kfFBEdIdpqBRblTqQRDmIbEEcKQIGGKOFhUbgk4E5TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=q+yugQOUaqmXSAjBrHvDdZsu55UbS8GIkcAVRespAG4GbifRTfT8uu2QGj6TH1Vy99NOImAqT9siLKTNjl6he6vxFUOgqVq9hDPmY3Z33AWUvTVQBCteWGK82JGTG57us0LyQ6IKZTqQiz15WsvN9msNrB9d4FrZC5r4NQSwHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Fe/TUYtt; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250821124053epoutp04b09216e09a9e9e62958ef856a9f0fbe5~dyKgSpigu1965219652epoutp04m
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250821124053epoutp04b09216e09a9e9e62958ef856a9f0fbe5~dyKgSpigu1965219652epoutp04m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780053;
	bh=EaJAXK2wOTdF1z31qS2L/1Jcukpna02k48jPpUzUhP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fe/TUYttMcVyXw0g4h18Hj6vUPme+ljsY9hYu7SS3js+ABVPpW2aEMGiHOGoN/UKB
	 1eXP6fQiRpO5sXZQ753PmChgU3w9I7rcw/zkG0Ew3PpdtzlHV74b3fFHiE0bs9YLR3
	 DG2Kn/n7BRM7tCI9ba+LRyiqn5bybwBIiLrOJmOo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250821124052epcas5p109ce75936e0e30ea2f11c90dcaa1e3e3~dyKethypv2595525955epcas5p1t;
	Thu, 21 Aug 2025 12:40:52 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c72wz1xGLz2SSKY; Thu, 21 Aug
	2025 12:40:51 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4~dyKc7nYw81778317783epcas5p2J;
	Thu, 21 Aug 2025 12:40:50 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124045epsmtip2ce3689d8c8c55cae7f27daa7e2ca514e~dyKYVddln2624826248epsmtip2P;
	Thu, 21 Aug 2025 12:40:45 +0000 (GMT)
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
Subject: [PATCH v2 07/10] dt-bindings: arm: axis: Add ARTPEC-8 grizzly board
Date: Thu, 21 Aug 2025 18:02:51 +0530
Message-ID: <20250821123310.94089-8-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4@epcas5p2.samsung.com>

From: SungMin Park <smn1196@coasia.com>

Document the Axis ARTPEC-8 SoC binding and the grizzly board
which uses ARTPEC-8 SoC.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/arm/axis.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axis.yaml b/Documentation/devicetree/bindings/arm/axis.yaml
index 610806d87416..941eaed2b3cb 100644
--- a/Documentation/devicetree/bindings/arm/axis.yaml
+++ b/Documentation/devicetree/bindings/arm/axis.yaml
@@ -8,6 +8,7 @@ title: Axis ARTPEC platforms

 maintainers:
   - Jesper Nilsson <jesper.nilsson@axis.com>
+  - Lars Persson <lars.persson@axis.com>
   - linux-arm-kernel@axis.com

 description: |
@@ -24,6 +25,12 @@ properties:
               - axis,artpec6-dev-board
           - const: axis,artpec6

+      - description: Axis ARTPEC-8 SoC board
+        items:
+          - enum:
+              - axis,artpec8-grizzly
+          - const: axis,artpec8
+
 additionalProperties: true

 ...
--
2.49.0


