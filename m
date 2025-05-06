Return-Path: <linux-gpio+bounces-19687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85ABAAC94F
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C1651769C9
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 15:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1234283FF9;
	Tue,  6 May 2025 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PESKl44y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D8B283C9C;
	Tue,  6 May 2025 15:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544896; cv=none; b=crxMcYY92qrpeQj1F3bcSL5KcjiPIvx7NhmEcAOPc7Q7nl7AIFZV/c6F92TR+9OcnXG1EQ/TMrda+Lsv0Hexm/zx4rkwipLWYmDIt5y2Gx8gUSTD1aE8eBAyG3rtxhHUlUbw9RoSBOu0xkDNFb65KmHSeghhM75FNgVX8EGGOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544896; c=relaxed/simple;
	bh=56bTPPIQLXvmsf5LCAJEmK7HEvsdxzS94R86YuQfSm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJHd692mx9SeOkC8bfaN3dfeeRvZvYy9AZDMgvFxW2R3P6CzCysj7tVXfie7wug707UkwbyT6WyKeBEtqyz/Qjiq2NVyUF9rueA4H91egvBZsEt53j5xC2B8uv3au0LHNvXk7kWMeZthUmoHE9D3SBcBd1JAf3duTs8cP4CqlmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PESKl44y; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B1A543B14;
	Tue,  6 May 2025 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746544886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tMK78815Dg1a0/PXJsktZUNkpbltOz6RRsoWHHtQeSE=;
	b=PESKl44yc/qxdRkT+sa9wKWPVbjllfX1DMQidHwLf4HWWwtF4fuqUMoUI4L7UCgBCbkEcJ
	+P3UEjNtz/7fo9dijkFNFqIQ4XR67wdsi+fwBD/2ZJdvPuw9hBjEoK53nmSEVsTQl/yYVw
	5vv6WgY7e26it+6v2XfG6YvJJNuhZplAd1AElvPilkhMHH9Ze6ZLs8HvHUfoE7xhmhZR6Z
	NlS766fl2Uc2/QMTpppyFiaaDhOI0SKoUCFhnanLy7hLhuDwNpde4XApFqqVoPfulLyLRP
	coW09WqtHrgViL/5juPiaS0ONmXEcH3DD5z9ePWi4asm2K8sOxGPFwR9jEhFDg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 06 May 2025 17:21:20 +0200
Subject: [PATCH v5 02/12] pinctrl: remove extern specifier for functions in
 machine.h
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-aaeon-up-board-pinctrl-support-v5-2-3906529757d2@bootlin.com>
References: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
In-Reply-To: <20250506-aaeon-up-board-pinctrl-support-v5-0-3906529757d2@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvt
 ghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Extern is the default specifier for a function, no need to define it.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 include/linux/pinctrl/machine.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
index 673e96df453b..93aceb92681b 100644
--- a/include/linux/pinctrl/machine.h
+++ b/include/linux/pinctrl/machine.h
@@ -153,10 +153,9 @@ struct pinctrl_map;
 
 #ifdef CONFIG_PINCTRL
 
-extern int pinctrl_register_mappings(const struct pinctrl_map *map,
-				     unsigned int num_maps);
-extern void pinctrl_unregister_mappings(const struct pinctrl_map *map);
-extern void pinctrl_provide_dummies(void);
+int pinctrl_register_mappings(const struct pinctrl_map *map, unsigned int num_maps);
+void pinctrl_unregister_mappings(const struct pinctrl_map *map);
+void pinctrl_provide_dummies(void);
 #else
 
 static inline int pinctrl_register_mappings(const struct pinctrl_map *map,

-- 
2.39.5


