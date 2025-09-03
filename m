Return-Path: <linux-gpio+bounces-25450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D18B41797
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6C61BA39CE
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1992EA49E;
	Wed,  3 Sep 2025 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QK0Ru+gb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7927B2E9EC9
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886431; cv=none; b=BSlaBIZ0dNax11QJ0wRhek6nXFABDI84JFGyAb9TJMLfQ0KGJHQyvmbe01CigKbcnryVJ+KJf6FV+8zkPc2KDuEE1KIF2hP8wmtZ5ASmeQEP209GrN5doqyBxuU3ZFWYH6PDdlTInVe1p8WyH1JfJTEN1LTf9q9n32dSvNzCRjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886431; c=relaxed/simple;
	bh=IEGwE+ToAulBFVshjmgY/31wRMo4QqAB7hu0d9ikoTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKZL1c1diok3xL+iO9We8ERyGaH+AKE7YzFyMNb0zP5V3RKtSZUKzxiLpn6UG9J/FbiDCpUGoy4Ga0dJpQqaYsCCciSTSb7+t8fpljJVjNQWfac1Ony3n6mOMnNPBNXko98ySRW6mfrNhU5VmRkTw7W+VVV1NuzXRvOzX1GVufo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QK0Ru+gb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b869d3571so10156455e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886427; x=1757491227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVFzQkChyd+UXTmzf+EsGWF7UuykP0xo5LCpzHLq3/I=;
        b=QK0Ru+gbVo4CT5aBmWvvCQZpZA825/0p74V70DrT5bkLW7FsT/ZJmRfzprHd48m44t
         BiTklnOzZMxdSSwdKVwrnlMr+Nv1UxXaBaTt+X9B40mabLqH79Ao7SHWz/WAW/Xdftly
         kfHwTNXhkNn69G4DCKMoSqXdvA0ZxAhGgngFowxvYgiNX76xabAhAfV1m7Xu58gJKsrG
         xUcaCe19VV9FnJ7CU5dGPsKdtFXKh6Fhg+SH2csi/adWwlxUvPSsNjbfvt3p3qd/cycT
         +/rR9Y1xuxKEWGtqquD+HXAdqHS8eG/5D2eJqjJUuNUM2mcB5QLr0bN2wjbdz0QYgU9L
         oegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886427; x=1757491227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVFzQkChyd+UXTmzf+EsGWF7UuykP0xo5LCpzHLq3/I=;
        b=BQkpMlitA9Tm7GbjzBmuy9F+Frg3/tYn8YO6JYMChoUr/8C3vf+BPqYUgOt+E0itMw
         xg8XVc7wAOLj/OMRN/h5+lYDK3e61irbv99D653vE1SuCuvp3+bJ28aiSvt26uHlQGdM
         jgug2BL2yG4F9MpdFBnOf+gXnNKe1beOIrj/fkLGGkH9Zo5Sm8KChWk6b1WXGiy7dMYm
         6XxRFooc5psZXlTvbTz1W+qgGobkP+44MswmdiCDPO4V0vuBEHC06jqRSYk2waYv5QKg
         6unl68AS9roGm4btd65xyG5QoKm1d1cb2kxEjTu3P4qiGiz9LMmcIM2SsgGT8qX3ZviZ
         rMjA==
X-Gm-Message-State: AOJu0YxyLZvWqxMVI8VMUMlH53ARojeloJWkwSKlZ3DRiyx+oKfz2QfP
	AQEG1QWYhHDtkKqYTMFNJv7G4/iLsEy8ZMf8HddN45ku9cSkaS2Tr2SExBtBo+ps214=
X-Gm-Gg: ASbGncu9AKYHMUBBiDPeHpocEF2FPCrrIQqKDoncKVBnLSksJtlg7gsx5nDyvutOn7/
	LA0Bwojs/WyPUuvYpx6dWemY0Hmb+ApN7rMz/vYYJMDABHVGldsFcLyzoDtr4oWJETi/+RLx2Ah
	4Jh70Z9DHM4+XZ8vkeuMO/TENBivwzVComvSb2J5blIkJKUSNkNndOX5DyFdUfvKTTDgu6AFEcD
	gg8Z64voeMFL824pimek6Oy8PSCo3f/R7ruE14OCOVRusDCVzUItN0L6hiIJZBnBcUTLXGIMMo7
	+gQrpPhsmVcWCke5gfwl9MLCBhvQbNfU5ptOMF4RACZ5p7ZJ5LD0dj3A8U4vnca3+6fRJdo7OSf
	CLi7TKh0mQYsv7bwB
X-Google-Smtp-Source: AGHT+IGq1DLgS9RobB4HREo9vO50WwmuNievMGfbOF7OziIxKdJPrcqmgePSVYo8F6jx37Btbjg6Iw==
X-Received: by 2002:a05:600c:a44:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-45b8557c9a1mr120153075e9.29.1756886425764;
        Wed, 03 Sep 2025 01:00:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:09 +0200
Subject: [PATCH 05/12] gpio: tb10x: order includes alphabetically
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-5-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XKK3o9s7sBkrHAIKP++kKb6hradf8icS6yfA8KQr9HA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WRk2iQOIWKe0p/kN7bUllcUQHzjZ9KLefoW
 sroPD9j5hGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kQAKCRARpy6gFHHX
 ciZ2D/9S4qDq+ty2QVf8sh7eHtke1y3AZIAl8EpZ/S0paaKLbc2KYgItDPXimDcZFnYwgMiLPE/
 42tDBAqb09ZsD7/t9sMW7cgiaBlTLx3a+Q4taUYrv/N5o9OJmnb0pjA8S2vb6ZkdpEm/BcEYQ8q
 vIlonycX1Tr3ooqgieWEOaqEan+xXL+UK06CMlNmQieVYfLljKSFEMaOazUwh0XVyoPeNmNk/Be
 pASf5Ks9KxWqi/7sivZbREzBAkSFtmuAcuiAqY8ijLcO+VBTmlQwbL3GLXbVwM4F+I8OjBwyNV3
 5WEyzDOs0yqOEunJIdtengR8nKFyjMxXjlZmevPUDxGrDRdsdlDwUtHp8QUise949CkMa8ec7g0
 wEhbrUOWOZ16DvJNiera05bP/aP+Dusswdp8GjNhbJLhKzWD/g8h2V5fqfdJ4xYuReizJmz70om
 SIDDFy7LRDPfLGwR29AdLEoeZrqNFHoyoghgOXYOCBBac3kKBnFwiZ3x8Br5mEmDzAtCKwEzE/S
 ixziiJsSmxGLFaCzXl5qvhM5MK2XdGgjn4xrkuE/jwCq9QqG/pDsKYNgaGpOgqpDNPxihymk5VD
 ClTxwQS8HyF5zuzav+iVJCEa4isMUlcP0GCG7AgKTc6CIhKO0OZO2knLyHxn8buMWRaoEfjCn/j
 VAEoGrK8mJtpf+g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better readability and easier maintenance, order the includes
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tb10x.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 1869ee7f9423efb31045a3394343e404db102faf..356d0a82e25f29f60c43801cee6c6803ea7a22c2 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -7,20 +7,20 @@
  *          Christian Ruppert <christian.ruppert@abilis.com>
  */
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
+#include <linux/bitops.h>
 #include <linux/gpio/driver.h>
-#include <linux/slab.h>
-#include <linux/irq.h>
-#include <linux/irqdomain.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/spinlock.h>
-#include <linux/bitops.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #define TB10X_GPIO_DIR_IN	(0x00000000)
 #define TB10X_GPIO_DIR_OUT	(0x00000001)

-- 
2.48.1


