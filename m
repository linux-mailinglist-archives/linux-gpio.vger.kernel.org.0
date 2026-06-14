Return-Path: <linux-gpio+bounces-38412-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ndzrAOZsLmoUvwQAu9opvQ
	(envelope-from <linux-gpio+bounces-38412-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 10:57:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E017680B60
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 10:57:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Xi4FV+JY;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38412-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38412-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 872CA300B113
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 08:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2639B2F12AB;
	Sun, 14 Jun 2026 08:57:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE29E2D7DC6
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 08:57:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781427425; cv=none; b=cwOLccWT8UsI9tHWaDjWcfbT8W8GZ7TyKo5PYNstByHl5fT3DN9p2AQn6YrDBug/QRsIAc/FFAq9rVF0Z/D3Kqka5ZY4WBdvpjVdolnD4L1gvU157ehVARmqXLEQFKiMbPcpkrEsUl6RQVeHzCb9Vp0r83H7gCXd/0TAR7Fy6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781427425; c=relaxed/simple;
	bh=YWNnWHClE3Ny2yYoxJDO3upPIgy6Q9CUMVVhiRbwgs8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Xl3uJovtNIYBMk5l0upvdAPXeZzQf/psIYUbTSDYJYfz100P9ocKuUt1srcg8QxG7kHjwWu3DzGfOPuBZqJxl9UPCcM32anoQK3h1UgS8UHRtqp+ggBj1R2b0tMhv3Oe7/tScrYa18p7H2fHQQVP0vzG6zXOAwJMTUirpj+cUbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xi4FV+JY; arc=none smtp.client-ip=209.85.216.48
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36b903567fdso2800710a91.1
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 01:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781427424; x=1782032224; darn=vger.kernel.org;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AeCTcCGBmXaeoE0gLM8C1mS8ZMOJYPKoEcB5kH+0npk=;
        b=Xi4FV+JYiTNPU9g8i4+SDZ11toSCIupUTRnAE5Z+mzbXejL0O1hodJ1EbVUwOXkIIf
         nZ2VPNSlzacQFse255yW6fNLT9NYvDosnClgJBNuEpw/VztCVEyS8jyHwqx5qaPySEpP
         us4qMghArwyZRDuFQ2NvbGpwkaai+eSifPlVYoxzVAf6khuDeGFOkZLFuARU3s7hdexe
         /c8+OGnGkpy4t46VT/Hpof2hAiKRxrggKQY3/TGACNlW0Ygj71NPsViBwtjtJbmqBXIL
         miuZeD4Rp/jOUF/+QxKbUgCqoxROL19bVMH0175VOXitpFbzwBSRft23fDRNf8W0aOiI
         GOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781427424; x=1782032224;
        h=message-id:date:cc:to:from:subject:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeCTcCGBmXaeoE0gLM8C1mS8ZMOJYPKoEcB5kH+0npk=;
        b=MyEDTGPHF3GLzKx8++gKGnkLwJoxKES4UsPyaLiNqTuYYqZrwuvDKvf4XMeAooyNTX
         wnTP3lTYGYt5JBiWgFy3x9LvwJLbI4/Yf/qtBCvV5hMyp5Xv1QG3WfKLG9ocJnyoAS85
         7fKK+db+q1qbe3fwJoWIy7lZeWeYFWKcwY3hlr+xLYmW61W5XnvIJhJULlMmFunNkzcG
         +s365nPvblDD1qqfu5UxH3aoUPweCmYsaD7nfnsZCC66vR2/zGTTvBKP1ssj96sV9yWQ
         RRYZzsiUuonc6R4nvBgVTGWeWefOitu0PblSSjgpjWEriAyYTX0g6sdD7a+fwROPISOg
         dJhw==
X-Gm-Message-State: AOJu0YzmdMEjah/nBv0Lnqx3UZjhvljY0P6Q2dK/N5JiN0d2OASjy1xY
	/f5w2dZJnyZLMl7O+lXBV2tbqt6zNvbHyryFeVic4Q8hUVBvz2spL3aEDXzu5jTGetY=
X-Gm-Gg: Acq92OGpWfE6rIwdunEXiv1KV6A7nUUSsbDf8a9sbJ/N3EEtcWdvUa28GS/2wCFSAA/
	IO/3XXhD8LyWNW8mDwXS+U38uwzHX2jljrCXbd5N7tuw7BeMw6GL5n+/5XScDPw9xg/Yfo/D9A9
	9OmgNZlcUubGl0iNWT3gMCbJaNHyv5n/U9TltLs1svOEugcubcnBTZONtkOnUCmPsaYlIJFqNkn
	4bPyUpvYknfPbxW/IogoRxMEW2yPKkKcnH4NrPnb5+/LqJcOrSu0rIh8tKmsNmmCKuZg7+zWBDD
	PCceyvaEESm/J4mGtY9aoEj3SHRVxNBtrW5UWS7lYLl6aJo83E3tkXSB+1uVjAk7/d6gKlDtnXM
	7a8lIIAhGjfJkcGsQh8dwzXN51P/sW2Z1XMz4KtXnpgRA6DkdNOheEaaoD/QWLBtBQeCt8uEzEc
	U3k6xz8b4UL7A+P+sedXMoUG6mYow=
X-Received: by 2002:a17:90b:3a83:b0:36b:9daf:1504 with SMTP id 98e67ed59e1d1-37a036ea6bamr10197716a91.14.1781427424151;
        Sun, 14 Jun 2026 01:57:04 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2678375fsm8493287a91.17.2026.06.14.01.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:57:03 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH] pinctrl: airoha: Fix AN7583 Pin 21 BIT duplicate in conf tables
From: Wayen Yan <win847@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 14 Jun 2026 16:56:59 +0800
Message-ID: <178142741958.1925629.15221988023327723278@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38412-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:ansuelsmth@gmail.com,m:linus.walleij@linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[win847@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[win847@gmail.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E017680B60

From 5ed6ed42e17baf059bfaf1ba0ab5fc484f854659 Mon Sep 17 00:00:00 2001
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 16:56:18 +0800
Subject: [PATCH] pinctrl: airoha: Fix AN7583 Pin 21 BIT duplicate in conf
 tables

AN7583 pinctrl configuration tables have Pin 20 and Pin 21 both mapped
to BIT(18), causing pin 21 configuration to incorrectly modify pin 20.

Fixes the following tables:
- an7583_pinctrl_pullup_conf
- an7583_pinctrl_pulldown_conf
- an7583_pinctrl_drive_e2_conf
- an7583_pinctrl_drive_e4_conf

Pin 18-22 sequence should be: BIT(16), BIT(17), BIT(18), BIT(19), BIT(20)

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 995ba6175c..f325ca41d3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1847,7 +1847,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PU, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PU, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PU, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PU, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PU, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PU, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PU, BIT(22)),
@@ -1964,7 +1964,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_PD, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_PD, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_PD, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_PD, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_PD, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_PD, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_PD, BIT(22)),
@@ -2081,7 +2081,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E2, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E2, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E2, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E2, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E2, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E2, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E2, BIT(22)),
@@ -2198,7 +2198,7 @@ static const struct airoha_pinctrl_conf an7583_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(18, REG_GPIO_L_E4, BIT(16)),
 	PINCTRL_CONF_DESC(19, REG_GPIO_L_E4, BIT(17)),
 	PINCTRL_CONF_DESC(20, REG_GPIO_L_E4, BIT(18)),
-	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(18)),
+	PINCTRL_CONF_DESC(21, REG_GPIO_L_E4, BIT(19)),
 	PINCTRL_CONF_DESC(22, REG_GPIO_L_E4, BIT(20)),
 	PINCTRL_CONF_DESC(23, REG_GPIO_L_E4, BIT(21)),
 	PINCTRL_CONF_DESC(24, REG_GPIO_L_E4, BIT(22)),
-- 
2.51.0


