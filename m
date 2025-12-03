Return-Path: <linux-gpio+bounces-29217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA2C9D8D3
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 03:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961AA3A87E0
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 02:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7040D22FE0E;
	Wed,  3 Dec 2025 02:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="TBb8Ad7u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CB572628;
	Wed,  3 Dec 2025 02:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764727535; cv=none; b=i7WPvAOW2VWsk2vkgD5phjXdfOs87oY5Z9ETYnAmIxPArTCTbsOtQbz0LjUt4Bh37mn9m0kr4pWo3Q1vqFa8K8W8tu7B/5oW1DnwTJOc09Em6Yru2g3be6Nkb/6Kn//v2s5wZfPzHdYzsMWzF7cyts9pQSI/TGDSzNB/j05huHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764727535; c=relaxed/simple;
	bh=RAWjNvMTXBBPiw+T5ybL7p086n0NyxA7fuNEkKM+dEw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WhgwbY/tadMWV6i429jEYFI+JFqN1uyICCGfkf81TiZ0gg3dCWL3OytQ3UwGeKodVtEkI3vYb+/REK92UJqVi4suMIfrTnQL0x7zRpvl2Dfylg4TVS3xPakgo8nv7DrCQsCOxsk3madkGWPBAqKEVvWRbc8ojzi6iO4G+tyiXG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=TBb8Ad7u; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764727489;
	bh=WBWtofBGf2lT+XC4ai5R6H4ssUy7WTEXTKNPHsRQSVk=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=TBb8Ad7ung+OxViXEK6L8l7wd9ggnaDLYbMkcxM/yR5PqiyuFMJEPAi5NwyaMONX2
	 VVhGXk7AF7i2hJh4HdjwAwF8xVQgf//Ys+bpfV7aNaYy7fQE2Wo4998QL30D6sJrEh
	 Md5zocHUVkcyXEIOpND9HWZxHGpNwpF803Fp86Eo=
X-QQ-mid: esmtpgz13t1764727452t0664ceeb
X-QQ-Originating-IP: jNaDEnoeeaZUngDPhacDKoMq/BCBFJpjzpjiAX1SdG4=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 03 Dec 2025 10:04:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6415891439791493088
EX-QQ-RecipientCnt: 9
From: Wentao Guan <guanwentao@uniontech.com>
To: andy@kernel.org
Cc: mathieu.dubois-briand@bootlin.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	Wentao Guan <guanwentao@uniontech.com>,
	stable@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: [PATCH] gpio: regmap: Fix gpio_remap_register
Date: Wed,  3 Dec 2025 10:03:42 +0800
Message-Id: <20251203020342.2564767-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mh6kbFCQnyrML9JhLlynvt9O/WDQnN4sVRhs5O3dQPzOlJj+IPaZt1vk
	RrucZ6RSPFaF56IJM+x4yg66uGoQxQxQDOHQnm+2ALWzuau5nDq4d9Hras/F3TD0h5JLZqM
	NpHEZ+jRWslL+TOT2YHrDTYTRBl6u6aQ6mkisqyc7AePFT95kgpvC27xVeLOzfokIoXLNXQ
	wKqc0trvkWfhFPzc4Dzc/MxDbJ4NdfVFzmxTsRK3s+D+4F/W6ZlUaSayVqwAiwqbjjfGGnc
	FMFIQ+Ver0MzfbHnedMv8fVGJSjl3Fcihin5BFyqp3Bto3NFBsinJFxOFuLQj+9uPrYdLQ3
	t6lWKtPQtAkKVBA3WHOYwXDzZzyrkWk3CK8BRy3ouwNnY4Lk7strfH4AnRh1F55D9ZqkLkO
	yK3uPhfvzfEyqR2b190mjjz0oupXY/LA/j3thdCZj91DobQ1qM5p1QULG6B7FsUFCdrWdDs
	1doX0rDQxVXfTU8/OI8ARoMImy50uSnCp/laUlineqFSCPUWaDbNEbEr/5gXbYVqG10h/0+
	w1gG6T7SsC2IaGmpipQkGLrOqgmdltsS7gvx0hC9/2l3wOmy5o9xcTYJ7eeasHKwyL0tueS
	R3dkCRlz7FRUfuSweQzWcvpDv/zJD4ikZrkdLKD3dpGhn1o/8ZL2Ng1x2Ob6IUlrCJMcJRx
	OAN+dB+y4u0s0X3KE0fL/WNURih24P+NKP48NsYQb766Hc81tXZJ/8503sFzFH1cPtUl92N
	sAq4d2HL+oIQcrK4zjKkqnxngVlIM+NutB5FeyiaWPLT2l/RbGOx4WzyKCrSxdkOezv5cia
	0kcpPTijHd7I4tFYomVpHB5cIdAFKVRf7/tEsIpg1ZFCz6nX9cuc4O5W09AKBrVnW63usuJ
	uqADpRtqkr6BD5vnuNWGY3DMu6rvpVKfnIs/9nL4ej5aW0WHtfNvbfOSmleBSYx1o8bZrHy
	9K9kxSPHbJTLb8+15TGN/lkaxbFrT0Pmelwf+UiZRhqOUrf+JxcjdP3mOell3CEer6J9L/h
	G9Xe3WthzVjn6iJG9Dy1PqrMPLS4nG2tPJNJodeQ790MSxiP+aVeFzpVWxd4U=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

Because gpiochip_add_data successfully done, use
err_remove_gpiochip instead of err_free_bitmap to free
such as gdev,descs..

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
CC: stable@vger.kernel.org
Co-developed-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 drivers/gpio/gpio-regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index fd986afa7db5f..f0bcb2c2c6748 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -310,7 +310,7 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 						 config->regmap_irq_line, config->regmap_irq_flags,
 						 0, config->regmap_irq_chip, &gpio->irq_chip_data);
 		if (ret)
-			goto err_free_bitmap;
+			goto err_remove_gpiochip;
 
 		irq_domain = regmap_irq_get_domain(gpio->irq_chip_data);
 	} else
-- 
2.20.1


