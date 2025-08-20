Return-Path: <linux-gpio+bounces-24666-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9BB2E363
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF03FA21A1A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045262DC345;
	Wed, 20 Aug 2025 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="VQR9NnG/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070053C33;
	Wed, 20 Aug 2025 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710204; cv=pass; b=Ihq07Lp+okHDOb9b/kKgYK/u+bOo23Z1AsoKOa5bIlKCRUOYcEt2A2JM/ykuHt3IqazpzbUYFuEEy5/AdEnhy0x7+ClacwId630fGRFCkCXjQ3iil7r5EClsgtPv6rfnIdO6uFsowT4gOkPCxPDa1dqKSlajxoQg2MHz9QlbNTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710204; c=relaxed/simple;
	bh=7OmHx1LG0PLltljYV606T8L6+kMm9ob9bH0FC62Qjt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ni/fx+5FGo09cn1OSWDGwXsDUKzhh+lBG4ltzxTDIDB2v1RSslQHi1MRFgtzHqeJ7e4XxXwwYC+INJftq8zyboZeMb1yJARp8MRRABAE6cYqMtGQcsQiYx6Z+iQF19Okwe6uJ3GLY89Y/FV5vq68xseFosbCTzEb5cHNBODjoxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=VQR9NnG/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hNLFFnLSVZfTH6obyIu9vB7kNyghZB46uNT/owLhChrUkt43dDp2CiEQBc+X98R/RJRqrt8h+Oh8iX1T8k1hBjdOBqxq294Oqq6cRySvRmUWN5ryFv2Ledz+zouEe95+3GYLPbhUHsYTT5w6kwyrvGkceVOn1PLKaH/tAAQNy7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710143; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r5ce2vnAWwshsgRlImURtynlRilgSXboTdKci1gbEto=; 
	b=XINCOMJQ073ZT+t6eryGdxXhIaB/jBYBRPnSaFtbLaOn5zu9/TdTolsWmTqZxQObonwiVm4YUHl43pDT2YbIkXmRjm+B73eBf6c9tyHuf2gfGmAE6lAlxz0uR+er23XIuH23SLkD84Q52L+AoEONYXjTS9OvIqS/CG8Dx+UCR9Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710143;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=r5ce2vnAWwshsgRlImURtynlRilgSXboTdKci1gbEto=;
	b=VQR9NnG/NVAZ6T9+0zthHG6IpuE7PIoRMgzP8KW0dXszaYXMff6R+3xjuF42A0sn
	8XLm3HIMEfXrvoqbF4PyQvwSvIGPPmgrr/fBKUfjbfRIXa6ss5bVfcaFZEOPZCh+z/I
	JuOaD7CD1Vln8Bzn3QBp405PC7EtsV50hWldI21o=
Received: by mx.zohomail.com with SMTPS id 17557101417048.584499419248232;
	Wed, 20 Aug 2025 10:15:41 -0700 (PDT)
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
Subject: [PATCH v1 07/14] dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg property
Date: Wed, 20 Aug 2025 14:12:55 -0300
Message-ID: <20250820171302.324142-8-ariel.dalessandro@collabora.com>
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

Current, the DT bindings for Mediatek UFOe (Unified Frame Optimization
engine) is missing the mediatek,gce-client-reg property. Add it and
update the example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/display/mediatek/mediatek,ufoe.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index 61a5e22effbf2..ecb4c0359fec3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -64,6 +64,14 @@ properties:
       - port@0
       - port@1
 
+  mediatek,gce-client-reg:
+    description: The register of client driver can be configured by gce with
+      4 arguments defined in this property, such as phandle of gce, subsys id,
+      register offset and size. Each GCE subsys id is mapping to a client
+      defined in the header include/dt-bindings/gce/<chip>-gce.h.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -77,7 +85,9 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
     #include <dt-bindings/power/mt8173-power.h>
+
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
@@ -88,5 +98,6 @@ examples:
             interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
             power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
             clocks = <&mmsys CLK_MM_DISP_UFOE>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xa000 0x1000>;
         };
     };
-- 
2.50.1


