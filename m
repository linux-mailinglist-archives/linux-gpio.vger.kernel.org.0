Return-Path: <linux-gpio+bounces-18692-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED92BA8610E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 16:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A9908A6930
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272761F7554;
	Fri, 11 Apr 2025 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xq/UAxUK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7485537FF;
	Fri, 11 Apr 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744383155; cv=none; b=EU3ss2285BDYJTSsBSiTr0Ai8vP2ThZw1k8pfe6j4hHVvpA2Y3sIaqSw3U+4Eaw+afW5z0sU573Mf5DBuyAd7mJcfF5Smt5Vi3mRknwg//uwmPWZZJXgwUt8kGW4r45r7zlQRWzegA4dnr/qQffcFgA159+3fDlgvn4ip47NEA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744383155; c=relaxed/simple;
	bh=B7cRh6flxc3wDyyTeZFBhXdqljBYzOjL9IBWbznSorQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NANerUmMbZPzGF0C8Le2aIK/gXbID0p6PbCbpsltexVonC9/OmRBUYSpa1DGmWIIwzh4HUYOJplZ5lrVxuSKDfuG0E6q8VAQByk29yQty5fz7hsZ0CjYzER4kJamJ0kpVGFF3tXJrqEu42DHuG1iuIbOtFVD3FbgN3hRFgJXHpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xq/UAxUK; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7866C43846;
	Fri, 11 Apr 2025 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744383150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5WQj8JYIDKZIiU5BLzr8VSWJkkvHXrsWHxGSKXKhNz4=;
	b=Xq/UAxUKEca5FS1wbJRQN/WGzbGua7wdXp/xnJGSERiHx/dw5Re9qjsuG5pQBpJ5VCdBzc
	8xu0s5C5OSaUpKm2yxK4I5yny4rpww3JndLzOCaiN2lbH7Ciaw2H4m6LHl2ZXhIYx/pPyO
	Vlx1zJ2xcFXw8vNnNynHgkOkMUrUl1p7BExm2j1+2fmOLT26lzuV6rJz4F+IriBMP3iKCC
	yL7XcMlyuUhLeSNC/YW0UZLd+SpgZ6oClFQN//gr6OzXJuGaLgKMAkyNT53I8FW7+etiFR
	spOcSKKF8FHN+HwiYRtQnQyR/UTUmQGcuBaj7wLZi0dTyG5W7sgLeaN/ILod5A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Fri, 11 Apr 2025 16:52:09 +0200
Subject: [PATCH v2] gpiolib: Allow to use setters with return value for
 output-only gpios
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-mdb-gpiolib-setters-fix-v2-1-9611280d8822@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJgs+WcC/4WNQQ6CMBBFr0Jm7Zi2orWsvIdhQekIkwAlbUM0p
 He3cgGX7yX//R0iBaYITbVDoI0j+6WAOlXQj90yELIrDEqoq6ilxNlZHFb2E1uMlBKFiC9+o71
 ro2/GKKEFlPUaqOij/GwLjxyTD5/jaJM/+7+5SZToqLsI1Vld1+JhvU8TL+fez9DmnL8jx3hBw
 AAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744383150; l=1462;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=B7cRh6flxc3wDyyTeZFBhXdqljBYzOjL9IBWbznSorQ=;
 b=XlcqQPOGKCYQh051bTYIKWVhhv6s3D0dQvElenhZ88XXUe/UN7ogyvti36ApuR+ocXMafBHbW
 E6pdlZSI99WDvI10QdVOV56X4h4p5m5yGE7KmGxsNVZQass1/nwY8Sl
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeitdevuefguedvjeduieeludekudeiveffueektdehfeevheeugffhhfdtgedvgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvq
 dhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com

The gpiod_direction_output_raw_commit() function checks if any setter
callback is present before doing anything. As the new GPIO setters with
return values were introduced, make this check also succeed if one is
present.

Fixes: 98ce1eb1fd87 ("gpiolib: introduce gpio_chip setters that return values")
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
Changes in v2:
- Add Fixes: tag and Cc: to stable
- Link to v1: https://lore.kernel.org/r/20250411-mdb-gpiolib-setters-fix-v1-1-dea302ab7440@bootlin.com
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


