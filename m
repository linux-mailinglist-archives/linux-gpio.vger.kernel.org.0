Return-Path: <linux-gpio+bounces-24751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD278B2F876
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 14:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88083AC46CF
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3DB3115B8;
	Thu, 21 Aug 2025 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QWXx8Tb2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D05321F50
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755780072; cv=none; b=aUCae5wZh7zUyysuIOHy0iskImb7F/dI+sgGCDthyok8G7Gg8gqfnJut20iyDtM/dYGjoK+jCNANAORIHhHSKCIJQZflopi0k7Bfn45fpGa6drmlZ+OQw+r5vmwc7n80y3yqjboaB+9CsQne0nt+68cNCc4I7vqJtXSU8iLazGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755780072; c=relaxed/simple;
	bh=9jpgKSSMok4duRe0b+RWtWp7OmcmSdefUa27stJuCIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Baa5zdiHJk89Hpj2GRXCFRH0Ork17BzB+h0Jq6DyZoD2/2uiC3urdOXARiwir526mAwnadUoQzPPkk3Ro+U8ndtaxDkZSa4wRNV4Ao2ecZuLJxDQaOtcTKrpxJrRClhCCUvXGIh2T0YKKbSdSk6ym+/CkQ4dDydcYbRxfX8SBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QWXx8Tb2; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250821124108epoutp0445c12a55aa58c3396997e54345af3290~dyKt0uO-N1816418164epoutp04Y
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 12:41:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250821124108epoutp0445c12a55aa58c3396997e54345af3290~dyKt0uO-N1816418164epoutp04Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755780068;
	bh=YSW64KWlEWguGEP5S6aHwmfVaZSZlb36SUEt3aN4gtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QWXx8Tb211F14jUMSrcwT07DY7tg/o+idoGrQraXOqpAfx+TwGAeM9Y8kBjDv+4Ox
	 4YDHdVWNmCKBzze9otwaUXMP8wH8BEAlYTNhm4ENoecs6qsA0141K6a97exhYIgwd+
	 uZFv1gmF08usf6AqhXs0eeQlC3tr4Wt7o80yXL7M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250821124107epcas5p3d0165e6d8c4fefbe9990d4ed54b437af~dyKtBAz0d1592915929epcas5p37;
	Thu, 21 Aug 2025 12:41:07 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c72xG4gNtz3hhT3; Thu, 21 Aug
	2025 12:41:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250821124105epcas5p402a0f6ec6a893d0e5e305547976e4c80~dyKrZpFEa1534115341epcas5p41;
	Thu, 21 Aug 2025 12:41:05 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250821124100epsmtip24bf607fee6cda2466f7f16b0c3a40894~dyKmvfG7k2624826248epsmtip2b;
	Thu, 21 Aug 2025 12:41:00 +0000 (GMT)
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
Subject: [PATCH v2 10/10] arm64: defconfig: Enable Axis ARTPEC SoC
Date: Thu, 21 Aug 2025 18:02:54 +0530
Message-ID: <20250821123310.94089-11-ravi.patel@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821123310.94089-1-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821124105epcas5p402a0f6ec6a893d0e5e305547976e4c80
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821124105epcas5p402a0f6ec6a893d0e5e305547976e4c80
References: <20250710002047.1573841-1-ksk4725@coasia.com>
	<20250821123310.94089-1-ravi.patel@samsung.com>
	<CGME20250821124105epcas5p402a0f6ec6a893d0e5e305547976e4c80@epcas5p4.samsung.com>

From: SungMin Park <smn1196@coasia.com>

Enable the Axis ARTPEC-8 SoC in arm64 defconfig.

Signed-off-by: SungMin Park <smn1196@coasia.com>
Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..f94c1357d6f5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_ARTPEC=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCM_IPROC=y
-- 
2.49.0


