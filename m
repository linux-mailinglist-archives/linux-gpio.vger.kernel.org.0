Return-Path: <linux-gpio+bounces-8089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0891F929E64
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 10:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88060283105
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 08:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DC847A7C;
	Mon,  8 Jul 2024 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Mdvazh3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6520B38FB0;
	Mon,  8 Jul 2024 08:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720428095; cv=none; b=WVkyh8lck18ntuqhwnDrktn89YO4nIE1+OOaJSmECWjfd4RVuCws7ayzAzew56zH+yr/Toxbx9mdk9o62/GIv24g3PSYRhM658I4CKA2Kthqh6pgLMcbNosTv/y/ce5x0yUHPVdy8phDjJrYPzjLhBtJTZcBBrQ2938whHK0P0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720428095; c=relaxed/simple;
	bh=OlqDzkICZh/rXle1yN3cbMo0i3pUWIT0ry1t2Or0OBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzBB3Z6tFNKhnrfdcNyEJ6g+mdDjTZoE+fHuKSlxSqHwmWNTJvz+jZjLp/SXsBo1wiWTuhNBtCNwmmn8/d3+z6kLcufQEtCTI6mmsbpumg7+U9XHsdjo1kkm3wuldhigGRajC8fI/GITkUVzQWLaJ9MjmgO5HYUSwEZYE6jyKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Mdvazh3a; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FA9DBFB4D;
	Mon,  8 Jul 2024 10:41:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1720428086; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8b9WEdH6nX/uhqStbhCkxjbUTBocln+2zCJ0wjlz2TM=;
	b=Mdvazh3as5WxPvN2jOz6c7pNkuYrl00UjJ8Xt4UlUDINGARD/zK1yFD7tFfH1V8oRmNzOW
	9J6lBuVIfboFtllMmf+D6/tCkeNfK6aNQqlKfM8P3c2n9QMPdrlLkQsNbwaLGHzfRK8/ND
	mqVnTgkENTszZAPB3C73dUKZbUh8qLrOuFz9KjwJMqvDA0azx+TWNrjZAVeM5l9pDQqzz+
	Yur5ZeoEW9LKud5jkhL2P3ylAeYS/Km5qvdfl6u+ZhL77Zb23XRDqv8P0lATdnYoXm2Lb6
	jLD55CCtRNYwCUmZiuZXTtl6QBpTmRLM5bMlg5nJ/VjXLjR+EDm7eGQ4rMFK4A==
From: Frieder Schrempf <frieder@fris.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Stefan Agner <stefan@agner.ch>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 1/5] dt-bindings: gpio: vf610: Allow gpio-line-names to be set
Date: Mon,  8 Jul 2024 10:40:31 +0200
Message-ID: <20240708084107.38986-2-frieder@fris.de>
In-Reply-To: <20240708084107.38986-1-frieder@fris.de>
References: <20240708084107.38986-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Describe common "gpio-line-names" property to allow DTs to
specify names for GPIO lines.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* change commit message (remove non-existing warning)
* add minItems and maxItems
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index a27f929502575..cabda2eab4a23 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -51,6 +51,10 @@ properties:
 
   gpio-controller: true
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 32
+
   clocks:
     items:
       - description: SoC GPIO clock
-- 
2.45.2


