Return-Path: <linux-gpio+bounces-25970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D0AB5373D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 17:15:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA2E2AA2039
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFEE3570B3;
	Thu, 11 Sep 2025 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="N5QfbwJ9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B0C350D61;
	Thu, 11 Sep 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603666; cv=pass; b=pXRNvlh5TC6PKmObeV22fdozGhn1RKZOrXW5kNEyu6Z9SPFrWdo8hFJXee4VEfzqtr44a/vxwB3G4LGrSfk2sVSnxqGot45kp2H1YQPE3phlKcvwkQv4wrFYiMNQKbj3BwaHb67SXeDRIBMQkkBW/lK2i7qfGH9bkENGA8VzjtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603666; c=relaxed/simple;
	bh=6rB+bBL99k76FU+7hRIDnEiSThkf6d7imnmiWq6Yvd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nW9l0saRAl8/UypliCRYRa9b82Ha7/2HP1GGpi4qhj8KB6wBT+764uKVC9nkjCKQtPATTAs8PkNd5673WpH+bKcEo+Fe43X6BfVXYa0RW1PGhbCs15ViGgoEQNd7iXfnMqw8br9zrhOjl51t4usEmQ7slZLl3rrNfglB+bopXxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=N5QfbwJ9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757603611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y3TWVD8OQzag4n7vlKhHW5hOxDdlpiKY6usJ9p/Cd7xIJo+Wt+wwGpMU1mwM+/yaTN70Q+HkZEvfU4U5Nye8JRjBACTcEb2BPVgFIvEJfd1jRM0UAHYwJoRphYahJ2NnI6bDe/++mWRFzbzDRVIJNAiXFd2MlhOvUgniihMT4ro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603611; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bY54AAdDsGJHBRu4VNnRBqaafsYGU+PM+RWfhefn48Q=; 
	b=SDZ70MmO1l08Sec8X99CQjE+6BeOZSjEsYq6rf3CQ8i5apB5Su+nEys4dfRw2Ptfq84xKDgJCcdnRUA2LioqVQ655gfYIGPlmaBf+2EL7LGCc2j0u4AlA0fEjU+8UqvIx7CTDdbnZhWHPXUFvx8JizPAtqUMamd9/AwpOa4Y82U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603610;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bY54AAdDsGJHBRu4VNnRBqaafsYGU+PM+RWfhefn48Q=;
	b=N5QfbwJ900PSelAysTK+1BMVDe9AfBePeRmlJVYGFQn+jbiN9qM/JfZSQQH6pdsq
	CV0/LWZV3dzLQcKLLX3OPZ13viNYqb0CLjUtbjRvarvzuzZ5sbRNrKRXwhRgdtsupdp
	U2ff0D8faKik7RS3sTIgM9M/EVfMY/CFZKSM1iR0=
Received: by mx.zohomail.com with SMTPS id 1757603609772835.2831161402115;
	Thu, 11 Sep 2025 08:13:29 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
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
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 05/12] dt-bindings: display: mediatek,od: Add mediatek,gce-client-reg property
Date: Thu, 11 Sep 2025 12:09:54 -0300
Message-ID: <20250911151001.108744-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Currently, users of Mediatek OD (display overdrive) DT bindings set
mediatek,gce-client-reg node property, which is missing from the DT schema.

For example, device tree arch/arm64/boot/dts/mediatek/mt8173.dtsi is
causing the following dtb check error:

```
$ make CHECK_DTBS=y mediatek/mt8173-elm.dtb
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
[...]
arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: od@14023000
(mediatek,mt8173-disp-od): 'mediatek,gce-client-reg' does not match
any of the regexes: '^pinctrl-[0-9]+$'
```

This commit adds the missing node property in the DT schema and updates the
example as well.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../bindings/display/mediatek/mediatek,od.yaml     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 71534febd49c6..930c088a722a8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -60,6 +60,18 @@ properties:
       - port@0
       - port@1
 
+  mediatek,gce-client-reg:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: describes how to locate the GCE client register
+    items:
+      - items:
+          - description: Phandle reference to a Mediatek GCE Mailbox
+          - description:
+              GCE subsys id mapping to a client defined in header
+              include/dt-bindings/gce/<chip>-gce.h.
+          - description: offset for the GCE register offset
+          - description: size of the GCE register offset
+
 required:
   - compatible
   - reg
@@ -70,6 +82,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gce/mt8173-gce.h>
 
     soc {
         #address-cells = <2>;
@@ -79,5 +92,6 @@ examples:
             compatible = "mediatek,mt8173-disp-od";
             reg = <0 0x14023000 0 0x1000>;
             clocks = <&mmsys CLK_MM_DISP_OD>;
+            mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0x3000 0x1000>;
         };
     };
-- 
2.50.1


