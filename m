Return-Path: <linux-gpio+bounces-32872-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N/9KuR8r2kXZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32872-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 03:07:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F3124407B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 03:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F414322B266
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 02:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3080523A9B3;
	Tue, 10 Mar 2026 02:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJNOb5Jj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE372331A59
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108079; cv=none; b=HkUTdWCMmPzLHOLMOrjR2Nc7j4czHqVNuAwog2qo2Mw+U1KGXxWOKv7fZ+C3F5SsqYSTx5pkkPsDRl9qTqalnM+tgnTsu4SVZBSgyuLQL/jzJ6766kfSQAGCLiv1Y3ApSOLMLItPCVKu1kCdS026p5RhFEHiHYGKcFXZlYpQD+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108079; c=relaxed/simple;
	bh=r74vXhE8Sb4aeEjXyTRfyESwDzvu/qDaicDAjMleUvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErqsHqsotkH/MoNhOV2x3fc5dNHc/B0qkJ19N8MvjOIYk/RksPuQkTpjeNQezYMuhGoRWimRYBFx7ZD51Twg5uAmuewvrYasiBUWZftdjgiwk9p8friQBEqHgiYXJFo3sYATSfszOzDuI6x+o/FQD1m2pfCxR7cYYBjsuZ6znpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJNOb5Jj; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70f91776fcso5168150a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 19:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773108076; x=1773712876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lALqj4AFCCf04PXMDS8nK7oxi7K5MFhENXcy3JAs/Dw=;
        b=dJNOb5Jjoc+jmdYmgiu8+0knsmzfzdQvaoaUBRVv6lCtAtSXO0FEN+ZJpoVjxUs8B0
         Y2GiMIilV/ishEkDr3qPEo80DL15wyeVomYUQabdTOibrSVvsdaY56drAgsaSfjsF8ZH
         nvLtM4LvatzOFauc8/UDfhdSCX+5AQocJEb0dbV+fPO8giuwvwIsveckgFNigs4wq4Ir
         lNNLnN5mmMeH5imwjvTUgtmPK53wAIJfX/mszGqY+PDvRZ/+VWwOH4RUd/c8Sklvsc2M
         /4maCJwiAfdlHoglKfCj0qn/jJCg/BuhBoG4aD5+Kw84lkS10Dvxlcxr/MBP58cZ7d5n
         XjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773108076; x=1773712876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lALqj4AFCCf04PXMDS8nK7oxi7K5MFhENXcy3JAs/Dw=;
        b=WSktDPhH1MqLYIj5oqhHMCEKL/weK52GT1JVLPFbRglZQzTWh3HUa+dHP0/aVPz7+b
         1/meW64hgfzE3BJnDJ6gASdTb7YRSEDgD3vg+tfZlU3I7RfAYYtcAbjwKsS8FsjJTd3T
         1O340he6YFAN6nHfrJ1JZp32By9jUGCXJG/SsdZCkG2jTrv6m4UpXfcUR387JgQJ0Acg
         QOxiTT9gaDhRB0u88rtdSiDZqxzQaKwpMwKe6b5KMuqb16s+DMAn4PGGVdkgzzLkD9hW
         EMCP5xdz9G0RtoFzWeg9X9O7eGVgR/SLtmwNE9XZtBU6PrCanDTdOOHItAATl6fXl5mc
         DxrA==
X-Gm-Message-State: AOJu0Yy3DPBqHeu2hJBfuZPkm4z4uDNr2YMYNxPWLxOwsjNlrIyjYRg0
	6z+1/E+uwronfL7WiYUBEzfODYaYG1RRdLCuqKS8z19Jf+Z3twWuMzK8FmRhDrfP
X-Gm-Gg: ATEYQzwLphdEyO1tkolUzjYe+ksxceDoupze+dPrYijcrMKHIlmg4xVvzNo9W+UYZtK
	QkXQr/wKaXLyMwgSVQNGahTWVkxP2raBuQD+X3xxgVJANyfegJJ7vCJtn69j7y3KtNsxzOcJiKt
	j6Re0zENRLOdSyQwChbT7v5gPz1kctm/+V9c8R7S08DxZGNPwA7UyGICJLA6+EnBHEItcwvgl8i
	snJCC1aWVT5OrRZuu5LgiJwExAVBGc0PhRQ6b6Es4OqdiMyw0zAHOpaMWuOQeah0NgVV90Zq99i
	lRnajj64aHxUs9c9Vqa+76Y4WMIOseir0AmD6YE+m3pmX2jHcg4gYNk91ffa8xoqoAlZZOEDoGP
	xrADT7eRRq5VXkLRMmn4cpc0K/6uQCv/8N7mqMBfyv8wS5G7E1UrdonZGZs1u+or9L+KTGbsA/X
	B5qwXtvREUGkuOH4K2RtYSCdkvmfi3UkACRT1P6x9WVNP9oHLRjMkQhQ==
X-Received: by 2002:a17:903:2c50:b0:2ae:57e6:616c with SMTP id d9443c01a7336-2ae82362d1cmr136082195ad.3.1773108075517;
        Mon, 09 Mar 2026 19:01:15 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f78370sm135102865ad.43.2026.03.09.19.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 19:01:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	linux-hardening@vger.kernel.org,
	gustavoars@kernel.org,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	virtualization@lists.linux.dev (open list:VIRTIO GPIO DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpio: virtio: remove one kcalloc
Date: Mon,  9 Mar 2026 19:00:57 -0700
Message-ID: <20260310020057.340550-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D4F3124407B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32872-lists,linux-gpio=lfdr.de];
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

A flexible array member can be used to combine allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-virtio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..876a34ed739d 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -52,7 +52,6 @@ struct virtio_gpio {
 	struct virtio_device *vdev;
 	struct mutex lock; /* Protects virtqueue operation */
 	struct gpio_chip gc;
-	struct virtio_gpio_line *lines;
 	struct virtqueue *request_vq;
 
 	/* irq support */
@@ -60,6 +59,7 @@ struct virtio_gpio {
 	struct mutex irq_lock; /* Protects irq operation */
 	raw_spinlock_t eventq_lock; /* Protects queuing of the buffer */
 	struct vgpio_irq_line *irq_lines;
+	struct virtio_gpio_line lines[];
 };
 
 static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
@@ -541,10 +541,6 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	u16 ngpio;
 	int ret, i;
 
-	vgpio = devm_kzalloc(dev, sizeof(*vgpio), GFP_KERNEL);
-	if (!vgpio)
-		return -ENOMEM;
-
 	/* Read configuration */
 	gpio_names_size =
 		virtio_cread32(vdev, offsetof(struct virtio_gpio_config,
@@ -556,8 +552,8 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 		return -EINVAL;
 	}
 
-	vgpio->lines = devm_kcalloc(dev, ngpio, sizeof(*vgpio->lines), GFP_KERNEL);
-	if (!vgpio->lines)
+	vgpio = devm_kzalloc(dev, struct_size(vgpio, lines, ngpio), GFP_KERNEL);
+	if (!vgpio)
 		return -ENOMEM;
 
 	for (i = 0; i < ngpio; i++) {
-- 
2.53.0


