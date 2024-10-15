Return-Path: <linux-gpio+bounces-11380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF199F8A1
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 23:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADA011F23366
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 21:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D438E1FE119;
	Tue, 15 Oct 2024 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="jnqE49BQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CFE1FE103;
	Tue, 15 Oct 2024 21:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026312; cv=none; b=i0Y+NYx1zaWGkF38+9azYh47x+ttQnhR1Al/Gni6lUakEokXPXpgUvtWteDICpQo1aXARYBaHLPWZXStQz/4tuhXLE1gnBR12Mh3DJvGz3CIg3pLVDJSaqW9cODLBwrfnwtKcO88TeGqoqK/axTpxBy+Y8bN4EM0U8HvnY78A/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026312; c=relaxed/simple;
	bh=JpRWW4hEuXyr+dOavz4imNsnkeY0yV1ki8FOJUM9jB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MkIrEg54mpE+kbYvfMXSF4dAbfD8NpTyOJBVRPWiSHp2vXACmQ2bj9u6hN04zFR9Qqqt+2Ykb2kdfzOeYT4TKb6lMAM7qDbvVDY5Lub54+bn2YTJhFJESvAgjlZC412rjD9ZpcjLhGxVpO8tTiYIY8AYbQKa/3YQn2FAmchV+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=jnqE49BQ; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmnx6f4jz4w5K;
	Tue, 15 Oct 2024 21:05:09 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmnp14m9z8sWQ;
	Tue, 15 Oct 2024 21:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026304;
	bh=JpRWW4hEuXyr+dOavz4imNsnkeY0yV1ki8FOJUM9jB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnqE49BQL+HTCHPVl026Vo/TiS8Hq8BS+2I4Yass7BhngNZBBs+xj1DH+eyZZkIc0
	 eq9Jzf7WjfKrjuSW92AY5bAX/88pfTTIl42i+U+OprJuamuho8zsKcpIltJ5gcs/6y
	 PEOVj9lfYCiN+DD2a9qaeKxUwYv4gbJn9TwVL3GcQ1BhkbWYuI4awwRT4TBLRZltLO
	 faB3axN/f6HfDrCC9au0Gd6iCuv0mhNGTNs8wcDUL7SxQFEPCNJTEjSd/nuVUuKY9x
	 yYSLGRmgstvWgjBHmpylfPBLh2Luwyyu7nTuu52QpMuKbt6TjKyCK12IGgUb70mypJ
	 /L1Ryf6dHUDHw==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: pinctrl: samsung: add exynos990-wakeup-eint compatible
Date: Tue, 15 Oct 2024 23:04:47 +0200
Message-ID: <20241015210450.964093-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
References: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
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


