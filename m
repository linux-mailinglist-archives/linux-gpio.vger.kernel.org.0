Return-Path: <linux-gpio+bounces-6144-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098E8BD11C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D50BA1F2220A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7D3155395;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6jRkwCk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32206153BF9;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=jk8QByY5gDRy/MM46zWGVi+Hi4EdahTJPiWGKFt7qJaVTkHiIB4jn8n07Z+Kq3K2fFh+AYCG1RF9URzSf85YwGlOYD5aHw1cWE3A0F1PytCLA6JMyvotHj871MGTlACn5elCKZb0T+xroE0gbtXIoP1iAQqMvLWgWP1YnOEQHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=523LXoj0Pt0fxaIsf7xGgfx1SdV1yqQtWQ+gVfyEBww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjzxj1W6XrCthqTfHW9/LmCfnU1LZxGOBGfvsoJyBi9NZKWiw6XX61DC136vYRxOyjR4kIythXQ7UNDEiPjRuS2PKQSVQt3VNzht+AwL2DNqyNjggezdbbavmJKzWpfgA9DC6nurqCOYhOjYX1oI0MuegU7t6fBPBLO2HFUNqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6jRkwCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B982DC4AF63;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008214;
	bh=523LXoj0Pt0fxaIsf7xGgfx1SdV1yqQtWQ+gVfyEBww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h6jRkwCkjX2psYHpb3IXCM7OIFfYeQtHB0ufepMTkeQhjAwsBv7TmxEdRX5Ih2Jpd
	 +R38zHB63Qel0c5KyJR1YPPOvtYDWmFiDS7E42W6CjrIy928M1wXwyXI9pPCeH+UMz
	 IELi3k88Fo7fcouxmZmGAs2SnzAmRPU6kP1qWGACB5qQ0wTCUIN9CIqPS/emnXTxLa
	 8yb9YwGhtDFUsOxWCv+oNyHdwTAuTxBMNx03d5erLemVMHgCzZn1JhTp6easgHAG6F
	 iTW7I74SViMUQVgYzpWonMehjlj9LUaVTlZDuXyZXsBsg3v5MfJ3n2tjZ89WRKbAPf
	 pa8NEZFPWgLww==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyp-000000006C9-3lxB;
	Mon, 06 May 2024 17:10:15 +0200
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
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 01/13] dt-bindings: mfd: pm8008: add reset gpio
Date: Mon,  6 May 2024 17:08:18 +0200
Message-ID: <20240506150830.23709-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the optional reset gpio (which may not be wired up).

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
2.43.2


