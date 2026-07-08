Return-Path: <linux-gpio+bounces-39687-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xia7NPLTTmqsUwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39687-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 00:49:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D223A72AF40
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 00:49:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qF3CfsF0;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39687-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39687-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05B113010DFB
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2026 22:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24A63859D7;
	Wed,  8 Jul 2026 22:49:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904AD36E497
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 22:49:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550957; cv=none; b=u57KVeuF/hpMZoBAEn+9m0Ys4pPM1jv00NWpxyx7h9n9b7/nf4NQWLdph7MSTIgMU7mg6ZMOwRG2u4ElSFLPcO6Y0g3tQyjaNNcaLbGOUgHvJDDbFAPYBQprCp0edDJOamWOG7nTyhdy/9lexEUdgJb1+05Qb/ux8sRkCFW9rnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550957; c=relaxed/simple;
	bh=X1NUVpDQ8vl/uisADeeaUpoml5NJsI2D9HCalPdWhdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P4W25pi4gBCkCHg5CXi3zRRjIMHZB5FV5gq5SAhYKxexnMzmTqOGvbXakC87BQFOEvD9BEOTvqiTpMhZQTLGUOSKqCjQfU3hD7Bg/av+AiO+gJi6eXRrXR+dZVaErQCKsVEeGPxdn7WZoXb2wsqERmO1bLQZDq08pmilvwtzSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qF3CfsF0; arc=none smtp.client-ip=209.85.160.173
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c8e2e39easo7315921cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 15:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783550955; x=1784155755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7N7lDaO72foXY0RGgwf1zTvt3mB3Hr39FiuOGnXHck=;
        b=qF3CfsF0PIq4DRU+O/4F3zmTUtNlomgj2PmyzUY2HXzVNb98sFcsbOmJeQJ2boz6hx
         igbvxdnftzXjzDii+InvpckZo216g4jB0Yhp+s5HZbWBicFOykoY1Nl3OmVhdMNrL790
         3Yr/Q4qFb/60EWBjp9tQ4vXw+mq9CnNbSUIO3hRkLTWkQrThEINw2w7gIXs1348OXdrW
         U5z75JS+K3z8Pnq0ichPOKY8KuB7IRIJ272DEIl7mRtFpbYBWW2K4PfChXnbA3FfzakR
         tBidiegedSsmRF2wvuzqftGgKfUveeaZ9gbHvJTHFxDUrafc0ARHKjAcCdeUyz2GaNWN
         8+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783550955; x=1784155755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7N7lDaO72foXY0RGgwf1zTvt3mB3Hr39FiuOGnXHck=;
        b=YuSvBDFMfBoUbP6lTTct0L4bEWzB2bOIJH2pRh6yKw4TVusCWvcQZbC+F6XYH+KF7l
         VUuFOVcLPtUjhO2VFveEcsidOhXKFCjLA+FVS8RpweTS32aBbpH5K/Hmi++9Rrv+o1Py
         Cmvhvg2JPspkEFdTU3jKk9bSIh8l3R23ex6EMJT8V1Mpr2+plASUhbEezWbGo+TLzpy1
         ftVQWqOSGCRU5+Dyr5Vql3MGIGTNqFwqSezwqs5c5nRbOdz84IdvfaP+z3QdzId0pL8p
         43K22xyw4EBEN2tGSw48p0oYt7cJ5CRRNKeEsGnbonALp4uFQvkPaNEquENEeZUQmGxD
         7whQ==
X-Gm-Message-State: AOJu0YwVleBtW854mnzDhJtdnqquw+rbrO8ZeVMEiShHe+2TiVRpsN4i
	/YJK3Ovel4K382hoSU+Uw3wh921YV1V6QHWOecQHnPti2IfiIYXfCe6VHEWyUw==
X-Gm-Gg: AfdE7cnfyNVNPy8LKlrbeaxVu+2UWafV2G2K6c2crPSGNbCJirkpuimlc9X563ZGr4O
	x+v25YyaGyychC+yK8Y/dXyveKyQHGnm++8294+ISub/Y7UJ2nCERM8G1wkH4tE71tN9nn5usmE
	ypw7/9j5rNC+2lYuQUkS4WNBBKAt0H/k/uuyjS0zqb8gSfxLNvhxoCX8UNL60c18lkfpzRoqdop
	rLoaw02PEm5NQQc1CzYW5ES/EVg8n7Lf35yDXcwFs+dQY5hP/nNpvJu8YiVarb/X+IQGLWJGlVq
	kwuv/rPOB3klkiMkXpjlOfq2sbmKFy3K5L7MjiWYQQ8usw1FBgDoltWR9OyYcohsenDFw6hzNNO
	KWEzlzs3i/wslnJUMX6SnPMWYdwT55KeUQNsoRiDEceJmFyZDI+C3kMfvYaKEiLBGACekHLQs9h
	eCMBeKfvqVtHfF7uj1JRxWtbp4SsbV16ews/1heL3G3tbO0jACGYTFiXCxeoE9Gal3bTxHEA0c0
	7ronfbGqzD8w5S5yjCsXBozoCFU0DO+yAEcFYa9qIwACOY/rYDyF5QhHK+DXIMAfw==
X-Received: by 2002:a05:622a:2c5:b0:51b:fa52:807b with SMTP id d75a77b69052e-51c8b49bff7mr50185091cf.47.1783550955465;
        Wed, 08 Jul 2026 15:49:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41e084e8sm143000721cf.28.2026.07.08.15.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:49:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: mvebu: validate ngpios before use
Date: Wed,  8 Jul 2026 15:49:11 -0700
Message-ID: <20260708224911.964245-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-39687-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:jason@lakedaemon.net,m:arnd@arndb.de,m:thomas.petazzoni@free-electrons.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D223A72AF40

If ngpios is read as 0 from device tree, it is passed via
irq_alloc_domain_generic_chips() as irqs_per_chip, which leads to a
division by zero in DIV_ROUND_UP(d->revmap_size, irqs_per_chip).
Reject ngpios == 0 early.

Also reject higher than 32, which is the limit.

Fixes: fefe7b0923459 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: reject higher than 32.
 drivers/gpio/gpio-mvebu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index a863b0bf46ff..73f4bbd2a0cd 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1176,6 +1176,11 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (ngpios == 0 || ngpios > MVEBU_MAX_GPIO_PER_BANK) {
+		dev_err(&pdev->dev, "ngpios must be between 1 and 32\n");
+		return -EINVAL;
+	}
+
 	id = of_alias_get_id(pdev->dev.of_node, "gpio");
 	if (id < 0) {
 		dev_err(&pdev->dev, "Couldn't get OF id\n");
-- 
2.55.0


