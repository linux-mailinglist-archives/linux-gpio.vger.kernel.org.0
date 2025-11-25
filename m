Return-Path: <linux-gpio+bounces-29061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18D3C846B8
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 11:19:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46BC53B020D
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 10:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2091E29B22F;
	Tue, 25 Nov 2025 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ah3Z+H5K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AA0231836
	for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764065960; cv=none; b=bp0LK7gmfrdjo9lm1iHzTqdt296qBzPlWwhPbZOw4G87TFjjMogpXYBySN9+lXze9doVETxVMtSpoB3EbnAhpJZHYRkUtuT+iimw7UTa9yPxusO3LbZG8XeEBXlOvGd5X1HSWg+u2URZ8Uls/p1ReJ0yGBuYCOJKuSl/ABJiEns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764065960; c=relaxed/simple;
	bh=4TjQoesRtOi9VvDdWCFJB2g5O3xdH21QKzdf450490I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KTLf+kKn4niOu9zIbyJ+eY40EMPdbERaDt+QSJg4zwyPLPod/rZDdBSWheQh1z1+k/RUGxSfE6wOHPOgmTz7oUEDvCG5Yyf7abxQ+0RBTA73UrylTtvR98Z3nz5ikhy8SbA31Tr9xV7igK1bHayM4E9SXicCmqTfq9q9NL+LR2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ah3Z+H5K; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3720e58eso4035952f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Nov 2025 02:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764065957; x=1764670757; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHsazSRjBBdLw/5wTjNE+V06skEMqfKGBJCeXidVHP8=;
        b=ah3Z+H5KCFIwNFETk3M6EMhMJ5eG7tk5xaTsszAnRGNliWPgFlWyL153zr6GRBKdjN
         PpZ/EJeEo/IIlP+SEm02NxXI53UEb7S568TxvRJfhq8nRirF4IXnLTTSZCOCtjyArktD
         a2nYDnWZRJ8y18hK23MMLJr8S2fz3Am9dYtwK3qssyP15C9n5fGM8/8a7R0PaKInk+Vq
         /WtYUO7tvw+ueTXRWhPzCIW83Q+f9rUaLEzXypcOrRPK5tCt7Q0hb3WU9YtduE/wpile
         Z8kcSKvae4urDrmAsFxyexdqN74FE1dSDAB+i+rtSPg8nivuHWfs8+t9akXCqUsZS//v
         gEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764065957; x=1764670757;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHsazSRjBBdLw/5wTjNE+V06skEMqfKGBJCeXidVHP8=;
        b=DrUPpP3YC4MlGh69Zo/fYXIIJ58J39RAiLCxcIoxh7IbwnlPU+D83HDPVCabNlr2sj
         kcF1wPEpCRctDIi4hlCZThfX/6TY1zpE4iy5+kUNvF4UEuoQut+3hM2opV+xgMhd0tki
         +iFa95XcR/wUGePBdbklKcRIlwqH3Wd5ymw6kOkgROFHcdgHOxqASQnVKf2GGMQtdp/U
         7aOZQWELrlI4FC7r/OeQy2x+IwbPquZd78R0nVwr7dCJpOHzvezdUb1noOTiR8G/9Kif
         F23fojL4OYPnQoQIY7Tga1HX3uy09f0+KKN4Dw7i5+6WqQ4ApiWAdbAXrCD9j9V4Y4yI
         djjQ==
X-Gm-Message-State: AOJu0Yx3iZ6nQtv36mfduoB7+Y+02WEtbd6dttGc0fBWM5cns9dwDQ+D
	cnglOQ/eZRCT3wr8qlzX9Oh3/IUuTF1s11JtLd8Tnf5JinoheagmXGAeuIM8ZlpygGk=
X-Gm-Gg: ASbGncvkah7yrpfRZexOAs59OxsZDhuUZi19zluD9kbdggD3NwA9jFW3Jf8OM3HqlL9
	J1QSQJs7+PAwyh0InB+rv5B4MHhw8KG7VuE5m8s+uayA1s07PLNvdF9ZPv6j5lUsCk3Rc4udOhK
	mzQSHhZEBK3cOF5wTSAC6veQSpLeNVuy9QC9ycBxOahhGYudcKVhtxEvUD1qOTe4x7CS/eLJpph
	XXluZmXj7IDTH+NT/SZLKoJqCraev0iCijDQV36nmsvlZCoP9tF3ruzx5sSjbUOHDS/525bdl85
	UkiSjRJmbjsrW9nHnQMZoucE+QvUjvxP0Gb+uctv+YPa9wbWySnTPQQBCclgYBZJnEo7qumMpJN
	VfDMXrsBwHiljltJ3fWknMr8FU3Ps5OWzIcOcxOXrHZg0RnME0Bv2ZHmz8rbI0KV7t3aD67fybt
	sMSwpDVQ==
X-Google-Smtp-Source: AGHT+IElDzPPFo4R1Ku7VyEdXDsLFVn8Cz67qhPRUicZhyExrx80sPETRT42LzKc2vysci1RyB+4NA==
X-Received: by 2002:a05:6000:1789:b0:42b:3ccc:91ec with SMTP id ffacd0b85a97d-42e0f2047b3mr2147500f8f.22.1764065956581;
        Tue, 25 Nov 2025 02:19:16 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:df0c:79ae:5345:c3b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8a29sm34001497f8f.30.2025.11.25.02.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 02:19:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Nov 2025 11:19:09 +0100
Subject: [PATCH v2] gpio: shared: handle the reset-gpios corner case
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJyCJWkC/42NQQqDMBAAvyJ77hY3WGt78h/Fg4kbXRAjGwkt4
 t+b+oIeZw4zO0RW4QjPYgflJFHCksFcCnBTv4yMMmQGU5obkSEcVwmzWIxTrzygcuTtlOjlja5
 hqsk+fO0s5MaqnPXZf3WZJ4lb0M+5S/Sz/5YTIaHzJZnGc2WrezvL0mu4Bh2hO47jC2VFOoHLA
 AAA
X-Change-ID: 20251121-gpiolib-shared-reset-gpio-fix-c8e161b9f6cb
To: Val Packett <val@packett.cool>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5799;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Bh4WSLi6y/CnVH3wsSIW37S1oJbk0T+/9wnfMDOpxrY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpJYKgXlWqwGiMyybTu1eEQuKBS/GGqWEztq0G1
 Stt4o0MRM2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaSWCoAAKCRAFnS7L/zaE
 w8RpD/4iTjKDMaSQseHyBVPfP6DcSIFr6FMR1aaoASkR7Ung6+kb13y3dxPvAfLSqQn5+qFvzGL
 ZErUbONFVgA7xx+dtSlnSDkJNwvl8XXKuYiWtRexZUisSarB0oZa0S+1GqPTE7t8J4zcV2IK6Rn
 tX5EXLaWv5zo2ncE9y3r0f7rjRNUW5Y7OZ+DgeAEhUg75o7blDvWHKBHiZ0XPX9E0OBoJljR9fN
 Ikxys1kJLn2FsUYom/cXsl+c2JpqQwEafBxaPzbl/kblWTzkH5pNbjLAKIaF5P2fdireW1KnD31
 vjXGsUATf4NPeCwFrFVXIRpnB0pOyae56jzoB2SQK7Sn9IR+A9dDUXIZXFO8ZzF/kTyoNasTZk+
 nuuJovWnOswBJlT2OiW4Q40Iwv/bmyqZeNqWQmV2kFBzbhF/RgZimMJxspoG/pWUuBwu4FG54Xm
 xO5bRt0iMg23UQd3hCIPck2Z0g3IRBH8ysVLcX88rOEivVtEqDRnqWsKfwUcFXsdU3Pq5oEDZmj
 Oyav87GhqHJorCgb6bi9OJ0VgDaQuUvGzjVWU/m/up6Yv8fU8y05sT8E74Tv5JzduNbKzf9efdg
 SqiR7XMUjBhn6ChCyKPaAmFtNUOFZscotSprdrfcw5Delickr82uZ4XBinId1gcFB3bfVA+09ER
 8w/HRWgDZR/Cfkw==
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
Changes in v2:
- Make the reset-gpio checks stricter to cover use-cases with multiple
  reset-gpio devices using pins from the same controller
- Link to v1: https://lore.kernel.org/r/20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org
---
 drivers/gpio/gpiolib-shared.c | 81 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3803b5c938f9933dab01c6d777c349ed3b42ce9b..cc8646f563d2fa7b1972c94c734b19c4cb01244c 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -253,6 +253,84 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
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
+	struct fwnode_handle *reset_fwnode = dev_fwnode(consumer);
+	struct fwnode_reference_args ref_args, aux_args;
+	struct device *parent = consumer->parent;
+	bool match;
+	int ret;
+
+	/* The reset-gpio device must have a parent AND a firmware node. */
+	if (!parent || !reset_fwnode)
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
+	 *
+	 * The reference args must agree between the real consumer and the
+	 * auxiliary reset-gpio device.
+	 */
+	ret = fwnode_property_get_reference_args(ref->fwnode, "reset-gpios",
+						 NULL, 2, 0, &ref_args);
+	if (ret)
+		return false;
+
+	ret = fwnode_property_get_reference_args(reset_fwnode, "reset-gpios",
+						 NULL, 2, 0, &aux_args);
+	if (ret) {
+		fwnode_handle_put(ref_args.fwnode);
+		return false;
+	}
+
+	match = ((ref_args.fwnode == entry->fwnode) &&
+		 (aux_args.fwnode == entry->fwnode) &&
+		 (ref_args.args[0] == aux_args.args[0]));
+
+	fwnode_handle_put(ref_args.fwnode);
+	fwnode_handle_put(aux_args.fwnode);
+	return match;
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
@@ -268,7 +346,8 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (!device_match_fwnode(consumer, ref->fwnode))
+			if (!device_match_fwnode(consumer, ref->fwnode) &&
+			    !gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 				continue;
 
 			/* We've already done that on a previous request. */

---
base-commit: 71dfa12e37df94917955574484b122abaf0e7bf5
change-id: 20251121-gpiolib-shared-reset-gpio-fix-c8e161b9f6cb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


