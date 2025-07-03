Return-Path: <linux-gpio+bounces-22759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B7AF817F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 21:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEE4B1C8851B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 19:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1782F5C41;
	Thu,  3 Jul 2025 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="yBzBlY8L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AC2DE6EE;
	Thu,  3 Jul 2025 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571730; cv=none; b=KoVbYsL34vY7dOl8nFseHf81GZigYVkEaM40aOl1N/wJZMiFN99KFfJ6mRa8fGzcY1B1gWU5c73+2jWHGPSXAAvfVrHduubJI+uQyaaPjQECLvs3JQCdKT6n60spkAJF++zgrRJlVx5ZJAq9bTxoNbSdktoA/R6305PF2Pe0E60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571730; c=relaxed/simple;
	bh=ZPgvTQEAtNA5WcOn6LUP1VJstYlJfcMlYcQavNL3cmU=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=AluQHQzlG77afKOg+miA/I+oX3IEqmD5m4/JdKRMzJv4BIfFPAirShiRxQZFo9BpMNxw7gJWz5+2nYmD2jRvItbxNvnQMFdLJglaFpb5byUrJdonQHnq+/VVMbnftXIBhWc61kATam3QKn7ejz2A1WeyjghFzWO0+mh1NqkKNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=yBzBlY8L; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=za2z2+bViAfwIYdsI8uZdJAEJbOJgv4ShAC1Qa9i2PQ=; b=yBzBlY8L+Hq0u3FKAaG2PJYygN
	9bvf4D7N/ZkkxD30jih6NcYUiizYXBCiWK5Mf4WH2bdzl9wJNF03KetpYpkUbiFYPHS26jYsoP4Tf
	Bv/lNksTMaU7vRLos21Vtwo7pahVYuzGmnKUq+0UC+mGDs02/vd3J8rSmGjHYG3C/SiA=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:36484 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uXPS4-00069V-Gh; Thu, 03 Jul 2025 15:18:32 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu,  3 Jul 2025 15:18:29 -0400
Message-Id: <20250703191829.2952986-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] gpiolib: fix efficiency regression when using gpio_chip_get_multiple()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

commit 74abd086d2ee ("gpiolib: sanitize the return value of
gpio_chip::get_multiple()") altered the value returned by
gc->get_multiple() in case it is positive (> 0), but failed to
return for other cases (<= 0).

This may result in the "if (gc->get)" block being executed and thus
negates the performance gain that is normally obtained by using
gc->get_multiple().

Fix by returning the result of gc->get_multiple() if it is <= 0.

Also move the "ret" variable to the scope where it is used, which as an
added bonus fixes an indentation error introduced by the aforementioned
commit.

Fixes: 74abd086d2ee ("gpiolib: sanitize the return value of gpio_chip::get_multiple()")
Cc: stable@vger.kernel.org
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fdafa0df1b43..3a3eca5b4c40 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3297,14 +3297,15 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 static int gpio_chip_get_multiple(struct gpio_chip *gc,
 				  unsigned long *mask, unsigned long *bits)
 {
-	int ret;
-	
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
 	if (gc->get_multiple) {
+		int ret;
+
 		ret = gc->get_multiple(gc, mask, bits);
 		if (ret > 0)
 			return -EBADE;
+		return ret;
 	}
 
 	if (gc->get) {

base-commit: b4911fb0b060899e4eebca0151eb56deb86921ec
-- 
2.39.5


