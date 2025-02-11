Return-Path: <linux-gpio+bounces-15777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D364A318D0
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 23:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C55F23A6AC5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 22:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E106E26A1CF;
	Tue, 11 Feb 2025 22:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QTvY0hxT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32C926A0CA;
	Tue, 11 Feb 2025 22:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313500; cv=none; b=IUmjay5YylIdBMndKJn6BBGCjm1TU55lqqkcd6XNSZYmiKvnMGCLcvmUdNr97HKMClDD32O9NSV6djQPwxaVAXH7IALjDG4XxyWxd7FLXPqLv1gswd53mFpD1wUGbN5jDoDM32fPT5EJ+ua8Tzhq5rNT11YWFc5VzqqKgCGBDho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313500; c=relaxed/simple;
	bh=ZYO+h724XzJ1rIDpTL5OLQ2PCko9bbQtlLzzKjoV2D0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=liFQivtcZq/2bCVrAaSULJEEMtv2LqrlMjhsgdgMa5m5O4BOM0aLJ3RXEzWDVOe8xfg+7aGxxnCgbgpj8akhmEk9t6JqU2hG9/Ca8AGX9+63olaf9m0OQHA8AvUs5lt//kYmf2g1T+K0+KFFbML+hD08BAe0fQNAeZwqYYm9g9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=QTvY0hxT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C21CD.nat.pool.telekom.hu [37.76.33.205])
	by mail.mainlining.org (Postfix) with ESMTPSA id F1737E45C7;
	Tue, 11 Feb 2025 22:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739313495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZW0Yb/V1cDc8DrF2GkR+fnepEU4VAhs63W6nClz0cZE=;
	b=QTvY0hxT3hPG0F8ICW5zcmvR7hbjzAoes1jHT/4Gt/bAADVWFL+MTo81qhgUqatVOmGILk
	rxBC0TzDa9YbjlDVIBafeGHXPZ6cPso6RXEIeDrbWIGOftY068QUmoMLlLbWfMNhRqYjS7
	UMN6WVthN41Y0DHWI7NwF+pQ1SSX9bxoQrtHrusY3HmV81ZPIU/4/qYahjUtvkKWA6cg77
	SCUaUbBcaIzJhaTpE5TfO5XQ6vbjkdQQfNJ8vyrQzTix4bB/uykty9jZgAhQOQpdwjrUU1
	WXtyulEefZgCT2Q6fJMkg+q4p+JqIhBSaC53B53TFoSBfP4vRFmY9Q2HK3MEig==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 11 Feb 2025 23:37:50 +0100
Subject: [PATCH 06/10] dt-bindings: nvmem: Add compatible for MS8937
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250211-msm8937-v1-6-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739313484; l=859;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZYO+h724XzJ1rIDpTL5OLQ2PCko9bbQtlLzzKjoV2D0=;
 b=oxIn5nP9L7imWq/8bMsVdw5ip0ZYnlk7E6KP5cTOro5Aj+FUYbJrNujnYxz34ZYU8iZDHQEaN
 eQZSagndtBbDnNiYC9z/mkjI4U4GaUPo18UI3ucSXkKh9R3djZQbBjF
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document the QFPROM block found on MSM8937.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 39c209249c9c0bdf1eb5693306daf3de6e19dff5..bc10e038852c9278d2f4d8875f7498ca4c4bdc17 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,msm8226-qfprom
           - qcom,msm8916-qfprom
           - qcom,msm8917-qfprom
+          - qcom,msm8937-qfprom
           - qcom,msm8974-qfprom
           - qcom,msm8976-qfprom
           - qcom,msm8996-qfprom

-- 
2.48.1


