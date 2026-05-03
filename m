Return-Path: <linux-gpio+bounces-36002-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1rj7Hk2b92lkjgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36002-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 21:00:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B604A4B70E5
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 21:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 128533009141
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 19:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D0E372ED0;
	Sun,  3 May 2026 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsrCCPon"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA9E38BF72
	for <linux-gpio@vger.kernel.org>; Sun,  3 May 2026 19:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777834823; cv=none; b=B9kPC4EIFftjPzhBOyWABSh+3r2zV2BCPT9xSE8bK4M2IIO/9sCCFrEInY73+hbHbe+kwWk5sHEW7l6+GWU9SWowS1xWBXyTQz7yT10mt0iozDKju4XhCPTAd/J8IzYeYIGISFKoxiV3hUMcP31Kizd+SX8X8lWHLN1kh4/4T3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777834823; c=relaxed/simple;
	bh=o6F3nF2O0oh1QqtBXJyM5pwHLTdevetrcOoH6c/SVrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JTRgxN84kEAJcz1TapOHWGjzyqFoLZRF1sNv4KBeDdDQc60vgeEiHTi7xGCIOji5JJoIrnb702SJU/3JIeVIiXRu5wWyMSBV/aJfFRMax2j1Rxlcmq9X7Oj196JZ+Hv4ynxLsBoL6L8ROkl2egBcRf+dpT4GmZsK1l3a65rZnac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsrCCPon; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8296d553142so2309227b3a.3
        for <linux-gpio@vger.kernel.org>; Sun, 03 May 2026 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777834821; x=1778439621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KjVAUyKukJeCfmaUj1rdh/OVSGApfRD+jJDm/U7qFBo=;
        b=DsrCCPonOxied9ANQ4e+E3Uc8D6GjFG/28vOAWLuqCQsfdbu3tXw6Vhw3ziYle57xc
         R4sO1K8KtVW4F/PlG6zfbqC2jOlwzYgduws4DcdHhdLiW2cIJpOjpGBs+gkGXz0Pl0EC
         55/14EK47HMj0XHaMgC0G/JUvaGGScPv6aZS0fqIyFPNk2xBmht4uyZfOIheb94ajq01
         Amt5X5R6Is89X9GNM5li4sth7Fba7Km2SBv74Jq0Yl87QEe1QMAhh1NJS8ScB2A29QyV
         LsBOAu7n0y110kSTX/Xf698vhKGrY3HLtsQY+/yQQeeLMpH8Y4m+gtEermo+BX+hokDk
         +EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777834821; x=1778439621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjVAUyKukJeCfmaUj1rdh/OVSGApfRD+jJDm/U7qFBo=;
        b=Fy7rZ3O4vYg3MvQuvSaaSp+vmEo7y+edRHt25snsU3u/GCD4OZF5n5dYGMjvdW5avJ
         pLlLuctQwxAfd962UOZBY0I2V/z/szAIbytwmoO8W04TxBT4sd2JKw/izy0V+wkjgbj1
         eIW52LQjbUT1sZWdZv4UPMTdcxEqPK0gwFjRW0i2uPDDl11Hs0zxewiiddHXX/cNf5Q8
         1JAACfCiKsG61dtrFQoYPy7gNLm/R6mjniIeQTqY8VePIkDShHThXyd/NTCugf8OfRgi
         uwTpN1M/5wDTFVN+Lz8sCg9M8uoXWVmnVUQ5sUjv1idtHSx2cMOmb0oLGYd2JF2cDXrx
         BkBw==
X-Gm-Message-State: AOJu0Yxc1ySu1mxQLe+8KpbBhyuyx0joE70v3UX314ZlOqZCB+nObS1N
	pNBqbUDR2yDtwyAxWSxXKL/POEYlPQK1gnZuz29ugaPgyiuUHIdfA2+mS1noVg==
X-Gm-Gg: AeBDieviLLc9Uo8TBwToG0sMNMH4dWnCzP7kC5GyrEMMaAOgC46XmTDoNzQlzTVs3ZW
	/dcanJHcAA1SeYv4Zy461sEdWiNarvbr1WNoBseAeBx1QjvX+Iu9CdrNaqsgMYC40RW2YufaG+V
	pBjMHtINmDoSmgkS9mAlalY814R1+AbS9IdsYBjErrDndmW/waMwPkt3j+hcWQY07uHrPD5v5Ja
	ZePtYr3HaDtirLLnP1BYiWszbeW8szZ+jUmbN/K7m2M0rJDhxWLVmiUVRtaLAkdP7k/SdSWnzL3
	QLMy770aJig0Uil39WMOkRKb7NGGzET//G3BH0FGBUubqDd/ErSYT6UV8jVhqzqLvk0VJnqM+Vb
	+96IgFbWExkF+Ljosy5CEICCRZ8eqMA908tS+WywoCjaUPsKjqUc6i1zLkKxBhtDd3kQ2yxD8yU
	deBkKfTpSXU8o9B3Q6crDkUXEZRN4DGDpEvKmb
X-Received: by 2002:a05:6a00:430a:b0:81f:852b:a925 with SMTP id d2e1a72fcca58-8352d03bf06mr5948036b3a.1.1777834821160;
        Sun, 03 May 2026 12:00:21 -0700 (PDT)
Received: from localhost ([188.253.123.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0183sm10229043b3a.31.2026.05.03.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:00:20 -0700 (PDT)
From: Zhang Xiaolei <zxl434815272@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	warthog618@gmail.com,
	linux-kernel@vger.kernel.org,
	Zhang Xiaolei <zxl434815272@gmail.com>
Subject: [PATCH] tools: gpio: fix buffer overflow and add bounds check
Date: Mon,  4 May 2026 03:00:16 +0800
Message-ID: <20260503190016.13439-1-zxl434815272@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B604A4B70E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36002-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zxl434815272@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Replace strcpy() with strncpy() to avoid potential buffer overflow
in req.consumer. Also add validation for num_lines to prevent
out-of-bounds access to req.offsets.

Fix incorrect ioctl name in error message.

Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
---
 tools/gpio/gpio-utils.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 4096bcd511d1..1afd9dff2bed 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -65,11 +65,15 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
 	int i;
 	int ret;
 
+	if (!device_name || !lines || !config || !consumer ||
+	    num_lines == 0 || num_lines > GPIO_V2_LINES_MAX)
+		return -EINVAL;
+
 	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
 	if (ret < 0)
 		return -ENOMEM;
 
-	fd = open(chrdev_name, 0);
+	fd = open(chrdev_name, O_RDONLY);
 	if (fd == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to open %s, %s\n",
@@ -78,27 +82,29 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
 	}
 
 	memset(&req, 0, sizeof(req));
+
 	for (i = 0; i < num_lines; i++)
 		req.offsets[i] = lines[i];
 
 	req.config = *config;
-	strcpy(req.consumer, consumer);
+	strncpy(req.consumer, consumer, sizeof(req.consumer) - 1);
+	req.consumer[sizeof(req.consumer) - 1] = '\0';
 	req.num_lines = num_lines;
 
 	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
-			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
+			"GPIO_V2_GET_LINE_IOCTL", ret, strerror(errno));
 	}
 
 	if (close(fd) == -1)
 		perror("Failed to close GPIO character device file");
+
 exit_free_name:
 	free(chrdev_name);
 	return ret < 0 ? ret : req.fd;
 }
-
 /**
  * gpiotools_set_values() - Set the value of gpio(s)
  * @fd:			The fd returned by
-- 
2.54.0


