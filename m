Return-Path: <linux-gpio+bounces-27393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4EBF70FD
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F863A156C
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238BC33DECD;
	Tue, 21 Oct 2025 14:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="RR2SygYh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51A33DEE4
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056680; cv=none; b=UX3sXADzoMPJuQyFmliN4kvhcHOjsqaLZAt/PAt2sWE9VqJMm+DoiY0xC9x3a2/IewtGg7lyR2rNP4m3TqIQE/czkpLWkqlBdPrEqcs0VCbEuPnqXJWjmmnsPZRureuiwiler23up4O7GOVE/JIXTGn3tlFZECb31RBCzouCW5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056680; c=relaxed/simple;
	bh=Fez7uS8AbScs89gfdW78iX7P7jEs/X0KZa5sFOKAbRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Odnq88VBR2Vz9wYE1DQQsFzCCqkfmDZn2TGKZReo3pb4MkONo2/p8K0hQSFiRL+upKQu6+7zJqbxntSn/oMuk7hyIZq4if+s0fCFWQSCNs2y+lsbBBmcOWT4EWc03muUsyXIRkAvD3Eg57CNze/eU0bsWNy0p9oPVta8kED0og8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=RR2SygYh; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 888CD68A1D3;
	Tue, 21 Oct 2025 16:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761056674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hi27ZSmrR6t0dm+4AwHvX71F/u/ISlzchGx+6AIwVJI=;
	b=RR2SygYhLgA7AsiICg78fI1XTrOUI9zPfQMoIGqRW5Ex0wbXQgF28cq/dyK8xNeE/Vnp1x
	Qnqpr3R1rXuykdB0cvpkVO6Y3zyKRj+3o8sIH2O+TvmTUFz5YdNpFi20xcBw03obsoM2Kl
	Gx24igIctmBhXDveVXSZKpBDGHPqtNdkq48SLS3zxKkY7Xd1hHzgfQo0TQcpTkpMjRdH22
	mK89xXHgdwkiyRXm2sdoUqybLjGpcT6gA6MN7qBP2/38Kr/wFnGfQPGKTG/SxCG+MS1C11
	bDCRNcWE5kAzgGRdf7xsdlLsveU2y/OZaBG5BzII8vOFRI1VJ9YQsgih+QHXaQ==
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
Subject: [PATCH v6 8/8] MAINTAINERS: Add RTL8231 MFD driver
Date: Tue, 21 Oct 2025 16:24:03 +0200
Message-ID: <20251021142407.307753-9-sander@svanheule.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021142407.307753-1-sander@svanheule.net>
References: <20251021142407.307753-1-sander@svanheule.net>
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
index 46126ce2f968..a83c57091a9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21630,6 +21630,16 @@ S:	Maintained
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
2.51.0


