Return-Path: <linux-gpio+bounces-15776-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED17CA318CB
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 23:39:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 904AF164F11
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 22:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DBA26A1AF;
	Tue, 11 Feb 2025 22:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KRaBFXzp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC2F26A0C0;
	Tue, 11 Feb 2025 22:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313500; cv=none; b=U+PWhOM6Xmgn/IME0AgaRmsKUn8djxaXsUEKN2xPfY1hKTE4iMA0GsW9OWHdtt0R5mGggRLrhTLhDb4kWlSaLluQqG/BSrG3gE/lP3zcHNa9sXDDBDd88GiHWa3FN+7HxeAS+lB/lZ/pXhbzx/FnQ+8AMkM9Pt1HAwYL6yamCok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313500; c=relaxed/simple;
	bh=rWnWugIb1mILN22ffUtNr+15cGpAZ1Qkyp5CSezmC8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7vHB0kV2K6tM8I+9BG1lHGZJOUtRlPJPXyHceRwTpPpEDEyxGKxIX743w5NYLU58+gB7QQ5woD71TO3eojLpl4zjsm8d8qJiCoVdzrOjD1LNgC56Yk7JM86smeaqTaffqZ1za8+DLzSFRrmcOz0R4/3XwIXbq723WldV8c2QeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KRaBFXzp; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.244.162] (254C21CD.nat.pool.telekom.hu [37.76.33.205])
	by mail.mainlining.org (Postfix) with ESMTPSA id 679D7E453E;
	Tue, 11 Feb 2025 22:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739313494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+9Fb+kzSr1brBkZYKUqpkGeN+Gw1NNq3tX8qP+X3keg=;
	b=KRaBFXzpgLcH4LujEB1tM6n0BnPI+BXDIbVq7xTzxx0HbRTPZdaIk3hQrkHHK+za0Analy
	sExrQnfQk7SOsW9kDsTEdRUxwJKYxAnA1emuU+yqPDrUnls6WtG4t7ZS7TN+4FqF2elHPa
	JHU9JYppWXq1NVMuGBhXPr3nhMHaL+STsqFlmDzy5m1wzgJaKkODBT280MOZfpWOtOE1Vx
	5AAm7gbosyvXcvoJGTUq/IHliPjUVGHcs4O3YTCXOZVPDmHHf4/Mx/ETNQWD7jWm+JaTM7
	VdR0H/1qQCC4JRfZY51i6A2eQWBuqvWFnDSWwVxNbM3a4XXMUg6HPBx35wZt0Q==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 11 Feb 2025 23:37:49 +0100
Subject: [PATCH 05/10] dt-bindings: mfd: qcom,tcsr: Add compatible for
 MSM8937
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250211-msm8937-v1-5-7d27ed67f708@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739313484; l=824;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=rWnWugIb1mILN22ffUtNr+15cGpAZ1Qkyp5CSezmC8c=;
 b=eGUpm3IiWBiNfzOUhY1QriJeJai88w1GdJzpMORa4B3V9aSQFLiDP/jIKsCnL1iI8YCfkS4JC
 JkWUF65LpzOAGGrvrLl7gxAmGqXjqQdTQJN07SGGX1gXQhOar+vQ1cf
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document the qcom,msm8937-tcsr compatible.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a503b67f2dbe78516a693ca55a8906f93c8f01dc..7e7225aadae3285f59ec303294cf1515772a629b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -52,6 +52,7 @@ properties:
           - qcom,tcsr-msm8660
           - qcom,tcsr-msm8916
           - qcom,tcsr-msm8917
+          - qcom,tcsr-msm8937
           - qcom,tcsr-msm8953
           - qcom,tcsr-msm8960
           - qcom,tcsr-msm8974

-- 
2.48.1


