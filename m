Return-Path: <linux-gpio+bounces-10978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331499336C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 18:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7A5CB236D4
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 16:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5751DC042;
	Mon,  7 Oct 2024 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="ezz8LTVI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398251DACB0;
	Mon,  7 Oct 2024 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318962; cv=none; b=TCuIakFEdhU2zyJn9zdsJSRETYYv3cIsiLjiJh7bE7w6SQyS/ocuMBLQldungPzSKapy0u4JPy3CR+oor81ziyMvLXZZFV1+lqrkSLnJdN1Nr/R4PyZzbvgChRHFRdj/aHZ2/yYRYQR05kz/qCKva3oOd6DkQXG0oOtUlBI02VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318962; c=relaxed/simple;
	bh=ehZDP8fh5uxfrKTsADhsn196tG6D+jYfMML9Ef5Lqmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjxb2Lpv1zFpnv0rJ2Vxnf7jcoysxsn+kjNCKHNXXgK7+G+yibe+Y9BFjBqfDbVNCZsGd8OC4EvF79NLidR+4qZ3LzP5jSM7ubjNAf6DyB1UcUfhkpK8Hr+A3TOKdqGL9U7e1q0t9vp3q9kQ4/nlj/piDx7Me8vOXHKmxwnzozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=ezz8LTVI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A7B3A23D49;
	Mon,  7 Oct 2024 18:35:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oKQRXsga-PXr; Mon,  7 Oct 2024 18:35:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1728318958;
	bh=ehZDP8fh5uxfrKTsADhsn196tG6D+jYfMML9Ef5Lqmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ezz8LTVIk9kXIs4vRUSq4E8TBO6TlDLHuop1Or2DoZfshW1mPxPkeRjx7j+E7eswY
	 IQL0rMB9rCEgJZ/KdcwYUkCDe9uxiFVlpUb6oNvrWIehgnOrQab8/sfSoTkqj+x2Fr
	 k/h9ME98+1eHMYgyYBSS0ZN8ZkvbEBZPXMaIJ4LnpzQ62tmETvlrultvPhquqLO1ll
	 io4Jn5O43papJahfzA7qbJId8kPq4gFCmGqsVV7QmBwIbaT1YKsJVft3PFVo1qiLMV
	 Pg77gNQbUcKicG9pmhJ2F5dDsT5qj1JOz1dBQ5GUQ3xIAiN9V8SgtTscXT9+HZJg4w
	 /f/hy4bkjo7vg==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v6 1/5] dt-bindings: arm: qcom: add Linksys EA9350 V3
Date: Tue,  8 Oct 2024 00:34:10 +0800
Message-ID: <20241007163414.32458-2-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document linksys,jamaica for Linksys EA9350 V3.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b..98dc4819a5a2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -338,6 +338,7 @@ properties:
 
       - items:
           - enum:
+              - linksys,jamaica
               - qcom,ipq5018-rdp432-c2
               - tplink,archer-ax55-v1
           - const: qcom,ipq5018
-- 
2.46.2


