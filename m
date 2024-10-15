Return-Path: <linux-gpio+bounces-11320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B15899DE52
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93B18B22606
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 06:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF11B18B486;
	Tue, 15 Oct 2024 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="BJgG3ZCv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB5018B460;
	Tue, 15 Oct 2024 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728973725; cv=none; b=Tx6Cr0wvf1jzLzfND7ZlLasa9ER1j844UK8kuyCuyFn77cwzlGHi9VXxKFPq4MdXLTaTOkUwYXNXgkrgpBhQ0uZ7R1Cnytj59fVR0AZYuqN00nGPDJ6q8HG6xmqvZwAIbG0KspgBdl4UWG2xjD947fyEGUv4cyuJnJpNfOOT+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728973725; c=relaxed/simple;
	bh=6iXJqsdkRbgn8i16UO7+hM+1BnZy9Hn3hwGkDSII/hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5T6gwNJi0I1k03bYlWbKhpiFxrI5f6HBzlmRquoU6tD5dbzXKnCED+3Zfnda9ldJCvQOO6qhy7GXf9EGFnW7ENcnYd99FnIQNiLXSI1oJAG5xh5xHewzdH0JOWlwkANMHg3KVZL/2rIHt+A1vUBUV2cZ1FM4OY2d3FPnBHu19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=BJgG3ZCv; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSPLf5rRqz4wYs;
	Tue, 15 Oct 2024 06:28:42 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSPLV6jj2z2x99;
	Tue, 15 Oct 2024 06:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1728973717;
	bh=6iXJqsdkRbgn8i16UO7+hM+1BnZy9Hn3hwGkDSII/hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BJgG3ZCvtdIO/MW34lg1+c87yW5k+HuIAo8y2DdW/RZLQZ4BhtP1W48jVrgOjzCKx
	 fRFl4+15H8obI9wO4rwqxLgImS73R6UaYIMZJbxuAvjjq1jD7kqRjWtC7l3DDuZUTm
	 uBp4a+7bHgJ3cVXWbsuGvIrcM/Pg6PGl5gGrcnQ+DKhuE06aJNmxInu947leBRxzZx
	 Ulg5k2BT3xI6tY/jtnGOL3yVQZDa2pDCFeO0DbbcV7YFVJbNr5gApRrhWCxUTd7qdr
	 +jeXs3ome929eLNCwXNa/FUvcjqzf40bG22U72Au/hDvej9JO8EkjASe0S6CURzoec
	 hX5JRUF+Hbv3Q==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	david@mainlining.org
Subject: [PATCH v1 5/7] dt-bindings: pinctrl: samsung: add exynos990-wakeup-eint compatible
Date: Tue, 15 Oct 2024 08:27:44 +0200
Message-ID: <20241015062746.713245-6-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015062746.713245-1-igor.belwon@mentallysanemainliners.org>
References: <20241015062746.713245-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dedicated compatible for the exynos990-wakeup-eint node.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 91516fedc872..cda5bf4cee4a 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -43,6 +43,7 @@ properties:
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
               - samsung,exynos8895-wakeup-eint
+              - samsung,exynos990-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
       - items:
           - enum:
-- 
2.45.2


