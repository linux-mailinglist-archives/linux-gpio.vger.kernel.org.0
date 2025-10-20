Return-Path: <linux-gpio+bounces-27304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88536BF0F5E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 13:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 492434010D2
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 11:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E94304BD7;
	Mon, 20 Oct 2025 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="0gEXgnIY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B930FC3B
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961416; cv=none; b=nTL/3V2S7p9usHbW5VfKQCxDubCjt/m74cgPptVaDCaFo4AP2LZeMucbmh+6FmJanFhZcuVIMQOdEc8596htB6YeflP47Ml2t+PzEs85A6lIDTx7mHGvf2hWgUzY8u0ISRlyEfke9m+moxZH1mvGMLyx3199sUzd/+n6E/YWnpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961416; c=relaxed/simple;
	bh=ZTbA1qfwtTWnDUQYYQBEGnlG6EasH/qpBuqL+ZHu52s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlFUclxE4Hmkbv8GRFdk2hoDzMe5JZYFrXYsZp/wdap/YFwi7AWCK0b6YfOMOq7QrS8K1CI5/3dLGmS/ox95KrAqdcKYiIBBb63XSTKjO8QjMoixECVXEt4YXlHaVauhqPSUmKAZu6QSLac3gppuP9cMZepA+s6Sx+lSM0aPqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=0gEXgnIY; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id C85BF6892EB;
	Mon, 20 Oct 2025 13:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1760961406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DK3/svln/NWfvJpk3kK/gSDPYhLgNuFCyCVVwQR5cTc=;
	b=0gEXgnIYO0LcIXcoTDOotM4/yx/qYtb+x670dvp+wGnsUaTaSa+mnv6XJWCPC94vrTnhaE
	tL4qbWhZkvDERsOaGwuyu7/07rUFTbvSVLhTD5RoVsNM3UslAF1QuUcB5DB9NoW9rbxC1N
	YjEDClZFzb6NW/0rc2Nu3UK9GvTp0qTbhKVwJ/G1ayLBpARKEZ6/rbzgzxrVSiB5CHq6Vm
	VxozR9cTJ1BVb6BqXiLmsR7azTpdVacUfAlWmtlGYBc0RBBcjVHUvwN+zc+Cr/ccKHK557
	4sJfrSCHKkZdlj/mV7zxNApIHY6mz0BH86dabLxmmaJgEVYDWt/e4cJa+PtBYQ==
From: Sander Vanheule <sander@svanheule.net>
To: Michael Walle <mwalle@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [RFC PATCH 2/2] gpio: regmap: Bypass cache for aliased outputs
Date: Mon, 20 Oct 2025 13:56:36 +0200
Message-ID: <20251020115636.55417-3-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020115636.55417-1-sander@svanheule.net>
References: <20251020115636.55417-1-sander@svanheule.net>
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

The generic gpiochip implementation stores a shadow value of the pin
output data, which is updated and written to hardware on output data
changes. Pin input values are always obtained by reading the aliased
data register from hardware.

For gpio-regmap the output data could be in multiple registers, but we
can use the regmap cache support to shadow the output values by marking
the data registers as non-volatile. By using regmap_read_bypassed() we
can still treat the input values as volatile, irrespective of the regmap
config. This ensures proper functioning of writing the output register
with regmap_write_bits(), which will then use and update the cache only
on data writes, gaining some performance from the cached output values.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
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


