Return-Path: <linux-gpio+bounces-24662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF7B2E351
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 142DE5E486E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F074833CE9B;
	Wed, 20 Aug 2025 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="jGjcsFSK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F4D33A03C;
	Wed, 20 Aug 2025 17:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710134; cv=pass; b=LU/1fWxajSorkJkQRhrVWj7r4CwPIStmN1eOugQE3KRPabVE5auxA28LQWFxriNwTSeBGEBJXCYyVZ2G4EN4Hd3Dt+9qCocghnWqFKzu28S3US/RHDmIANgcEI/mZ0RGICx5+4QaJD7XA1GVMCjprtD9eyWzCgAQZ7iw7ZoTE0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710134; c=relaxed/simple;
	bh=daOn8KlnWZaC4JYfeEcyntB4Xpuz91JWjJFV2qjpABM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ctvjgSiMQqab7WuZH+tEBOoi/Ow7Vu1ytXcDVdJ8x4xfdyAfmb/BRMQexVzEvl2oIkzY1HiYuMQnlJA0aFQVPOZaPy78YGP7sNLQmA7kPCaX4oyeLFXMgZiepmPOYuxCuKQIQKC/GA3KaMVKkOzFqc0UPkznNC8wiBBz5ckN210=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=jGjcsFSK; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FTnWVGb5ktCfnaCYrS5yenNeDc7vDsN2aJVUGxm2/9Cqcw4eVg2x/EiacItHeT5AIYXkxGEnWkocJbTpl0iy17gLUoHAlorkG3/lX+3wpyszhE/dajidQ5il1t6s5duZOmHXmfZa5/FbW71YZXchwW5mH7c8a6F+psjgPKpX5M8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710085; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FoPVuBStBvUM57EnDHdyDOSI/MqVu22rPsFJ0LZ4BLU=; 
	b=MTv/99UW8etAyy5/38QR+E2c+ZruaERBMxdoqgEreTKCTZ09U1lN343bk9qUCYH2PBx3GVug3n5QHkIUu2u3e0nclzcRkZkJIePFH+KjzD3aPGg6GUAfG4Ae521HDkvmYOc1kXcWUWr3mSf45kMXm0/1zsj5OvRc+5JPJxWUAvg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710085;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FoPVuBStBvUM57EnDHdyDOSI/MqVu22rPsFJ0LZ4BLU=;
	b=jGjcsFSKI9tNIT2mMc7ULHhV9VXmZ2mN8VTO4r4iatqo2USNHECT9uTRPAvRboVX
	7dseJNDMWoP6p5FI3rov+csDBr/HAyoSmH/HydhHOxtDjdVGeJsO8eo/iVBltpuH39e
	z9+rZe8b9K7VCyyS4CvyFRyVSsAyIU0yJ/VhAeIA=
Received: by mx.zohomail.com with SMTPS id 1755710083545671.3749174712098;
	Wed, 20 Aug 2025 10:14:43 -0700 (PDT)
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
Subject: [PATCH v1 03/14] dt-bindings: arm: mediatek: mmsys: Add assigned-clocks/rates properties
Date: Wed, 20 Aug 2025 14:12:51 -0300
Message-ID: <20250820171302.324142-4-ariel.dalessandro@collabora.com>
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

Current, the DT bindings for MediaTek mmsys controller is missing the
assigned-clocks and assigned-clocks-rates properties. Add these and
update the example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 3f4262e93c789..d045d366eb8e2 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -68,6 +68,12 @@ properties:
       of the power controller specified by phandle. See
       Documentation/devicetree/bindings/power/power-domain.yaml for details.
 
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
   mboxes:
     description:
       Using mailbox to communicate with GCE, it should have this
@@ -130,6 +136,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/mt8173-clk.h>
     #include <dt-bindings/power/mt8173-power.h>
     #include <dt-bindings/gce/mt8173-gce.h>
 
@@ -137,6 +144,8 @@ examples:
         compatible = "mediatek,mt8173-mmsys", "syscon";
         reg = <0x14000000 0x1000>;
         power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
+        assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
+        assigned-clock-rates = <400000000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
         mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
-- 
2.50.1


