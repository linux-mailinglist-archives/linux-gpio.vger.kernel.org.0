Return-Path: <linux-gpio+bounces-23677-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B0FB0EDD0
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E63F177875
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B739A284B3A;
	Wed, 23 Jul 2025 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="gZ/cAkFz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B7283FE4
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753261036; cv=none; b=uMeOkWwdCZMq/JQNyvs8LzGn7W2hMnQw4DJWC/2MZfQJ8KG5lizlAIqnP616PC3eY4qyFKNlcIB7SehuFZkmgzplAoxbD6zEno3adOQz0NXmGKFq1DoZ8cBfQisNlgjJnjzSvbEu7srjUQzAvrG+qlOiBuJVYKz9o/1wFzay/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753261036; c=relaxed/simple;
	bh=49hlALmvO3tf+FxtZgb/HogpsYZxbw25DjGIXxz7B+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3GhCf381wxheQrp/7Ej7XtZmrP++vrpvfsLzOHU11lBF5clKcPbDnxX4MKesmgKa+QZ6bh6cIqRfdlq0YDZnPVCysDKdls+g/1cdsRR8efe/G9r8MGDMFlAuAcKeAkeQrBXt3Swt7chkEP1O5WGmMXU4O1Hidvf+m4tSfXk/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=gZ/cAkFz; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753261034; bh=PKSo/fJwr04VNmGVrbdVZ+djNyZPEPotepO7Vigj2G0=;
 b=gZ/cAkFzBk4dAWEQEvopEKT960ozV4vhq862TUjFWC++4XivxeraSJ7N6w0Ut4H/v9evZnt/B
 WZ6ea60xDPneIfGHXMR0x1N/ZjcPacmNFWO03qlG7tc/LIyhidPCQDFdxtSlNzrSGbLmjSXypz2
 xOrc1WpoByNG9iGdmdYKysSp+4xynThh5S8LZicA0/oFrUx4dXUciWmpb2IwmCuc2W/r2uOZHxM
 MOpZI6THaAVGcEya0LIY+T5i6h9JxhoE81bwMSglQqgyTYcRgUdpn0hvgaWKroaLV07O8+2LTf3
 K0JYvr5NlivEwk1Hhtk3mMJ+xnmANB4VFc/Y3Db3hfng==
X-Forward-Email-ID: 6880a3e0144dc4a5e5baee04
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: gpio: rockchip: Allow use of a power-domain
Date: Wed, 23 Jul 2025 08:56:43 +0000
Message-ID: <20250723085654.2273324-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723085654.2273324-1-jonas@kwiboo.se>
References: <20250723085654.2273324-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO controllers in most Rockchip SoCs are part of power domains
that are always powered on, i.e. PD_BUS or PD_PMU. These always powered
on power domains have typically not been described in the device tree.

Because these power domains have been left out of the device tree there
has not been any real need to properly describe the GPIO controllers
power domain.

On RK3528 the GPIO controllers are spread out among the described
PD_RKVENC, PD_VO and PD_VPU power domains. However, one GPIO controller
belong to an undescribed always powered on power domain.

Add support to describe an optional power-domains for the GPIO
controllers in Rockchip SoCs.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: Update commit message
---
 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index d76987ce8e50..bdd83f42615c 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -41,6 +41,9 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  power-domains:
+    maxItems: 1
+
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-- 
2.50.1


