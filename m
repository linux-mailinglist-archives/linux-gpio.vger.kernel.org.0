Return-Path: <linux-gpio+bounces-32742-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fUd+KQzbrGmhvQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32742-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 03:12:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E35EC22E508
	for <lists+linux-gpio@lfdr.de>; Sun, 08 Mar 2026 03:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76D38302E929
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Mar 2026 02:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D314835C181;
	Sun,  8 Mar 2026 02:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChxAJxHc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926AD223DE5
	for <linux-gpio@vger.kernel.org>; Sun,  8 Mar 2026 02:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772935941; cv=none; b=mRf+PRdtZMBMHujb9SUlLTWa9cUQ5tYAjdAHq8yiCWIXqOnWPx04j9Z52F37wBxT40tnjIvEAOPHsO4TaWzt3g2625DiECkmoE/YeekaMrKNwPEij+7BUCkOWHPEQzwcWCQ2CEfHAxwFAsnkjZJpUav5lExCd5WN3PG2jHhXCjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772935941; c=relaxed/simple;
	bh=U+UrXdwcOfkYlJBQF9thJVz7vlBKSvjiHEDWnXodD5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JlmrcWYCJLHH9WuBDj0yirfvjCT5U9Qb0narfEgvOlY2yNo+Kr/stXcjuEdCBx0ufaLbHGhcE+yCOTSWcWUFa8vNlxW7hNt1+84lvN50FbVW655JwTW6bLlOUBG7Ie8cSQjia7ikKit53JA5DqCDmENZWcZWcz7rtOG8T006Hw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChxAJxHc; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35990245493so4392171a91.2
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 18:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772935940; x=1773540740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1r0YKx3cc+gQeQOXY6J4sG6IoXgBr7Vg9n7U1F+VLNI=;
        b=ChxAJxHc2dT1htSXx1+52WT69RiXem53IpfyukLyTtl739RFGIUWlL/DziosbK7ewG
         1jwViYvYUDURMLJXMcJTfdBG87vsTPZu/Un4sBKve5zNPa2iGSQbdK+HwOtLQQ9p4OUF
         mr5HWqkr/OBHNMStFBO3LyuxDUOv5FMMxM02kI7VzYYJHtdqyb3p0iLeMrsVFsdXnSRo
         wyQ8AM9SlOBGE6vmN23MbXHBR+UpOXpH9QWxthVow/G3lrHHULMnJ54vgURHz3AS05Sn
         G5+DfWFR9LX6snu8vrnDaSLwZyc/EV5v9vJykixvuAa+eyElZCbwJ+zfnelwSAHLl4YQ
         8m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772935940; x=1773540740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1r0YKx3cc+gQeQOXY6J4sG6IoXgBr7Vg9n7U1F+VLNI=;
        b=ASLyvnln/hJWzXYd1sU5RBQGZWdkb25KS6Stz/vW17DHWbR8gBb5uqVXJMJMedSZ45
         TCw46xT56rxDusfNKDsYlKtVHfxbVAck4/8k3G6LHZ5HrfbCD3XSP/KfSr2ATitXnRws
         M3q43t5Bc1l8tVhgEKkELIWExOMAhMOeP51ZmppGj4dMtFxoAb+S2F1mkEn+RrSSGySI
         qs8KflAywTB1/ysXHaDSuSoqQKJwdXtOq8jbbVaO9PGT6w0zisp/7sBqIFQy6dRCHbNI
         0QAdIpGHt9DI3yho5jfQJh6rrNtYoPWb7vTnKA4MEExxAh3WnPV9ay93lIF675VO+asO
         kjvg==
X-Gm-Message-State: AOJu0YxOqgSjYC+lzbZmTbpL2p/GXcGa4rkRaXq70MlU2OqcB5Dm80ne
	U9Bh27y9+7rn/7cdAbfHpCBKP2Hhyv/6t3WMYgMhtwu0cH+ivZ3LF17VHyHYoXqa
X-Gm-Gg: ATEYQzwERRxr0YgCQErLNBIU6mjYmVU21HSnhU9qWebnIA5IwgAqRoL890CddYaxmyB
	nazGAJfGL/tvmRaAJSUbvBvd6rgdO/QaX24kOab9rIrq1gH6nVoujQGFuesEFEKl+EkmfbYL3K5
	kUzvmsvlXqBl3X3wy5WKb3IPSpfe4qgiP5W/XHxjAHc8lqvze0WrdJ8uZfCs+JghkOhz6mh0GVC
	UNczEZLBXsuXppTHYPhQaoLWS/KwUwK7nPtc+lwSr8kqpHJhSQLNB6Eo3eUwswgw4bygIt/86zX
	eB8C2AKmRxiNFi5b/nExYez72sCHzxfDXUyNySim7kUANcwRguIWR8Gukes8UTMMTbQun95sx+E
	lPo7roEXluab6+E/39/qS5UhVR4QsI+YH/NHaOso/d3NDW3UPKu3v9MOG8vjL0+pOfySAcUD+rZ
	gLqSy1j9mZNHkddXWmSYqmPgPIj5tcaR8jQ6s4fmKcLM9oFFGwnZGcww==
X-Received: by 2002:a17:90b:3e4d:b0:359:88c5:3add with SMTP id 98e67ed59e1d1-359be307609mr6760544a91.19.1772935939709;
        Sat, 07 Mar 2026 18:12:19 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcc28f0fsm2632739a91.13.2026.03.07.18.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 18:12:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: ljca: reduce struct allocation
Date: Sat,  7 Mar 2026 18:12:01 -0800
Message-ID: <20260308021201.47820-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E35EC22E508
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32742-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.960];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Convert connect_mode to a flexible array member to avoid calling
kcalloc and to combine the allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ljca.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..a531aaa0425f 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -63,7 +63,6 @@ struct ljca_gpio_dev {
 	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
 	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
 	DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
-	u8 *connect_mode;
 	/* protect irq bus */
 	struct mutex irq_lock;
 	struct work_struct work;
@@ -72,6 +71,8 @@ struct ljca_gpio_dev {
 
 	u8 obuf[LJCA_GPIO_BUF_SIZE];
 	u8 ibuf[LJCA_GPIO_BUF_SIZE];
+
+	u8 connect_mode[];
 };
 
 static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
@@ -400,22 +401,19 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
 			   const struct auxiliary_device_id *aux_dev_id)
 {
 	struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
+	struct ljca_gpio_info *gpio_info;
 	struct ljca_gpio_dev *ljca_gpio;
 	struct gpio_irq_chip *girq;
 	int ret;
 
-	ljca_gpio = devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
+	gpio_info = dev_get_platdata(&auxdev->dev);
+	ljca_gpio = devm_kzalloc(&auxdev->dev, struct_size(ljca_gpio, connect_mode, gpio_info->num),
+				 GFP_KERNEL);
 	if (!ljca_gpio)
 		return -ENOMEM;
 
 	ljca_gpio->ljca = ljca;
-	ljca_gpio->gpio_info = dev_get_platdata(&auxdev->dev);
-	ljca_gpio->connect_mode = devm_kcalloc(&auxdev->dev,
-					       ljca_gpio->gpio_info->num,
-					       sizeof(*ljca_gpio->connect_mode),
-					       GFP_KERNEL);
-	if (!ljca_gpio->connect_mode)
-		return -ENOMEM;
+	ljca_gpio->gpio_info = gpio_info;
 
 	ret = devm_mutex_init(&auxdev->dev, &ljca_gpio->irq_lock);
 	if (ret)
-- 
2.53.0


