Return-Path: <linux-gpio+bounces-32396-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tyJUDkfTpWmvHAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32396-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 19:13:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF881DE4BA
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 19:13:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B53673041BC9
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 18:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B45833509B;
	Mon,  2 Mar 2026 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLAiSYRS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060C9330D43
	for <linux-gpio@vger.kernel.org>; Mon,  2 Mar 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772475204; cv=none; b=G+fZn3AzYtua+3mHMzAIcd2Q8qiafXHdqG3ESDS2u93md/7SOZtWVpI8NPXC1sEl5/+QWak4dUg7oRfk9BhG8hwDB6o0qRnKKXd7zAe0XAHNhcq/98FIXp8Ah88ZsV9rf8K0t3NaOe2jk6JkrHqGhN+tUJzUNC5mmAaVCeyrG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772475204; c=relaxed/simple;
	bh=X9pFxZzMqkOXOXtjPC/JVKM4MxUqs2nrYJdjE2X9+yA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Cv+Pg/evblo/PwwlSQwQBm2ZfvhsJvxv0UIogsP2ZThsFHSDDq07mpvtOFvlf0D0xiw2RJ6aVm9TIDI/bdgXDr1MLrlISK6trTQTMw+8oKqfzZZnTNxNYP61557DxsY04MuG60ShMccsfz11Lj/jOBfU/eokjruJt1KWecetK7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLAiSYRS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso2775739a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2026 10:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772475202; x=1773080002; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnWhypid25+2v4/CmwVulpRAOWew3H3syajXEsdh0sA=;
        b=ZLAiSYRSNd4car2FpLXzc8AKt4jIsO36jFPAdRCBC/ghNSqWNlt1vGaSAumgkz2nrJ
         xbIDvrQXKzL5h/eWmka6yF0F/zFRY3SuiUsHwrpSBYLDpkFK36eMQ2Z2b7lf77f5Dg/P
         Wh7tAbp6W7KULfCyIZmz28eV7WQunmLADkBYm7oeQ7L2R9Izi51s+tR4lUDtGCkUIAgf
         1grMClDn7wSlS5Shw3iqrodI4Z9huH7GR+zrZUnlik1+uHHjFUB7B3CY0IxABdYnzviW
         UEWE7qxwXragc87MPogGU41EoYokjBqlCX7K6fW8GQ2CEKIDuEdNISVhKergxKzG1ycg
         jIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772475202; x=1773080002;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnWhypid25+2v4/CmwVulpRAOWew3H3syajXEsdh0sA=;
        b=iad/2kOK+/3SI2LF7STuVg4+qNUvwQ6XWoJuIgu2/qXgaQVO45wTkiFFnKLGcaaE+l
         DHyymfg25D66wIjs1yUzjZ+83hoTDQtBqDlL+ssfyw/szKWPF5mnExT4o70bGYqn7E2g
         /kPEevkSg6/sF7Q2tmeS4SDEqHzyvKcrqN8mt/Xw3I1gtGlAla84g5A8RpJwmbjvyS4D
         BozQAa1xTccUtcFIT0a5gmwf+91syeFAxwn1tKzlL5XWLoNG8YYxpgDmuLHnxuZACxEI
         n4nRMgsfP4XgAiDFYpfa1QsQifYEtthETcRzbCDx5jJYfbmfUgT6Lmwr4pnPXcaoIbSm
         /xzw==
X-Forwarded-Encrypted: i=1; AJvYcCXX4YoIUChCsR14FSvvXhNdtT+JdJbu8lkB7AGylyKj3FQaDATpqvZ4LjrG5NL03j9LeXwsJ1j/aWcX@vger.kernel.org
X-Gm-Message-State: AOJu0YxVAmICCur5Cys9Z5tFiBiqq3xCN7QNyaspxwLIOmmhhSoxKPSQ
	pMHo2e3PFAXBIrGD6o58rIZjFKqLj2REDRPzaBIgHd3pM1enHWLTgxeJ
X-Gm-Gg: ATEYQzxYwFl6rLuS7mQR1f1a13khyFZmllvt+PQsWGd1+2R9AkE7U0/YJbnjlmrc1nB
	7rTfU/acYIfUIuSksjkzdhe1YCzpx5SG4tyBYFLwVoHqj5Uzuh3zLgBj8J0fLRMVVgn0NjWYT62
	rq6IaRAdE8J/IyEluhmk6gkW+EYQOlWZaHabsoSg82+9dzuNfiupm4X/Hk4p13HJVMbG03p5iG+
	MCaz/z/K9DknaAIzZoFS1C3YON4nstdnHpuJSlYUlzk3xhAfLyxDFb0fjKoSY6mGEQiqiW9LeCp
	3HLDD8Tyh2jQ6bVKaFzmim76gU5wVB59omJ0wrh88fX0Z3EzKbcSHKOfjWKbMsR3HhVhpEt/Jw9
	SQgbExK5Cp1omO8d4jARB/weRVrqaG4Gux8TTehii7S4iAzLXj8684DfF3QVI/zUT7FEyXwiWyu
	dIN7d9eEQjLZu//PFJ1i0Uh7+qdYJYszfZ6nm5
X-Received: by 2002:a17:90b:3b8b:b0:359:8632:5e39 with SMTP id 98e67ed59e1d1-35986325f9dmr4652923a91.5.1772475202326;
        Mon, 02 Mar 2026 10:13:22 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:4c92:fc5c:54e5:712e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35901883a0bsm24608201a91.6.2026.03.02.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 10:13:22 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Mar 2026 02:13:17 +0800
Subject: [PATCH] pinctrl: microchip-mssio: Fix missing return in probe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-mssio-v1-1-ea0fdf3bf202@gmail.com>
X-B4-Tracking: v=1; b=H4sIADzTpWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNj3dxioBJdc2MTYxNL00RDC5M0JaDagqLUtMwKsDnRsbW1AIvNzr1
 XAAAA
X-Change-ID: 20260303-mssio-7343495a184f
To: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772475199; l=1266;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=X9pFxZzMqkOXOXtjPC/JVKM4MxUqs2nrYJdjE2X9+yA=;
 b=cYspcSg2cni4FEWF1uboSvnd1CiyndInwPoVrAX1RlAaSyS6iRlllrsyLXTvMue2o2G90tCPd
 KJL+YEOurDvDBdY9wf4whkeVrXurUzX0DUKbv3pxtCMd+5h/49rpwA/
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Queue-Id: 7BF881DE4BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32396-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

In mpfs_pinctrl_probe(), when pctrl->regmap fails, it just print out an
error message without return, which could lead serious errors.

Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
index 3d5ffd6cb14b..15d73ea1028c 100644
--- a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
@@ -686,7 +686,7 @@ static int mpfs_pinctrl_probe(struct platform_device *pdev)
 
 	pctrl->regmap = device_node_to_regmap(pdev->dev.parent->of_node);
 	if (IS_ERR(pctrl->regmap))
-		dev_err_probe(dev, PTR_ERR(pctrl->regmap), "Failed to find syscon regmap\n");
+		return dev_err_probe(dev, PTR_ERR(pctrl->regmap), "Failed to find syscon regmap\n");
 
 	pctrl->sysreg_regmap = syscon_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
 	if (IS_ERR(pctrl->sysreg_regmap))

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260303-mssio-7343495a184f

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


