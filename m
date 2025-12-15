Return-Path: <linux-gpio+bounces-29592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE0CBF515
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 18:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EECFB304228F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B12325738;
	Mon, 15 Dec 2025 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="dAS0FWam"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74D324B31
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765821097; cv=none; b=F3ci8P7ZEhYUpddZQq27ayvNlkkFaWhXurf08s2sf/d6UrcMzIQwXa+opOqjhVzKuYPEtUS9tA4/ZQC94oa7SOuOVYNOpx0LG3CpIolmMp1zbpsyF8ORNQk3NmD5bebXtIInxpeWVTQGuIjuOXbwuA0eEW98M4mjkVFNFGJdMDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765821097; c=relaxed/simple;
	bh=OMBjumZfPZOkHIbUa00uG1t2OyMoQw4hQhX9sXpxidk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MWGP+t1uYOwVacJwZH52Yi2KV5oPwNjLXBBREGfTpeNL/NhvI8/jwdpwL1h3ykbx8Y7FjpLomkF/MbfZ7Kf1oMp5lQoYJGPN1ulvv9cWgJ8+AgEHJ8Li1AIuY3KUwfdR7sConPjJRBTEGlap8BIj4r+w9kB523TTBYtyl9cuThc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=dAS0FWam; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 068806B1FA8;
	Mon, 15 Dec 2025 18:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1765821085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zYHl0cckTMDsYyUvY6SsUbK63A6J0gTMMaV4kaaWOBg=;
	b=dAS0FWamLr5KGQVyIgZo99X2WE8m/IFkuyOny14wslRBzbIJANJMQRCI2A/IjyWyxZU9P6
	fNESpBaUtH83/V1yolRm0YZJGpsqm2RVxoEElruRstjnsoOeUaCCutrxPzUfIx9yQAdPtI
	hEM+xaDX4B/5WSkB+9e8C79lpjS4G5M+FCAosNExy9gl073/nsr2NikmkjPKX2mC9ASX0C
	ZHtSHp/jO1+wTuSBJwYKdJbGEZs5U4Ux2uBnv9i4Gk1Hs7J0MVh7yyWcHblWWS5c7nt7Ii
	WD81nnnZrgfGVaNuobTX/93N7upbShTRxjsG7BoR243tw7Lc0fonXS8Xph0MhA==
From: Sander Vanheule <sander@svanheule.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH v9 6/6] MAINTAINERS: Add RTL8231 MFD driver
Date: Mon, 15 Dec 2025 18:51:14 +0100
Message-ID: <20251215175115.135294-7-sander@svanheule.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215175115.135294-1-sander@svanheule.net>
References: <20251215175115.135294-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the files associated with the RTL8231 support, and list Sander
Vanheule (myself) as maintainer.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..f07803adeff1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21962,6 +21962,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/watchdog/realtek,otto-wdt.yaml
 F:	drivers/watchdog/realtek_otto_wdt.c
 
+REALTEK RTL8231 MFD DRIVER
+M:	Sander Vanheule <sander@svanheule.net>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/realtek,rtl8231-leds.yaml
+F:	Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
+F:	drivers/leds/leds-rtl8231.c
+F:	drivers/mfd/rtl8231.c
+F:	drivers/pinctrl/pinctrl-rtl8231.c
+F:	include/linux/mfd/rtl8231.h
+
 REALTEK RTL83xx SMI DSA ROUTER CHIPS
 M:	Linus Walleij <linusw@kernel.org>
 M:	Alvin Šipraga <alsi@bang-olufsen.dk>
-- 
2.52.0


