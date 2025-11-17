Return-Path: <linux-gpio+bounces-28615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD85C665DF
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 22:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 244AD3453B9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 21:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BC034D4F6;
	Mon, 17 Nov 2025 21:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="xk9VjEVX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C9634C141
	for <linux-gpio@vger.kernel.org>; Mon, 17 Nov 2025 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763416321; cv=none; b=upnzrRl08vluuVbTsgQLzPSckgrTsEixhOHO/rHhLrL/dJx+sCZVbzdkGQI/b+Yp98xdFDIPsIMWvWGe2okt4m0rIBVPvNXl2L8Ahiwbdh2/sPXyrbeE/frWO98TfBrNDR0H020d0+Iuv090uwqRhDy2+aitVlfSwvgJhIhtMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763416321; c=relaxed/simple;
	bh=rJqy6GzZyBFkqGBlnC+kbUd2Jg6Ouw8WXt0uyhQGxSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RnkVFxUfFsVHrYNQ5a158dtBSJUIrTgyZ9V0hkRJP+Fu1LQ5X7L4SWe5wWKO/7UF/0sHSBmDlxnKDeFxqe3Li7D3qQjeT4fkFEEZHOhg10rpSKmYOnBsLK6IvT2xHSikezlMqeTziYEm+xGpV8eFM93jIfs8YNkre482G/jHGEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=xk9VjEVX; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 062A86A0B61;
	Mon, 17 Nov 2025 22:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763416309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RD3ewx8m9AdAzNtxCLFnTysOmpu3pl3ZjHoTwYVS87o=;
	b=xk9VjEVX3krgstltidznYx0O3tqhUz5e3G8+08B2lxkg/LcV06qo1c2JDv9dQ8eXxXIY+/
	ZzTOuLSVzIzPPTZ90njg4sMRER+tXE8ERXwH+L5oHRAkMokoIURPKn1t2PoFWd5eIx/YpA
	WZBv2DfrCXlOehlaOIV6R6OHsiGRpPoDxCupeVTW+3YY93P0nRb6ZIvb8Me0IKLqqKyMWE
	pG+sBwnyQWwA0E/C7bU71bfwcWXkR7fYdW/8k2iCr2VQe61ucNOBrS5MQALJt7uHrp2vSB
	lBMUY0R2ubbFnv13m/AHybT6kfQyWgqMhOxGVFvrIfHYhTgt380fizpZ90s5KQ==
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
Subject: [PATCH v7 6/6] MAINTAINERS: Add RTL8231 MFD driver
Date: Mon, 17 Nov 2025 22:51:36 +0100
Message-ID: <20251117215138.4353-7-sander@svanheule.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251117215138.4353-1-sander@svanheule.net>
References: <20251117215138.4353-1-sander@svanheule.net>
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
index 3da2c26a796b..d0b4e93ec58e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21656,6 +21656,16 @@ S:	Maintained
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
 M:	Linus Walleij <linus.walleij@linaro.org>
 M:	Alvin Šipraga <alsi@bang-olufsen.dk>
-- 
2.51.1


