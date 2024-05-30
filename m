Return-Path: <linux-gpio+bounces-6898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 108048D430D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 03:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AEF528302F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 01:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1071DFE8;
	Thu, 30 May 2024 01:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GJCyeMjh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AC11BF3A;
	Thu, 30 May 2024 01:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717033223; cv=none; b=CyUJn9WeZ6CR4Llb4S6CyH13DoxFoy2GgBK1O7+LvVKnpus8s3vQI5qj9ofrzwliK6fvKlA0IUwpHsrUlerVlQYhB0ViJuXkGI86LzjV/0LGjhsnNBW4wFZU6f3s+SCp3d/cyF4BM50u+g8HCVY4aydWjpMuTjUAzPBA7QOJNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717033223; c=relaxed/simple;
	bh=omFm5ce2AOlS/lYSLsthVtR85tT7UUbDCXpxWCjYZQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJTFThYEJ8uAvjpUNsdcFzJu0tQx0AVtkjB5Ol8QuF4BjPsVGTAAf4VuVvQt1SinJATFoQuFBN6Ycfue2r6ywb7Wqr5Q7lNInnuPqc1xV27KbqDV6k8HneS0+hzSXhl4VIWDJ+3Yy6RCEjjMsFkDRzgGWYDVNv+0zWMNd5BpklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=GJCyeMjh; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 67395201EE;
	Thu, 30 May 2024 09:40:19 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717033220;
	bh=ErLapQqkYUF70ZPHEVqq7CYbi3OWaCay12uuoAyOF+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GJCyeMjhaKZQp+DVyfyn+RCjNQk5fZnevTUN4H4qvXsc9qwy5dtqaJiNzHgi2eDBt
	 NcHGJA0u5NKxi9LuO010j1YdBnRPcS0zVTN3/TZbEjtNbkfdw0denWFu63IWIiOpuv
	 B19qQMDM2i8KAzpVRzuwy8aTUO7/kMqGrsfnvSoeZiPiv5O+Z09dQ2cN/9onQaz3cH
	 GBdiSRbcLUqtw/Ped02fX8RD9Qot/OmMz+ZD3wrTGrzxigVKA2JAz4xtZmOjGyv0FI
	 aXs8cU6YRZ6hrJEt5FFllY14G5bZEDa61U2MKNJ4HhD5o8cf8z46VO6bBJ6rcH1n0k
	 8DHVJ+NwCmwDA==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Thu, 30 May 2024 11:09:49 +0930
Subject: [PATCH v2 2/2] dt-bindings: gpio: aspeed,sgpio: Specify
 #interrupt-cells
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-2-912cd16e641f@codeconstruct.com.au>
References: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
In-Reply-To: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Squash warnings such as:

    arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: sgpio@1e780200: '#interrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Also, mark #interrupt-cells as required. The kernel devicetrees already
specified it where compatible nodes were defined, and u-boot pulls in
the kernel devicetrees, so this should have minimal practical impact.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
index 34cdf1ad9c73..1046f0331c09 100644
--- a/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml
@@ -46,6 +46,9 @@ properties:
 
   interrupt-controller: true
 
+  '#interrupt-cells':
+    const: 2
+
   clocks:
     maxItems: 1
 
@@ -60,6 +63,7 @@ required:
   - '#gpio-cells'
   - interrupts
   - interrupt-controller
+  - '#interrupt-cells'
   - ngpios
   - clocks
   - bus-frequency
@@ -77,6 +81,7 @@ examples:
         reg = <0x1e780200 0x0100>;
         clocks = <&syscon ASPEED_CLK_APB>;
         interrupt-controller;
+        #interrupt-cells = <2>;
         ngpios = <80>;
         bus-frequency = <12000000>;
     };

-- 
2.39.2


