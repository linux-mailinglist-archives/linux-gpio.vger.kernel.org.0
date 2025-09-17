Return-Path: <linux-gpio+bounces-26274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B87B7EECE
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 15:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328791C0396B
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 07:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C1D2E040F;
	Wed, 17 Sep 2025 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iAS0zb7b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8D2D46B7
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 07:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758092444; cv=none; b=GdN/vQS6Y/SEZMYx6Q0MtLl72rXXnLfNMV7BraldRXh173FIkdOTH7PoHIYE1PkvJTLHm/SYPO+9bvbtubMYVfS2jk5IfSMsdrVkOdLXP2rbxnPW04M2Fkd21SBUjJoeGyC88Eo3ArAMwZxLJnadueCktDE7kLJqmti+QocKU/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758092444; c=relaxed/simple;
	bh=RknxYDJxWY15GoiFXevUz1nxqfhNF92y9Nj5MeY2TLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=Yp8fAg6DU/12gRtxEOpxPeTveW5RpcwoXOQFJTSw7pWGc5GGuH0mDMDrAIjXFv4jyZUIjHs2KohAJKmJV9nFU+6Cjb32o42epsxM7/PQe41OgJXgDgMKSUafvTmQQJVNaRyTEBrBwWmou7r+H+2s4UywY86Tb4BN3xWSTZpnues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iAS0zb7b; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250917070039epoutp018587b13192f9c9e767eba5e3b2831871~l-8JLYG9V1149311493epoutp01h
	for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2025 07:00:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250917070039epoutp018587b13192f9c9e767eba5e3b2831871~l-8JLYG9V1149311493epoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758092439;
	bh=AM0BKLJaTM7gm/KQ3eSWc3YGrRvLsMW9oxGhBM3Pggo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=iAS0zb7b/I943lnmZ5aS4/wguApDbRItz9bepcIkeBS82U2nKRQvgE6ZynzKhzeN5
	 35rf+XRIITZp9/n6EqszyV3g4qNuDJ/YtBld10CgvcM2ZwX1vPu7lS3WAwJk32bPtX
	 A6CseMsnRpt41mFtGCmFb6Tz6KfZEkpa1R1SIl9M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250917070038epcas5p3c8840218379d7def7226afe4033d733f~l-8IRGakU1163911639epcas5p3I;
	Wed, 17 Sep 2025 07:00:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cRV5x3V19z3hhTJ; Wed, 17 Sep
	2025 07:00:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250917070036epcas5p15db06286fc187651574b68ea4ebe5edb~l-8GzA2rX1715017150epcas5p1G;
	Wed, 17 Sep 2025 07:00:36 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250917070033epsmtip1c91fd7d614b95cf94cbdbd8cca6a51c6~l-8Dq6wMj2904729047epsmtip1H;
	Wed, 17 Sep 2025 07:00:33 +0000 (GMT)
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
Subject: [PATCH 0/2] Add pinctrl support for the Axis ARTPEC-9 SoC
Date: Wed, 17 Sep 2025 12:30:02 +0530
Message-ID: <20250917070004.87872-1-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250917070036epcas5p15db06286fc187651574b68ea4ebe5edb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250917070036epcas5p15db06286fc187651574b68ea4ebe5edb
References: <CGME20250917070036epcas5p15db06286fc187651574b68ea4ebe5edb@epcas5p1.samsung.com>

Add pinctrl bindings and driver data for the Axis ARTPEC-9 SoC.

Axis ARTPEC-9 SoC contains 6-core Cortex-A55 CPU and other several IPs.
This SoC is an Axis-designed chipset used in surveillance camera products.

This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.

NOTE: These 2 patches has been separated from the original ARTPEC-9
base patch series as the target branch is different.
Target branch: Samsung pinctrl Linux kernel tree

SeonGu Kang (2):
  dt-bindings: pinctrl: samsung: Add compatible for ARTPEC-9 SoC
  pinctrl: samsung: Add ARTPEC-9 SoC specific configuration

 .../bindings/pinctrl/samsung,pinctrl.yaml     |  1 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 49 +++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |  1 +
 4 files changed, 53 insertions(+)

--
2.17.1


