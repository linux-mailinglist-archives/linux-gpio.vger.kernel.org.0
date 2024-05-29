Return-Path: <linux-gpio+bounces-6879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A58D3CC9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0225E1F238D0
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D993E1C9EDF;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1Cay7ae"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7568519DF42;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=hBB3R7Do2nur8JUjHfnuIaxf1/Ff6yex82k4gvblRo2+32GB4lWkwrvsBLjgYU/eHWlNQlqk8ZmtC6q6RyCFErPI53Xmf5Yt8hNIe3HLhCdsKnpKQZTdit2S9dkGg2HNXzrzluID/0OsOHV3jVR3997B4LBqhIj0G9soBbo/aAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=SQO/+ouLx21qu/S9Vf1DTU5WIZ4v/dXTVdqD0GLD4FM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5XZVXpj/vAUZ8eg75fJc+Er0Wj8M3+4spczM4nRYhyoz4x6/kzlc1UZGzMfahH0ZNHsnv0HwL03nIN4Tdio/gzbknXadQFxBpIUMSxdpg7IY5SMVLAFphPmvYMunbKG5wZNQvI94X55nDPv13gKwYoL5K9upceDK48bMZW2Eps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1Cay7ae; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09931C4AF0F;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000236;
	bh=SQO/+ouLx21qu/S9Vf1DTU5WIZ4v/dXTVdqD0GLD4FM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n1Cay7ae3Iz2RpfLd5/XdlMF8rcIlgdnRp5sB8pjfk6wYMKtnDeVQql6tZUYDJRIe
	 3+YB6t0kFcB9fNpNTWfR62vG2cCLVlL3/rhRUDiXXmOlAa7y4xnF6/7ZeySX5WhTmJ
	 PFVf+5JzoLa4Nd35yGwxGxvR4QOROBWbW1Eup2G/QiZybZKGmS7iMKgDQoMl3s77oA
	 cmiwCVmPRjpDFFR9ufKAECbuEcFF7OerGOiLzrvJBqygu73TSjcuQT50yVXWDzItY3
	 toTq7NAxY25g9mT5u28nF5Wm1F0GVmLJ50UWZDhjG7+6HL90pLOBHZsv+gOYDMF4WG
	 LzLGBLdXYJ1Jg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCC-000000004j5-0LCb;
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
Subject: [PATCH v2 10/14] dt-bindings: mfd: pm8008: drop redundant descriptions
Date: Wed, 29 May 2024 18:29:54 +0200
Message-ID: <20240529162958.18081-11-johan+linaro@kernel.org>
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

In preparation for reworking the binding, drop the redundant
descriptions of the standard 'reg' and 'interrupts' properties.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index e1e05921afb4..d71657f488db 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -19,16 +19,11 @@ properties:
     const: qcom,pm8008
 
   reg:
-    description:
-      I2C slave address.
-
     maxItems: 1
 
   interrupts:
     maxItems: 1
 
-    description: Parent interrupt.
-
   reset-gpios:
     maxItems: 1
 
-- 
2.44.1


