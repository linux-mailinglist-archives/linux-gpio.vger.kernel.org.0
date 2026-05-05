Return-Path: <linux-gpio+bounces-36193-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QApfEKTi+WmlEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36193-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:29:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B026B4CD7C2
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AC9330A8086
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42664279E5;
	Tue,  5 May 2026 12:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsJawBEk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F10639BFE9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983889; cv=none; b=HWdYUa5FEBwsgShjN2GFybmp1b6Vp50IKUaOHWHXToVxYwxnVSHR3CToTWwUvm9ZQOxsng43Z/PL7cla+E2wOX9fhc0ROoSlO7CCNXWL4EE8eQ6b3nIEvZXcqlvW82AzZFkh6OfRk4fVVBvAK796pjwuaSQoVBxBxTKupP3COd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983889; c=relaxed/simple;
	bh=QwxQp+0FfIRUxCgijPebeFcXAEV0BqLFpwMm7tALZXE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yer2nzKjpl771Ri3P1OqQkezaz7n1OS2OlkftDjquoJN526Wu2xMvAqxuFfoBD4sxprqA5/WAVuCE7fCRiHynzRVfuZ6VVj9imKED2bHayO6YjbVaaP0bpJr5AIOWMyMrbZ1z2UUOvh+yLw0iWK44oV8cGqXUrwFK71gUMWoV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsJawBEk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so75586865e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983886; x=1778588686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC4g++npCHabxO0V/jcmCvcYLl4L6AGT/Lrm0NJ3wa0=;
        b=lsJawBEkoHBM0TvWblxXbawF/+lQe8IYVRkwlI74Wrh1MdXq7p0R16wvLjO4/2NqmV
         0Q5A3H1yXYfDGFQl48iz4Xe5MZ9JolRrSZOpSxSplVK6BcjpXdS4QWn+S/0rcNYpJEN6
         hWgo37krGlHeJpB/B5QBIseRfGJEKODukI7A0ZQOcPdWnUNUsrxjO67jLm+NawLbyzQ4
         1mwoXwTGw+i/vCFYB6ZoYzhMPmp8bBjKk433kF22lr6Dj6S+4nE0UTd8wIZtmz04pkhV
         j00MconINtfLXPur4CG+MhjSlFCfTzcBA/R9+/egsoVdGtL7PqkACPPH+jQUnHrHWh7D
         MC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983886; x=1778588686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC4g++npCHabxO0V/jcmCvcYLl4L6AGT/Lrm0NJ3wa0=;
        b=fWfKvg10l4fA8CJ5qCvtP3LAqjgYxKGB0jh0+qbe5f1nTsYl6/XBeSqlid9MjJ1DL0
         2hHEdTk43kWASCIbUdWc+y/TB+u4PwLVV/Ns3okx6lFyqzMx4Do841ZP3iqkET197XBJ
         4/ntFeAnMny9P8jbvryRgRxwNKcPMozoBq62WxJDxAQOglFHTTEnJkrC0kjXAaSSWYH7
         hq+hpPM6ERd8PdNY8cNhAvfFgpvB4H+DuxBa2/YCeCZr74j1T+rwSsgZNaSVlIfSZ4Nl
         0IyAtV8WmT9cRtgMOR9eF94KROJTfs59xopqpGhc2WD6gtA1S2u6r4qljbak0JqHMui6
         3KgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9H7YWnYuiOWtSq3W0kzJq277ItxqX1AJ03F8s9tEUkmJ8HEblzjXJG0GbW4rTWOesurmtfUr1IhCor@vger.kernel.org
X-Gm-Message-State: AOJu0YwP+S3kzjYrVm8nfRubJ7+wRyzJ5SAo7WhF2JnjVNyLm8oUVKKZ
	K4cHMLE6ePztzym0W+GgUpHsKTB+oiFlKWMnhdw5mpptPDQnrw0Q+2UG
X-Gm-Gg: AeBDietPhLh0MvqLHsw0GaOnCXvhfmuZRWlaxbtwK5K99SauYGYKJTIgUgOHQUc7cxz
	0au1jlmKplcBvlB48h38cPZskTbiDHRIOwTBxUtQhFq7jDVPv5zOQ5Gx/GI4YsMjL/56WRW1nXp
	ZyWa4DRwSlEHC7xt+YBhwXSL36XzsU27WPvjbp3f7mkCgqK5511qIxqwObKJdNnIXYSQh6XJwHB
	RV1nPO+YdBIUrSoYkbwPLxwbbgAXkq1nOV1XRNvfYKGD5KTxXCnd2EYafTolyWtGu1PqbFdxXr4
	kSLv56GH50Ur1czfVRGsZhXbnw8drGfr8AFsUcij0KidBYRFUY9jh5zPRix047jLWIyDwELy7rJ
	SBXUDugTbllR6I2Gm+sYsfIvgOQKmUaWxVHRd/H1VZ1XEQua7gMjBgSirIxiIw6MqQmfFsKv4Bw
	J0pHkGJyRz8Gy9BL/g2FOzmI7MRZs2amu5YhwWIO7tWZYZGWfDIMVNd0r5Q5JoU59nQ3Y0/a5Q2
	r75FDpj+fEVAesY6l3pYg4LlQ==
X-Received: by 2002:a05:600c:810a:b0:48a:592c:e655 with SMTP id 5b1f17b1804b1-48d18be5ab5mr46167335e9.17.1777983886313;
        Tue, 05 May 2026 05:24:46 -0700 (PDT)
Received: from LA-DE-0220.emt.local (aftr-185-17-204-8.dynamic.mnet-online.de. [185.17.204.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d149de41asm28196115e9.2.2026.05.05.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:46 -0700 (PDT)
From: Thomas Weber <thomas.x.weber@gmail.com>
X-Google-Original-From: Thomas Weber <thomas.weber@corscience.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Thomas Weber <thomas.weber@corscience.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: realtek: Fix typo
Date: Tue,  5 May 2026 14:24:43 +0200
Message-Id: <20260505122444.59265-1-thomas.weber@corscience.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B026B4CD7C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36193-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[thomasxweber@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[corscience.com:mid,corscience.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

STRENGH -> STRENGTH

Signed-off-by: Thomas Weber <thomas.weber@corscience.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index a2c672508a4b..60222339726b 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -34,14 +34,14 @@ struct rtd_pinctrl {
 };
 
 /* custom pinconf parameters */
-#define RTD_DRIVE_STRENGH_P (PIN_CONFIG_END + 1)
-#define RTD_DRIVE_STRENGH_N (PIN_CONFIG_END + 2)
+#define RTD_DRIVE_STRENGTH_P (PIN_CONFIG_END + 1)
+#define RTD_DRIVE_STRENGTH_N (PIN_CONFIG_END + 2)
 #define RTD_DUTY_CYCLE (PIN_CONFIG_END + 3)
 #define RTD_HIGH_VIL (PIN_CONFIG_END + 4)
 
 static const struct pinconf_generic_params rtd_custom_bindings[] = {
-	{"realtek,drive-strength-p", RTD_DRIVE_STRENGH_P, 0},
-	{"realtek,drive-strength-n", RTD_DRIVE_STRENGH_N, 0},
+	{"realtek,drive-strength-p", RTD_DRIVE_STRENGTH_P, 0},
+	{"realtek,drive-strength-n", RTD_DRIVE_STRENGTH_N, 0},
 	{"realtek,duty-cycle", RTD_DUTY_CYCLE, 0},
 	{"realtek,high-vil-microvolt", RTD_HIGH_VIL, 0},
 };
@@ -473,7 +473,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		val = 1;
 		break;
 
-	case RTD_DRIVE_STRENGH_P:
+	case RTD_DRIVE_STRENGTH_P:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
 			dev_err(data->dev, "P driving unsupported for pin: %s\n", name);
@@ -490,7 +490,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		val = set_val << p_off;
 		break;
 
-	case RTD_DRIVE_STRENGH_N:
+	case RTD_DRIVE_STRENGTH_N:
 		sconfig_desc = rtd_pinctrl_find_sconfig(data, pinnr);
 		if (!sconfig_desc) {
 			dev_err(data->dev, "N driving unsupported for pin: %s\n", name);
-- 
2.34.1


