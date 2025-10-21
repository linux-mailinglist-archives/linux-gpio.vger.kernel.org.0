Return-Path: <linux-gpio+bounces-27389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176FBF70C3
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E14B189BF0E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DBE33C52A;
	Tue, 21 Oct 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="5reUCzt3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4A83385A2
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056676; cv=none; b=INKJM+f4EFLjw0Ng6/8MW2rkLnDdM8uDokei+V3IOPDxhO1iWcbQql36y06IFwoe2NmAcDpMjfZEXaRQvLWGVe+6XAHTJJhzWyo0jUQ0+i7hcbGWn6OwDDIMkeZjXscpJfaaEytRLr2YUp6j9njZDwuMQp0f2nK+/AcUaFsPWH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056676; c=relaxed/simple;
	bh=mjMBW4Sxdy9jvKWjdvZDhiiRV/EN4mkroKkKBROPKjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFnDJ1C/NN2zfa7fhJh0W/kqHO0WMxuZi39pkx0F3afoeCfQxQ2q55eHM33HZjfaORAjOqnu6jxvhySmwwxSgqiEeooTfXNk5n0JMyLgU7YYomKLuqpvxAMqum6R8P5ZfqFToCRkFAm8hjp0JcFwdSfbSxiYj4/Ktd1oOdAHNj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=5reUCzt3; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id C4B3E68A1CD;
	Tue, 21 Oct 2025 16:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761056672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBL7rt7cVDLBdD6u/8R0OUTQE737shBf+U6nao7w184=;
	b=5reUCzt3wSy96XoodKBWfC6xC9UwIIZZXqmwANXGxCdEu0yUn7A3EJ84Djpd6pvmB/U787
	vWlhxoVtLu/zwa7JWau3KnrLYOPgDIgWWb544H1FKwWkM+PgEahNk9jxBvqPLTSbk2vt7A
	jA6lpF9BKdvh87g6gsn+chQkQFt1dc6wcxHUhzNqMClHljHp8wcaQIqbVUyqGH7ytwUsnC
	hCVSLnR8gXhqtmAgkeyxA5aCB+sy6wmzZJ5fXVoUMKYpIuZ3LrwnVpDDD6aYYT+qu50wNa
	oz9z6gs78cNoa0YAwWU+0fAz7oXOKMfb/ka98J+KXaxzMVJN1uBiBWwGXQfKRA==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v6 2/8] gpio: regmap: Bypass cache for aliased inputs
Date: Tue, 21 Oct 2025 16:23:57 +0200
Message-ID: <20251021142407.307753-3-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021142407.307753-1-sander@svanheule.net>
References: <20251021142407.307753-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO chips often have data input and output registers aliased to the
same offset. The output register is non-valitile and could in theory be
cached. The input register however is volatile by nature and hence
should not be cached, resulting in different requirements for reads and
writes.

The generic gpio chip implementation stores a shadow value of the pin
output data, which is updated and written to hardware on output data
changes in bgpio_set(), bgpio_set_set(). Pin input values are always
obtained by reading the aliased data register from hardware.

For gpio-regmap the situation is more complex as the output data could
be in multiple registers, but we can use the regmap cache to shadow the
output values when marking the data registers as non-volatile. By using
regmap_read_bypassed() we can still treat the input values as volatile,
irrespective of the regmap config. This ensures proper functioning of
writing the output register with regmap_write_bits(), which will then
use and update the cache only on data writes, gaining some performance
from the cached output values.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Michael Walle <mwalle@kernel.org>
--
Changes since RFC:
  - Add review tags
  - Slightly reworded the commit message
---
 drivers/gpio/gpio-regmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index ba3c19206ccf..afecacf7607f 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -81,7 +81,11 @@ static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	ret = regmap_read(gpio->regmap, reg, &val);
+	/* ensure we don't spoil any register cache with pin input values */
+	if (gpio->reg_dat_base == gpio->reg_set_base)
+		ret = regmap_read_bypassed(gpio->regmap, reg, &val);
+	else
+		ret = regmap_read(gpio->regmap, reg, &val);
 	if (ret)
 		return ret;
 
-- 
2.51.0


