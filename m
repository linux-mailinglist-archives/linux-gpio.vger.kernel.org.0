Return-Path: <linux-gpio+bounces-16273-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D24A3D5F1
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 11:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 689721884D0B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 10:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1A51E5B6F;
	Thu, 20 Feb 2025 10:05:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559811D7984
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740045915; cv=none; b=ZUdgVuU6ji0N+fs0e8T4cOYWmdWiL20VQwBe0T5aC9fCQxzvP3QJ1qRa1PXsED6L28fNUFB9KgI9/ODBxLRcLHmXUKt8W2DudJcfeq/eItcX8hQ2w8q4VezHL/XyLaHrN4s+je/sFJskwN21n4xlySd3R/bFSl77SfO0GvnUmcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740045915; c=relaxed/simple;
	bh=HCenMjy/1zY1WNhoLNaLkQ7qj8Ms8jFNldivjvVtGJA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a6xp8GEmcGZUBNTLmGZ3urZ63JagFIsKW4pIftC6sc4xv+e8lHCsSEcfrIe2+bklUdisrA0zaZrB5tuHqnBaJT9O41e9QjOY8jJJzkNs94m0QT7KoBOpmjXQJr0ESvWujFMneoaghZJkwKnENMPf2GXoo0i4JtS/Dq0LF8N9kk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; arc=none smtp.client-ip=45.157.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Yz7w82L4wz9ps;
	Thu, 20 Feb 2025 10:57:12 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Yz7w73jlBzbbQ;
	Thu, 20 Feb 2025 10:57:11 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/2] gpio: pcf857x: add support for reset-gpios on (most)
 PCA967x
Date: Thu, 20 Feb 2025 10:56:50 +0100
Message-Id: <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGL8tmcC/x3MMQqAMAxA0atIZgNatBqvIg6ljZpFJRUpSO9uc
 XzD/y9EVuEIU/WC8iNRzqOgrSvwuzs2RgnFYBrTN6YlvLyjwSZUjnxjUHlY0ZNz1I+WOmOhpJf
 yKunfzkvOH5SYnhJmAAAA
X-Change-ID: 20250219-pca976x-reset-driver-c9aa95869426
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
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
Quentin Schulz (2):
      dt-bindings: gpio: nxp,pcf8575: add reset GPIO
      gpio: pcf857x: add support for reset-gpios on (most) PCA967x

 .../devicetree/bindings/gpio/nxp,pcf8575.yaml      | 33 ++++++++++++++++++++++
 drivers/gpio/gpio-pcf857x.c                        | 29 +++++++++++++++++--
 2 files changed, 59 insertions(+), 3 deletions(-)
---
base-commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
change-id: 20250219-pca976x-reset-driver-c9aa95869426

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


