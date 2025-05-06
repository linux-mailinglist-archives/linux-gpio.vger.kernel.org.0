Return-Path: <linux-gpio+bounces-19694-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3FAAC958
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 17:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A2381C2747C
	for <lists+linux-gpio@lfdr.de>; Tue,  6 May 2025 15:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163142857EA;
	Tue,  6 May 2025 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YAPFuodd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B4C283FE8;
	Tue,  6 May 2025 15:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544899; cv=none; b=NJkeGcVcW3diSXLtB3NZNfsudu+T+uqf8F/TRM+aNC8qifF2rPXgMMerehBcoq4SKsJaJoCnQr9FvhdppS5T4Y2beVKdS4gBJtG+/w2HLnF76DFWEcL4A2Go1z2Rv9qeqyj5LB2PUFP6P4fcFd62Pj64EUifRHa7pRGID5vvq5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544899; c=relaxed/simple;
	bh=c/VjgngVldLlTaqu+7JoDMmHcqtvz8kBdxTEdrJXtao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=swlinQzHTm2mu3q/LZg3HvMmTq2u5HNaz7WEYYtZyltuK9bY3OGAO597fIFy5TY/JOW//Ms+Sqe9KmfhiGy+fVhI7v5iXPI4dXYJIyQU3BF+ExUPSF9UA98PTC8RXh6KIegcfXurD6NgAz4jIrDSmPh+3/72bsozK20FvoHhRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YAPFuodd; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37EE6433F6;
	Tue,  6 May 2025 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746544891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+O5hiCoC5alHeoniheaAHRlGSS5BBU+n2qDYbHK6bQ=;
	b=YAPFuoddlkbXsIPfeWeEilcFsuMsPNOdQ/1ftgT6Oabh3EOK3SqnU06ll94uh7nMOZq3t5
	zrB0izfFa/+tsyS9Fb6ssaZQTz2MtpOapeLngQKwXCjp03vQYOfktPejg6nq0rBpAozlyD
	0zorhyU71FyyJbQ0cad/AwLEPb1qGmxxdDiadJApI9mIZyv+EjQRIxfX4jqCQiXxV8/ZFd
	p/zvwMNzUFzeFuZgZm5v6si3spTnxYayUWprVvIhnIBj6mh2Q1iKRP9RG5eoH5bKo3oUNd
	mN2npZ4oyAUNOaXT9vi/BXUQ1QZ+bb45vPSNATgjK93v435eQzy9SZnwEtXTLg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Tue, 06 May 2025 17:21:29 +0200
Subject: [PATCH v5 11/12] lib/string_choices: Add str_input_output() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-aaeon-up-board-pinctrl-support-v5-11-3906529757d2@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeegfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepvfhhohhmrghsucftihgthhgrrhguuceothhhohhmrghsrdhrihgthhgrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeektdehvdeiteehtdelteffheduveelgeelvdetgedvueejgefhhfekgefgfeduveenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegutgekudemrggrugdtmehfuggtrgemtggtudgrpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehthhhomhgrshdrrhhitghhrghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvt
 ghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.richard@bootlin.com

Add str_input_output() helper to return 'input' or 'output' string literal.
Also add the inversed variant str_output_input().

Suggested-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 include/linux/string_choices.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/string_choices.h b/include/linux/string_choices.h
index f3ba4f52ff26..a27c87c954ae 100644
--- a/include/linux/string_choices.h
+++ b/include/linux/string_choices.h
@@ -41,6 +41,12 @@ static inline const char *str_high_low(bool v)
 }
 #define str_low_high(v)		str_high_low(!(v))
 
+static inline const char *str_input_output(bool v)
+{
+	return v ? "input" : "output";
+}
+#define str_output_input(v)	str_input_output(!(v))
+
 static inline const char *str_on_off(bool v)
 {
 	return v ? "on" : "off";

-- 
2.39.5


