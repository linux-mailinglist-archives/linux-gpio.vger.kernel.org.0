Return-Path: <linux-gpio+bounces-28954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19231C79F1B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 15:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id DFEC436825
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 13:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5903350D67;
	Fri, 21 Nov 2025 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X+eHXmBv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777E52D73A4
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732818; cv=none; b=iaT4f4ur44Q7kDcP9gbCL+OYt5soZcaFjJJ9TZyqgYPUbweFOGrq5fWPPSZrhv4rCDkDTf3aXTDeoAnMAJDPuxx7zOZmlFvQKm0TcA750zobFEOrg6ZmHntjjMDL3WRC1bah2OwuADWzS4oCIzUUp7MsxjmCTUqLHk4HB3nZQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732818; c=relaxed/simple;
	bh=FefB8Oa165QcwPjxAwa19N04x26PcV1dV9ghQDSDEKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I/FW1j/17ykoTYIoL2e/n5O3hQg00yA8eUV8GNkXG9jQTvf+211hS/UI8Mr1f1em2ORKOJv8YiJZCUuSiWWN0rD7MDQTdNv2j/bs6MwjnV7fSI74xHvRPzMkR1Jum6olo2f6Rverrl1OFhRvron1i35kw4oCgYde/gGIus7hi/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X+eHXmBv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a1c28778so23356185e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 05:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763732814; x=1764337614; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaEPcePt981dVwwnls49VRiHkn8PVQt12TDY2f0CvzU=;
        b=X+eHXmBvgwmdgMKDJpZ2bifUYJbKk/RYZEWCpeq/iYPKHmFAmtHZLjXFjJS60BF67w
         otYc/5XvOyYh0Gu/nfavWpBuuwXxbPspw9DV3rgdbI36CbvIzOC62bbjrHKWQtMWIq+/
         mVBTq93LSm5XxmZo59SxeNjVukRAMvuBDWdEEAo+f1LZu/42pON20E2kUs1crpjYS3K5
         Qp3iJ5jaebTtjOwBFuNYdp0Qcrx/wmPAXa/NRb1PVahQjVLyEjy0Pz5iaZ3UK1hf2iDD
         Sjtf5vJ1HxL5YxoaezoSXpulvvUJ2qDJuOyuGC9VBhiGe1XCMGNiyMQYiziK+iRIcN6R
         yYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732814; x=1764337614;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaEPcePt981dVwwnls49VRiHkn8PVQt12TDY2f0CvzU=;
        b=JeIp4oUxluHgWdQ7Fbt6VnEeWTGF/9xm1tUI6JC47crn3IABhnna/hrN4pSAwYShgB
         cHj2xWZGqn6I5ZMUy3gy5NuHpdMLQCZaxbLeSBpMb2KpDKWfEKPXHfojy/5fevgpnvrp
         lf+7hX4eEEGfdMeRSw22BRKLs6RyZRdg0RhPnxwkoIkM9T/BQwBA+drFxJ+gJT3WtY2q
         JwZRd4ZQrTdd+8is36LKHAwv65gTykiyao3kXU1WQamdUHKKqDmbWpvXq/vfkQ0+lR1t
         RhvbEaHOM3ZdmTEYzJ5LTrQLMg5SW32eLBV1yJMAIGliBuqENwpzI31vJwbwWIgr3teh
         khyw==
X-Gm-Message-State: AOJu0Yw57L7t4GvdCAyKnubOMz2zl+UH6hn5DLaDGYxdVcEyHt+BnHBN
	JYAiXWIAut3J0DGJAuTeu0AKtYGTGHOg+ikEVzQC2Jg5RKM6youszdZScJ9QRZjXZL5GF8d20CW
	VULzHMBNqVA==
X-Gm-Gg: ASbGncv3BaRAd8C8TXjq3k+SW5MWkr0MKmBFCZ3Ea9YYzjo6w4L7HPRE3zuva4ynoiO
	Vf2RJDwHwYH68Q6NuOSiWm/ZXXNo43NY3QHgcWT+5vG5rO+fXJcYye+rnWpAmVqTs+NZR/AudRh
	kYYOg/0Feta6LdTU8eum88ev83ICGhWAih8mCtZT0F3d/J/0Jh2/OwNxkadWIcCZ+XdUIwKiXpt
	b3QGr+uiKfZpav5qEoWFGEvnqS8weOJLpZTvEa/1ZU0JTKvMV8+Ickzg2KhwdK0Mtl6sMuKcw3+
	VBQpI9onmmhRX74QQr80mT5WbKVW+bDYtimBO6j2tc1cyUQJNQnvQ3Qr/OCbwVt2idczDwQqnCP
	ggtfOwfgMogYmRpxuj7UXGVPzsv2Tjw1l8i+iz8pzGD8KSRR+PTUmHHZPpzFSue6ee8B2BSS9du
	Fup0LVOQ==
X-Google-Smtp-Source: AGHT+IG1IDA9LyEdnJY0Cwy4g36lQtjE3/pcaWfz37nHT+TWsKr+STHJEDzj6iLqyGPcCYccI6yU6g==
X-Received: by 2002:a05:600c:444d:b0:477:3f35:66d5 with SMTP id 5b1f17b1804b1-477c01df3a1mr22712665e9.26.1763732813889;
        Fri, 21 Nov 2025 05:46:53 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ab1f:63b4:bcef:12ba])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e432sm10712844f8f.9.2025.11.21.05.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:46:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Nov 2025 14:46:44 +0100
Subject: [PATCH] gpio: shared: handle the reset-gpios corner case
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org>
X-B4-Tracking: v=1; b=H4sIAENtIGkC/x3MQQqDQAxG4atI1gaagUrrVaQLZ/xnDBSVpIgg3
 r2Dy/ct3kkOUzj1zUmGXV3XpYa0DaV5XApYp9oUHuEpEoTLputXI/s8GiY2OH43ctaD0wvSSXz
 nLkWqj81Q+f4Pn+v6AzijE59vAAAA
X-Change-ID: 20251121-gpiolib-shared-reset-gpio-fix-c8e161b9f6cb
To: Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5123;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=O+8PieNk55lnbjyGEdqrNeBbrr42Vyrq9aoUliMf1bI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpIG1JrkeQS6/dOV/t9+xvO5M+FBFzbYxvZawDg
 ZX0r70gpfyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSBtSQAKCRAFnS7L/zaE
 w/JWD/0Z39ASJ9IT8wtlKFQ24PPmdcql1wFRWmFe6bjWiTjxSfTDQMQDvfWFspEBN8Ub0I0v1sy
 Yvx995chXF5qflunWmAGkMHGwHkSiJzBS7p8h4/P5KaX1ALmaml6dGSedrCaXKJf4kn9uWJUOmm
 r2/hb9y/j45NBkOmVClDSbek4xhN5tUX5v2jmeaqPcIGMU4xGENRDKGAjUOGQhyDR7A5IVMskQL
 cQUMBHOstzMmlsEqSjWFbnnUD9B0/bG7N7mvz0jjcHowIYG+EuRuQKt4OyVRMoPcQyKE0aevNax
 avzucxAkQa36/jF2OZlXdAG5gsub4X9X6dk2bOYw+T/U8MrX85R0ys1qqr/eF3bTciwUNfuQTlH
 Oga74Q7H3Oau3NJKNOFWcc5yR6vzY2Hya0In+zoGnQ8kUuFjlCIAQUCKAinEZhruXMGjRdn3G4S
 hUMvjqpeiQjsIFr/cYarp0RAwLvOLo1hlFG5HPwzcxdPDy/03uo56mplHnsC6jL19eeStqkLHFC
 EVnDUMpS3dHcB+NWc2nbYgG0ec1hfYBgPMSfqBRrgAEvWhw503Z2WtMQUUhi3qjDsaeoLBkVGHX
 ha0PndiGeZB08ccCKguYlGp7Iwx4vfphktYFH5JZ+82Pf7CUT9vg5/K+C99OOMaPS3hmskbKb2m
 hiU6KefkOF3xbSA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's an unexpected interaction between the reset-gpio driver and the
shared GPIO support. The reset-gpio device is an auxiliary device that's
created dynamically and fulfills a similar role to the gpio-shared-proxy
driver but is limited in scope to just supporting the "reset-gpios"
property.

The shared GPIO core code does not take into account that the machine
lookup entry we create when scanning the device-tree must connect the
reset-gpio device - that is the actual consumer of the GPIO and not the
consumer defined on the device tree, which in turn consumes the shared
reset control exposed by the reset-gpio device - to the GPIO controller.

We also must not skip the gpio-shared-proxy driver as it's possible that
a shared GPIO may be used by one consumer as a reset-gpios going through
the reset-gpio device and another that uses GPIOLIB.

We need to make it a special case handled in gpiolib-shared.c. Add a new
function - gpio_shared_dev_is_reset_gpio() - whose role it is to verify
if a non-matching consumer of a shared pin is a reset-gpio device and
make sure it's the right one for this pin. To that end make sure that
its parent is the GPIO controller in question and that the fwnode we
identified as sharing the pin references that controller via the
"reset-gpios" property.

Only include that code if the reset-gpio driver is enabled.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Val Packett <val@packett.cool>
Closes: https://lore.kernel.org/all/3b5d9df5-934d-4591-8827-6c9573a6f7ba@packett.cool/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
This is targetting linux-next where the reset-gpio driver is now using
the auxiliary bus and software nodes rather than the platform bus and
GPIO machine lookup. The bug is the same in both cases but the fix would
be completely different.
---
 drivers/gpio/gpiolib-shared.c | 63 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3803b5c938f9933dab01c6d777c349ed3b42ce9b..5d06ec66f55eb1478950caa01cd4b680ce606c52 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -253,6 +253,66 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_RESET_GPIO)
+/*
+ * Special case: reset-gpio is an auxiliary device that's created dynamically
+ * and put in between the GPIO controller and consumers of shared GPIOs
+ * referred to by the "reset-gpios" property.
+ *
+ * If the supposed consumer of a shared GPIO didn't match any of the mappings
+ * we created when scanning the firmware nodes, it's still possible that it's
+ * the reset-gpio device which didn't exist at the time of the scan.
+ *
+ * This function verifies it an return true if it's the case.
+ */
+static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
+					  struct gpio_shared_entry *entry,
+					  struct gpio_shared_ref *ref)
+{
+	struct device *parent = consumer->parent;
+	struct fwnode_handle *remote;
+	bool ret;
+
+	if (!parent)
+		return false;
+
+	/*
+	 * FIXME: use device_is_compatible() once the reset-gpio drivers gains
+	 * a compatible string which it currently does not have.
+	 */
+	if (!strstarts(dev_name(consumer), "reset.gpio."))
+		return false;
+
+	/*
+	 * Parent of the reset-gpio auxiliary device is the GPIO chip whose
+	 * fwnode we stored in the entry structure.
+	 */
+	if (!device_match_fwnode(parent, entry->fwnode))
+		return false;
+
+	/*
+	 * The device associated with the shared reference's firmware node is
+	 * the consumer of the reset control exposed by the reset-gpio device.
+	 * It must have a "reset-gpios" property that's referencing the entry's
+	 * firmware node.
+	 */
+	remote = fwnode_find_reference(ref->fwnode, "reset-gpios", 0);
+	if (IS_ERR(remote))
+		return false;
+
+	ret = (remote == entry->fwnode);
+	fwnode_handle_put(remote);
+	return ret;
+}
+#else
+static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
+					  struct gpio_shared_entry *entry,
+					  struct gpio_shared_ref *ref)
+{
+	return false;
+}
+#endif /* CONFIG_RESET_GPIO */
+
 int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 {
 	const char *dev_id = dev_name(consumer);
@@ -268,7 +328,8 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (!device_match_fwnode(consumer, ref->fwnode))
+			if (!device_match_fwnode(consumer, ref->fwnode) &&
+			    !gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 				continue;
 
 			/* We've already done that on a previous request. */

---
base-commit: 6d12dd55830ab67dfd8569ff86322f949a1ac916
change-id: 20251121-gpiolib-shared-reset-gpio-fix-c8e161b9f6cb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


