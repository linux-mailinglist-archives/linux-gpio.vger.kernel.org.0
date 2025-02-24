Return-Path: <linux-gpio+bounces-16473-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C0A41A43
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 11:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 926DE170D34
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77D52512F9;
	Mon, 24 Feb 2025 10:03:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB8253358
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391421; cv=none; b=tGiECGuejO3YFJgPuPVrG7KAKlRHWXXnbYcIwYneUitUdrScWFmkPYR1dD+ztNtcu//BXYehuEmKbmEYQYmeUAtNRrxZAxI/FmZin1nXckR8qoN44nkP/k/vA6Ts2ueiMJ2sesOKiiBmJnLC0K1pCm0NiN5mAaMeRF+FKQHHkfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391421; c=relaxed/simple;
	bh=Pc9RBvbEywebxaatBMIFCoud/VzmBeGFFTot8wPuMfg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pD5lBHwpx7qoCX70/u0uNYOUysKJNMsssulN9hArD0NxjMQtEfylcpW5SnnG4J76uYesymy2zLzoC6pLOIJBvr6m1VV2Yeus8Fsv5fxSc89Jw/RQhu7f82ISOPsYcOb3OstcPnMznp157eo61W/tZS7gHPeuSQ6lqHXXEj7kq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=84.16.66.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Z1bsb3shFzLwh;
	Mon, 24 Feb 2025 11:03:31 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Z1bsZ38M9zXP5;
	Mon, 24 Feb 2025 11:03:30 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v3 0/2] gpio: pcf857x: add support for reset-gpios on
 (most) PCA967x
Date: Mon, 24 Feb 2025 11:03:20 +0100
Message-Id: <20250224-pca976x-reset-driver-v3-0-58370ef405be@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhDvGcC/3XNTQ6CMBCG4auYrq1pB1qtK+9hXPRnkG6ATEkDI
 dzdQlyw0OX7JfPMwhJSxMTup4UR5phi35WozifmW9u9kcdQmoEAJUAaPnhrrnrihAlHHihmJO6
 NtUbdtKlBs3I6EDZx2tnnq3Qb09jTvH/Jclu/IIjfYJZccG2da0RdCSXw4Vskmi8B2QZmOCLyD
 wIFseC8M03woPQRWdf1A37H5Rf9AAAA
X-Change-ID: 20250219-pca976x-reset-driver-c9aa95869426
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha

The PCA9670, PCA9671, PCA9672 and PCA9673 all have a RESETN input pin
that is used to reset the I2C GPIO expander.

One needs to hold this pin low for at least 4us and the reset should be
finished after about 100us according to the datasheet[1]. Once the reset
is done, the "registers and I2C-bus state machine will be held in their
default state until the RESET input is once again HIGH.".

Because the logic is reset, the latch values eventually provided in the
Device Tree via lines-initial-states property are inapplicable so they
are simply ignored if a reset GPIO is provided.
This is eventually enforced by the Device Tree binding by making sure
both cannot be present at the same time.

Finally, the reset-gpios property is specific to PCA9670, PCA9671,
PCA9672 and PCA9673 so make it specific to those chips.

[1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5 and fig 22.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v3:
- wrap description of reset-gpios in dt-binding to 80 characters like
  the reset of the binding,
- add A-b and R-b trailers,
- Link to v2: https://lore.kernel.org/r/20250221-pca976x-reset-driver-v2-0-a2bcb9fdc256@cherry.de

Changes in v2:
- init n_latch to 0 again by default,
- include linux/gpio/consumer.h,
- update reset+latch comment to match what's in the datasheet from
  RESETN input chapter instead of Power-on reset chapter,
- clarify/fix expectation in commit log and binding around active level
  for the reset-gpio wrt RESET# line (ACTIVE_LOW means reset is asserted
  when the GPIO is low),
- rename rstn_gpio to reset_gpio,
- remove curly brackets around return dev_err_probe,
- use fsleep instead of usleep_range,
- use cansleep variant for setting the gpio level,
- add T-b trailers from Heiko,
- Link to v1: https://lore.kernel.org/r/20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de

---
Quentin Schulz (2):
      dt-bindings: gpio: nxp,pcf8575: add reset GPIO
      gpio: pcf857x: add support for reset-gpios on (most) PCA967x

 .../devicetree/bindings/gpio/nxp,pcf8575.yaml      | 37 ++++++++++++++++++++++
 drivers/gpio/gpio-pcf857x.c                        | 29 +++++++++++++++--
 2 files changed, 64 insertions(+), 2 deletions(-)
---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20250219-pca976x-reset-driver-c9aa95869426

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


