Return-Path: <linux-gpio+bounces-24673-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB80B2E3AC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F8F11C841B1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35CBA346A13;
	Wed, 20 Aug 2025 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="LCTflfgG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173F02DEA76;
	Wed, 20 Aug 2025 17:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710290; cv=pass; b=bBNLXvRJyZPti1iIuD/V38QyieZlGyFMTQV6xlX/FiITcg2RDSkky8mRnplPhG+0t3QvgCnt5pJZT04+7gW5s/i5sOpP4dcAVZBAvK8c9+ipmp/s3P058lT9dtjo665zt1F7f7rTJxVJQkdk0Y3bFUqvurGhukUpX4aAB5dQc1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710290; c=relaxed/simple;
	bh=ge7L7YbYpkE5ifhhVnTn3LgR/LKaG6jh+sNYhfW8vMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYNN8EtRMDlicXwkpM8C0PAPYjuTdUSl2tPo+sUcTFAMVvl2KbuuBfcbOPR7dnSgw0NV4YlR4LG9dSJp2K34J6fdZR7RXhW5uD32hvZkfUlBVqymqcIePRo6oOJNW8Dv/eH34p/91i+kR70hfhWLWCV93R7SrDenPddRpX33xSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=LCTflfgG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710244; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bv4o2GtIfeSCwpdAJVXW68k+i1poY2wqPj54uQzy+AHhghVwJlUMefTi/tuQeSpEq8KM8h1C3tVOI0c89HFuygo4/7XbZawEuwwwxpqs5FutFXCD1swTo8eQJQoHDj+QNjnFATRrnrqju0TgqVHDEpJ6dVzi+fTTL1/2WJJoKso=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710244; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Al91Oq6qR8Q/pF2nlUQ+kuTW9VseeKQhfyjI2Oag7gI=; 
	b=Intb6FGDtZmL8hqJgDUh9DVsy9d98DUYl18Ioi/0ZEaDgb+UWiFYqGMy1OvZsMjhwN59HlTRbT1XPdXo7z679jAoyS3jMDb/Rmeftc12eBmAe0JKBhSnVukPl4w24AW/dLv1YOnLLXip6qs3L8hHr7HSD1j2IiGZLXiug8gNl7g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710244;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Al91Oq6qR8Q/pF2nlUQ+kuTW9VseeKQhfyjI2Oag7gI=;
	b=LCTflfgG7eGVjTGguBB0daRZFJjRYDOP25NAel4BHQxfQt6HAjut98TSnt2MxnoF
	RUD/kiA6FQjh8OTWF5Em6/OlJr5xuzRC5d/fBQkHSDOdzNg2qAxTA0YoD7EsvqFjTxr
	g00N2SqiTUdEfGteL75CwjASfyqRoZV+hjbcPj2c=
Received: by mx.zohomail.com with SMTPS id 1755710242902207.8401396356436;
	Wed, 20 Aug 2025 10:17:22 -0700 (PDT)
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
Subject: [PATCH v1 14/14] dt-bindings: media: mediatek,jpeg: Fix jpeg encoder/decoder ranges
Date: Wed, 20 Aug 2025 14:13:02 -0300
Message-ID: <20250820171302.324142-15-ariel.dalessandro@collabora.com>
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

Commit 14176e94bb35d ("arm64: dts: mediatek: mt8195: Fix ranges for jpeg
enc/decoder nodes") redefined jpeg encoder/decoder children node ranges.
Update the related device tree binding yaml definition to match
mediatek/mt8195.dtsi, as this is currently the only one using it.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../media/mediatek,mt8195-jpegdec.yaml        | 31 ++++++++++---------
 .../media/mediatek,mt8195-jpegenc.yaml        | 15 ++++-----
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
index e5448c60e3eb5..b1f3df258dc87 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
@@ -36,7 +36,7 @@ properties:
 
 # Required child node:
 patternProperties:
-  "^jpgdec@[0-9a-f]+$":
+  "^jpgdec@[0-9],[0-9a-f]+$":
     type: object
     description:
       The jpeg decoder hardware device node which should be added as subnodes to
@@ -100,22 +100,23 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        jpgdec-master {
+        jpeg-decoder@1a040000 {
             compatible = "mediatek,mt8195-jpgdec";
             power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
-            iommus = <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA0>,
-                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA0>,
-                     <&iommu_vpp M4U_PORT_L19_JPGDEC_WDMA1>,
-                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BSDMA1>,
-                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
-                     <&iommu_vpp M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
+            iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
+                     <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
+                     <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
+                     <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA1>,
+                     <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET1>,
+                     <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
             #address-cells = <2>;
             #size-cells = <2>;
-            ranges;
+            ranges = <0 0 0 0x1a040000 0 0x20000>,
+                     <1 0 0 0x1b040000 0 0x10000>;
 
-            jpgdec@1a040000 {
+            jpgdec@0,0 {
                 compatible = "mediatek,mt8195-jpgdec-hw";
-                reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
+                reg = <0 0 0 0x10000>;/* JPGDEC_C0 */
                 iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
                          <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
                          <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
@@ -128,9 +129,9 @@ examples:
                 power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
             };
 
-            jpgdec@1a050000 {
+            jpgdec@0,10000 {
                 compatible = "mediatek,mt8195-jpgdec-hw";
-                reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
+                reg = <0 0 0x10000 0x10000>;/* JPGDEC_C1 */
                 iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
                          <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
                          <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
@@ -143,9 +144,9 @@ examples:
                 power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
             };
 
-            jpgdec@1b040000 {
+            jpgdec@1,0 {
                 compatible = "mediatek,mt8195-jpgdec-hw";
-                reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
+                reg = <1 0 0 0x10000>;/* JPGDEC_C2 */
                 iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
                          <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
                          <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index 596186497b684..190e4e7470195 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -36,7 +36,7 @@ properties:
 
 # Required child node:
 patternProperties:
-  "^jpgenc@[0-9a-f]+$":
+  "^jpgenc@[0-9],[0-9a-f]+$":
     type: object
     description:
       The jpeg encoder hardware device node which should be added as subnodes to
@@ -100,7 +100,7 @@ examples:
         #address-cells = <2>;
         #size-cells = <2>;
 
-        jpgenc-master {
+        jpeg-encoder@1a030000 {
             compatible = "mediatek,mt8195-jpgenc";
             power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
             iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
@@ -109,11 +109,12 @@ examples:
                      <&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
             #address-cells = <2>;
             #size-cells = <2>;
-            ranges;
+            ranges = <0 0 0 0x1a030000 0 0x10000>,
+                     <1 0 0 0x1b030000 0 0x10000>;
 
-            jpgenc@1a030000 {
+            jpgenc@0,0 {
                 compatible = "mediatek,mt8195-jpgenc-hw";
-                reg = <0 0x1a030000 0 0x10000>;
+                reg = <0 0 0 0x10000>;
                 iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
                          <&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
                          <&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
@@ -124,9 +125,9 @@ examples:
                 power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
             };
 
-            jpgenc@1b030000 {
+            jpgenc@1,0 {
                 compatible = "mediatek,mt8195-jpgenc-hw";
-                reg = <0 0x1b030000 0 0x10000>;
+                reg = <1 0 0 0x10000>;
                 iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
                          <&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
                          <&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
-- 
2.50.1


