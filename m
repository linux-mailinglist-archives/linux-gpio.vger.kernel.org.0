Return-Path: <linux-gpio+bounces-10446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BCD9865BD
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 19:35:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B2AD1F24125
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 17:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E941F13BC11;
	Wed, 25 Sep 2024 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lk9PKYmn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F455785;
	Wed, 25 Sep 2024 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727285715; cv=none; b=h4bOlDYSJXt23GCmKW+DMHNTnESnlZSf/af1fHIDxG/4cnxGFKZnlbQi4L38N9SjvIAfRv3hYwUsRS7hWB+OCMvNqlOLR2bqM0agQWmeC51XnvN2DrZEF9tQmX5fjPcuTSh6DNBU0kiwNdhcsMBBvKP6k+qaMCWjUyTy7fQ+64Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727285715; c=relaxed/simple;
	bh=1PV8bYybivP4bxKgZEi8u1Gj1Lzo4QO+fIu4LD60VLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5Ib9IeP4KNUYXwqKieeDvoH2PxvduFLQQqf5tmeyJOOkj2pJMMqUEOoir4drr4s1v+shc0y6JOqANX1VN5kp9qZQ470D+Cj1C0LjF4cBX1tAYMeLSlOx3HYfrmTzzn38x77/rUpOaCCgwGq3C5m24C0YnNwSoPXnONlYCATM7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lk9PKYmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC70C4CEC3;
	Wed, 25 Sep 2024 17:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727285715;
	bh=1PV8bYybivP4bxKgZEi8u1Gj1Lzo4QO+fIu4LD60VLc=;
	h=From:To:Cc:Subject:Date:From;
	b=Lk9PKYmnn7QONn58+TjcuZZtGbRroL+00BnoeRX01Pse2v2TFxPc1JUPjt1fe74sy
	 bdAfoTZ+nz8IlzA4qS1zLwEsh5pEA+dNkGZdOaMZJJwOL4JqldcVv1H1sdFbAMkzWM
	 lRGVbbFJH6NbXuXrVc7XwW3ISMJfIipkoX9NUBsPII3VVD9kC8ymqNiZbiJNUEGBQN
	 afRI8BGTSLdbH2xFcodLPFF932iOsDdt7DO2Wc6SlSQACAwpuz7VyfngcOs6SF4ZLe
	 pJPyhEZjOdPlIKxLHSNBo1QI0Dqwpo3IqDnequY4Qh7j87RxtcJU4HAXc2JUX6DeDT
	 LA2/lmNd1guxA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Rob Herring <robh@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: ep9301: Add missing "#interrupt-cells" to examples
Date: Wed, 25 Sep 2024 12:35:10 -0500
Message-ID: <20240925173510.1907048-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Herring <robh@kernel.org>

Enabling dtc interrupt_provider check reveals the examples are missing
the "#interrupt-cells" property as it is a dependency of
"interrupt-controller".

Some of the indentation is off, so fix that too.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml b/Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml
index daadfb4926c3..3a1079d6ee20 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-ep9301.yaml
@@ -73,9 +73,10 @@ examples:
       reg-names = "data", "dir", "intr";
       gpio-controller;
       #gpio-cells = <2>;
-        interrupt-controller;
-        interrupt-parent = <&vic1>;
-        interrupts = <27>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupt-parent = <&vic1>;
+      interrupts = <27>;
     };
 
     gpio@80840004 {
@@ -87,6 +88,7 @@ examples:
       gpio-controller;
       #gpio-cells = <2>;
       interrupt-controller;
+      #interrupt-cells = <2>;
       interrupt-parent = <&vic1>;
       interrupts = <27>;
     };
@@ -127,6 +129,7 @@ examples:
       gpio-controller;
       #gpio-cells = <2>;
       interrupt-controller;
+      #interrupt-cells = <2>;
       interrupts-extended = <&vic0 19>, <&vic0 20>,
                             <&vic0 21>, <&vic0 22>,
                             <&vic1 15>, <&vic1 16>,
-- 
2.45.2


