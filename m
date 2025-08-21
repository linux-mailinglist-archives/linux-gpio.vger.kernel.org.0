Return-Path: <linux-gpio+bounces-24745-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 521ECB2F854
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3121C884FC
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E121319864;
	Thu, 21 Aug 2025 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bqzsp/nW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A843115A5
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780041; cv=none; b=tVsMmFIIltgofDRKaQKg639EY2FrzIAQTOVZjfUH+lyG1UZaKa4U/oKS48SD2HgAiiXkWXWoFIEvA/+5L1BaY/W/VZBX2fofvZbekz6kPtZ4NtURtV8xswat2XFqXKj7XlXZp6N1GG/QU0ybtKO3G5uOausX0GBVJWtk1SlkS4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780041; c=relaxed/simple;
	bh=GnLrMbyDZW2GgpeykyrH1UvFDRtqnTH8x708+d6ZIJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=RAj0KJvsEgEuneSET5fj6kVqPKRftN24eMfEpdWSU1GwdklJG8K8Jt6CX19bQJfFSVLbxn6hil82tGyaDSbnvlCDqsphZnOTwmJ2Pq4im/qTIrrru3qVZRCmDjC904uPhEnrExhazjqLl8XrzAV9cbMm1C2Ipqmp8ULiARpODLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bqzsp/nW; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250821124037epoutp024c9b0e642e5bb28e8afb9da4e12e72df~dyKRRNeha0275702757epoutp02x
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:40:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250821124037epoutp024c9b0e642e5bb28e8afb9da4e12e72df~dyKRRNeha0275702757epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780037;
	bh=PE3v8D25w1NSW00QvTsGVwt89i4GMdjJys8VXXhPJ7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bqzsp/nWGhnOupn8PiRThHgaEVHAWMxfuhNXT/Nl87ykYBZlpRCMeAKhb6Hfp5Ou2
	 ROJz2tw1G+oPTdfj4UBvrMykzEi8WQN68Meo3HQXOvpvD3sDwn4V6mHl6y6i68M+Z4
	 NOdXj9AXU7K3qd0q3aAyU2QyvphMrMPyhzFiae+Y=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250821124036epcas5p23d4b1358a0f10a01045f50880154c3e0~dyKP1or6v1778717787epcas5p27;
	Thu, 21 Aug 2025 12:40:36 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4c72wg2Ddgz2SSKZ; Thu, 21 Aug
	2025 12:40:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574~dyKOZMGE41856118561epcas5p3J;
	Thu, 21 Aug 2025 12:40:34 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124029epsmtip2a1ba9abee1996f1a7280719efaf5a2f6~dyKJ3_XqU2369523695epsmtip2e;
	Thu, 21 Aug 2025 12:40:29 +0000 (GMT)
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
Subject: [PATCH v2 04/10] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-8 SoC
Date: Thu, 21 Aug 2025 18:02:48 +0530
Message-ID: <20250821123310.94089-5-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124034epcas5p350aeb42b9065fcbc3d9f713df1649574@epcas5p3.samsung.com>

From: SeonGu Kang <ksk4725@coasia.com>

Document the compatible string for ARTPEC-8 SoC pinctrl block,
which is similar to other Samsung SoC pinctrl blocks.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
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


