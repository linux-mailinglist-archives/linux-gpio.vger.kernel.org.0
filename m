Return-Path: <linux-gpio+bounces-37316-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBhFLQIAEGqLSQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37316-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:04:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00E5AFCCD
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 09:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 836D530209D7
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 07:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D335E387361;
	Fri, 22 May 2026 07:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DeU9HwHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018061E1E16;
	Fri, 22 May 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433292; cv=none; b=D7M3+JmadH47UbdtF/Y9SBHNcNRfvk4TEfTeaLSbyA991sM8/54AwXjqUoWjc0w++qNltgln2WkRHqK3kyhqk8Hucs09s0Q0CKkO+kieFTpONMGndO7/lGO19wWMlEzszCQaW+8rEpdyq1opguZold98e+zf+O4SqXs/yNqZrpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433292; c=relaxed/simple;
	bh=xwsD3uc/AvgU9eIQbiNd7ilP/hdwXkc/mLN6ckeWksI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D3TVeNjhIaWw6Xiss9OUOmbF5A22Li1kDKuIRPE/lkaufpQ2VmlGHRS4E1dBrcJDLkA70hw4lF5+EWMZ0Ymk1oFOPw3UbBMIxrLFHvojMveiAz+Esh5zSdI7imqiMJghN+0f+qtBH+BFxh97WSgQ2rixaFJhFkn8qqZvzyzkpwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=DeU9HwHl; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=9KLSNUMRSOCDv68eVq0zVj+JhIvRZYvAxY+y8avTqLE=; b=DeU9HwHlnjo4Zme9H2/6ve3gL+
	VRUQuDnD30JFNmZX+9sL+XZ82GKWPY+ZLgd7pSMj0wgGeBo00fFJywOade2go6+IpQGp3cGxytUkJ
	V8+ZstujXNIpr72WdaqrVpsuajfju/DZ4WkCZ9WXIo1IfsYkEt+c8C5H86qYHaiz1RcKzUmMaPClK
	/yulSX6yQcQvemQB1wEuExrzza/XvUADUA81pDhYiQysXNB4VQRO5RvPzhJrRWnENtbvVDoaUFu+x
	yk1AG36825wApIjrLUy0a1V19r82ewHf/jEI6xjKmOEdHe78eQaxdNTFNBKxZxVnLx74jQsORnVGc
	0lvYe+FA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQJsn-000JYj-2k;
	Fri, 22 May 2026 09:01:21 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQJsm-000AIT-23;
	Fri, 22 May 2026 09:01:21 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: mxc: fix irq_high handling
Date: Fri, 22 May 2026 09:01:15 +0200
Message-ID: <20260522070118.800671-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28008/Fri May 22 08:24:46 2026)
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-37316-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.993];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ew.tq-group.com:mid,ew.tq-group.com:dkim,tq-group.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1B00E5AFCCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If port->irq_high is -1 (fsl,imx21-gpio compatible) and gpio_idx is >= 16
enable_irq_wake() is called with -1 which is wrong.

Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspend")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
I don't have hardware to test. I just noticed this by code review.

 drivers/gpio/gpio-mxc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 647b6f4861b74..12f11a6c96653 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -469,7 +469,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		 * the handler is needed only once, but doing it for every port
 		 * is more robust and easier.
 		 */
-		port->irq_high = -1;
+		port->irq_high = 0;
 		port->mx_irq_handler = mx2_gpio_irq_handler;
 	} else
 		port->mx_irq_handler = mx3_gpio_irq_handler;
-- 
2.43.0


