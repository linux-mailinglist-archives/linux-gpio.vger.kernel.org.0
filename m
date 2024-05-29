Return-Path: <linux-gpio+bounces-6876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C68D3CC0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C2A01F23F82
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD8D1C9EC6;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNrvXw/w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C094194C67;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=GuBd57U5k5PC8X4h24BERXJJdD7JE3qG5+hWWbbpvFHNozRFBcj4XVNe4kSqOWOu8e4QIcHx1b8tJuPL8uPYFZYUsggD0atXYJ9XizjFBw5PiPcNzA+puBIpZ9BqyKRE4FaR3so4lqm/KcULmeIlJIxxZ980Atourn9WLXCX96U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=ay6FxObVid/tpLQpHByj0/j24W/+xZDsEHwqrIUSxCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLvOHxGP0CHFHUZoKniQUe2G/Xse2VgNWrvUg9EwOBSPCD1yxpXc0CpkhTAS714Lzbp88/Ls27Re/uI3YW18zLZC0ViQJD1B49waMiMC6SWkobY8EtETQkiwPVaBLBM4ZhRrjfyGWaz13viNItRYpnyOcjFYdipa+6waJfP18dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNrvXw/w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C8EC4AF0E;
	Wed, 29 May 2024 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000236;
	bh=ay6FxObVid/tpLQpHByj0/j24W/+xZDsEHwqrIUSxCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JNrvXw/wBzKS/rNwJ6A9XTbAYLDEko2MRARiA5OIkIsEtr7Y6oIAl4vsKkaV8v4/S
	 GVd6jlkri8o7vRzXRMKDLaBrnksxG4qJ0rBFCJnODp/IYyVeG6qPYctqEjqdQn51l7
	 kG5vXSWDAYWwNXtwmRNiT2m2Hmh9sLOsGlSFkOLfRA33ccJRtqQoxbYHFPw1tZLz+/
	 6DmbDrWoPmd3cIYId/rN44NjGppsNccbemmJqCAmhTSphMIjk4zyCkG+4Ft7IcyzCW
	 ISxCF/o+aqPrFXL+Jt7HGPU9JhWEuAMSD9eKTvM0h6mkaUH+EcC9MuxmoYyvnoXDWr
	 TCjhyTpJH4N0A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCB-000000004j2-48bG;
	Wed, 29 May 2024 18:30:36 +0200
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 09/14] dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
Date: Wed, 29 May 2024 18:29:53 +0200
Message-ID: <20240529162958.18081-10-johan+linaro@kernel.org>
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

The binding for PM8008 is being reworked so that internal details like
interrupts and register offsets are no longer described. This
specifically also involves dropping the gpio child node and its
compatible string which is no longer needed.

Note that there are currently no users of the upstream binding and
driver.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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
2.44.1


