Return-Path: <linux-gpio+bounces-25625-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF78B4472A
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 22:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36208581C66
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 20:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A95253F05;
	Thu,  4 Sep 2025 20:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b="suPBrdPb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 3.mo583.mail-out.ovh.net (3.mo583.mail-out.ovh.net [46.105.40.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3627D77A
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.40.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017169; cv=none; b=epgdiFoLvJHo6n5kTvErZxRIzKfPJaCoG21L7Fikx0iaytJQ+4J20XTFZF1TNU3UZ1YZtNoIRJ/zYFOnW/gFAqGc45hJNmyEsyhzeHJrMkzg4GHqvj9f7/eqWLH0AvesPyeDmeChq6AU8jHsOXpvXZNPpDENaOoTFSA71SUlqQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017169; c=relaxed/simple;
	bh=9zcNQP9m+mY9M0THwqxOYRx5V0BtNFsXoxQfLjlPZdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DpaLG7HVP8D7RTAm5kEHYcg+vy2/SBmXQpGM/tUoqHAvgNcXbs6yX7nYQ2ln3gXM2zwI6xKkEJj1EiQ1aZB3iML9SclUxhZNklDz/0hpvfrbW11qCR6b7ZLH2F6OIHZU12OGPgFKoFrQvDdZF474f/ngz8hEZ87QQwyphYvDSHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com; spf=pass smtp.mailfrom=armadeus.com; dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b=suPBrdPb; arc=none smtp.client-ip=46.105.40.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armadeus.com
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.54.180])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4cHld84xX1z6X06
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 16:42:20 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-v9gcr (unknown [10.110.118.54])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EFDF7C02DE;
	Thu,  4 Sep 2025 16:42:19 +0000 (UTC)
Received: from armadeus.com ([37.59.142.108])
	by ghost-submission-5b5ff79f4f-v9gcr with ESMTPSA
	id xzN5MmvBuWjlnwAAJZEplA
	(envelope-from <sebastien.szymanski@armadeus.com>); Thu, 04 Sep 2025 16:42:19 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S0025b848ee2-3489-4988-acd6-dcb84b63b1b0,
                    86F439A93EF419A5F8DFEFFE961FF85F9AC47286) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp:86.243.209.203
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 04 Sep 2025 18:42:07 +0200
Subject: [PATCH] HID: cp2112: fix setter callbacks return value
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250904-hid-cp2112-fix-set-value-v1-1-17d2e26dc8c9@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAF7BuWgC/x2MQQqAMAzAvjJ6trAWBfUr4mFsVQuisqkIw787P
 AaSZEgSVRL0JkOUW5PuWwGqDPjFbbOghsLAlhvbWcZFA/qDiRgnfTDJibdbL0Fqu9a5RmxNE5T
 8iFKEfz2M7/sBV+n8tGoAAAA=
X-Change-ID: 20250902-hid-cp2112-fix-set-value-1898aa5e041f
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 13937514947645991849
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeihedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfuiiihmhgrnhhskhhiuceoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeetudffuedugeffuddvhfefjedufeejleekgefhjeeuuedtvdegheeikefhleehgeenucfkphepuddvjedrtddrtddruddpkeeirddvgeefrddvtdelrddvtdefpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=0FeKAQxjy6vo6196zHIUsEHi4EuwsIHIs8qqJrNf2iA=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1757004140; v=1;
 b=suPBrdPbNHYAteDart3sbrNHPZP3kovOzIj9XBwisohzZ1T03wPjNOcs0TtYN+av6DbCJHkO
 P0IJa9qCE3Gu2a6LYSMjYb1uRKR4LxntG7BHLmB3lJHOu39OMky3E9zKG/XtNepLs3oepzIMLnH
 iee8RpdTizQp4+wkGG8B+zCbkM9aYe7c55OnbaRKLh0/gVumkfVBtHYoPwgTbnXRgEubzqKo3x2
 iE6g6tludTpHI87vXOoV9ycUnxMIIw+ZXwMVPQ4Cp6QWsXCTJ8tm40jjgqLh0FRKOUkYspE9g5I
 cZvDIZSbnlt9BsQ+r0uGdCz7MWWY/xJCjXVYUJD1o7VuA==

Since commit 6485543488a6 ("HID: cp2112: use new line value setter
callbacks"), setting a GPIO value always fails with error -EBADE.

That's because the returned value by the setter callbacks is the
returned value by the hid_hw_raw_request() function which is the number of
bytes sent on success or a negative value on error. The function
gpiochip_set() returns -EBADE if the setter callbacks return a value >
0.

Fix this by making the setter callbacks return 0 on success or a negative
value on error.

While at it, use the returned value by cp2112_gpio_set_unlocked() in the
direction_output callback.

Fixes: 6485543488a6 ("HID: cp2112: use new line value setter callbacks")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 drivers/hid/hid-cp2112.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 482f62a78c4155a50cceea3c8894ee5959e9aaed..5a95ea3bec9805453712b7b9e3d3fefec2351822 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -229,10 +229,12 @@ static int cp2112_gpio_set_unlocked(struct cp2112_device *dev,
 	ret = hid_hw_raw_request(hdev, CP2112_GPIO_SET, buf,
 				 CP2112_GPIO_SET_LENGTH, HID_FEATURE_REPORT,
 				 HID_REQ_SET_REPORT);
-	if (ret < 0)
+	if (ret != CP2112_GPIO_SET_LENGTH) {
 		hid_err(hdev, "error setting GPIO values: %d\n", ret);
+		return ret < 0 ? ret : -EIO;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int cp2112_gpio_set(struct gpio_chip *chip, unsigned int offset,
@@ -309,9 +311,7 @@ static int cp2112_gpio_direction_output(struct gpio_chip *chip,
 	 * Set gpio value when output direction is already set,
 	 * as specified in AN495, Rev. 0.2, cpt. 4.4
 	 */
-	cp2112_gpio_set_unlocked(dev, offset, value);
-
-	return 0;
+	return cp2112_gpio_set_unlocked(dev, offset, value);
 }
 
 static int cp2112_hid_get(struct hid_device *hdev, unsigned char report_number,

---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250902-hid-cp2112-fix-set-value-1898aa5e041f

Best regards,
-- 
Sébastien Szymanski <sebastien.szymanski@armadeus.com>


