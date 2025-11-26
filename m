Return-Path: <linux-gpio+bounces-29106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D2C8B0F4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 17:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26C7E3B3D59
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDB533EB18;
	Wed, 26 Nov 2025 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sZcwwicp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E533D6D1
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764175760; cv=none; b=lWgoiq8OFT2TdVjmIquO2SWnMX0zVB4owhjF7jAtc/0rxsmqxCevU8KS+m3fItzDMmK702mZGMHROrzv/dvrQfzbLs2oEyxD6ZLWhLaDreZsq4vIQoIKcucVXbDboK72B2/2n0NSFIsyZHnT9jwOyKXlVYQFEJa+o9s4Z0ezuFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764175760; c=relaxed/simple;
	bh=LwyAttsRrPvwlvN1DtW/T9ppxPs5e9oNnRBoiJYtY50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hg6cXUghft3Hy1wC/n0gHfBTiFiO4dXXNMv5qKTlmKlVcaFe6ZXfl6ZafDjpGKw8DGM5sdhr/GH9tjjx6ucOUU3+4p8I4QSnv3+TO641FLfbNmrFVMmarNF+ZTe9Ned8uiFKegHWg+O3RRhe7wVZSYMiid0y/GgF5SnU/igikPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sZcwwicp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso74203085e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764175756; x=1764780556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdkvspqtfKX+nykL87RGvhWxW7ZpFYy9hRwmU8O0OVc=;
        b=sZcwwicpX6sQ38Xak+u+E+PER05CM/agnTBSWSllEmPYgpqNaQSyQ2tepuLwhM3Y35
         s3bUk8g01dm327ultOFwW5AtNXMNEsSDOSc4ra+mMWKio9bMqm9GQvS34sDaIomftIY9
         I10bybcIq9VcauFUZTvHIbr3/wyYstE5bj4m0CuHAN2yA7q9ncx4oFSZx74EKxvORCCA
         y+USQQFStus7RhocoNx1FfqOh5Wylrb6GfMJgcP3tN6oadkcIdXt90TxGvoN9faYD9s7
         ii7z1NufsV3ZT+gyHXuk/ABUDFh1dwKTE4fEfS0vIEwKiEP1x+0RuthbVQg3XmBSVhQy
         O/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764175756; x=1764780556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NdkvspqtfKX+nykL87RGvhWxW7ZpFYy9hRwmU8O0OVc=;
        b=HBB5r0FaKaHsHml/VCIJzgCr3NuyU8Gt1iSUzkd8QcjA/JcQ8pAeThFimey/sL9xRC
         u1q5aKhP00S4nDNskOJYky6HUXDbFim/7gSOF3ToaYaRhnTEXwgvlylz7e9x6bvHVyGD
         73cU+iBaV0OKPNxTssCr/NViq9tfNavNBZbVkdfSbzpIKXVUqeE3NcaoD3+I0uRnXHl3
         P+Wu3TCIgGYMLsuuCjALuPoz7jDqJKX4UmBeZRV0GDO68Vv0vVSjGl7WVIR3KkBI5clp
         JDexs048FQbA+2Y3U8OIFmJhp/C0fvxwWaAT5L52kMDXeA3qb7bTQgRXeaVWmoFgCeG/
         VpPQ==
X-Gm-Message-State: AOJu0Yw6i15hQcJ3k/dwESfBvGWyynciTlqyUKJHN/dSlpn8bh7hAAWb
	tGG3VhFRUTfFqoun+jAHlQqbMK7cniQh57GkVHhGZ1kGNGuBSxn9k3Dz/RLswpIvrC901luAZYa
	g5uDKf6k=
X-Gm-Gg: ASbGncsicsUQN1JFpnjYZKm0RKG7/m+Wz8woPqWDc1A7fZsdD9zJmASlbPQ+OSTBHBK
	eqU4YaSyuBuX2BU5ew4lkJ687CZIyxqCDzteLKhxHdiJCYbzdqfjZj9ejtItmt0DaANKVWL9pyg
	d6gxu5Hm8z/R/TPNhGIUb0E+uCxZSMgbF9LRw3iMC42QxyXexawHovP8Cy670h+74c7p8Zh+Ggy
	+BaNosF9nExlXCQQwa1+pQYuquYrWW7HSW7IR0N28JI7glhXO/xQAobXHIlu5pkKLrWIOthMFkl
	I3u0vNLt+oEiE0Y8Iw0j55b2THrF85qLAfGqUavmdPCnPyzIqGlB3Z+QLMb83u+AjotPLuRiV3Y
	DzuwYqkYi5wC1bSS9Ded5gVzOtnv/Od+wWtj7RMlbot1gLIk/NWJ9nUoHofjS/nhXx3Dhmqb03z
	+kjlalJg==
X-Google-Smtp-Source: AGHT+IFYzXkK5QvrzjDfB1W/U+T4/YV+th2oRtm+cZl3nxDVcU7NXjTNa0xyMdvS/EmAqSoBDKPi1g==
X-Received: by 2002:a05:600c:19cd:b0:477:63b5:6f39 with SMTP id 5b1f17b1804b1-477c1116192mr195661475e9.19.1764175755889;
        Wed, 26 Nov 2025 08:49:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:544e:b6f5:116d:4a8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add5b80sm55848625e9.6.2025.11.26.08.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:49:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 17:49:05 +0100
Subject: [PATCH 1/2] gpio: shared: ignore special __symbols__ node when
 traversing device tree
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-gpio-shared-fixes-v1-1-18309c0e87b5@linaro.org>
References: <20251126-gpio-shared-fixes-v1-0-18309c0e87b5@linaro.org>
In-Reply-To: <20251126-gpio-shared-fixes-v1-0-18309c0e87b5@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Jon Hunter <jonathanh@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Z2jfm01OR77kYVvO3RX51/gCbeNUmM3Rn8L3o2x8rfA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpJy+IiX1ejPioi0BedoF1Up+jFZlDw1jf8sz8X
 yjuvUwswXmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaScviAAKCRAFnS7L/zaE
 wzDQEACQxtSH5/xDF7deUl2/B6b+mAMyUl6p9otrmARzmY1FQSBhvckj2eSN9c5n7QN0oK4s/5x
 kn3tAwn7z/5qwkhHvhbhqGVxmYRsv0BcDhNPUAmNaHROqCyw0g2F7xctLTKobo8mc1N+xW1qqHQ
 Ns/rdVVK52vIIwtqaRxSTQL96J/nbDMNs9HoqwmA3JW/l0wDx7xSyWgOhqzkI4eKW+tU15Jo8mg
 bF7FCtQaDgVhazmcnxze00bAC3EbKejEWoPaDYVNn7tJacfgEmpHzq1NxksrdXypo7oFlVlcA5f
 ouMOZXpbgK3cVNIftEIwZl5bTcGWspezGVt+ZBX/He1C9eiJpywX326QaY34Cflov3GME2aeT7V
 GQR2gRU4sL7okSi9pj7oRKPHrYF9xyQ4z7Onb6bRH4ZofkR+M+DHOV5Ay41Fzsv5XxkWXwWBuuZ
 aPdUw1gWDlbx0Zt6aa28Pb2rU+SjgpGsNSp0o1/0ymaJaiPciWXfZcgPDJIXu89i3SkzBD4+1TM
 g6r1zxr4CBUSScIbcuTUSH6Xx1wWOAv91EOpjvo2IW1fca9T3eGL6WpSWM0BgOvmnRSfc0kaIUD
 QvzI0YO27XUiDR1sjgoUo+r4DJqTCz50x4j+0Zz345woEx9qk821PxPVL9yoUMWVS0SBa0s6RSA
 kOYH4aChSVRwjCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The __symbols__ node is a special, internal node and its properties must
not be considered when scanning the device-tree for shared GPIOs.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/all/0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-shared.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3803b5c938f9933dab01c6d777c349ed3b42ce9b..62f32489a8a6f70c567ed93645f1e36a81612def 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -73,6 +73,19 @@ gpio_shared_find_entry(struct fwnode_handle *controller_node,
 	return NULL;
 }
 
+/* Handle all special nodes that we should ignore. */
+static bool gpio_shared_of_node_ignore(struct device_node *node)
+{
+	/*
+	 * __symbols__ is a special, internal node and should not be considered
+	 * when scanning for shared GPIOs.
+	 */
+	if (of_node_name_eq(node, "__symbols__"))
+		return true;
+
+	return false;
+}
+
 static int gpio_shared_of_traverse(struct device_node *curr)
 {
 	struct gpio_shared_entry *entry;
@@ -84,6 +97,9 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 	const char *suffix;
 	int ret, count, i;
 
+	if (gpio_shared_of_node_ignore(curr))
+		return 0;
+
 	for_each_property_of_node(curr, prop) {
 		/*
 		 * The standard name for a GPIO property is "foo-gpios"

-- 
2.51.0


