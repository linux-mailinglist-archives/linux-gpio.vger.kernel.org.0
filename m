Return-Path: <linux-gpio+bounces-588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A0A7FBE31
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:36:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5775FB2168F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 15:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9BC5E0D4;
	Tue, 28 Nov 2023 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jW5PFFRF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C989A92;
	Tue, 28 Nov 2023 07:35:48 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28365FF803;
	Tue, 28 Nov 2023 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701185746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wheDqiE2a9OZr8JN6HhD16I1O5hsDNL5yX5S9DFZ7RQ=;
	b=jW5PFFRFM3QHLzqGw2eP/vuhSY/2H2WnsX80le7uM3aFzdaPasOGKMZgaXRnRpg6HxF9KS
	dPnktG+RUba8i95BML29r6+xhH9dY/rgmO7IINtPJsklbQgDHXKmN7VoQQEuA8j/fe+Qun
	k18ByByEdOzlQSvn9h/HWKFQgYQdr3GZu/bAX/Ma/UHmffHAvdqOx3Ng5N00Lrgd1npuem
	ZJoWIKv12Ep8Iqqb7Ob8Q8pUrvTKaoWWm0rm0344ox0KT3OnkjwNdY0kC4b7XVpbrgAH39
	PUPjFOugk3XfkPz6GGUD7xSoe7vm4eUO+zKHdkbDnb7L41h/dv6TlJbu06YBbA==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH 0/3] pinctrl: pinctrl-single: fix suspend/resume on j7200
Date: Tue, 28 Nov 2023 16:34:58 +0100
Message-Id: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKIIZmUC/x3N0QrCMAyF4VcZuTbQRobWVxEv2iy6iNSRiAhj7
 77Wy+/Az1nBxVQcLsMKJl91fdeGeBiA51wfgjo1AwU6xkhnfJ4oBFy08sde6GSYRi6J45hyEmh
 dyS5YLFeee9nZ58Xkrr//1fW2bTsVmSuPegAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 gregory.clement@bootlin.com, theo.lebrun@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

On j7200, during suspend to ram the SoC is powered-off. So the pinctrl
contexts are lost.
The flag PCS_CONTEXT_LOSS_OFF shall be set to restore the pinctrl
contexts.

A new compatible (ti,j7200-padconf) was created to enable this flag only
for j7200.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Thomas Richard (3):
      dt-bindings: pinctrl: pinctrl-single: add ti,j7200-padconf compatible
      pinctrl: pinctrl-single: add ti,j7200-padconf compatible
      arm64: dts: ti: k3-j7200: use ti,j7200-padconf compatible

 .../devicetree/bindings/pinctrl/pinctrl-single.yaml          |  1 +
 arch/arm64/boot/dts/ti/k3-j7200-main.dtsi                    |  8 ++++----
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi              | 12 ++++++------
 drivers/pinctrl/pinctrl-single.c                             |  5 +++++
 4 files changed, 16 insertions(+), 10 deletions(-)
---
base-commit: 2a20795e4274c0d94c14fcb8309f72699e404d99
change-id: 20231128-j7200-pinctrl-s2r-95cb9c159a9e

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


