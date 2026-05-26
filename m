Return-Path: <linux-gpio+bounces-37487-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id k4UgEig/FWrZTwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37487-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:35:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC05D1331
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 08:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 866FF301DCF2
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2026 06:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02185385520;
	Tue, 26 May 2026 06:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KDGebqiS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE55C284B3B;
	Tue, 26 May 2026 06:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779777316; cv=none; b=kEKv/KMcx3XP8p2bfXvmnwOgo3VRFpFnd9acJM876H1BjORmxp/R3KXGpyUYJpALbPW7DaivKhhvQaPlAu0BkZqg5dwi/vtPhrlHlhNT9698RJHDdBpKTFpmcYcsYU6Jz91zw54vez7arUlyCJfJzRUngnhPfSftu8O9VAblEm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779777316; c=relaxed/simple;
	bh=+DPhe0f9n/BdhOA+tCs0kwl815jMEZvP20htrUqfg+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edAZHgcI9Ck2QKhIarGBFlJIAwV4qDbtUYA8YSoxECLK1tm3oHbESrwfFMnMldHkVVxLiSPnEepxOFoBYLAkq/FZX2Gp1AABk6V3qnduI4fUg0WTHKRZ8Gx8NQ5bnvVVHOqRj4iGBP0HZwHUXZSmJAylimoIFDVBm/TQDRQUYKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KDGebqiS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=8XVBgfioNoFF3XKmhaeZO33+RcBSbm4amlt4C5V5yD4=; b=KDGebqiSbDLX4U8zIhDPAPmY0v
	xT4XZltu+uzeO9efqmny5UcqLSX89y7V0fKqiWd5zcigYhi1Dv2RgJWVVpCyGgOwGVwLGHsR8flx/
	fSmTSPFWxjIAVz9Nq+bencsVzin5awLvYm/4KBqigF5pQ1/uJhWK2FFB3wsn3xBxwCNjdvaGV/x91
	HgZEx+VLT5ktrxo3bClz6JgcLlcQlerhEB2e2ncQoP77Ukej43mGODy+53b7Z/t0mvyyooemWcEcm
	BzYoy6rBwhXi52O4vTwZLwALGAYKB2Xp+ZIgw7nuYFqJQx+f+wBqSFwhpOtH8CztUSXMZNVNTbQTv
	CBZ+rIFA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wRlNb-000Dvn-0K;
	Tue, 26 May 2026 08:35:07 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wRlNZ-000M6u-2q;
	Tue, 26 May 2026 08:35:06 +0200
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
Subject: [PATCH v2 2/2] gpio: mxc: use BIT() macro
Date: Tue, 26 May 2026 08:35:02 +0200
Message-ID: <20260526063504.25916-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
References: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28011/Mon May 25 08:24:46 2026)
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=default2602];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-37487-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tq-group.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7FBC05D1331
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the open-code with the BIT() macro.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
* Improved commit message as suggested by Frank
* Collected Frank's

 drivers/gpio/gpio-mxc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 12f11a6c96653..7e2690d92df6f 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -330,13 +330,13 @@ static int gpio_set_wake_irq(struct irq_data *d, u32 enable)
 			ret = enable_irq_wake(port->irq_high);
 		else
 			ret = enable_irq_wake(port->irq);
-		port->wakeup_pads |= (1 << gpio_idx);
+		port->wakeup_pads |= BIT(gpio_idx);
 	} else {
 		if (port->irq_high && (gpio_idx >= 16))
 			ret = disable_irq_wake(port->irq_high);
 		else
 			ret = disable_irq_wake(port->irq);
-		port->wakeup_pads &= ~(1 << gpio_idx);
+		port->wakeup_pads &= ~BIT(gpio_idx);
 	}
 
 	return ret;
-- 
2.43.0


