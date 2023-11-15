Return-Path: <linux-gpio+bounces-125-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F97D7EBFD4
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 10:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65319B20B0A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 09:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5AED29C;
	Wed, 15 Nov 2023 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="p/57tihj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E6DC154
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:59:03 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA59D134
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 01:58:58 -0800 (PST)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231115095854epoutp02eea8558515cc8cc18676c71148a8239b~Xw38LFBDa0277902779epoutp02J
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 09:58:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231115095854epoutp02eea8558515cc8cc18676c71148a8239b~Xw38LFBDa0277902779epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1700042334;
	bh=kJxHxNjsxBKiWMi9viH6jAuHV4XZXizWHnQJw/wgmHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p/57tihjBEwTZOERfnqiGd79PTh6B8dLKcHuHd1h3yVbR0xe5Up8sltmu+DSJDrZS
	 KMaaXkw9l3AWZWk7RwtuyLMlSRL/JYLP5TvVYA1JDnEf3QvNcFVfthJKRHwy8PmT7d
	 gX1VNDOKfWXGz0jidMuUDM84JAZaZHM2hNlnoFiM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20231115095854epcas2p175cbb55ca0281f244db0d05356c89322~Xw37iyZvH0959709597epcas2p1o;
	Wed, 15 Nov 2023 09:58:54 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SVdsn5DYCz4x9Q5; Wed, 15 Nov
	2023 09:58:53 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	3C.46.10006.D5694556; Wed, 15 Nov 2023 18:58:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20231115095853epcas2p3e808e27c4a5c611e7e1965f4c968cbcc~Xw36x_PKA0132301323epcas2p3S;
	Wed, 15 Nov 2023 09:58:53 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231115095853epsmtrp2c7196be844e6e8ffebdc09b9161c05e1~Xw36w8hL32585825858epsmtrp2o;
	Wed, 15 Nov 2023 09:58:53 +0000 (GMT)
X-AuditID: b6c32a45-9e590a8000002716-f7-6554965d5774
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	02.F6.08755.D5694556; Wed, 15 Nov 2023 18:58:53 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20231115095852epsmtip2ce7770628a2aa20bbf5fe5f2b8186299~Xw36RnLWe2715627156epsmtip2N;
	Wed, 15 Nov 2023 09:58:52 +0000 (GMT)
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
Subject: [PATCH v2 01/12] dt-bindings: soc: samsung: exynos-sysreg: add
 exynosautov920 sysreg
Date: Wed, 15 Nov 2023 18:55:57 +0900
Message-ID: <20231115095609.39883-2-jaewon02.kim@samsung.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115095609.39883-1-jaewon02.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPJsWRmVeSWpSXmKPExsWy7bCmhW7stJBUg3VTNCwezNvGZrFm7zkm
	i/lHzrFaNC9ez2axo+EIq8W7uTIWe19vZbeY8mc5k8Wmx9dYLTbP/8NocXnXHDaLu3dXMVrM
	OL+PyeLM4l52i9a9R9gtDr9pZ7X4uWsei8WqXUB1tydOZnQQ9tg56y67x6ZVnWwed67tYfPY
	P3cNu8fmJfUe/X8NPPq2rGL0+LxJLoAjKtsmIzUxJbVIITUvOT8lMy/dVsk7ON453tTMwFDX
	0NLCXEkhLzE31VbJxSdA1y0zB+gdJYWyxJxSoFBAYnGxkr6dTVF+aUmqQkZ+cYmtUmpBSk6B
	eYFecWJucWleul5eaomVoYGBkSlQYUJ2xrr5GQWn2CsONu1mamBsYOti5OCQEDCR6Nga2sXI
	xSEksINR4vLdz0wQzidGifbmhSxdjJxAzjdGiX+LkkFskIYluz6xQBTtZZRYdXUTI4TzkVHi
	yc7dzCBVbALaEt/XL2YFsUUE7jNLvG6rBiliFmhnkpj37SXYWGGBeImlk+6zg9gsAqoSV068
	ZgS5iVfAVqJpjwLENnmJPYu+M4GEOQXsJFrPa4GEeQUEJU7OfAI2hRmopHnrbGaQ8RICVzgk
	jk9+xQ7xmovEnnMJEGOEJV4d38IOYUtJfH63lw3CzpZon/6HFcKukLi4YTZU3Fhi1rN2sGuY
	BTQl1u/Sh5ioLHHkFtRWPomOw3+hFvFKdLQJQTSqSdyfeg5qiIzEpCMrmSBsD4l/q6dBg3Yi
	o8SKDatZJjAqzELyzCwkz8xCWLyAkXkVo1hqQXFuemqxUYEhPHKT83M3MYJTtpbrDsbJbz/o
	HWJk4mA8xCjBwawkwmsuF5IqxJuSWFmVWpQfX1Sak1p8iNEUGNATmaVEk/OBWSOvJN7QxNLA
	xMzM0NzI1MBcSZz3XuvcFCGB9MSS1OzU1ILUIpg+Jg5OqQamRY/EJBaxLdx485/27YuS6oL6
	364ysdt8U7fdOqO7NUPd/O3/xmkb1wb/Yl7oceXSpMrgq+rBfq5rPmg/XPOk7E358yKhj3sY
	HnJVmT27erf83sJYy/icZouj/1s+r7js/lVGWlSqRETHsHjG17geiyivPQcvHAupXVeQu0ff
	+jbvl7V3jV+vSOYuOdJU/6h/s8HmgOJdGzp71WKTP0jJHHfT+ynSL5f18hqDjswJqV0Bup09
	HMtKp8dH/P27vFTY0/32+5K2VuMZN/n+ei17vU085QDfhvpVbakM70WO7tkx+fLmmWv1jp26
	Ej3xApPv/89BztP9ZP76xu24L3LxQOUPvet3ryfxdOwU0hD4pMRSnJFoqMVcVJwIAM9VbOti
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42LZdlhJXjd2WkiqwdyZrBYP5m1js1iz9xyT
	xfwj51gtmhevZ7PY0XCE1eLdXBmLva+3sltM+bOcyWLT42usFpvn/2G0uLxrDpvF3burGC1m
	nN/HZHFmcS+7ReveI+wWh9+0s1r83DWPxWLVLqC62xMnMzoIe+ycdZfdY9OqTjaPO9f2sHns
	n7uG3WPzknqP/r8GHn1bVjF6fN4kF8ARxWWTkpqTWZZapG+XwJWxbn5GwSn2ioNNu5kaGBvY
	uhg5OSQETCSW7PrE0sXIxSEksJtR4sLRJiaIhIzE8md9UEXCEvdbjrBCFL1nlJjfuRMswSag
	LfF9/WKwhIjAc2aJs38eMYMkmAX6mSSub0oAsYUFYiWWnmtlBLFZBFQlrpx4DWRzcPAK2Eo0
	7VGAWCAvsWfRdyaQMKeAnUTreS2QsBBQRevuH2ATeQUEJU7OfMICMV1eonnrbOYJjAKzkKRm
	IUktYGRaxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHGNamjsYt6/6oHeIkYmD8RCj
	BAezkgivuVxIqhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe8Re9KUIC6YklqdmpqQWpRTBZJg5O
	qQamrLMS318qHHly7LeUg3rxmw6jE//02FanW6f83Lvb4yrDAo47k6NDEnVzE3X8/y66IB/o
	43dk8Zzfb5XdHmdePjFnz/Hn+Z/iK/d/7oyPKU3amX9/y78D8Wqm60pFlr49YnHhXfia1gUl
	wcKnn7T5H3/X+kXnjd2zaf+k/WU2lnBG97NEb5gxg3PH7LtB156Fvr4bdjY9+cNEI6Xdl80e
	CKfEnC5ttb2it7Xx62XznvXdXBe/Kuj1qIduviYnMb2o+97/Vr+wKWL7N8iYNvL/k4vicHkm
	0l56d36jwVEHAd3uPfZFpTaC28+82f75ov6LD4/XLWOcMmvm4XW83Zfn7FzJ9LrhKP/qiyuf
	zJm2IVaJpTgj0VCLuag4EQANvdx5IAMAAA==
X-CMS-MailID: 20231115095853epcas2p3e808e27c4a5c611e7e1965f4c968cbcc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231115095853epcas2p3e808e27c4a5c611e7e1965f4c968cbcc
References: <20231115095609.39883-1-jaewon02.kim@samsung.com>
	<CGME20231115095853epcas2p3e808e27c4a5c611e7e1965f4c968cbcc@epcas2p3.samsung.com>

Add compatible for ExynosAutov920 sysreg controllers.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 163e912e9cad..2de4301a467d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -50,6 +50,11 @@ properties:
               - samsung,exynosautov9-peric1-sysreg
           - const: samsung,exynosautov9-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - samsung,exynosautov920-peric0-sysreg
+              - samsung,exynosautov920-peric1-sysreg
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.42.0


