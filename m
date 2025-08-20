Return-Path: <linux-gpio+bounces-24671-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F27B2E398
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D695E55E8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6249D340DA9;
	Wed, 20 Aug 2025 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="TvxHDTFq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E0D33768E;
	Wed, 20 Aug 2025 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710266; cv=pass; b=BzvIRl1GjXaFEfDSZrjka7w1RX0oK2E7/CrftCIZfCz3/aUaJeJe39uODJBuW7qlaGREjvfooxgjf8rLqQV3NJmzcL9f8bzy0vGbDTPB2X3hnclq3ppNw+ZbxjSFM0l6mvitWGlNHpvrpzY5Cbi582oxmiujObwy36qnMWBOZUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710266; c=relaxed/simple;
	bh=fOuQa45+u2x3pKDQEkY6RzgcAsiuu+jq9nBXOT5yN1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sgAR+ZHDG+8vsgNDvwSQCq7D25eFGg7N7k6q9yInfhq025USO9MsLneefKZp2fcjmRS+lxLB5qgEeItMvjuzc2hvE5aVZmlc0peoA7wkqzJvCXhXZ5ADoM27meHKta+xhgFYSkYoQhOlQp1/cl+/C7KH1zdY699h9JJsDoWKf9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=TvxHDTFq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PLrIntXILnml1BIJ4BKOOJHB+dggwwR55pQmTCMNaVaL56E+NhRK0NYvDgVfAppUw9JSWVJF4Fb2oQ7s844Fb6gW5dijwYE/egCvJk+2C2BEKF2BsIRe+KULPPGGpmpVP7/0onVFbWiKK1pmkaC2wiXSJktd6w6mtkUVJjJGeQs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710216; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sjr5FjezJ3DnctvttPhGjVA1HSx0Nva4gNLgYPU187w=; 
	b=hwpkoa+EEzGcfuGj09O2DUaJhu3NH1zsClkAgUEsW22wBsHCCyvGcj9LqBtiKfEllRfrPVb3xMa+7t7KnRGSrgHLtjEYwe7QkRnvCZbu7JXwQkEme1TO05+5DZhzksRlJV1T7l/aS+3Y/QQGLWFxhJmMYfA7oxurqJ2abFqm1BU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710216;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Sjr5FjezJ3DnctvttPhGjVA1HSx0Nva4gNLgYPU187w=;
	b=TvxHDTFqL5xmg0YBTOXCeinVn4RGQeDw+WcChZtVbiilJeA2+ZvhS3b5GZr699c+
	6UrdZhv/P8WzDCeEE2MEmjb/0RYaaQXDKwMJT6YrEYVY1ahn0FkBWU6h0eYCGlZY1EF
	WwEmckYK+LJ0hx59BNRzJb/wUPwSR6ytm8GwUgtQ=
Received: by mx.zohomail.com with SMTPS id 1755710214216103.48931777604218;
	Wed, 20 Aug 2025 10:16:54 -0700 (PDT)
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
Subject: [PATCH v1 12/14] dt-bindings: soc: mediatek: pwrap: Add power-domains property
Date: Wed, 20 Aug 2025 14:13:00 -0300
Message-ID: <20250820171302.324142-13-ariel.dalessandro@collabora.com>
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

Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
power-domains property, which is used in the MT8173 E1 evaluation board
as it needs USB power domain.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
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


