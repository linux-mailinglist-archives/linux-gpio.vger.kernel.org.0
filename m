Return-Path: <linux-gpio+bounces-26275-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22BFB7ECD5
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 15:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B39E323376
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 07:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840E62EA14E;
	Wed, 17 Sep 2025 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="apvk//Vi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01A22E1F02
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 07:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092447; cv=none; b=j08C55rluoe3n99W3hCGes89xV3Axg2TIU4ZHDZsCCcdA8FciQIAnp+4gcASS7rd2vH66LQfeC4TbTNHueqRUIshoa3cH9lDkXO5mWKUmCK4gaja7YdvKXs24+LG8rCnB6IrltMG2JOyNdRnA2uHQc5XSarOqTCisNjalyIYZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092447; c=relaxed/simple;
	bh=FoWkwbkhPvdUZ0dxR1wtPVUl2/rI0ssjLWQ73PpSylo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=IGOjFUuEDZFFSYPYQxqAitCcpEccSD2MV+f4hPgSePoxxE+m2jMIxO5/w+5V0H3LsAQFmrg7zF1ePhj7u94Wf6l06bmQDHaAI7Bixgqa5ZrgNm4SPo0HTR5VFt6974aSgXWpcXRA+pPJ1B03U2+abaHaoh283mXWR4wJlfrTskY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=apvk//Vi; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250917070043epoutp0443ac77e1b17d27ad5f49d9065a6c9256~l-8NL5c9W1787117871epoutp04b
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 07:00:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250917070043epoutp0443ac77e1b17d27ad5f49d9065a6c9256~l-8NL5c9W1787117871epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758092443;
	bh=AjHTiR3TP8U/dHiplS5lbpj1CbW/m/2exj5qmUp/EYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=apvk//ViSB0zCF6zsMpNVzZVZyHpNrA/+oaJ65ozZXRLqo/ZLD7Dtf00GoLxIf/Zf
	 tWJCS2PSNQzJok5g5PivQOs4Gl8JarJvnfD1cRcX0m6fLbxsG6CHAqJ/Pqj/ITfHhM
	 MLgteyO/ALEJBtBgt0TOyvMuvXWp1zacUdA2ANZE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250917070042epcas5p3c3921b9e9ea491fef55f93fc9a9c8eaa~l-8MUEMvw0930209302epcas5p3l;
	Wed, 17 Sep 2025 07:00:42 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cRV615SWvz6B9m8; Wed, 17 Sep
	2025 07:00:41 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d~l-8KqqV1y1470914709epcas5p4-;
	Wed, 17 Sep 2025 07:00:41 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250917070037epsmtip1266105bf74f13d80d8ee8c783b60254d~l-8HD8Mh-2848728487epsmtip1-;
	Wed, 17 Sep 2025 07:00:37 +0000 (GMT)
From: Ravi Patel <ravi.patel@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, robh@kernel.org, conor+dt@kernel.org
Cc: tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com,
	kenkim@coasia.com, Ravi Patel <ravi.patel@samsung.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 12:30:03 +0530
Message-ID: <20250917070004.87872-2-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250917070004.87872-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d
References: <20250917070004.87872-1-ravi.patel@samsung.com>
	<CGME20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d@epcas5p4.samsung.com>

From: SeonGu Kang <ksk4725@coasia.com>

Document the compatible string for ARTPEC-9 SoC pinctrl block,
which is similar to other Samsung SoC pinctrl blocks.

Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index f1094d65e846..a2c16385bad3 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -36,6 +36,7 @@ properties:
   compatible:
     enum:
       - axis,artpec8-pinctrl
+      - axis,artpec9-pinctrl
       - google,gs101-pinctrl
       - samsung,s3c64xx-pinctrl
       - samsung,s5pv210-pinctrl
-- 
2.17.1


