Return-Path: <linux-gpio+bounces-34913-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHSjKXRU12kFMggAu9opvQ
	(envelope-from <linux-gpio+bounces-34913-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:25:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA0B3C7001
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 823E33036771
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EDA3793AA;
	Thu,  9 Apr 2026 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HCuqhN23"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A5371063;
	Thu,  9 Apr 2026 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719358; cv=none; b=JezXS6qjYkBsoi71WIu3n7uy/hq8F+Vkm41vnL4fHrDY+23vIZ7p8cuG49rMgUkRO5XrEgediF2WT8fApz/OLLn8X8BrkTFV8nRCqBuKT5KSssxU+XkTG5ykW2y37tOtHppDStYF8CsX10z9wMOIJV7zsTBA1NILleAMHAn8oME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719358; c=relaxed/simple;
	bh=uG73nu9hZqiUQm8fuGJfOeHuM7E6GJFt0gE+Y+A7xtI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WOeOvI1XOeXSBZP/O3M8p+74T4prY72t34cN6OvqmMULKl+GRvdet9eGc7iv30v4TXaM2tEl6hnFiQRNAUuw0eauyUtM0cTSqw1tko+foBeNrOYUjSbsjVxXZsrpqWPMG2CpFT9ff8rwYxbBdHLsqbu44SxykAX/gWdB3fPak0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HCuqhN23; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ix
	eCLXd2qgXHzwKPvCTFfj8A0JjMaFnvXAu/L8gz2AU=; b=HCuqhN23j/HLwAwgdz
	fX+2cMfJH542hXntrPL9u0PEUpTHMM/Od4OTBxdqfw9c96U0VLwnyLRhATIxvjrT
	HnoAiesFPDKG+uu0zeCddhY09U8nrOWLu+08Cp+tiMmr2Zm2ESQOabrkiJUICUr/
	Bdzdj17T4L8t8mgmIC2we9rvA=
Received: from pek-lpg-core5.wrs.com (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wCXsa2mU9dpXL5fDw--.60815S2;
	Thu, 09 Apr 2026 15:22:16 +0800 (CST)
From: Robert Garcia <rob_garcia@163.com>
To: stable@vger.kernel.org,
	Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Robert Garcia <rob_garcia@163.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.15.y] gpiolib: cdev: fix uninitialised kfifo
Date: Thu,  9 Apr 2026 15:22:14 +0800
Message-Id: <20260409072214.164971-1-rob_garcia@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCXsa2mU9dpXL5fDw--.60815S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4Uuw4DtrW3AFy3uF4kZwb_yoW8ZF43p3
	y7K3W5trn7tFyxW3y5Za1fZFZY9aykGr9I9rW7K347uF17JF9FyFW8AFy3uF45WFZ5Cr1Y
	vF45AFnxuF1FkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piG-ntUUUUU=
X-CM-SenderInfo: 5uresw5dufxti6rwjhhfrp/xtbC5QhPumnXU6gKXwAA3I
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34913-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,163.com,bgdev.pl,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob_garcia@163.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0EA0B3C7001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Kent Gibson <warthog618@gmail.com>

[ Upstream commit ee0166b637a5e376118e9659e5b4148080f1d27e ]

If a line is requested with debounce, and that results in debouncing
in software, and the line is subsequently reconfigured to enable edge
detection then the allocation of the kfifo to contain edge events is
overlooked.  This results in events being written to and read from an
uninitialised kfifo.  Read events are returned to userspace.

Initialise the kfifo in the case where the software debounce is
already active.

Fixes: 65cff7046406 ("gpiolib: cdev: support setting debounce")
Signed-off-by: Kent Gibson <warthog618@gmail.com>
Link: https://lore.kernel.org/r/20240510065342.36191-1-warthog618@gmail.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Robert Garcia <rob_garcia@163.com>
---
 drivers/gpio/gpiolib-cdev.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 3cd19ab1fc2a..d4b221c90bb2 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -896,6 +896,7 @@ static int edge_detector_update(struct line *line,
 				unsigned int line_idx,
 				u64 eflags, bool polarity_change)
 {
+	int ret;
 	unsigned int debounce_period_us =
 		gpio_v2_line_config_debounce_period(lc, line_idx);
 
@@ -907,6 +908,18 @@ static int edge_detector_update(struct line *line,
 	if (debounce_period_us && READ_ONCE(line->sw_debounced)) {
 		WRITE_ONCE(line->eflags, eflags);
 		WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
+		/*
+		 * ensure event fifo is initialised if edge detection
+		 * is now enabled.
+		 */
+		eflags = eflags & GPIO_V2_LINE_EDGE_FLAGS;
+		if (eflags && !kfifo_initialized(&line->req->events)) {
+			ret = kfifo_alloc(&line->req->events,
+					  line->req->event_buffer_size,
+					  GFP_KERNEL);
+			if (ret)
+				return ret;
+		}
 		return 0;
 	}
 
-- 
2.34.1


