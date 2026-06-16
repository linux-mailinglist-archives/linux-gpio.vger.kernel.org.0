Return-Path: <linux-gpio+bounces-38585-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S0POFUo+MWowfAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38585-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 14:15:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65D68F335
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 14:15:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OJQhQFcF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38585-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38585-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0763230E1A5C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 12:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEAC35C1B7;
	Tue, 16 Jun 2026 12:15:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B623CAE7F
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 12:15:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612102; cv=none; b=KBtEUo/ckXFjc5S2aJzUQFoocnYpiziWc728iXxz2nyQfFERXJ4dNGSI7TzHIUWYCpyYwMh7XiKUxtkuYobKnFDTVkrmWSPSYxNZg43UgKo6u9/Ldl0yJVIeG230lG61tKofoGpbvMvdFw9H6JMNwNeH8vYWnHCxXaRROzYaaGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612102; c=relaxed/simple;
	bh=6S8wuEyltAzT8/X/ySOKtLmdWupADMGiotqEpc6gdtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=udDzLh3qPJeaWE7ZfJ2Peb+0nVOP+3tEVpcn5jZTDEMbimhayU9haFShFSBlvZOZBYdAW7l+RyPuL9fckTobXZ8YJp6hQ0u4rHyTpH9aVjkOt8RmQ+DGFb2YeGnBqZ2HKEtJZ+qIpQ3PAQfUBzi8EuLLoKMPm2inrqfNWX4AUzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJQhQFcF; arc=none smtp.client-ip=209.85.215.171
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c858961a8efso1868348a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781612100; x=1782216900; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50SE8l3bKCw1R5C7MBcazdi1YXMeu+dYN+l8lo26Bi0=;
        b=OJQhQFcF5quMFVmcdZEIQIe0HhLKVrPfKqDrVJlpmpfWyy0cy/lqO2TYO/rDOYmLc7
         goHumlYG4NuzqWUwcmn0ZLiShlb3FNsCn10ZwpFXeCe0kb5Vd7MumIXS5W4MNijElpaR
         WUxg4zZjP4UBuyQe7NheC4lzpCC1dCGc9bBtaWoWErOiY4mAayu0yp9CepVbo6fkJfv1
         v4yNkLUktFARhAgwm3H3PPUMiXugBUpXD6tMTG/ahxezic6oauSHVwpcZS1r+KjRi+pD
         AClbY5YpW0TiM46NeI54dr2qJh7Vyee5UIzGRhswmtM3zNpd2OcRIMeVWcPyF8kNf9J5
         t3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612101; x=1782216901;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50SE8l3bKCw1R5C7MBcazdi1YXMeu+dYN+l8lo26Bi0=;
        b=Nqt5phu5LV5XzAgU1Xptq47jEFi7s28oIuS75V80yZxXVkmPzTbB15ssZ7NoRMxxu1
         DUC2d8QivZnZPswgOotKB2zi9PsS+RQ8ybKwJk+2s2uFEc8iqmjTX293/f1qumUdbK8a
         qgMfD2FuGSvg2u1Fp2PRZSRDJdmfuZnNJ+mo9o24ix++QtULuQnw2bLikT7Ab9oxea6R
         lEd2En2s/2m9knP2fRJs8gxqzirinDokbKAjZZoUukXpe0JiBOYHqstR5O34w77BOooN
         X9VH2Fz6OWyaf71MBZgD9xaT0yl3QMqfq9fwEhbb9BRdPEHVkVHPUbEPOJJ83RXqlLMg
         JSuA==
X-Gm-Message-State: AOJu0YxZMWEMctOBDSOSNKhHASuwyAz/lvw7Bt9COo5bAkPpGnPhI6z6
	bOsqiQESBic8H/B0R7MqChKnj6EcF7CWkYsalpp4qckpHOZQiravFzDq
X-Gm-Gg: Acq92OFeouBusuG5y6UtaITVMUgWwlF/4mVArWb2uMfncBKqUYMD3rv++29Jvz5qteB
	1qpdce5Q6zteibD2GyXYwfeNsWqZYFGrJ79J+zoJfozkdnjcMhxuqQvq6neiIQQHABfDVQYidhy
	c4W2LE8EDtNoC+SaAWplqLV90WDEq7MWZM9bLH1UI3M7xep5SMbG1mxDE2+bw3x3+k5xliOnfCn
	XvNdcXrmxMV9M+LB8i9B8RKUlmy41bdNXh6i2LGlJyUtjkogN43dyu9/M3XhntxGdoOe9yEYkWj
	t5mZ1pcmym6tBqgds9efkqsZPLRoGltujPk6OPKbTxw7CvBW3TARe2YnSJSlUjDnlNrsB6u81g6
	XBHu9ORYJZtcT7Hus203VSE57XBW/RbAJxdqGzm+IEEc4xfnbpWanqFEL2aGmGaT7+iT6IwKxUR
	EFIdeAN6doe5yPHtC2UKvtnNWR5ajtlov9fB9nXDaZAKN20GYvw41P8nX7Krws5oOdgNBBnTGXZ
	sXw56WztC+GxF5gnw==
X-Received: by 2002:a17:902:ce03:b0:2c6:a99a:52a9 with SMTP id d9443c01a7336-2c6a99a5426mr9079815ad.7.1781612100226;
        Tue, 16 Jun 2026 05:15:00 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm135118355ad.12.2026.06.16.05.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:14:59 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 16 Jun 2026 20:14:49 +0800
Subject: [PATCH RESEND] pinctrl: imx1: fix device_node leak in
 dt_is_flat_functions()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-pinctrl-imx-v1-1-777c14cd2858@gmail.com>
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781612096; l=1643;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=6S8wuEyltAzT8/X/ySOKtLmdWupADMGiotqEpc6gdtc=;
 b=Zku0M2FJaEoEwwEmrCy//KeKEm/UNXg9nSoC03e69VuLUmDz9Ml+HSmsuuOUOgc4xg7mHQJS5
 d/LUhvYU2XUCGf2+Y9u4oXQNobiZ7p+MVx3pW+HgMzZyL+314bfXKqO
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-38585-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aisheng.dong@nxp.com,m:festevam@gmail.com,m:Frank.Li@nxp.com,m:ping.bai@nxp.com,m:kernel@pengutronix.de,m:s32@nxp.com,m:linusw@kernel.org,m:s.hauer@pengutronix.de,m:linux-gpio@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB65D68F335

for_each_child_of_node() holds a reference on the iterator node that
must be released on early return. imx1_pinctrl_dt_is_flat_functions()
has two early return paths inside the loop that skip this cleanup.

Replace both loops with the scoped variant so that the reference is
automatically dropped when the iterator goes out of scope.

Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function nodes")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0db..4a6bdaefa42f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260523-pinctrl-imx-b198f8391abf

Best regards,
--
Felix Gu <ustc.gu@gmail.com>
-- 
Felix Gu <ustc.gu@gmail.com>


