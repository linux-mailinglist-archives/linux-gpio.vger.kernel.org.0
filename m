Return-Path: <linux-gpio+bounces-33298-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCjpJBMWs2mDSAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33298-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:37:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E77E278262
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 20:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B4C030205E5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3EB3F99CC;
	Thu, 12 Mar 2026 19:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE+Hpt1n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC473AC0FC
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 19:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773344257; cv=none; b=FKLtiAzEbDLzRZkMtIWSvzg5ugSXkyzlYbCeo/KcY9t6bx5faxqYFzQajaTbGNxXlQ2L+geG+PhoQPZcSapA6Z345f0uqPHvJkvIRpP+lzRsVq5ldIXuyy9gBBgqebfR/FOWxi5aZZ43MxUTjt6ehmNC7aokiD4hcYPz5kEYjZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773344257; c=relaxed/simple;
	bh=gXp1sqo04e6LO5/4Vkl6NRi4x49bKddvQgyl58yMMsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ER0htYwMYZilqoIROs/5aN8+JU8WioTT1yaecNitdqdsvyr7xE4k+TDth+RNAc2nMCtXdvG8qdRPK3EZt6cWEO2OEsdcUP5f5pRa8UCRozZ63uUx+ArUZQ1sBzivWPXGWSKrxlHYVO6RnF4t2Nve9SBCREB+22yDtFg8h+osI0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE+Hpt1n; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aea68839a5so11341965ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 12:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773344255; x=1773949055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzzRjNz0vk0FkgwQahTz097bKivrpMU+EtTeSnfZdlM=;
        b=gE+Hpt1nBQIUFo/d1YUzifVzwjkYNVE+GBzTWBaHT6yTKGMBcus7rvUtkun0S793jd
         JB2boFIci6CelAMYrChF+L8MS/hvL857T0BKBcAwza7dTgOYO55Wr3nxp2ajNtP6QGkR
         vg2Jp1TI8kfuztoJALX7LzdWou/6Fmx6T9bpTwtibBukaqMsPEBW5GmHFZJiA5BkVgpj
         njv450OipbBbLxvScvG47yOjh9CPAuORNlWpkT2RbYD7jvCvq3n2Z1namP1R0M8BpxpV
         AQxl2D9xW6yrUB13o4kAIFWmvz9P75Nl8ugE/gYbeAOs3sWIJd/BtGrwOMi2zP40TrRe
         ACAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773344255; x=1773949055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzzRjNz0vk0FkgwQahTz097bKivrpMU+EtTeSnfZdlM=;
        b=uszUjbIVtDHbNccpceu8voTXMwndMZWnqU3YiK0YffNY3GTaocToJi6qcMrSAaW8J6
         6krK2PLP5GmgdKeuP1tb00SNNxQ0qNvyTgB5/gBIpQSLdlhE9gl8YYGg1JsZNKQ7MPvy
         oQHSmy3/24ImrmiwGRieN76Rz9pzxp89EptxGqxJDEO24Waf0JRuYIl8+JgvUCKXWeGQ
         Zn1OWD50U812ttUTlJwQReHxZhvqZWdUoPd0uaC7o49AKIge85L0FTLVVBGYXGWNddYp
         HtDTNMWRtl77emg0ezv6Aud9+QgmpibAh8Wm9hwuqzrwj756ou2/l6xHdzZypo9mPRhT
         wtqw==
X-Gm-Message-State: AOJu0Yy4yt9k3RD5wLk++aAyZTSR9N9EOIU2uO8+rxjlEMwxnFdzmjz1
	cDOmZgCwfY+eiYV2ycI1qgkxxj+v8DPdbshX5XmHSoplThSIXOZ8oknRcSvf1kRl
X-Gm-Gg: ATEYQzwK8ogsjhggD7Vcrl6zEvgCwOUEjJPBL2PwKtMKQeV6LQHHHbB8HhtWoGRDaSt
	BI6HrRWUcY7S9O18EQmCduwWkCyrAT8iLgdRYpdHx0yT5ShbF1rJYprw91EHE0bD5qziKaSbhNm
	snEHDD+HhbL2+fkXKvAzsmQ5tMLJEogtgjSJwU3lVWnzBg60jCIbxOOWyrB5eqAYi11bsJKa4KT
	wq3oJey0mI3ZMRBI0NvncK6/9bX2IrIFqMcfYQD7Bvd4Ssy28LFDottCGCifT/alCXUCpVPRo4B
	53GUWs6npLm8dqw/gXTcZbCiNovVsDjtGpnLbiX0R6oLzSiuthPXDScQXgUI1sCkAN67TQnbVIz
	YrciU6L8sqPbk/H+WzXvttKLp0SufwgFxfkJtfieuSFh8GcPPE5IfQ7XqG2HmC7kh7+RShSPi2k
	R6U4I4Vx2mlgQLnmwg+sho1yCsbsCjOC1JgvCpYpPct+CXZ/XlGgFqFQ==
X-Received: by 2002:a17:902:ecc2:b0:2ae:3ae3:432c with SMTP id d9443c01a7336-2aeba46a7d0mr41568145ad.10.1773344255388;
        Thu, 12 Mar 2026 12:37:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34de20sm62461975ad.60.2026.03.12.12.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:37:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	virtualization@lists.linux.dev (open list:VIRTIO GPIO DRIVER),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv3] gpio: virtio: remove one kcalloc
Date: Thu, 12 Mar 2026 12:37:17 -0700
Message-ID: <20260312193717.12221-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33298-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 0E77E278262
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A flexible array member can be used to combine allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 v3: add counting field for __counted_by.
 v2: add space in struct
 drivers/gpio/gpio-virtio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..57d0eb532c3c 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -52,7 +52,6 @@ struct virtio_gpio {
 	struct virtio_device *vdev;
 	struct mutex lock; /* Protects virtqueue operation */
 	struct gpio_chip gc;
-	struct virtio_gpio_line *lines;
 	struct virtqueue *request_vq;

 	/* irq support */
@@ -60,6 +59,9 @@ struct virtio_gpio {
 	struct mutex irq_lock; /* Protects irq operation */
 	raw_spinlock_t eventq_lock; /* Protects queuing of the buffer */
 	struct vgpio_irq_line *irq_lines;
+
+	u16 ngpio;
+	struct virtio_gpio_line lines[] __counted_by(ngpio);
 };

 static int _virtio_gpio_req(struct virtio_gpio *vgpio, u16 type, u16 gpio,
@@ -541,10 +543,6 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 	u16 ngpio;
 	int ret, i;

-	vgpio = devm_kzalloc(dev, sizeof(*vgpio), GFP_KERNEL);
-	if (!vgpio)
-		return -ENOMEM;
-
 	/* Read configuration */
 	gpio_names_size =
 		virtio_cread32(vdev, offsetof(struct virtio_gpio_config,
@@ -556,10 +554,12 @@ static int virtio_gpio_probe(struct virtio_device *vdev)
 		return -EINVAL;
 	}

-	vgpio->lines = devm_kcalloc(dev, ngpio, sizeof(*vgpio->lines), GFP_KERNEL);
-	if (!vgpio->lines)
+	vgpio = devm_kzalloc(dev, struct_size(vgpio, lines, ngpio), GFP_KERNEL);
+	if (!vgpio)
 		return -ENOMEM;

+	vgpio->ngpio = ngpio;
+
 	for (i = 0; i < ngpio; i++) {
 		mutex_init(&vgpio->lines[i].lock);
 		init_completion(&vgpio->lines[i].completion);
--
2.53.0


