Return-Path: <linux-gpio+bounces-11453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681F9A0EFE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 17:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24F84B26C72
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 15:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6669D2141C4;
	Wed, 16 Oct 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="EQ0Jt8Bu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE1D21019B;
	Wed, 16 Oct 2024 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093737; cv=none; b=T8uclQhEcwVsKhJmyLlLMvjZHKqNnNrtwtxuiqalsxd9cfYNb3H0ydcz0c/hv4VCnmBreqAmqhJyOLhJ4iXcA/BGQkc1WEIj0rCET7yWPm7Zi54d6EiMlkgLHmziXe/DcmWRa4qRVTzO9PHbBTk9dLI7DcW9injY1RI4j1u08/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093737; c=relaxed/simple;
	bh=gUlS1i8qx/2ojHqYIjPj+RLbxOrGmJfLGOal1pufpCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbWm3Sv5nY3RI1OAog7jxUontPVkMcdoftdH6hVaZ6meu4uEBcydvQl51gN5jtcaIcZhS+TIJWi++S1flaMdSow597ERXCnjKrOU9WATlN/9gJkjOt8T/O60x0Yo6we3d5HjFCNgqKFvwBpEAm7Vv2n2JWCXzlVoEJvu7nRgByI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=EQ0Jt8Bu; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTFkX5C4sz4wjL;
	Wed, 16 Oct 2024 15:48:52 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.245.91.ipv4.supernova.orange.pl [83.8.245.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTFkP1WJ8z8sWP;
	Wed, 16 Oct 2024 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729093727;
	bh=gUlS1i8qx/2ojHqYIjPj+RLbxOrGmJfLGOal1pufpCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EQ0Jt8BuJL0TZsR/y7RCTDQ176RS6upJh98YpsF+Ew5HL8peB0akDff8JC+s69Tps
	 I+Gc7M2xIfYLJ+UEuHOlL89jmEMmah1EBPpgfrb0jWDLbqfxngu6LNzNEDOjDjNmXe
	 oNgYLb2Jus3UbERa7XGL9GQYPvdabcOQ1tuA2laBo2n+kDb1RS2Q/ZJ9HukS7qI7eu
	 Yp0AOkhOiOYyd6vQUPmR3h2kFOKeXpRKSA6pVW9Q9OpdmugP8YNpEmCvto8KtQU78t
	 aEkJ2Qkzkgfduarz3jGSAs/BigiiGUhYzhG1ZahaLrpOp4UG+4GR1S540qUwt6onEW
	 co71oBMB+GO7g==
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
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
Date: Wed, 16 Oct 2024 17:48:36 +0200
Message-ID: <20241016154838.64515-2-igor.belwon@mentallysanemainliners.org>
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

Add a dedicated compatible for the exynos990-pinctrl node.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index a2af2c88a331..7e6ef8249de6 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,6 +54,7 @@ properties:
       - samsung,exynos7885-pinctrl
       - samsung,exynos850-pinctrl
       - samsung,exynos8895-pinctrl
+      - samsung,exynos990-pinctrl
       - samsung,exynosautov9-pinctrl
       - samsung,exynosautov920-pinctrl
       - tesla,fsd-pinctrl
-- 
2.45.2


