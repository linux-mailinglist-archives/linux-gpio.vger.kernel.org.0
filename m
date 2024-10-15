Return-Path: <linux-gpio+bounces-11379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE999F89D
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 23:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3451F232E7
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 21:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49D91FE0F3;
	Tue, 15 Oct 2024 21:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="iSj3Xgnm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1966B1FBF54;
	Tue, 15 Oct 2024 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026309; cv=none; b=F1hJ+gK3JgzHAnPCppjSZdFWLDE0MijVcF3j0KaS1ckc/bztJTeSvjOH9t5krzAEic2ZJVh/SXYWAxIlUw5IfTsgm7o1MPLw7Af8a4A5KfMqScK+VqTEINVp2JWQ9Sjo7lOPgDq65wML830JIo08aPNpy6KTYYPiRpVG/6HS/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026309; c=relaxed/simple;
	bh=gUlS1i8qx/2ojHqYIjPj+RLbxOrGmJfLGOal1pufpCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qG26uIUF25IF4J0u9pE3WYnvOLKhnu3mfJDrQkLxpwhewU1O4/EhLuV0E0gyHzx0I9fEfWzW5qAjX+nb7rRpVhiYmr1HnzqKVX1Y8vTmNmnK05JXql7DYoH/SnwAjGj3e77JQrfgBGQwsWbKc+GhL7TkuqgdL5Y/O2jRGS009Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=iSj3Xgnm; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XSmnt6YGxz4wK0;
	Tue, 15 Oct 2024 21:05:06 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.240.202.ipv4.supernova.orange.pl [83.8.240.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XSmnl0tMSz8sWN;
	Tue, 15 Oct 2024 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729026301;
	bh=gUlS1i8qx/2ojHqYIjPj+RLbxOrGmJfLGOal1pufpCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iSj3Xgnmigm6IOrV869peAuxV7eXcHTvDjEgdZIxh3CfvHTwv04/kwf7Kp5IPyW5Q
	 2ingprdelHIg0oAL00F+tAuIMAIPEfOQXGJUmHyqjfVMTWmAHgKV5zj6sRiwoO54Mo
	 nBDOUvUegN0iJNgztieBHQ9i6sxRl+/Rtv3aNsAUsbv8UVefK0B6NAZdU4tsmmueHU
	 l0AfpdUhpDEIMclcluW37hZZuk7FeFuA6lGxPxldEE2zXI9TpO7UZ80bg/U+688pCi
	 43OAg5OKoecWq5VLjP4PwuCK+7YpxXzUGi+dd8GSy/WTs5k4vML7KWfVNr6rPzM3gy
	 x++WPCq+oKRhw==
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
Subject: [PATCH v2 1/5] dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
Date: Tue, 15 Oct 2024 23:04:46 +0200
Message-ID: <20241015210450.964093-2-igor.belwon@mentallysanemainliners.org>
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


