Return-Path: <linux-gpio+bounces-133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B687EBFE3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 10:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C54C1B20BDF
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 09:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B06FBF0;
	Wed, 15 Nov 2023 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lFvYwQ6I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0DCD51E
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:59:06 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12024199
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 01:59:04 -0800 (PST)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231115095855epoutp04fd980cc7dfa80f4ba62119470414630d~Xw39SRa8Q1367213672epoutp04J
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:58:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231115095855epoutp04fd980cc7dfa80f4ba62119470414630d~Xw39SRa8Q1367213672epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1700042336;
	bh=niNoXIDBaDfRcCYo2fCtxgtWpQtcXPXpRTf9QZgEyLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFvYwQ6IWo44bA4tBHz/TuqG6jbO0KQ0cG0AI2LUsvKGNo8qJRcVTKASQQlw7Es/S
	 L8cxNKKFPtI7oa4lT7OO6/Yt6sN/LGEwU744Y/5N0bEPSnXnDqhcNe1RORGWY43k3y
	 91XVH7vLpjBgTMGTFVofg2O6VRNTPdqJoSz9UD3I=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20231115095855epcas2p141909fb8f82cf06006d28c9cad9c925c~Xw38zQmdn2129221292epcas2p1R;
	Wed, 15 Nov 2023 09:58:55 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.99]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4SVdsq0xmBz4x9Px; Wed, 15 Nov
	2023 09:58:55 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8C.34.18994.E5694556; Wed, 15 Nov 2023 18:58:55 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20231115095853epcas2p38f9fbdd7bbbb940afa2042cd5ee9d237~Xw37T0XZH0097300973epcas2p3Q;
	Wed, 15 Nov 2023 09:58:53 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231115095853epsmtrp1f9de90c93038c4976ec93fcfd8148b1d~Xw37SgZc22856328563epsmtrp1J;
	Wed, 15 Nov 2023 09:58:53 +0000 (GMT)
X-AuditID: b6c32a4d-743ff70000004a32-a2-6554965eda9e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BA.B2.07368.D5694556; Wed, 15 Nov 2023 18:58:53 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231115095853epsmtip289e0b6023a1c306598b74502f86d8e78~Xw3629IuF2749427494epsmtip2d;
	Wed, 15 Nov 2023 09:58:53 +0000 (GMT)
From: Jaewon Kim <jaewon02.kim@samsung.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester
	Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>, Uwe Kleine-K?nig
	<u.kleine-koenig@pengutronix.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH v2 03/12] dt-bindings: soc: samsung: usi: add
 exynosautov920-usi compatible
Date: Wed, 15 Nov 2023 18:55:59 +0900
Message-ID: <20231115095609.39883-4-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115095609.39883-1-jaewon02.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBJsWRmVeSWpSXmKPExsWy7bCmuW78tJBUg7VPGS0ezNvGZrFm7zkm
	i/lHzrFaNC9ez2axo+EIq8W7uTIWe19vZbeY8mc5k8Wmx9dYLTbP/8NocXnXHDaLu3dXMVrM
	OL+PyeLM4l52i9a9R9gtDr9pZ7X4uWsei8WqXUB1tydOZnQQ9tg56y67x6ZVnWwed67tYfPY
	P3cNu8fmJfUe/X8NPPq2rGL0+LxJLoAjKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX
	0NLCXEkhLzE31VbJxSdA1y0zB+gdJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6B
	eYFecWJucWleul5eaomVoYGBkSlQYUJ2Rs/uC2wF69krNj6aw9TA+Jm1i5GTQ0LARGL55C1A
	NheHkMAeRomb73dAOZ8YJZbuPMUG4XxjlFg57RkbTMvOOc8ZIRJ7GSVuHd8LVfWRUWL2gdeM
	IFVsAtoS39cvBlsiInCfWeJ1WzVIEbNAO5PEvG8vWUASwgKxEjc6e8GKWARUJR5d28UOYvMK
	2Ep86nrBCLFOXmLPou9MXYwcHJwCdhKt57UgSgQlTs58AjaGGaikeetsZpD5EgJXOCT2Nbxk
	guh1kTiw+hgzhC0s8er4FnYIW0riZX8blJ0t0T79DzQ0KiQubpgN9aaxxKxn7Ywge5kFNCXW
	79IHMSUElCWO3IJayyfRcfgvO0SYV6KjTQiiUU3i/tRzUENkJCYdWQl1jIfE13mroOE2kVFi
	3a8t7BMYFWYh+WYWkm9mISxewMi8ilEqtaA4Nz012ajAUDcvtRwey8n5uZsYwUlcy3cH4+v1
	f/UOMTJxMB5ilOBgVhLhNZcLSRXiTUmsrEotyo8vKs1JLT7EaAoM7onMUqLJ+cA8klcSb2hi
	aWBiZmZobmRqYK4kznuvdW6KkEB6YklqdmpqQWoRTB8TB6dUA5Nv5rpb3/+9KjSyZHvQIrhv
	K8v2gH5/numvrNYu1Pp0WvJEzPbdZ4XkF33eYfC+32AZ5701/bZb+4oWRcw9f7kvbvWTJLGJ
	UseEPUXCvnEmtrfM6jSv6p0y9YfwXbEXT/647//Wvd5UYUqjabRP4s+kia/fJX07yb36+4lG
	FnbWE/fvm2ya0PRm7+fXlrKOhz7pMEe8/eZ9LmafBEeJP4N63cv01Z869hzzdVnLu+ZvF8dJ
	9lzeN++uhbnLTfx+YMucL+nKMu/X3LcQf1k0farRF43es7c/aG7esvp70VYdYwfRnvCTKxfd
	KmQ7fvHd36CfcV7X3D/uslozWaaAIejmA46F9fqRSW8+7w3RZjhuqMRSnJFoqMVcVJwIADXA
	2dlrBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJXjd2Wkiqwa9ebYsH87axWazZe47J
	Yv6Rc6wWzYvXs1nsaDjCavFurozF3tdb2S2m/FnOZLHp8TVWi83z/zBaXN41h83i7t1VjBYz
	zu9jsjizuJfdonXvEXaLw2/aWS1+7prHYrFqF1Dd7YmTGR2EPXbOusvusWlVJ5vHnWt72Dz2
	z13D7rF5Sb1H/18Dj74tqxg9Pm+SC+CI4rJJSc3JLEst0rdL4Mro2X2BrWA9e8XGR3OYGhg/
	s3YxcnJICJhI7JzznLGLkYtDSGA3o8S1mRvYIRIyEsuf9bFB2MIS91uOsEIUvWeUWHLhLQtI
	gk1AW+L7+sVgCRGB58wSZ/88YgZJMAv0M0lc35QAYgsLREs0fF/JBGKzCKhKPLq2C2wDr4Ct
	xKeuF4wQG+Ql9iz6DlTDwcEpYCfRel4LJCwEVNK6+wczRLmgxMmZT1ggxstLNG+dzTyBUWAW
	ktQsJKkFjEyrGCVTC4pz03OTDQsM81LL9YoTc4tL89L1kvNzNzGC40xLYwfjvfn/9A4xMnEw
	HmKU4GBWEuE1lwtJFeJNSaysSi3Kjy8qzUktPsQozcGiJM5rOGN2ipBAemJJanZqakFqEUyW
	iYNTqoEpadH3S7+4X6k3WnLdmMpYuPGS6Sa1p/cXvzy3J77hcCyLxNvbBSwLJh/8nPMmr3vN
	wocGHw1qGj6x/jzfu6Jxwcrfe8OizVLO/Hll9+CkWZz55kiPGZL2elP6th2Kmmcd3cTvrXzs
	xszCTLmGoxxrfwRM0y95pHLpq+a0kmYdOS4WNm6P/Ye1RC9du5EqJ7v32yHnwAuLMoMXdl35
	dFBY/mhnsnHfYs4stw9CpVkTAlgWpq76vTtwRfurdd46Nh8TjQ71brf89mLH58MvP39RLp58
	eH//PxO1BTkV35OubPFoz/lvlvL/kEW2VEal8sfyi61t5yf12/1+eMyK54nyxTd6BvO95GdI
	NkVfkHZ3V2Ipzkg01GIuKk4EAGo9A80iAwAA
X-CMS-MailID: 20231115095853epcas2p38f9fbdd7bbbb940afa2042cd5ee9d237
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231115095853epcas2p38f9fbdd7bbbb940afa2042cd5ee9d237
References: <20231115095609.39883-1-jaewon02.kim@samsung.com>
	<CGME20231115095853epcas2p38f9fbdd7bbbb940afa2042cd5ee9d237@epcas2p3.samsung.com>

Add samsung,exynosautov920-usi dedicated compatible for representing USI
of ExynosAutoV920 SoC.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 5b7ab69546c4..61be1f2ddbe7 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -24,7 +24,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: samsung,exynosautov9-usi
+          - enum:
+              - samsung,exynosautov9-usi
+              - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
       - enum:
           - samsung,exynos850-usi
-- 
2.42.0


