Return-Path: <linux-gpio+bounces-16127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFF5A38397
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 13:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB803B47D1
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2025 12:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F0121C180;
	Mon, 17 Feb 2025 12:58:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6AE21B8F7;
	Mon, 17 Feb 2025 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797112; cv=none; b=Aef9ErlEcdFcRr8sTHTk4b1XHqJ3zwqiSNUkeBd187qTPsJxOf0OIGXSRoVLA0Zf7pkfDv38jlPi7OuE2T+Poat8BNOxeZUbo1uIueNFcdQ4sqQRDXmKk6X64IcwDFP/kGvqKhFDTi+JmGWM21ti5tUMy/a8rp65rFrTQ8yg9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797112; c=relaxed/simple;
	bh=SnBbFKKogB6q+Vfb+jj9D2g8pT9iPHj1lIkWDDf73vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clWhAc3UcY98fkiuVInkwF//2gWs3DZdxmqMzAfdgqaTWkwiT533+IkkIoRDYQRY7itlWbTrxxjfkYPKcyhscCc9CzNodhIYwyh0h61yWkmo3gS4FPFUAqyWBRHVlw4Qs9n7UTEGw5fRsBONpJgWq7HR0SjMBK8cSWYC+J/lCZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 02793343083;
	Mon, 17 Feb 2025 12:58:24 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 17 Feb 2025 20:57:44 +0800
Subject: [PATCH v5 1/5] gpio: of: support to add custom add pin range
 function
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, 
 Jesse Taube <mr.bossman075@gmail.com>, 
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=SnBbFKKogB6q+Vfb+jj9D2g8pT9iPHj1lIkWDDf73vU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJZrRNIp7anNjnH/aex/U9yqm+zBBqIhG0UO
 70eO8vlSJSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyWV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277T1qEACUaWQ2Yh3Eyo4GHf
 M926L5dBdaPRFOEH9/qyF0vb3PKCzwYT6CN87Ko/nLpf7KP3PI3CZFY/dvo1+vB47iw2rC5h0Cj
 T1HgI2dmu+mk/uXZsH5Ky5kFO90ehQOxSYCvaTdcRyThI3oejMO4KhaCab5U+CSgDRl6dCeoAa9
 Frd11USieyet8rAz+8J8GZK7XhLI99sdi36o6zd+MzGWjmJGc9lCQli/jY6wK6nyD3zn6uSPXl+
 70WdKwjJeba/ANsA+pd/o/hgwUTtOQWutHmdgkdAb5BYQAffhBmxehQ+ClFwquCTtIOKESAdjKg
 iPQcEr83zWj88bNbX1oN/5OP1WmEsg4EJ0Vk7uObqczrK/ekzXRbp3PmOZrvM1k5Z5OoxMz4Fky
 8Aaj/6cxEqKd2bhkpLFJGeF8uzLZjG+bx1p4e3wg1In5AmucGd9n0SgVRoLlZ74QWi/1OMSHiFT
 UpqEgKY8e19f05DaaaMMgdSUs4Mjuv250ES1sfpCvyZQAyycUqmLzswGDbW+ZRsEO7rklpX6Gfk
 cQPsaWoo226evDaNjfmSK47cJjHTvO0sTOpj9j/2AK1mHq/PR/M9mSfSG30hrwpkI/iIPh/80ge
 3XHB3YW1VLLfzlbESpUv4tUKSdm/b2GzPEQzy0k0xD/NvZibsUkBVmDSghcCDFtMMWWQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Export custom function to add gpio pin range from pinctrl
subsystem. This would make it possible to add pins to multi
gpio chips.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/gpio/gpiolib-of.c   | 5 ++++-
 include/linux/gpio/driver.h | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2e537ee979f3e2b6e8d5f86f3e121a66f2a8e083..64c8a153b823d65faebed9c4cd87952359b42765 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1170,7 +1170,10 @@ int of_gpiochip_add(struct gpio_chip *chip)
 	if (chip->of_gpio_n_cells > MAX_PHANDLE_ARGS)
 		return -EINVAL;
 
-	ret = of_gpiochip_add_pin_range(chip);
+	if (!chip->of_add_pin_range)
+		chip->of_add_pin_range = of_gpiochip_add_pin_range;
+
+	ret = chip->of_add_pin_range(chip);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270a68ddedbcdd5d44e0d0f88dfa785..a7b966c78a2f62075fb7804f6e96028564dda161 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -528,6 +528,13 @@ struct gpio_chip {
 	 */
 	int (*of_xlate)(struct gpio_chip *gc,
 			const struct of_phandle_args *gpiospec, u32 *flags);
+
+	/**
+	 * @of_add_pin_range:
+	 *
+	 * Callback to add pin ranges from pinctrl
+	 */
+	int (*of_add_pin_range)(struct gpio_chip *chip);
 #endif /* CONFIG_OF_GPIO */
 };
 

-- 
2.48.1


