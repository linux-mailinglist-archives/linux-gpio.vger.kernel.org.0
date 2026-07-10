Return-Path: <linux-gpio+bounces-39790-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VxDDHNmVUGoT2AIAu9opvQ
	(envelope-from <linux-gpio+bounces-39790-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 08:48:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1D737D0F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 08:48:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.s=20251104 header.b="Kypyo/MK";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=iitm.ac.in (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39790-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39790-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21E6D3014242
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 06:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A66E3AFCEC;
	Fri, 10 Jul 2026 06:48:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFC2376A14
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 06:48:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666132; cv=none; b=EzvatTr0WxKHmpMyWFqkWPrcDaQ6DWjdIhCcEK9y1ooEr20hzWr/QOTrXxUH86QIAwxaiz8sGUCrMrecukRE5t5xAop9c7WyC0An+dYB6lw7C36FGgS1A99rF1+4iZjY1QIOnIL1HcH6okxlJBNVvuenZ5sa+I4EKBv5NFNHOR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666132; c=relaxed/simple;
	bh=FyVlgF66HULUOeOB98Ec7Aj9z8bIAtFx++WEmNLDrY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qdfMuBWVMbfcDaOP4eA5WOQE3m8gQnbuoAyhiz/48kPg4Jcjd6XbDgsmcwE6Hna9wmfY3ctPclkc0XjD3UQQf2Nv7V+lv9xmndp5Xtte0X8ETWBXWDrHIrsbXkITho3b8SGFdriPon8yACBMWxxJ4JuTqQR4okHbwkMvG6JSxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=Kypyo/MK; arc=none smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b9d265355so588645a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 23:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1783666129; x=1784270929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/l0rPx4zX7KEfyyU3sS7NcqZLrVuCTMh/Peqhx84eQ=;
        b=Kypyo/MKRC+a8zUsQw6YG97Gt/5ybVJN9mj6xvfeOkhMz/MTpy2hpl+9IRAen4+vqM
         fvP0Zmm9cMN8bD/swqf93AntFldwSkN6zVXwA2YZlvTOmJA1LaYfzodD8xsqj2GjLfEN
         ajy07JT79rZ888KX2siEhZgNWVh96EZ4/8OFjWIeIsecDdyyGlq/mF5oONp2pFTYMKiK
         HIgvsNJrQ7yCSwblPfTgh8+L6Vm0wUpE58YqM5Qx1Qj1yT/JxWyqDEfuZ1f9tHsvgQ4S
         YJQMN7tKluQUE+q5fiBRwadCxI7k9fitlbpPsQWITeK/iQAG5iAR4PxcdwC56SZW4Lth
         hx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666129; x=1784270929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/l0rPx4zX7KEfyyU3sS7NcqZLrVuCTMh/Peqhx84eQ=;
        b=YgxMQIFYq8uVbBo7bhHAPETwWnn5KFquSI0Axi9SIzpHsYNnUDw6fC+JySaCVmda0A
         zrgf0PhxqdYd0ELiYn1JEZYwgaZTvEpOsRO4NhRvtQi92Vnf/pEAolHXKKZcm6VcXnzU
         pzZqpSO2XrROap6ZR3lsQ/OelJ1vkkpJdRQD/p+X8Q2llEySAf9s6mpWr4krPU5kHU0c
         1n52tgPKhSK546xaySugm7WJfsaTbpnS42gb61KzZFwxC1ZzjjGDMyDhv6aECEdwnJYA
         qvnTFuNlQ6qhgOs+qejAEYEHcDclgx0U7Fe5CoFis8tmIvyKHeNJnzkTR6qAGBPMOGw4
         WQqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4A28NOqB6D2uE/ZJalhZe5s+3wpb2hLC7irIW0KN1PToHbJKToGIu6mmQbzEtQRjIvvCm8sprxBkC@vger.kernel.org
X-Gm-Message-State: AOJu0YyktJADgVRPG67Nx1mWWM4Es227JtFwOVBWXTLyMOMUljHdv10U
	0RF/MjbZ2vnQme7qYnWSocMpckFqNfmhrfEyyFG+WGLdahkrygM9VSIKKkOUMqMm3J4=
X-Gm-Gg: AfdE7cmyXliHfiigykE1N7Uh6p/4G0BUHewVdszC1BC6Q06J5zwaWIlCifyPjxEbko+
	pnKMBFFphJ7QmUPtRM+1Qnh6rOMqln+mcbpasLyOywkwY6+T52l0UCx2DysJzO9bYza6lG4nlmw
	3n/Z/yG7j0beIWFKHdQr7v7L7c+2yLzlDvEqp+2zEZia55zO9iD18Mp9AYCgNJldPKCl5YW6HYL
	6zGv96w4UGRMhG0sucUmPmDptlEarm0/yee1Eq60M9Fep/e+lt1avn4TmbVt5hHFNdmS+ef7qva
	LLlcOcwCcU9Hwux5oZuM1LZ+rIVjbyXI22cHOnHU/T3/bA5DV8c/iKBndXHaz2rTnBcH8aNWf3R
	jpaUuZsmkS1RbTv/eWRZPDCiMMua3n0rOGHggiclfBNoAlct2KzMs0R7UQwYVsgY7YLwBQmOP8M
	gucNcj972bdaE+dQXFgq2unKnF4DvhitP/sLKSEGjAJ9LOsbE71DRY0/c+ewHzkl8SlwCKCQrT8
	LnoLQJqq9kufFg1YqvaLwWwXYDtjPV3cSXfhPGFLNI=
X-Received: by 2002:a17:90b:314c:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-38940536527mr10336039a91.19.1783666128850;
        Thu, 09 Jul 2026 23:48:48 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm42342498eec.19.2026.07.09.23.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:48:48 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: wsa+renesas@sang-engineering.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: sloppy-logic-analyzer: Fix memory leak in gpio_la_poll_probe()
Date: Fri, 10 Jul 2026 12:18:36 +0530
Message-ID: <20260710064838.153528-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[cse-iitm-ac-in.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[iitm.ac.in : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-39790-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[nihaal@cse.iitm.ac.in,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cse-iitm-ac-in.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihaal@cse.iitm.ac.in,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,cse-iitm-ac-in.20251104.gappssmtp.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C2E1D737D0F

The memory allocated for priv->blob.data is not freed in the error paths
that follow the fops_buf_size_set() call in gpio_la_poll_probe(), as
well as in the remove function. Fix that by using device managed action
to free the memory on remove.

Fixes: 7828b7bbbf20 ("gpio: add sloppy logic analyzer using polling")
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/gpio/gpio-sloppy-logic-analyzer.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 2bbd308ca08e..7b4af98286e8 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -160,6 +160,13 @@ static int fops_buf_size_get(void *data, u64 *val)
 	return 0;
 }
 
+static void fops_buf_release(void *data)
+{
+	struct gpio_la_poll_priv *priv = data;
+
+	vfree(priv->blob.data);
+}
+
 static int fops_buf_size_set(void *data, u64 val)
 {
 	struct gpio_la_poll_priv *priv = data;
@@ -237,7 +244,12 @@ static int gpio_la_poll_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
+	ret = fops_buf_size_set(priv, GPIO_LA_DEFAULT_BUF_SIZE);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(dev, fops_buf_release, priv);
+	if (ret)
+		return ret;
 
 	priv->descs = devm_gpiod_get_array(dev, "probe", GPIOD_IN);
 	if (IS_ERR(priv->descs))
-- 
2.43.0


