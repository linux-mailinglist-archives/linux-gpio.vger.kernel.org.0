Return-Path: <linux-gpio+bounces-19293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F92EA9B9CF
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 23:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA66B46018A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 21:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93BF21D3EB;
	Thu, 24 Apr 2025 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CX+cOMQm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98355221FA6
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 21:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745529783; cv=none; b=R4tcHB9h67ogxf0DhUp//uV37RhOBepyyNCluzTbe1Pz5/WDFm+3CGt6tTVg9E1XhPLUy3BNhy1Svmwq0ByGHk/iMoHFeQqlxm1KwLfTqQGpg15QGANqoJ0RX1aDGKwmkDrkoizIYbs8+IeMeWtUiwDlc8NAqyIQatel+4XWMFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745529783; c=relaxed/simple;
	bh=cneWUgF0PkoN3pNUK5/3nQjWRHX2htNPIoMNm2IG814=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mIdtEFBm+sL2J38kzbSSe01N1e3NuPkGn0I4qb4dVg3UHOAH5/CKBuXmhO0gUuDo5xr+ZF4c+jx1aiFpR6aaIzBPA6YEHtnXgEDgiclYP8n+Hkt1IeiVJ3kSWwTW0T+FX9oWvqQ2BwHEJNJ5PIWg8wYzIppxMhVfkkGxRw0LQSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CX+cOMQm; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=CrlgSMtVGfBlfR
	bQVgveEF34gSGoEH58NnZudbPx89k=; b=CX+cOMQm7enUW5hvDh7dO5QECWev5I
	96/mNRMsPqQEGMLSK01F9Iz6u/T2tVn7K2qqjaq0y/sDk0mOnjGflLnSi3H9lyko
	MoW4ScUe9MZpM1rYky4qfv2x+7RFdw/sTdqzjgarOqilp8a5Sfurzv7G7OX7cf+K
	R4ExY6O8hvGG+FoDAMnRFanEUqF3et1RQeRsLkwaJDKB+wzOnBtLycfB9z2hMe4k
	rm8nZF+ZC4Ac+rnHLw0YWb1SpfTGPFm3VATllxT4Uab0dB7pmkqAx9ZbNJ6U6T9r
	fe7gygUu66OjAJDNINt816snXBOinvkYnffzjWi11WixmRpWp11Nm4cw==
Received: (qmail 3600623 invoked from network); 24 Apr 2025 23:22:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Apr 2025 23:22:49 +0200
X-UD-Smtp-Session: l3s3148p1@cenb0YwzrugujnsE
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: add me as maintainer for the gpio sloppy logic analyzer
Date: Thu, 24 Apr 2025 23:22:23 +0200
Message-ID: <20250424212234.5313-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was forgotten when the analyzer went upstream.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa1e04e87d1d..00aac8a8dc7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10138,6 +10138,13 @@ F:	drivers/gpio/gpio-regmap.c
 F:	include/linux/gpio/regmap.h
 K:	(devm_)?gpio_regmap_(un)?register
 
+GPIO SLOPPY LOGIC ANALYZER
+M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
+S:	Supported
+F:	Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
+F:	drivers/gpio/gpio-sloppy-logic-analyzer.c
+F:	tools/gpio/gpio-sloppy-logic-analyzer.sh
+
 GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
 M:	Bartosz Golaszewski <brgl@bgdev.pl>
-- 
2.47.2


