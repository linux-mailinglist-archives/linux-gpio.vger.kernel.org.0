Return-Path: <linux-gpio+bounces-28846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C2EC7102F
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 21:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 296543498B4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 20:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F4B373776;
	Wed, 19 Nov 2025 20:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="6781Uit0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED6130CDAF
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 20:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582611; cv=none; b=miysht9HcWZV5Jc/Kju/7t0zzc60nuPl0tVwAJes9B9yUK056+2vEwLKuYah4aM75wEYy9hhCcadV4T1hylQbzgGUE56RL42waTjuAL+NCjO6TFrA/49YqlzAOmn4ZIemKpFzvWwD9UOQehteLCvXjAWZqm5qMGcpM3R5oTB4Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582611; c=relaxed/simple;
	bh=yfnCoLTtpEcfOKw0YoWFy2WJjr64Vx1dfDmsR/BqStA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uceX1vn4Dx6AFbUlMgMTJm2eX4ajbLRIanb4YPudEgeIiV4jKCK/uMEJJ6cTMMhOvUj0F07wSC1KNkyX3wb/mMl02SnvTHNAyos1UGwVD5y1CCj1VpsWw2LqXQ1POMlTOT9cRoCcjtqQdUf/1cwfYyg41p/jGXv13ltQ3KmIkcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=6781Uit0; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 86CA96A1E9C;
	Wed, 19 Nov 2025 21:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1763582597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o2tv2LQS6rVaGTazg9EFfmU0wdPHn3ddSWc6g6gBwqA=;
	b=6781Uit0+MiL0uTlcyB803kDOcMNfevWN1D5x0zdt0Y7A22YpAF6z3CfBjWYYAevHLLy4S
	dgBQ3JyIGgXWsirApg83QWnoBgSzo61wDOhZe1zuTle8wJY29YQHtX7I3H1coiuKGjnocB
	gswVISZ/NpM11uMCpYE9+eHsgUdld1RMvu7akogKO2o3FJvMy+AKUqQr4cutmA/csxNMyT
	naNqOCRMQ/b5sensoKBYPsApNOwQs5gvDWESC5tOqiBCeWMUGcDyGgv5VFEHZ+KcsWW/3c
	VgsJfxgC/ig8FJAW0JINoj7B1DD5Lzw9pbOO+ecxFljxlZm7e3C2GraRezwgxg==
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
Subject: [PATCH v8 6/6] MAINTAINERS: Add RTL8231 MFD driver
Date: Wed, 19 Nov 2025 21:03:05 +0100
Message-ID: <20251119200306.60569-7-sander@svanheule.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119200306.60569-1-sander@svanheule.net>
References: <20251119200306.60569-1-sander@svanheule.net>
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
index 00e2cb65ddec..20f946dc4a25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21663,6 +21663,16 @@ S:	Maintained
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


