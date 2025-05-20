Return-Path: <linux-gpio+bounces-20337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8492EABD95E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 15:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C5C168B0D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 May 2025 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B5A243370;
	Tue, 20 May 2025 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PwCPPSue"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A61E242914;
	Tue, 20 May 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747747734; cv=none; b=BNK9l3nw9zFJ/f1bsGphs+/GemkyBJvTklJPcPuaQ7zKb+6v/Z2p5vS5N0fAOg+VsRzGxNfzz0JICgx/+5s+gnGT+AOuEcYnk923F6Hv0zqi1XmVvAP8lPtOVKqrmqw7rdejOOIFX+SZQaPYb/m3Ph7QaVZwwlVOULopQIrMNFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747747734; c=relaxed/simple;
	bh=MPRhORoIf+p97dZC12GuaGCiDgDN43zdjI8z19+pM2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJCL0RvyKjfTzjEfBMJrJjtixYS9XcSq8Hu8Vhqpc3DZR6yARp7olH4dI3QvhfSliGFV6O74waGOypdEtqDYcq5sWwzrxO7KKh5S3kN+Q0MPcJEM01e7wSTCN6zge+Uta3QW9mXvR/9gPqGwTWJKbCPcLCzk4MNuOmp3kCYBL6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PwCPPSue; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0048E43B02;
	Tue, 20 May 2025 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747747724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xWSRMd1rSllcRQkLqgI8rwgHMIaDsYTNnzGMTwHCSs0=;
	b=PwCPPSueNWab/sothcE/6vUaxHLzOcZ9z4mYH1Al7M/KCFJLLUidz4Ow/TVCR7vGWWeFVv
	z1h5TU9SBPgV4fxoo9mrTNscv4xsRQ2fP5p56gdfv70Vec4ztn4jOw9vVwpPmFMv7dP2Ut
	6q6YhDXB0fnmabkupW5nvKEuwFSaQ6f2ry4geXXhgizgZhs/xKVCIUGBs9Rwispj1GnC4z
	B9IM4DRZEfsEYSvsv5NY8HUjwtE6c6lT5xsa0ipEUowbsknLwHTTTR5iTyBa0y5VIQ8B1M
	oSDJ5pum8H99lSMSgDMnS2GtyIRcjbCXsPTi/JztfvcU0oVk74c4jRlRObX2hA==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 20 May 2025 15:28:26 +0200
Subject: [PATCH v6 02/12] pinctrl: remove extern specifier for functions in
 machine.h
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-aaeon-up-board-pinctrl-support-v6-2-dcb3756be3c6@bootlin.com>
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 linux-hardening@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefvhhhomhgrshcutfhitghhrghrugcuoehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepkedthedvieethedtleetffehudevleegledvteegvdeujeeghffhkeeggfefudevnecukfhppedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmehfgedtmegsfhdttdemfhdtheegmegtlegtvdemvddutgefmeduheeiiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeffrghnihgvlhgvvehlvghrihesrggrvghonhdrvghupdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrt
 ghpthhtohepthhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefirghrhighrghnghesrggrvghonhdrtghomhdrthifpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: thomas.richard@bootlin.com

Extern is the default specifier for a function, no need to define it.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 include/linux/pinctrl/machine.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index 673e96df453b..0940fabb154d 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -153,10 +153,10 @@ struct pinctrl_map;
 
 #ifdef CONFIG_PINCTRL
 
-extern int pinctrl_register_mappings(const struct pinctrl_map *map,
-				     unsigned int num_maps);
-extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
-extern void pinctrl_provide_dummies(void);
+int pinctrl_register_mappings(const struct pinctrl_map *map,
+			      unsigned int num_maps);
+void pinctrl_unregister_mappings(const struct pinctrl_map *map);
+void pinctrl_provide_dummies(void);
 #else
 
 static inline int pinctrl_register_mappings(const struct pinctrl_map *map,

-- 
2.39.5


