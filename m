Return-Path: <linux-gpio+bounces-10740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6C98E0D6
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 18:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 300C31C22F55
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0462E1D131B;
	Wed,  2 Oct 2024 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="VXoY1RtY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA11D0F79;
	Wed,  2 Oct 2024 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727886594; cv=none; b=YYufH+PapPKGeel7vcdryS9tyxgtdYyxXC3cic+bgK6c+5mzmQTcvPhX4/69q+qLodWe2R7b3O6r3DUBYFE+9/5axTNOn9a4rPTYuduWKAPRrc6y9XQoltIgVTpKw2oMqmzYpYVJh1DqAnfwFkV4e+zYPYau46Q8OkMlz0Kf9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727886594; c=relaxed/simple;
	bh=oV6B5e+qoTEsfbec+8stNvUBaHqTyHc4zEUqxUFmuBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y02S3zuv5vGKVrrWBzqWPIzTLsnuZAwWgHW9vsJs7JIfooJORWMIxVY1s7RmQn+tRgsLqhXujz4ihdsff8yuomdwe9uipXImydLeBFq0FXuEOlRwBsibK6XL4LNTX8PkwrbGtL2XSjBSaqDa8Yq72ppkM+t5VJLr3+XwDZQ4oig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=VXoY1RtY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 936CD23E38;
	Wed,  2 Oct 2024 18:29:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfmGj_UkG7aa; Wed,  2 Oct 2024 18:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727886590;
	bh=oV6B5e+qoTEsfbec+8stNvUBaHqTyHc4zEUqxUFmuBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VXoY1RtYBdpNBNwFc76mRD/6FhmsUphCyLFBsdbZclLHX6i6G8iH4dUxKwBe1abK/
	 oDsM4b3gjODtOlKVBG1CyHyP1wGbftVn5kMP9u+W0mnKcyv6rmRREnDrmISTdtl++C
	 leHabIRUVfLJw9QkJbIU3GbLTpWogf4DH7w864dGiiknWPGSL6Gi/4/DsukQkmSxb8
	 3iXYUhq08o6t+Kn30z06rourTUrhrdbN8W1LW7Ly2mqTjeoCCnc/bNjDuMCo2Wq+Vc
	 +JHMdxfOYg1XQsLNlxkmZGyThfIAbKd0JDMAeuEIVQp+ql6Ah1y1DzPVEI5st+20qS
	 pLPsEkaPFgmaQ==
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
Subject: [PATCH v4 1/5] dt-bindings: arm: qcom: add Linksys EA9350 V3
Date: Thu,  3 Oct 2024 00:28:08 +0800
Message-ID: <20241002162812.31606-2-exxxxkc@getgoogleoff.me>
In-Reply-To: <20241002162812.31606-1-exxxxkc@getgoogleoff.me>
References: <20241002162812.31606-1-exxxxkc@getgoogleoff.me>
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
2.46.1


