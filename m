Return-Path: <linux-gpio+bounces-25973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4D4B53762
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 17:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DB811884C4E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 15:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9280F35E4D3;
	Thu, 11 Sep 2025 15:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="hNzPgjTG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBA11E9B3F;
	Thu, 11 Sep 2025 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603713; cv=pass; b=GWbwxUP0mG+BzqcAtJcky5gUihuibwObhWbrrRBU9jF4/DFHKhgq9ofuz+Y0wARQAI5j3PLvSWvbGF0dr3FNf3ydv5sm5YSutHlxn7qplJUEE7oeYCARGaPEsA8KBtQE+hZQK+lxC/JqzO0bOhx462Qjjnz/0owb+P6xWoQNhmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603713; c=relaxed/simple;
	bh=ImSze4/paAh7Ng/Y7LmZt4NLc5gIpnBk3nj1wLLLTPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opilTM4m1Ks3M2epQ51tKUB+cCB11pZQlrdSEu0N24H09dYrrknITokrJKgEZaZbgAUmdcd0g6Iu6RnsTys2APIH+6Ok9O+LMBU/hXol7YLcumU+9NXWGuXWRxomOsDyYNesnYtBea09RcuMBa6kMOZrVfbu5xtp7iQ012iz6AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=hNzPgjTG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757603659; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ADY5IxfDhznvAFte4Sh2ahTKVPLIh3SWk/A+VK/j5VrmXYbkfN354w17OALz8EAbd0A1IFBo6pOS0hg5tQ+YDTXnsVyXQKHravDb0X5fkd0O0frh8vL0jYc9lClDH3G+zbCS2KXWEFHutJuO0TuyulRdQmPzQkjv7CM52lOB+r0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603659; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=; 
	b=hzLm38qKhYmC2Ni+sMX69v6qULV91EKb158cuDnFPrDgXvldIBVZNMu3+f2xeatOU/1aHSZ2Vis16k2c5GNO3DsYNRkYSOvehwLu71JjoHtCJWoJo/6S3SKCSUOVrTC8wg3aBd9uZmrI4sX65ET/Wvq3ANlpFnzD8sOYhF/TWHM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603659;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=;
	b=hNzPgjTGHpMMITx3KOL7Fz1pBNIDr7UDiadLmVSxGJMCuFxSqYYJUrLHsBzFGaTm
	m+nRldrpisOE428v2F8kATXnzoRESCdArKZ3xjxYNBn++0AUFE2uazu1e6LmLxZdl1V
	RjeWCrtu2RXDNu3AJHpcDM5vMjFS/DoTKfzQ7IY4=
Received: by mx.zohomail.com with SMTPS id 1757603656617184.5256423904582;
	Thu, 11 Sep 2025 08:14:16 -0700 (PDT)
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
Subject: [PATCH v2 08/12] dt-bindings: pinctrl: mt65xx: Allow gpio-line-names
Date: Thu, 11 Sep 2025 12:09:57 -0300
Message-ID: <20250911151001.108744-9-ariel.dalessandro@collabora.com>
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


