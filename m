Return-Path: <linux-gpio+bounces-19136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3FFA97283
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDFD81601BC
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 16:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC1D293461;
	Tue, 22 Apr 2025 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="qXIaKsOy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D618292900;
	Tue, 22 Apr 2025 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339010; cv=pass; b=cXbvxDlbx1aDOEIR0Gl36Sn+TUmE6ZAWigT2x/uScrlKebryWUsz0AJTpG7wz0/eO42Dp0hFXuirLfTWEbcTmnfy6a4MqYrCzYyTh9TO7+GEe4ajui+I1HODQXYUr6o654GL5hhWPZxdxS9vh0sd5bJVNNwf8/g3W+q4iqQ4Q/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339010; c=relaxed/simple;
	bh=+gwzvMZHMkRJbKKRUCAnUBF29laHkO5T9NrzsqQu1yI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyA3AXzKVdE4kTi6bKYhddnzoq9G/8MvnbTxqjQu60acSSKPXvKrKZvzhviFDtdoFwHYewEMms390azQTTpQFISSXdMiu1cbmo2YQdpWlx2JZJa/+C994K+S2MzOj/zSppyl2fkh9ernIspxXTZiB6LDjKcD0jnx+JDauRneYeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=qXIaKsOy; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745338991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YmpFT+Np6DaKQbeE7Md2qEzIO0UPN3esqWkXLVnI3sRUlNxMOyVYOnAD69iSECFmR9ykf4Jif3ZeJlBs8FknjaT8yBZF9A72+P6EujpYCynxPiqfgnyMjqUC64YRBVsLk6H3OcqWY4N1sK+1wLYn9Zpc7Uuz+mCNCxG5wpUZRCg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745338991; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FWFt3dRo5BXi34AencVAC8YNFSNDAd4deu1+bkumoOo=; 
	b=CnwRcEDA8XzrUNMWL7DrvQDZ2Ls0daxblvRkuDTNkDyYYTIXGC8Eh0ai+T3P1IlUIjxqHDgdHu2V8uOHjDJ5wCdk5zQQHNyDC162irCI2ESywAvMhxZ+6r9LatU13IrkTc+Jks3ipsfsoIEP+hGF0D4r13RYFq3uo1ZZcB0Ls7Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745338991;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FWFt3dRo5BXi34AencVAC8YNFSNDAd4deu1+bkumoOo=;
	b=qXIaKsOypDu1rzVoxBRDe3LX4GSk/+dh8tzK6qwDEP6cazYGBhPhlthnfQ62e2Qz
	pXUbsvqAvwEdnWf4RCn+6RvDBfUijhH1868/eYFHy64hF8Dq7yp8ffgLsZ7oWCHuTML
	jCGS2ZMEFpoFEgMddXUfAymXv1DZ/tx4ycVHvq/PxZYZTbLYzm4wpEaYrtKSGERf1wU
	yRcKG2srqQXvDTnwfRKF6XDnRh3Sf/1dWMQfpvFQ03qU9L78IAEUt8EnORnvf2uOzcw
	x9HuyBHpP1KFsv4cmWxZUnQD2wZdACpQiPZwONSRt4w/zXnMCQfn4f419kXa2HnC93k
	twGwpGj/Pw==
Received: by mx.zohomail.com with SMTPS id 174533898976779.42946038180173;
	Tue, 22 Apr 2025 09:23:09 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
Date: Wed, 23 Apr 2025 00:22:48 +0800
Message-ID: <20250422162250.436169-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162250.436169-1-uwu@icenowy.me>
References: <20250422162250.436169-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The internal inputs routed by the pin controller could be routed not to
any GPIOs but forced low/high in the pin controller, which is a useful
feature for some input signals (e.g. overcurrent_n pin of the USB
controller, which needs to be tied to high if not externally routed).

Add two properties to support forcing inputs to low/high.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
index 222b9e240f8af..d793290afdd74 100644
--- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
@@ -46,6 +46,16 @@ properties:
   '#gpio-cells':
     const: 2
 
+  starfive,force-low-inputs:
+    description:
+      The list of input signals forced to be low inside the SoC itself.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  starfive,force-high-inputs:
+    description:
+      The list of input signals forced to be high inside the SoC itself.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 patternProperties:
   '-[0-9]+$':
     type: object
-- 
2.49.0


