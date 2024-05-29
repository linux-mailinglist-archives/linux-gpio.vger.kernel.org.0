Return-Path: <linux-gpio+bounces-6869-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 566D48D3CAA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 865BC1C2502D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532F9190693;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxX2a2aT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0638C187358;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=V1OigAQ7JMUhnCo3t0GIY97NaGPKWzF5QpylnTt0Fwc/CgyQ/aJfG+C7lWVaVw3I7xqofS1TBmvLmuXxDRimRuDZgH48udJ0gzPITuJZ/IyEd2ct1KuAL3KWY+1if4VuwI0qyFTB12CYaRs0Qq+sdNf2ZrNSCCsO62WLMWJqNZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=xQFnxItaw23X3Z5K4ATnqQiJwXgY2xVxtlO/Rvgqwyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryJIjdcVAjgyHiUH/Bn+jNLPZD5lvAyQd5HBfppr7rdtdO9NsWkY64xbGgAuLNNEu3lEX03YI+Y2cromNvWolfv+sNHB0zTP7AErNGmpzC/CnNueuPfWHqN04Ytzs5aoMvZwefSeY+yeYwtEodWSBMI2xhdq4M8WDIEzZFr3MdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxX2a2aT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994C8C32789;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000235;
	bh=xQFnxItaw23X3Z5K4ATnqQiJwXgY2xVxtlO/Rvgqwyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IxX2a2aTTeLmaC7Pa3LqNnTkfbHabF5Yg6us9YIk/bmS3UQVZ3Sx1WKxgIMym3xt0
	 BCLy+PnFZwWHMqa/gxw81U5IBcou6JQy4PHyMwxKi/WQjkPlfHjbr9G1fobBSx/sjD
	 UM3Xs1AWcUMaIkWB8eut92kYQ3AgQYvRffpilPY6uGcVeL3+BqIl1yz2LE/Q3+oAuZ
	 +6KhJ2U5KGztBTsR4OqhYRqn25TKDSSj0mPv98L0nw5i0J9yhkCbmfh979RdnFuAsv
	 LAnHIGu1RGRMQuuWsayy1dVmrlHWidUSaF2YEaNqtXqZlGQcHcvNSDxmGXeXP6gkK1
	 +S1uYI+nT5zFg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004ii-1PJU;
	Wed, 29 May 2024 18:30:35 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 01/14] dt-bindings: mfd: pm8008: add reset gpio
Date: Wed, 29 May 2024 18:29:45 +0200
Message-ID: <20240529162958.18081-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240529162958.18081-1-johan+linaro@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the optional reset gpio (which may not be wired up).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c75d8bde568..e1e05921afb4 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -29,6 +29,9 @@ properties:
 
     description: Parent interrupt.
 
+  reset-gpios:
+    maxItems: 1
+
   "#interrupt-cells":
     const: 2
 
@@ -97,6 +100,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/mfd/qcom-pm8008.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -115,6 +119,8 @@ examples:
         interrupt-parent = <&tlmm>;
         interrupts = <32 IRQ_TYPE_EDGE_RISING>;
 
+        reset-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+
         pm8008_gpios: gpio@c000 {
           compatible = "qcom,pm8008-gpio", "qcom,spmi-gpio";
           reg = <0xc000>;
-- 
2.44.1


