Return-Path: <linux-gpio+bounces-25976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CABB53763
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 17:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 442FA7BA5D3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ED0E3629B9;
	Thu, 11 Sep 2025 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="UG+iT4YB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400336299F;
	Thu, 11 Sep 2025 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603756; cv=pass; b=XJCx8vJ3k60+lvV1qE4c2ueVi8o+7DXIhy7nzZlK8tIDP6+GpO9dapVMvBFhRXtAVbAUaGjEWOLjjPp4D74uHKjXF/ApOroDsyzQlzqMgH5x9REJul0TSPbP02FpqvkfgMVefx2001c7+AFSvkm90p8z+IjPMvYQ/yAINZ4P8UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603756; c=relaxed/simple;
	bh=fR2M3snGgXKoXVdvvdQNA7jLh8HqQ6Bj/ZgYePPr5Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D1BZv9v1hbevgW0cFrkHzKXCrlklxM+7vE/L9Z+lZgPXmxicGg86gIsB40XOdZ1iISfXRvsEPE2Q0ns/pd1GLzFK1ePyp1oUogFv6BfjqaTqMQPSdINoXHHYZJWt/OhzdJcEPqM0PFZwVsHHufmCZ1iD/ni6Gq82K5H/Aggfrj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=UG+iT4YB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757603699; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RfQQ/M6Tm+6OaYTlB7FKmVd0qTVEJfQBVE3+fZ4Pa3hwCrsDZb9vqtwn3dRmZS9ScyCktZluwjSwUkEtrQoUSoyCzyDxdG2ChPP7mHlUKAiqUcIIThtaNjiZPKFB6zz48lC780EDMZyUxXSA1lQB2UvVwzqZbvRJflLK12iZmMQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603699; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pUtxZbvlNIi4H5EeFTGaoT/G6bLVLSFgmTvDYT5R3gQ=; 
	b=XzzTiLYGaQts1yoxDScBtoi4FMPDx3Q275Hd5ugIxyelpYN69Zzr+Iylz8OwUlShOzzHEL/+hJANMdbBmtIbIonrnMqnRkXK/mrDEeIe1hjXz26wCq0NnJvPn7DaIk3AAppziFizntQOvca3f4w+PyoJTHihWtAddSyPGJs0fyo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603699;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pUtxZbvlNIi4H5EeFTGaoT/G6bLVLSFgmTvDYT5R3gQ=;
	b=UG+iT4YBQ9kxlpgN7Ojj4kZaWQKaVMN6VD1IQcR4bXOhvQs5ZJgQoPF+GhByeHqi
	S7DNO141+WLxOLF1wdGAwz++Bl2BOEYHb8YBy6pOk6U5YpC57Kpemxf03bkRINgZokA
	genKNirerdwk3In3ZcuWUJV6JM7z2gC1YxCvRmb4=
Received: by mx.zohomail.com with SMTPS id 1757603698448103.94183972441317;
	Thu, 11 Sep 2025 08:14:58 -0700 (PDT)
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
Subject: [PATCH v2 11/12] dt-bindings: soc: mediatek: pwrap: Add power-domains property
Date: Thu, 11 Sep 2025 12:10:00 -0300
Message-ID: <20250911151001.108744-12-ariel.dalessandro@collabora.com>
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

Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
power-domains property, which is used in the MT8173 E1 evaluation board as
it needs USB power domain.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/soc/mediatek/mediatek,pwrap.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 4737e5f45d541..54c0cd64d3094 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -98,6 +98,9 @@ properties:
       - const: pwrap
       - const: pwrap-bridge
 
+  power-domains:
+    maxItems: 1
+
   pmic:
     type: object
 
@@ -126,6 +129,18 @@ allOf:
         clock-names:
           minItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-pwrap
+    then:
+      properties:
+        power-domains: true
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


