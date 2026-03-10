Return-Path: <linux-gpio+bounces-33039-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGbVLYeZsGkukgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33039-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 23:21:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA09258DD9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 23:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C370731D3ED7
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 22:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9933638D693;
	Tue, 10 Mar 2026 22:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RT59+NCx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D2317166
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773181260; cv=none; b=pNK6b84LjZ05997JpMYTmrGyX7tQC7Oa2gR9rAZZ4a3uX9uMUdqtNi9ZeClA+aU+YZokhKE40VD4Kno4Y7cvGYpvh+RBDUtFZM0k0Sz7/54MggLJT+NwUM/6YZDxMlo5ujhQgJ9yk6RF34G/LJICHgI5c15wscMQDOIygMM5hoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773181260; c=relaxed/simple;
	bh=AoCKtx/PUi7xUnmBv9zsoXN1mNbIXI5U5Hql2pRn6sE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JsICq4ZJKeP6qPmOvs3ZjJZS9s98zOLZ7ff4X8rqhB+ISAzPlC85/AG15vn4n/L5LLXosw8CZSAzdmbjroKADc4XlcHWLVJhmjZ75yi1FvO8pUyz9O8tRuWGwMczXl8JkgBf8qRLdOh31SW4MczL9JT1fngyBmV5rZ6Yy6qieTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RT59+NCx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae3a2f6007so77849675ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 15:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773181258; x=1773786058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3PmiKrgbRCdENnoUgQXrKp+F9EjF1+JrjBV/WyUOuw0=;
        b=RT59+NCxAdb/G4PWJnUgKYoKcp0Y8lA5qSs+5Mi0thQK1qsdkierfTBf5y/XnspRzn
         Xi0+UTPL0QLZ8gcb+xHTLWzXJ/fkDBqIFwLPLGUT2dMV23FiVBLu6O43I2zcjMEBAk/5
         ytDTlNK5Wf2GNf36dwwvspIzziKzy/rer9e182HzVaXEi58g/vt6U0EzCtlto8IlY8BL
         Q5lPMj8Jso5Z+V1HJHef5hHKsPi/IWMfQmFWlN9xQo26VDvaBuD9jiwVLP5Ty/71bfS6
         zSWE9MN1kG50UJlMYvDBfJRaS7/CYJjYOIpO8C0VyDPixAdn+D6kdxqN2wE5z+sQHtjI
         kY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773181258; x=1773786058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PmiKrgbRCdENnoUgQXrKp+F9EjF1+JrjBV/WyUOuw0=;
        b=VEZcf+KEsE4XxSaKU81OfNc5unLUhh8QfAt/3tlBcXslehBId9CILXPsjkcDOnPJbh
         OwVAYNIwMMQ3XdjFD8L5PJbE1XY77u1XnAYnSrLdmcHFhlL/3Kj3kwwQGb8F5pusY39p
         mx6r81urPhYai5lfVR8Q1sp9rvS68AuxHthYazykhhmI0ZYXkh+MwGFwX7aUdruISUrz
         pdegDdrbyxsgBkpUN5pAqapTH/7A6XdNvO4kdbx7pvUQJ9OumHNaZWwdAYpIARbrHGD5
         AeZ4NHjJn0mZ4nkGXxnaRSXggZnKEyuI2fEaJItMYDNqGvO7ILrBXMmwC2l7nDcil4o5
         d5Sw==
X-Gm-Message-State: AOJu0YyJ1UpiWyy3kc0vlJjwYUEhe2rglpAQfW/PB5eKRq5m462X1y+N
	Wn0XA0inzAIh7Y1UxJtrC21OqH5BqXfDOmiHk4zg2xGGcbJ1OXOtTtt5C2+ngdbG
X-Gm-Gg: ATEYQzxn3TgxFsFp69sR1vatLAhsxyWEbdDPr2sncs9McmL5U348q3BXTTJ3wWd/mkV
	Y8b78vWl4qoYP59HSg80bq0GKInWRaePb9XV39Zd3cCsWSH8gwLG7HNJWJAnzrN2nVcHgG95dEk
	z2qWwUTpDLt8Tah6NHXRzlYKUqzW1puOxA6Hjuw5wRQVXrqOZxBGY9TzPVVuJJfg3zKc3wSfLBA
	hW2etqAUJku7Q0GteSud6tOMb4Cp+zpNH7KorrRA+tIurjf24iseRImhjXNc/qLVmYDfDPSVi7l
	ygcXwvVPBsxY6MiDi3QWbXQHsWCk4SD91vT1gt29+s5stsOt/Rh2sIzGCLewGU9Wmzmj8k/COXV
	MUAht71yVz4JunlM4bGxpYa0AFHzXyfgRcYn+vOqO7fajqzaOO6P/4dKSPM3gkOz7bjeJhqzkzo
	ZjhZzCHYzVI9JbunDaKdjt0SQhiut1eYMYm/17mad/0X35+RqX7/WfXehTuIbLaJDY
X-Received: by 2002:a17:903:37c4:b0:2ae:6d9e:ed57 with SMTP id d9443c01a7336-2aeae7cee56mr3730555ad.21.1773181258114;
        Tue, 10 Mar 2026 15:20:58 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae246ac7sm3219435ad.25.2026.03.10.15.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:20:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] gpio: ljca: reduce struct allocation
Date: Tue, 10 Mar 2026 15:20:40 -0700
Message-ID: <20260310222040.10324-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1AA09258DD9
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
	TAGGED_FROM(0.00)[bounces-33039-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Convert connect_mode to a flexible array member to avoid calling
kcalloc and to combine the allocations.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add counting variable
 drivers/gpio/gpio-ljca.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..61252e0eb444 100644
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
@@ -72,6 +71,9 @@ struct ljca_gpio_dev {

 	u8 obuf[LJCA_GPIO_BUF_SIZE];
 	u8 ibuf[LJCA_GPIO_BUF_SIZE];
+
+	size_t num;
+	u8 connect_mode[] __counted_by(num);
 };

 static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
@@ -400,22 +402,20 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
 			   const struct auxiliary_device_id *aux_dev_id)
 {
 	struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
+	struct ljca_gpio_info *gpio_info = dev_get_platdata(&auxdev->dev);
 	struct ljca_gpio_dev *ljca_gpio;
 	struct gpio_irq_chip *girq;
 	int ret;

-	ljca_gpio = devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
+	ljca_gpio = devm_kzalloc(&auxdev->dev,
+				 struct_size(ljca_gpio, connect_mode, gpio_info->num),
+				 GFP_KERNEL);
 	if (!ljca_gpio)
 		return -ENOMEM;

+	ljca_gpio->num = gpio_info->num;
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


