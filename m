Return-Path: <linux-gpio+bounces-33236-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNXFMpl/sml2NAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33236-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:55:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45C26F449
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A43D43170650
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581A538C2A5;
	Thu, 12 Mar 2026 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5x3kQ7m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546C838C2A9
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305619; cv=none; b=WVu5XOh/pnZ31S5/v101/jP65bv1Okxq0ttzugYnmboV7koKqjHn7mlHeySEsKqui6juDOzQjLkf35Lz+3bzZSVzeccCgldnknWIoWwCG/8IlTW2a1j5LX+GHHvU/0bvrNTgl2dtFaD68sa0vGe1kLA2v7u+FatlsvUFRx+fER8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305619; c=relaxed/simple;
	bh=OCqMqTV3Fk0GHlGjVJ0UFzNI1DHV1XFUgzJgSRR9AZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MPRrwcD96+BTRcBxrd0EzpElM170k3TErKDo/9/M7iPvPKZjX/RHa1MUWUmNIp+fVqOnM+DRTy91jbKkWajDnTpWI48bacawPpcIlND8WzV853b8j8jJooqvOqQtWAqEfCwzkdctw281wABFYhREtdxtlf4ouW7Q2/2bCuwp5hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5x3kQ7m; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so6113835e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773305616; x=1773910416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+87770G0UGJrf+jBGNAZwy7BjuGZ53X0m5gpUF71N68=;
        b=O5x3kQ7msFNDjWpbWi8Fq2jQgBplW7GX6/rbZs7RuX+srufoy0h4ikXCbbpKINbGs6
         04DUlWvgI4EFP5MXdujfh1Fu6u1x84tByc5cXoF7tll3+iuw+WzMh/bA3TP1rE7bFQ8F
         G5Toa7k32shC2Nxw8/rlMPEE+WlTsaWhC8hI2s0NZ4pHZkKo4H9kSud5b6Q8z2Q5CXGK
         rlq6Rh5PY3lhqavFk0mdle4fg/wFDWSErXeftNETUG81ERSj1CT6bPXF1GnOydOJW4ky
         tU49grRSNu76K94iVgjmZ9mEy3eZkJLGMec1r/EdA9/FiFXzy7HlaprbDHkElKzUC2It
         DO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305616; x=1773910416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+87770G0UGJrf+jBGNAZwy7BjuGZ53X0m5gpUF71N68=;
        b=eBQsF9zb38IqxD6taU+0PYldN5+tjOAAaMNC45T3n8EdOCiq1c+DqSSjd1Wc+72ol9
         VE5vACsmWXGShNr4Rtf9gyCQUZeR8XZS493ehG69NyOLnXlmgldYU+L//yI1Or4BAQw7
         YRXgF48BVC9mciltN522CAlAVlwn2GTd8HBlsj9eqx1mVw3yeLH/QQ6yjT3J8qFEHolN
         NQOdnUO4i0gwmIsUWY4sfWYqxZYQGYElsrYe37czNMqmVWdyvobjXZ6BueeBXPlTVh1o
         c8DNyo70yhcye/HoJQr0TFk9ojSocys8iIRvJpoOtMTIA2yVAM/oCi9h/HAIVj5LNw/N
         qcMA==
X-Gm-Message-State: AOJu0YzkfuO6Uedy2n2uebW0K+rUPwv5aatTgPR65Y3bqmKLy1L6hnGJ
	18H1KClhJcBsflpJY3sRdWzJFDnNOU2RqPWSjtrn/vdO/lbtdBbxJvc1
X-Gm-Gg: ATEYQzyegQ/vKBKi5c/W36orK4aw7FXUaJR3Qc66rmIsSXZaaWdEHBRkBdiNkVt03iC
	m/wlK2fgnI3jwg7Zhunsargqw1xRjTB+6ao6HEwZnP8YRe9Vkm2myYbF4mnWRP/K13TqRdDVUfi
	9waqPXvi7MVkXr0x5OGjfKBht0wtQK+dq5DFLv9dOqxCWIgFLPa8LiJeD9OshlN+wG+Vzsnh9rA
	ewZ0Pfv252U++TmHtFbLNXNodmKusTN5Ix1WhnKgd/at/1+caDzIZ3a2IZmO01rfaIaajh/CyHT
	oHd9+0ZLizmXYmXSyKcZr3VifZpToLFoFePTxwfJkvgaOuBsA2utDAT0rasIAD4Q4Y5AlwS7uEE
	IgCKAA/PZvFiK+x/ill0D3hwFP61aOWrcYIXnHhrbyHO31b7UGMtI0hbTX6QBdqxSx7b3zjEYA6
	xMtqT6Hj6U71VD
X-Received: by 2002:a05:600c:4fd6:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-4854b0a555dmr91969175e9.5.1773305615537;
        Thu, 12 Mar 2026 01:53:35 -0700 (PDT)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe226473sm5449162f8f.32.2026.03.12.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:53:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v4 5/5] rtc: max77686: convert to i2c_new_ancillary_device
Date: Thu, 12 Mar 2026 10:52:58 +0200
Message-ID: <20260312085258.11431-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260312085258.11431-1-clamor95@gmail.com>
References: <20260312085258.11431-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33236-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E45C26F449
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
i2c_new_ancillary_device() to enable the use of a device tree-specified
RTC address instead of a hardcoded value. If the device tree does not
provide an address, use hardcoded values as a fallback.

This addresses an issue with the MAX77663 PMIC, which can have the RTC at
different I2C positions (either 0x48, like the MAX77714, or 0x68, like
the MAX77620). The MAX77620 value is used as the default. The I2C position
of the MAX77663 is factory-set and cannot be detected from the chip
itself.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/rtc/rtc-max77686.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 69ea3ce75b5a..3cdfd78a07cc 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -686,6 +686,11 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
 	return ret;
 }
 
+static void max77686_rtc_release_dev(void *client)
+{
+	i2c_unregister_device(client);
+}
+
 static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 {
 	struct device *parent = info->dev->parent;
@@ -713,12 +718,17 @@ static int max77686_init_rtc_regmap(struct max77686_rtc_info *info)
 		goto add_rtc_irq;
 	}
 
-	client = devm_i2c_new_dummy_device(info->dev, parent_i2c->adapter,
-					   info->drv_data->rtc_i2c_addr);
+	client = i2c_new_ancillary_device(parent_i2c, "rtc",
+					  info->drv_data->rtc_i2c_addr);
 	if (IS_ERR(client))
 		return dev_err_probe(info->dev, PTR_ERR(client),
 				     "Failed to allocate I2C device for RTC\n");
 
+	ret = devm_add_action_or_reset(info->dev, max77686_rtc_release_dev,
+				       client);
+	if (ret)
+		return ret;
+
 	info->rtc_regmap = devm_regmap_init_i2c(client,
 						info->drv_data->regmap_config);
 	if (IS_ERR(info->rtc_regmap))
-- 
2.51.0


