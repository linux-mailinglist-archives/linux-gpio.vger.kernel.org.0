Return-Path: <linux-gpio+bounces-12327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D09A9B7198
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 02:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3164D2827AB
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 01:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAFF78289;
	Thu, 31 Oct 2024 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tP3Btnzz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA8D45025;
	Thu, 31 Oct 2024 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730337599; cv=none; b=fGFLZKQHp9bejnK6fTY0+XUvjzT/2U3Kwce9uSpzNH0t9gOkIaoNcQKL8UyTGt04WFXPNNnph7o6Msd851Dnud96B0DplA6/TSKRijNwSarQUiqljeZvsQWtegE7stI7wcpztIt8OcspiGjzdLfWAUym8A7X//Ld6QqTRvx2N6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730337599; c=relaxed/simple;
	bh=u8x5Y76BpR7GHm0tcI8s42oOSgTRRalW68806GGcELk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiw0ffp3zICMvP05Jg8kj5Q8IYDXndrdD1YZLoVewsd4QNy+Qki0q3VPSqOEp91Bk8iTBx+fRJTZGBVb00z3gNFPS2t40Ctr+1ZhGxpa93qEvm2DvPNJNdOYAUMgP6cGdx533YX4UDK8wpgiVjJ3U/oxDcoPaE+b3rnwVaMGE8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tP3Btnzz; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.0.162] (BC24936A.dsl.pool.telekom.hu [188.36.147.106])
	by mail.mainlining.org (Postfix) with ESMTPSA id C6CD0E45BB;
	Thu, 31 Oct 2024 01:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1730337594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V3+UAizzWXsZekrxnLJdeu9Ruj4MIRyoNFA7cvKypSE=;
	b=tP3BtnzzC9Mfh2V16mIM1Hq0he/IX9oJsVuOmodUGu0Dv1xqtaTmaVs5DxX7N6BkNMt/Fb
	sVf8GW2DFexx6sc1Z7hdGbHwLYswleCiFYwgvalGgLe12KQrlhL/Tu7Y3uT3HkMKVWrOOQ
	7TjdgNedRrnOKwD5TKfG0JP+QIP+w5icYe124VeT1qBKTQKVGIjpg0X9gs05A2G/hrBPcU
	98xMJfNhIfsxizr5uYiIgbVcp2rkoyYaNW3dJrvbCGZy7ZtW6HZUBOswZ4opPMCjmskjY1
	kGkki/ciNygx243fBQjR4RW3CeZP0tEYngyW2hI/nz+k2IMXfmX+Qr6mlLOIRg==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 31 Oct 2024 02:19:49 +0100
Subject: [PATCH v2 08/15] dt-bindings: mfd: qcom,tcsr: Add compatible for
 MSM8917
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-msm8917-v2-8-8a075faa89b1@mainlining.org>
References: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org>
In-Reply-To: <20241031-msm8917-v2-0-8a075faa89b1@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730337585; l=824;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=u8x5Y76BpR7GHm0tcI8s42oOSgTRRalW68806GGcELk=;
 b=gINZoCfqfZp5PM7/4qbzSfGBnY3IwkUsYtHb8srP+C3EDjiKgFLukTjaPqLbhxyvpQFQcXqJ4
 skN9Ev+EQxyAQyVFTYBTObf2AkPH20zey5MOE8Z6w3PTXsy1TVGhK3t
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document the qcom,msm8917-tcsr compatible.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index c4fcf501f502724b5ca36bc4a26f77a00104ac48..79add913e35c848363941a8634a361c45d296392 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,tcsr-msm8226
           - qcom,tcsr-msm8660
           - qcom,tcsr-msm8916
+          - qcom,tcsr-msm8917
           - qcom,tcsr-msm8953
           - qcom,tcsr-msm8960
           - qcom,tcsr-msm8974

-- 
2.47.0


