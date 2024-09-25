Return-Path: <linux-gpio+bounces-10445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D59865BA
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 19:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35BD2289607
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 17:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA5D13BAD5;
	Wed, 25 Sep 2024 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckKaZm6d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734D584A2C;
	Wed, 25 Sep 2024 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727285707; cv=none; b=ipCsK63RfyNQS2qE4zzWJuGBzMtfpkoVAd6Xon+5Z0+QnAKPS7Lf4HrhqNdYYKoqm1C8gUeFdLbwv5QVVnSfExdmkwG5rigqeOALn/yf4QiunPmrhAwJZPUlLfzV0YlCjqA8zsT9GW/vcENhi5Q6ZrASxX/4t5T1jq00DOz0r0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727285707; c=relaxed/simple;
	bh=u5pPiPPL7uX87sVhb6Lr8QDfaCyqRvRoModCm3os050=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EiZJ/i//DzWQiv3QdY1+GRHJPHmu1t4O0o4fyMHkfF7R7LyFXlewOpsGCrdyGiWXO/o4QOvSV+qPGZ8+D+1RHkImwgzZCxpmpCQ5yx8WWV7khvQKK2IU3wyuAqB32hKJYkg8bG1REzyKLunrgocpLxtk9ZBD39++yJWpKFcWRzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckKaZm6d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5EEDC4CEC3;
	Wed, 25 Sep 2024 17:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727285707;
	bh=u5pPiPPL7uX87sVhb6Lr8QDfaCyqRvRoModCm3os050=;
	h=From:To:Cc:Subject:Date:From;
	b=ckKaZm6dWrSfXFGSsjE1qRBY0+dZrpsEYSnSmMDhnZgnt9XydrAhNJebG1XXjjsX/
	 r39JLm+SoJhfmSIy1q1a6O6ME6zZuQIbndl6F/iRHmuxA2Ihr4V1lKJHB58z2romja
	 YdcgkI55DPRZ8C2s5/iEDVU6kfK6I7PFDeBVZ1Hyt4++ruXmSmdtiHX6pDs+/9DjQv
	 tYOUFhnARFkc8v1Sfkd9g8QiLu7sZqgN+XivXENz07/F4BgHzn2kr4SJSArxMNQTEs
	 5DnjfNFF67aHPErqULarhCSM1QlBFUhUo3W/H4rHld+5+gZI90Ef9wNAnPiyth7HGM
	 ydP7W+8FlXLLQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: st,nomadik-gpio: Add missing "#interrupt-cells" to example
Date: Wed, 25 Sep 2024 12:35:03 -0500
Message-ID: <20240925173504.1906872-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling dtc interrupt_provider check reveals the example is missing the
"#interrupt-cells" property as it is a dependency of
"interrupt-controller".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
index 38d37d8f7201..b3e8951959b5 100644
--- a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
@@ -89,6 +89,7 @@ examples:
         interrupts = <0 120 0x4>;
         #gpio-cells = <2>;
         gpio-controller;
+        #interrupt-cells = <2>;
         interrupt-controller;
         st,supports-sleepmode;
         gpio-bank = <1>;
-- 
2.45.2


