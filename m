Return-Path: <linux-gpio+bounces-18688-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE688A85A10
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 12:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E35DE7AAA27
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAC81EFF93;
	Fri, 11 Apr 2025 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ToaC4srx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82A817D2;
	Fri, 11 Apr 2025 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367507; cv=none; b=pcJeGBhGAVUVGTnNV8Z+AgNAfH5AgKdP9HUeGFYNwPwcLKORAVexoAHQ9YXanI9Fs2XU2AHrs3Gm7wrL34e/CtIq/95gVzzuA20zXDhU8Cu3+qJ7Da/8aWAuNxCJ8vkF10JsGKJk4Mi3lI5v6xZwTP8kI5MU1ysGQ6tG2gdsM/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367507; c=relaxed/simple;
	bh=mgLQV5uAKAvv+GTeLSY7oMWXtIySXDDC4YJ+p8Ya6ZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TOOdhiRcdC1N+tVBbflb1lO7r0M7Q4dVAn6XsbFpyfBlCjraFpfbe27/WruMmMe8f+JLFX7DgFp1kVBA+qwSaTMPQlNBRGEb6d6/IvCIoUeO4AxvVeTLqAL9tl4LHiZ1n/XQexZS1AXati4jyTujRII5fpRSXaI1kUEtqNsozP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ToaC4srx; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 573D044202;
	Fri, 11 Apr 2025 10:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744367495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ARsEBlS8z/DGHFLMU+KwhsYSblcxTkzggGQ2KHsh9wo=;
	b=ToaC4srxEBa8riX4ocTC5BjonR1PG8bAwDr+36+3NPzaqzrMHRzz43zilfdL118em1CJ65
	bfXaIznETkP8kUbr9NyXdcZTUlN5Qw4XDMhun3LbBMxJUg6ISp8fpPpzXN9oRiwbNusV4d
	6OOmlwv/cfaGArD3ncT2NPCAqNgWoegmAHoz5tCSV2KExB7kAmU0Y0S1wik40JGxGTPAev
	n9rgjZ7Udmw89E9YSRdJWfWtBSgfy20oyuxVGod5dLiOWkNP0nL5pAHhZi7YOGz+T0/pg7
	x7RfFnBSi+opSPqRME9+mmGUPBbeygK5P969FlIe2F9OP5HfCexl91/D8OP6xA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 11 Apr 2025 12:31:08 +0200
Subject: [PATCH] gpiolib: Allow to use setters with return value for
 output-only gpios
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-mdb-gpiolib-setters-fix-v1-1-dea302ab7440@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGvv+GcC/x2MSQqAMAwAvyI5G2iLWutXxIPVqAE3miKC+HeLx
 xmYeUAoMAk02QOBLhY+9gQ6z2BY+n0m5DExGGVKVWiN2+hxPvlY2aNQjBQEJ77R19bZyjmjrIJ
 Un4GS/s9t974fgSFo02kAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744367495; l=1220;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=mgLQV5uAKAvv+GTeLSY7oMWXtIySXDDC4YJ+p8Ya6ZY=;
 b=UtMSaoH/2qToKJFTuelYmZK1a6qVUgW+XIwIl4l5hynX5h+QxQXB81tMsk+/t098QEYqc5VcB
 4qphVuVqy1ZDV48s+RTvIaj4x8r8TJdBzQ94n9X+iWI2f8TwBTgFn4w
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvudduheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelledtieffheelveefueffkefgheevvdeugedutdekfeeghffhfffftdegudfhteenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com

The gpiod_direction_output_raw_commit() function checks if any setter
callback is present before doing anything. As the new GPIO setters with
return values were introduced, make this check also succeed if one is
present.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b8197502a5ac..cd4fecbb41f2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2879,7 +2879,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	 * output-only, but if there is then not even a .set() operation it
 	 * is pretty tricky to drive the output line.
 	 */
-	if (!guard.gc->set && !guard.gc->direction_output) {
+	if (!guard.gc->set && !guard.gc->set_rv && !guard.gc->direction_output) {
 		gpiod_warn(desc,
 			   "%s: missing set() and direction_output() operations\n",
 			   __func__);

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250411-mdb-gpiolib-setters-fix-b87976992070

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


