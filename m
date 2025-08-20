Return-Path: <linux-gpio+bounces-24668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5AB2E38C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 690A91C87B1C
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9138338F4D;
	Wed, 20 Aug 2025 17:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="YmQ2Jueg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFAD18BBB9;
	Wed, 20 Aug 2025 17:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710217; cv=pass; b=LmhAzRziAfzfIhDE7cwtDHOdIZyJ8XaXcsjgCSS31+jTijzsKLOOcjOSYgs6xIE/OysmKnztyO4rAY0um3Tb7VYBy9I/6VEhEgCVuQoi+qjkeOrqcF10990LIIBHytP8l+CipP8dEHqcYEV6MYJJaqy0o46jlBh1064rEBF5K2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710217; c=relaxed/simple;
	bh=ImSze4/paAh7Ng/Y7LmZt4NLc5gIpnBk3nj1wLLLTPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YFqghYV2yK7otItz2dgCpWAKANLZLmaAHlVo5B3pD7AuoYq01b7sOXjGpc1JyorpOjJmHXYHvCx4+w9iuU0E6fDgb6DjtXmKAC4XD+gYURximG3lGkQdxnC1FWVo4pi5rZV0iYVyiWb+80dWdu2mow0/iY4RHzf6fygnvk7ayfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=YmQ2Jueg; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755710172; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RjzT/f8YblOclyalWeryqHbLicp5WmRidds8+LWiFgwkE9fl7bT0/hyPj3LTqJeXSXAr4OAhcXLbqY2CNpvFD5a/wTcMkyamK1NaU2z7PVd5cLpgOygHkjR8yd+hWfk1jCO949KpeCr5UxT5erSCVBc6/TZuG8eMc+eOrW9rFqM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755710172; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=; 
	b=kXi+D+/QdGWNCBtsnYxOQdLJXLRy3HbjU3u4lvvI5lzS18JY5DrPM1QAO2iL7441PZ9gQhXxWCd9BnJINXilS4cuVBqPjyHOAY5nXs52e9+1Ll0ruOe/vIG506nf9Xst3yQw0lIoZ0jLzDs8l2yEPgDsj4r9OlVouggGhNqSX8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710171;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=;
	b=YmQ2Juega/HOl6KnUF4i9NncuelEK2VPn9Fh7FH8d1kJ8KFM/jl89+DeORaM96Md
	tjbalhQof5uDLhfAcUBm9ze0luDTFvZORvjFzngrp+KwzKxwc+GW7XKF9YfD5upPrxI
	gO7DRXkvDMKT5w6X0EuHfQf0WPVePsiU/AzLub4g=
Received: by mx.zohomail.com with SMTPS id 1755710169818871.9439170647294;
	Wed, 20 Aug 2025 10:16:09 -0700 (PDT)
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
Subject: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl: Allow gpio-line-names
Date: Wed, 20 Aug 2025 14:12:57 -0300
Message-ID: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
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

Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
the gpio-line-names property, add it to the associated schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index b9680b896f12f..aa71398cf522f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -43,6 +43,8 @@ properties:
       the amount of cells must be specified as 2. See the below mentioned gpio
       binding representation for description of particular cells.
 
+  gpio-line-names: true
+
   mediatek,pctl-regmap:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-- 
2.50.1


