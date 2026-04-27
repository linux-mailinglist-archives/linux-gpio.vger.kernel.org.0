Return-Path: <linux-gpio+bounces-35531-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BEnB7zF7ml5xgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35531-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 04:11:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6D46C0C1
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 04:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 760563011C5B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 02:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC322F2619;
	Mon, 27 Apr 2026 02:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jdEwHiAl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0096A2EFD9B
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 02:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777255841; cv=none; b=tm4xAyXZ2WxntSSr9wWRaZoT8fJ4GDcbRrKouePiq6lMhHQNsvXPTLMvP6L2srkPi3zPpSQQHPvimeqLxyb1CIpU8cL8LvkC+5EJa1NqRLH9L5XTHpy1FK+Y1LcR60NaDqrDG7YMUbAWj2TNijtDUCld7Bwo114BdzMAYV6y/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777255841; c=relaxed/simple;
	bh=viJexUdqwfDtXJ6xLOWsVeVHZs9hpDIALfJkAe62pHo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O97jFnv/aqTxoaKhh+mfo9CftIo0sDJEhBs5bLOAaAHfHjnqhqAEDp1aKNMcnF0iF5+61WXxCFQVtePvqYTAiBZIgbHsFa3mRTJ6RMU//v9PZuanHNIfgCoAJ9wDJK9VitOYJP4PJLtnUYImil0cR8C1A6QJhkQqLiW2gyBxyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jdEwHiAl; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f8cebc935so4114809b3a.0
        for <linux-gpio@vger.kernel.org>; Sun, 26 Apr 2026 19:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777255839; x=1777860639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNGha38KYXK7mTaNFdD1kyRzSrZGKEbgGIpx5vaJrTA=;
        b=jdEwHiAlH44f8d1kc9uaLR0ka4iveQW76HvAA9ZX/ka1nwkC2L9r5KHD/ndh+i4YyB
         cP9807CcVCJ4I3NxdhNwTrDssHj46nK+SwLXturS82DedE/wRSw00L+iuhBWvGRWHoZC
         qiH6fYDlx85EjO9628ukimGdbsAavJaWGI/og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777255839; x=1777860639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNGha38KYXK7mTaNFdD1kyRzSrZGKEbgGIpx5vaJrTA=;
        b=bW6drO3EQW/M3k4QPRgKpUrFvGv8P0JFYGF2Vq189wBKcB1QMpH47HtmGWZFLrZvyd
         NMw21cqzpsKix/rZy7bAodn0IB5Ff4DvlNqDLmVulmUv40mWjwW9FKJN+zQD1DgEjlpl
         4lDx7GQPVNp8ZpIIVy/2UBo6Lxhk3sgdhUw2kOCQr1M0c61+X8AiCCF+2CC5LgvRxVCX
         rfoiON82StSeGgbgEBKG2nG1nMf/DJKhQ9ivHIOHArTYrwasr3bNHNX+ScxdhwPcEu9l
         BirDOJA+ssL1PwUWJmOVWai4Ihq1yMgVD5lMzGsUg3U23x2DsuPWUt+LNpmrmGzehFH3
         Werw==
X-Forwarded-Encrypted: i=1; AFNElJ8Kfo/4Xzkj5ayDyG06Ug8sxrxH4viRBLe1vguMpxi4w6+SjP9t2Xc7cbpjhmkOzY5a4hUtUVY73Quo@vger.kernel.org
X-Gm-Message-State: AOJu0YzuHdOgdS4M14OK2+jrjWhhvt0l7v4rJlLPEQ3lKefgmSDWle2E
	/D2W+ci3elSbK1/RQ0xyQwFLpx5w39+1M5bqN3Q20vtNZdfqmf8hJhlVoRIrO/G6ag==
X-Gm-Gg: AeBDiesFJ2xH7HWlRjT2VnynaqURyrMiRYAsiHxTtJzMi+rsLvDA7BDOpbR9RLIhrcd
	4cQzUmArV4BZ94co96Ex/U9X0qXlJ+mUey+KMDuDhwTGtrFJ8/LRDxEPahvapE56fnXr7M8jepU
	L2ELh/dw4Wr3lv3aUnpLKJexkzQZJaBoyfxky06SeGLWQqdCHAf4AKRYnDSVby/bjEuOXpqahqx
	9QkGtjfk2WPdj4IhXhWso13XsuAa8DdTK5mfXhHA6l/vjXZxBpKfsupQxoqxebHdPbQM7j0Qc/a
	mHg8D/1DEA0m8vnvbP1jXrxOCdpkjGxxlD484tiHYaoP3qMyWg4i8de66QB77wTUIoWUkWm58Kz
	qkZHVFU3H94kH6nPgCwhGfrQ+tJQbbJUUUYmXx1aYRk00qnbNeQQtXjs3q8KqmsH+zhyoRFhN3r
	hLutEOqnEwCQY4p94OWINWwU4be6L3cLbe+RXalCYPgrWFSLe3+SWpkM5bA2PVD3p8t8EyoPeJf
	MjdLTYZbI7rSKKuO6O0y7iTZyCG2Q==
X-Received: by 2002:a05:6a00:c81:b0:82c:dd31:b84a with SMTP id d2e1a72fcca58-82f8c908083mr40534324b3a.43.1777255839376;
        Sun, 26 Apr 2026 19:10:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe41cfsm33097883b3a.43.2026.04.26.19.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:10:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: paris: Directly modify registers to set GPIO direction
Date: Mon, 27 Apr 2026 10:10:19 +0800
Message-ID: <20260427021021.2049015-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 79A6D46C0C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	TAGGED_FROM(0.00)[bounces-35531-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,chromium.org:mid]

pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
the pinctrl mutex. This causes a gpiochip operations to need to sleep.
Worse yet, the .can_sleep field in the gpiochip is not set. This causes
the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
whether it can use a spinlock or needs a mutex. In this case, it ends
up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
takes a mutex. This causes a huge warning.

While this class of Mediatek hardware does not have separate clear/set
registers, the pinctrl context has a spinlock that is taken whenever
a register read-modify-write is done.

Switch to directly setting the GPIO direction register bits to avoid
the mutex.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 6bf37d8085fa..e4c0bc27d984 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -886,19 +886,24 @@ static int mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 
 static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
-	return pinctrl_gpio_direction_input(chip, gpio);
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc = &hw->soc->pins[gpio];
+
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, 0);
 }
 
 static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				     int value)
 {
+	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
+	const struct mtk_pin_desc *desc = &hw->soc->pins[gpio];
 	int ret;
 
 	ret = mtk_gpio_set(chip, gpio, value);
 	if (ret)
 		return ret;
 
-	return pinctrl_gpio_direction_output(chip, gpio);
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, 1);
 }
 
 static int mtk_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


