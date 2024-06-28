Return-Path: <linux-gpio+bounces-7803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB0291C36B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B9371C236B6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2141C9EB9;
	Fri, 28 Jun 2024 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NThYkc8Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CAF157E91;
	Fri, 28 Jun 2024 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719591098; cv=none; b=tLRtjYPOBjbkqIOP6haqVayfvAl6IESM89cJ7im5iujE0dBOEYdwzNcx1L6/RQAwaErsTHRvQ1N3OXvSKvR36J0Yya0XEN+SaGf3QxmOJSkKyaK4WJGX7WU+6Q28gZbPd+8tp2DvaHXUo9OJGG/GJVOu3WqC+zNF4ihlGj+Tj+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719591098; c=relaxed/simple;
	bh=hXckcbAI2Ku1bTjVu/yVcz2IT/9CN6Fxcjv0cx1R3Yk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lnD6lxdhKBLMTQEwbgPWWskTe+WCifjC3UMYQYJOPIcZ1IWsuySfGSEMreh6Q0mn53VvexeiHqUp6zdUauoDFDC0o7iZhOOShuRdgKlmY1kx55cN6HIDEc2Q9La28Iyc/uIWmW0Oww3yq7xlA8QhwV9HHWjenOCnx/daRjE5wE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NThYkc8Z; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A690760006;
	Fri, 28 Jun 2024 16:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719591094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=czcJ/fr1ZTjrSI6bfQeORM5XhCaE4l9N5BU3rLIJ3U8=;
	b=NThYkc8Zg1933Q0MsQ/TZDU6Op59y2RnA4udRp84T3Q2JxN4gXH4e8k5FZpoqSNm5xmPc+
	nZZNaiXgolXWNRDv4z2j48F/pmaWRcBLJV9WXPHy1PV0C//czGaaMPL5FH5mVK1mlRd8Ws
	SQef6AUYosHkdbSzHOzXlc2q3eNsKGosABC0bEEp2C1PZHwdyP8P9phlb5mslOrloHLn1t
	m7YozCiUWJYVxn3kI5lMph033+xdLZpwzbPJa0QE1QQXA3b3w9+OhEi2xatoWH2Mc1aVJO
	sqtOYVY2Wr4ntEBloHimRCvpBNeztYebLAv3BWtzjtf242ynWPJ9giZxEDL67g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 0/2] Add Mobileye EyeQ5 pinctrl support
Date: Fri, 28 Jun 2024 18:11:30 +0200
Message-Id: <20240628-mbly-pinctrl-v1-0-c878192d6b0a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALLgfmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyML3dyknErdgsy85JKiHN2kNHOzpDRjS4NE82QloJaCotS0zAqwcdG
 xtbUAblHmhl4AAAA=
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev-13183
X-GND-Sasl: theo.lebrun@bootlin.com

This is a new iteration on the Mobileye system-controller series [0].
It has been split into separate series to facilitate merging.

This series adds a driver handling EyeQ5 (and only EyeQ5, not EyeQ6L nor
EyeQ6H) SoC pin config and muxing. It is an auxiliary driver being
instantiated by the platform clk driver.

Related series are targeted at clk [1], reset [2] and MIPS [3].

Have a nice day,
Théo

[0]: https://lore.kernel.org/lkml/20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com/
[1]: https://lore.kernel.org/lkml/20240628-mbly-clk-v1-0-edb1e29ea4c1@bootlin.com/
[2]: https://lore.kernel.org/lkml/20240628-mbly-reset-v1-0-2a8294fd4392@bootlin.com/
[3]: https://lore.kernel.org/lkml/20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes since OLB v3 [0]:
 - MAINTAINERS: Move changes into a separate commit to avoid merge
   conflicts. This commit is in the MIPS series [3].
 - dt-bindings: Take Reviewed-by: Rob Herring and Linus Walleij.
 - Kconfig: do not depend on COMMON_CLK_EYEQ. This symbol is not defined
   in this series, it is defined in the clk series [1].
 - Kconfig: do depend on AUXILIARY_BUS.
 - Kconfig: remove outdated "select MFD_SYSCON".
 - driver: remove "#include <linux/platform_device.h>".

---
Théo Lebrun (2):
      Revert "dt-bindings: pinctrl: mobileye,eyeq5-pinctrl: add bindings"
      pinctrl: eyeq5: add platform driver

 .../bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml   | 242 ---------
 drivers/pinctrl/Kconfig                            |  14 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-eyeq5.c                    | 575 +++++++++++++++++++++
 4 files changed, 590 insertions(+), 242 deletions(-)
---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20240628-mbly-pinctrl-bf76bf390a7c

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


