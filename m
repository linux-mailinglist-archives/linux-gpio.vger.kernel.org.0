Return-Path: <linux-gpio+bounces-24670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF48B2E39D
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EAD518902AE
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7166C343D8A;
	Wed, 20 Aug 2025 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="bwh4pIeD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D25335BCA;
	Wed, 20 Aug 2025 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710252; cv=pass; b=pMZNQD60rpdWDYFF46mAJZBmrOShlrUHreYDPi+K/awBCvDls92yxUEI4T8bkOUbrcghwru8kCUrbBY5vjgifvIt4zvVexXMwukAW8zDukRHb5ege43NeDJpUdW+QtdRWtiZQGyvHIp2+VYy157cPMhzAWF//RsG8ee7xD4sKyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710252; c=relaxed/simple;
	bh=8trt/YjhLxd8SbwWCqb7d7Anq+hB+vGLKqbxKNc/wgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRaqHq10xU5TYrP40T4EHaP0QjPlPotUoxIGLwSNzwdx9MeVV/o0wTQ5U+bgvjHMocP2/Qhc9QykKC1kROz51EAj/o8mAWYfZ7OhKwpwGiYFvzlBO5nrIHLgZXTzfrQjDmdNt91SUrE/yPb63mJRdPocaUwrBrD/b9BgdKQOLSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=bwh4pIeD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710202; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JFRte4iAUD8WS9zgYMl01cN3fdagLl+xrzEKef7yIZShODGP5t7tOOLRWKdYaYlmvRn0t4DFWLMMwUaA64TjL3upQdIkaJxnfqDf/uP4yJFbKNcOmy4LleqwV97aD2keGvvltN/wsV62vYIK7c+z1wRV6PrMfLinjpzXHwQaZRs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710202; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fbWU5pWt1jYsHmgGoCV0Xj8rM8SO1tarK2D1hlMGKuM=; 
	b=TTO5vdICmIVNbbpL4jBvXPdQY7hYuE11MycmqqOvWnIoC6wH+0Ff//vb+UqA+x3A5kiTbKqD6u+tAHSMg5QuWfSGLhwWPWFwWX9ZjI1sR90JlbhX4WBthe4zP3zoGg/0GTZvlqCoIsvp3M6ndMEovrkYgxQMZMfapjquL/3Y0wg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710202;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fbWU5pWt1jYsHmgGoCV0Xj8rM8SO1tarK2D1hlMGKuM=;
	b=bwh4pIeDK1MgXLPqhfjEgFGJGOWqgcUGQrw/1S/xCf0xuFDGDvs+WWVCNPuJ0kOd
	HH4OibcvwcYTu/4324jI76Mmfsxw3iiNFbyQiojUgd9nS7rVTC8/O89ek59ifpRGFs0
	aZ2u48p7EwI9PEHjw6sRclCc51nnlSe+gxJFkB1o=
Received: by mx.zohomail.com with SMTPS id 1755710200082444.74997358661824;
	Wed, 20 Aug 2025 10:16:40 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	ck.hu@mediatek.com,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	jmassot@collabora.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v1 11/14] arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
Date: Wed, 20 Aug 2025 14:12:59 -0300
Message-ID: <20250820171302.324142-12-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The mediatek,mt8173-thermal device tree binding schema doesn't allow
regulator supplies like the ones defined in mt8173-elm.dtsi. Drop these
as the associated driver doesn't implement them either.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 0766026864c9d..b6fe979fcfb10 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1149,11 +1149,6 @@ &ssusb {
 	status = "okay";
 };
 
-&thermal {
-	bank0-supply = <&mt6397_vpca15_reg>;
-	bank1-supply = <&da9211_vcpu_reg>;
-};
-
 &uart0 {
 	status = "okay";
 };
-- 
2.50.1


