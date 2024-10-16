Return-Path: <linux-gpio+bounces-11454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B220B9A0F01
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 17:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ADC51F26C10
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 15:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF712144AC;
	Wed, 16 Oct 2024 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="iuFd1h3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E72101B3;
	Wed, 16 Oct 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093738; cv=none; b=XJpAcFPuI4vXQpFntBH4RqK5+KcMV5uwQr01P64RGoS+F94Y+hgSQHBFCC28xCfF8qBwkJD/oLE3G9oxtU/M/UaC79tmm1PwbCqQ7MR+ZFiE9mvoAwgt/2MhNUZ3Fho617gqppECqDo+ocADO9jpCqa2vgYNO13LwF9W1B38O6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093738; c=relaxed/simple;
	bh=cTT5W1sBuWCEzt07+n9JBMBOQdkxazwa+CKiUFRRIPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S38OCRWwjAcb5Iz/EjdiQ+1QEQ1V4YKLieh+2gYbMUBNvyE+WZb6PUTkHR/avw4ehaZi/lsWrpFtI74yXwmWdnH7sTdFfT02CQkZ/3t8rT8cCFp0H7D8ZR6bRZ8Vj7yCLghvXANFZU1JEGlIt2G1OJneTCvgxJcJ897BMUE++Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=iuFd1h3h; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTFkb37gWz4wjF;
	Wed, 16 Oct 2024 15:48:55 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.245.91.ipv4.supernova.orange.pl [83.8.245.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTFkR6xzVz8sWQ;
	Wed, 16 Oct 2024 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729093730;
	bh=cTT5W1sBuWCEzt07+n9JBMBOQdkxazwa+CKiUFRRIPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iuFd1h3haayinQgGgtLoGwqDU360aRlhxmeKqoL6HDZgPPzLwUbsso/TAb6DZ/ald
	 xqf+i9NJEv2mC4SvLOM0kxPKL4lfn2IIjmugeRjlITjnv8LeXQ0lnv1NU2PXGFKbqO
	 gJiLn3qTVjTostRMTiyOmFOak+dDT225QjMoQ3peklQyCx0FexkPtnue8jrbq6DCpf
	 4ewtiiyZtYuwI0XESKUP+fll4MoEwwjWOTKeqdWsvrMWrKT2BOAIrmfxNWY+g9U4U3
	 oxyQ8d4rWcQBNOquPAlVecBQmAEOMsiv/e9oHnFUWzF1EThbPYGtrH50DUdNVywp5L
	 Evw1y2f/hhA/Q==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: pinctrl: samsung: add exynos990-wakeup-eint compatible
Date: Wed, 16 Oct 2024 17:48:37 +0200
Message-ID: <20241016154838.64515-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016154838.64515-1-igor.belwon@mentallysanemainliners.org>
References: <20241016154838.64515-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a dedicated compatible for the exynos990-wakeup-eint node.
This SoC pin controller does not mux interrupts. It's compatible with
Exynos 850's node, while also being compatible with the Exynos7
fallback.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index b7c2692f0ac3..565cacadb6be 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -47,6 +47,7 @@ properties:
       - items:
           - enum:
               - google,gs101-wakeup-eint
+              - samsung,exynos990-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
           - const: samsung,exynos850-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
-- 
2.45.2


