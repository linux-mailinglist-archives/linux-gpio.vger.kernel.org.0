Return-Path: <linux-gpio+bounces-6143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6A8BD11B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 854971F2217E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6F2155391;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8W9RkQ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321C815383A;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=rchRXFdH1bzi+C0cf+Gk3KXckXanFqufwHoDfa3vYEertQsiEC/QtkfYkn7uMKc9ylNN8qI3PqYZPmNJpXIWxbVTwVar4WvSF4edvpy1T07E8F2R2XhKrtj8vnNobRG2gTqtUjC+W4MJBAZyLO2o2O26RYnQR/LmhbtNAj1l0eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=qyD342BqfDOno7Fiw8o0i1cQm2xzwZ7rJO4LeMETBjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6elTOLJstdi/fNiV2uj9Eax9I2mw/6FKwMUsaRDg+NqzSjKBCvmcDSOWk9qJATFSOHv3k4PAvWbO7LlQUEXhuwwM4y9sk9+FOLmI3+d5NKFjrWgQPBErMfmNc8lIOakU0M/2H12FpDNP9y1yEl0+Qedpcokqjk8oPe0qUVVuA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8W9RkQ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC10EC4AF66;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008214;
	bh=qyD342BqfDOno7Fiw8o0i1cQm2xzwZ7rJO4LeMETBjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8W9RkQ2tyKuug618wjKuMW6ToJK9gNNwHMN2hirdxhilHeosoPeUqskvQ8UD9LbF
	 CF+vojWNHg3nFGEnson136J13nggU+erTA0jsVMaQvySxw26FAi2W2nAZQz6VDw/p4
	 VzJiebGtUTh2JayQSPLBol/DxGwYl7bc7WqV44euKyE7rjQ2a8p9pnzPy0x4jES4z9
	 7f3qq33sJYAOx8gLUTMsND5T6f6alcdmaS3+91zaaF/+FMOmlG6WiwACAKs2jR3tmk
	 7lFLT7T1ou7lHa77WhTbUfmefT3eMSDe0vJvMDCopl5pT2LhTceeMGLLcWfpf51TSd
	 LUyZcw2tXiLDg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CN-1uiB;
	Mon, 06 May 2024 17:10:16 +0200
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
Subject: [PATCH 08/13] dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
Date: Mon,  6 May 2024 17:08:25 +0200
Message-ID: <20240506150830.23709-9-johan+linaro@kernel.org>
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

The binding for PM8008 is being reworked so that internal details like
interrupts and register offsets are no longer described. This
specifically also involves dropping the gpio child node and its
compatible string which is no longer needed.

Note that there are currently no users of the upstream binding and
driver.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 3f8ad07c7cfd..58807212a601 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -28,7 +28,6 @@ properties:
           - qcom,pm7325-gpio
           - qcom,pm7550ba-gpio
           - qcom,pm8005-gpio
-          - qcom,pm8008-gpio
           - qcom,pm8018-gpio
           - qcom,pm8019-gpio
           - qcom,pm8038-gpio
@@ -122,7 +121,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pm8008-gpio
               - qcom,pmi8950-gpio
               - qcom,pmr735d-gpio
     then:
@@ -421,7 +419,6 @@ $defs:
                  - gpio1-gpio10 for pm7325
                  - gpio1-gpio8 for pm7550ba
                  - gpio1-gpio4 for pm8005
-                 - gpio1-gpio2 for pm8008
                  - gpio1-gpio6 for pm8018
                  - gpio1-gpio12 for pm8038
                  - gpio1-gpio40 for pm8058
-- 
2.43.2


