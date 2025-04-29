Return-Path: <linux-gpio+bounces-19454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4550AA0E34
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 16:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6E581B63557
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 14:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ECB62D29C1;
	Tue, 29 Apr 2025 14:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DwOBUlIQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06192D1935;
	Tue, 29 Apr 2025 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935713; cv=none; b=BKHBSputx2p+SqZbmsKdiVKnyDcBr+eHK1djWzcjINUjkgrfjmcpA3W7TXDB0R/IM/hdX5s94tJZz4flzcigPV0JlM0dHhyVWV+/FWalHXq8WB0cUnXUqI7AU84EAEnc0GT2zBL3jHu0AdPILsNhPrlwVEPUDsH9Ivmm2sn4kVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935713; c=relaxed/simple;
	bh=8ivdH2v+B4xst4MYoyZg1Rfx+MTzdZWx+ekWDWKsCbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+cSaEBV+3tJM02ewSGMk8N7zW8FxY2xidU6mRVTqQhOMpCstj7fCxPWvrKL85RCawPPslu53jDToJTHHantSzsuzVfJC46+G6UcnyQTsjX0Hd0glAuIulnz74qmnQpyffG8eJGqEO/pXT3qb4OHJwa7sH/plfh08hS9cE3Ahjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DwOBUlIQ; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C77F438C1;
	Tue, 29 Apr 2025 14:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745935709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2qpZvJB8NWTh/LBoWTbKsfbKXjJcrNXAH5B03PoA1I=;
	b=DwOBUlIQjSuZ7pUYcCrR5rAQlx8oDmQPlBu28H97KnGwNKdqSumXd+odjYF+xviNKbQ9WR
	5Sp/0S51qXje00qiRkWQ5E57CWeDjug/f53Rlr1N+rBUNmpiRVn3jjcexXqzkErxT24EVR
	jenGj7RAcLkcq9TOddX3IEVJSJUkIZUxkZ0Yxn6SyppxPOAEYV4URCicp9fMqu9j0801Tn
	mX3YGeQgeTvlWm8yCfz+/CQqACHSEsRxTjj1jII0pB9AoCYNNL5iatyM/m1oOoJ0lR2biQ
	PvUgdOEGbfZ5K/vbFPD8WI55SPIVqlAb870UJdjbmODTgebEg8ShXK9TtO02Sg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 29 Apr 2025 16:08:16 +0200
Subject: [PATCH v4 02/12] pinctrl: remove extern specifier for functions in
 machine.h
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-aaeon-up-board-pinctrl-support-v4-2-b3fffc11417d@bootlin.com>
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepffgrnhhivghlvgevlhgvrhhisegrrggvohhnrdgvuhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Extern is the default specifier for a function, no need to define it.

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


