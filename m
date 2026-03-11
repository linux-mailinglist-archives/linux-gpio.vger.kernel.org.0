Return-Path: <linux-gpio+bounces-33046-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOnlB8nZsGlTnwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33046-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 03:56:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC1025B283
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 03:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B99B302B46D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 02:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F402DCF58;
	Wed, 11 Mar 2026 02:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzkuIDEq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CDC2DF153
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 02:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197761; cv=none; b=BTR/dmZHcpVxPEjonInH+zg/xX/V3EJN3z3N58bNmkPt/cX4YQfQK4y/VtGU8KxdOFhW+LlNG1nUsmALUIpiE9Biuw4FXjO1bBQNnJe8cQj5Wyfk8Ac3nyOh6HbVGovemgrFfK4JbOn29vhZxSgsR4MX8ARiYugEllcmsyJTDj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197761; c=relaxed/simple;
	bh=hyjfQXklLqkW/i7CefJGecdgWhNnoQXJHNE3mTmlTlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f+xAvcCtlDJDg84mwEp4FBLu7LsmSoA0z0vxu4N1vWplR5zugB5ZI6mYdCuQf/+mGM/fVMRkZHTRpUS3rdxt4xElf0r0wGMExtLEo1Ze7QFBZ6f+mvxtFU2+ttrgjKj/g5acaCW3wIt5mV0Mi4iHZZ/SHNxzqRYyNsaDDFg68zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzkuIDEq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-359ff894f0dso183882a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 19:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773197759; x=1773802559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8c6OjZm0+U7pnN7pJa7FIN5Z/TewF/LGu73XtmiIMW0=;
        b=YzkuIDEqy5ODAAozRB2nCuj1FJeWLHr+B1ftxolqwW6nJYdvRTz1C2f2e6vLjxlo66
         S/NFD2yAvxXirm4fejOdWxcYwbdUevdjGYQ8wkq/vucIMPmxKj31l2jnra/jv+tbkyNL
         YUePD1QwbElOJUq9svnEs1Z+meiPica1XLi9An2bgLV8YOpyw+1umJvnNxj1UUehrzHo
         7/W1zKN9AqcGdxFy5om+/Y0o0vBWN4iKzATcrSjQw6Yv+qhULGAzuHBfXnuuJf5fxuE6
         sYycTIbNu6QE8MiY3G5AdmNiNlzMMwptsAx4EVBuoqzvI4LaCM4+tKC3MMNoIA3nbxRc
         +6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773197759; x=1773802559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8c6OjZm0+U7pnN7pJa7FIN5Z/TewF/LGu73XtmiIMW0=;
        b=tB/qdK6IV1leQTh28dPkTICsVXct921kp1oHdmj4pbKqo4+LHLnhwzexcjtl6WokJh
         P3cChXhz4Ik9R7Uyaq984Yu0THhUbEfKjLARsVBzcP10zmmqlWT0bPeZiiGNbpHtx8Kb
         +WmU2Ui0c7fjJm8bS80bCgJtil3HThGJrJ3hN1FPDNB77xe4pfodThcwwXXL6VVEO89u
         AR0XFNW9e62eZCh+10ukKkEToW60/Di4YhdvUSATla+KFHHL9MoVp3MpOTOZBERmor5G
         vGilvoc/2CtvcbQKgfMt/LdrpxlQWQWsoUqLFhg//WlcX//sq4L5cLDvP91Xtu6I/zeJ
         Vm0A==
X-Gm-Message-State: AOJu0YxBrJR/P/SlgozRP50cj5cSPLNgXu7YA1TgnKmS1PFykVDjonBE
	qK1e74TvIz8os1Fqp63XeCG0MYOMVQsvZLTegF+I4kMjF0++eSvSPv282N6VTHka
X-Gm-Gg: ATEYQzz1fbgcjZOxC/Hxcs1x5MxhUoqSjZsUhj6TddfcuFJbYh2+N7t4lXoM5Z1s6TR
	hCd8OkANIHZEm/oMvNAgRQY5iDfZ6BVoc7IaZJUkaChKiSSygKsWg/3SQDjeaBPWNf9bDRRUaK2
	1DEDSXITIwvR9pbiXpYwh/exoigenMNBrZPiSA7W7keWFQ0eiT/jRqlnWP/Jac8qwdEr4n6nmiP
	52/cUYAt/nkWX8yqKoN7NP2riQp1XAOhuujgXOmTvvRsxEiv2mdGvUYansf+trV7b2vSRTIbga9
	RIe1M6xXcqSVzQTE14GfN3RPSLleFw6AHVHAOWfGtTIrLzOUOmA6Yx6uRH9JaSGxV73xSrR2pff
	rNqdKuh9ZBgCIFq6ePHnaoRI7T2FObYyizmGgz/7nh3Iv+1C1/gNc6mleOEZFj+T2pkr9jSAuuH
	D1hykvnSSRtbzhaJIAbPm/KlODh5ZIKNRJhXrTDxpdpGHBUXtbRF0fjQ==
X-Received: by 2002:a17:90b:3f45:b0:359:8d70:c4e6 with SMTP id 98e67ed59e1d1-35a012866b4mr885260a91.1.1773197759236;
        Tue, 10 Mar 2026 19:55:59 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ba23adsm475448a91.0.2026.03.10.19.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:55:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	virtualization@lists.linux.dev (open list:VIRTIO GPIO DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: virtio: remove one kcalloc
Date: Tue, 10 Mar 2026 19:55:41 -0700
Message-ID: <20260311025541.53814-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2AC1025B283
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33046-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

A flexible array member can be used to combine allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 v2: add space in struct
 drivers/gpio/gpio-virtio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..db66590ea5d3 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -52,7 +52,6 @@ struct virtio_gpio {
 	struct virtio_device *vdev;
 	struct mutex lock; /* Protects virtqueue operation */
 	struct gpio_chip gc;
-	struct virtio_gpio_line *lines;
 	struct virtqueue *request_vq;

 	/* irq support */
@@ -60,6 +59,8 @@ struct virtio_gpio {
 	struct mutex irq_lock; /* Protects irq operation */
 	raw_spinlock_t eventq_lock; /* Protects queuing of the buffer */
 	struct vgpio_irq_line *irq_lines;
+
+	struct virtio_gpio_line lines[];
 };

 static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
@@ -541,10 +542,6 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	u16 ngpio;
 	int ret, i;

-	vgpio = devm_kzalloc(dev, sizeof(*vgpio), GFP_KERNEL);
-	if (!vgpio)
-		return -ENOMEM;
-
 	/* Read configuration */
 	gpio_names_size =
 		virtio_cread32(vdev, offsetof(struct virtio_gpio_config,
@@ -556,8 +553,8 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
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


