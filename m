Return-Path: <linux-gpio+bounces-38415-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jt+gLmi+Lmom2QQAu9opvQ
	(envelope-from <linux-gpio+bounces-38415-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 16:44:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2773D6814E6
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 16:44:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Gtk4QDf/";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38415-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38415-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 143E93008503
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Jun 2026 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0D93AE1B9;
	Sun, 14 Jun 2026 14:44:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD153C584B
	for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 14:44:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781448293; cv=none; b=QWF2xaKCTY+aXdRZRyTuejtSUO31HitaQdf7vafpPybgLYYiyPH5VKRZZqQJw+zSI4lKCRF0pKmh1ZQTfp8Yik5CFg9EtE31LEzXkw5CcuRfJRKG6IYmAZjp+GHZvtQ5HZrsjf7AUa0n/tstX7Gl1WULOt35Aej1G0zkVy2Lxh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781448293; c=relaxed/simple;
	bh=TisGf5pX6ErFtdTDgfTV+0zQmwRZj3uZQwSjI9GluTo=;
	h=Message-ID:From:To:Cc:Date:Subject; b=KDbXB0lCiwkenQFtif97Ecc8YS9WdlDBnnlT7qDgZMo5fCz0UfeTX05BNCVGXt89AI00GOZEj40g5ujfzbsSWdJx8tnVR+5vPwtZFUqC7t8xj9WfF4eIQSTMDEtBvSnM9izWHPabQp86PxY58QtABymngpocCCoDikEpidtz/zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gtk4QDf/; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b8d414666so1512620a91.3
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2026 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781448292; x=1782053092; darn=vger.kernel.org;
        h=subject:date:cc:to:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCH56oESC6n7X2Ge9q8ZdkIBLhIo7OksXBXPlx+vTys=;
        b=Gtk4QDf/KPuswbKBaPegfz7SgJb+16nslak8dx7AefmEPfM8gyL4fpSwk/ZO4eH96a
         t4SWSOiXYwehDkSFTcviDvPTvP1AvjFoBP2dvCIVcxAJPSmrPvf30PnGrnDEZ8ZLthkr
         ADoLcpDtBeYYhW+C/u4XLXJlTr9R0wYc2ivLL9/XS1PK29l4NpPrkoGtuAlur4Lw7iK2
         fIrThBVcgxef6NTleGgsF+GMxYiYUJPfeSPugub569hYJn3lLa+/YXSm5efEZxKDOZ8R
         B+MuE8XEDSZk/QbV5Y29pU41ww9I12YT3i4B8CgPDi+BAwQixiCWJgjMRZKKDG/zGLfA
         ruQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448292; x=1782053092;
        h=subject:date:cc:to:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JCH56oESC6n7X2Ge9q8ZdkIBLhIo7OksXBXPlx+vTys=;
        b=P15tpSmt24zpVZPCDo2U8Uta5o6sFyvg82EhrAlkHSWw8eoO6411nsanGJMixYN7t6
         Gs/1iItQgX/au/CdhYu0H3lf2A/SLCEiq3jxu3u/YLVfOJV+9GEhC1HL70vTEdt8nljE
         f+klLPDq2357I8MMSDCt3CTzQxCc81eyUP97uo1HD4GiCyhkLFecSVYDbIk+i2RjuDbm
         LQ/au3rkwf/ldKK5XfU2xs+fkiU0Vovm9bkwHPFKHnOwm6OqYzaEd9I8sNu56awOE67J
         NBNgBoevHGEY1lA7089CNU8te1gH9srfiliydi0htuWJc6K7hGvx9Oa9fS9M6ET82sEJ
         DMUg==
X-Gm-Message-State: AOJu0YwWvgmQsgOza3PeJjWZ9o0kObHAaqdeihhwgJkAJj1HnEb6wcAX
	nfFMy0MSd6WcHAdZfF98eWFq2ksC6jHJGyJWFvbmzQRBGxvM77raAAF3XrU3S8ui4K9GuA==
X-Gm-Gg: Acq92OGdJ8XUdFnMInfHo7Mxrn4RB0RVDpbWi2F8KF8rGgerlyavbskkweLqR2GxZ65
	F2NQ5qjwhlP+Wpd75rqce/eX8ayXjp5lOQ+hJlpKG965HMnazpCwGLrz/LFWOWMAu/l5McPwCtS
	3PoBwRS98abGlq6nBGJn+Vox+1v9k0T9NryKLOZhn2jwar2jIfWqRdazC/Q/jwdQLS8Ms40tJ+3
	lp0pW/2vqnf6CuwBL46HF1/d9dSQtQuQrvPEhxgg7hWlTvrkLkzNG7MNoEuF0bxFtHa//gnQlnc
	b/c/BDoq/E443vzlamvG9Imer2/Dur3uL9NkFj+twn7djUx3LnNYo//8IHcYcDnRbGhLdVXOZ7Q
	9RGoTCuvi+UpN98GHltD1DUg0gyqxx+0QKJkZOtHStXQXtqMmePbFmB9fEUTi/tr/xYg6oi5kJu
	/0xfNjT1lXfrOHDH9U3sDYgil3A44=
X-Received: by 2002:a17:90b:1348:b0:36d:b12f:6143 with SMTP id 98e67ed59e1d1-37a04784e81mr10827516a91.25.1781448291679;
        Sun, 14 Jun 2026 07:44:51 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8fb3sm7273168a91.4.2026.06.14.07.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 07:44:51 -0700 (PDT)
Message-ID: <6a2ebe63.f0a9eb5a.7cfd4.8e8d@mx.google.com>
From: Wayen Yan <win847@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: lorenzo@kernel.org, linus.walleij@linaro.org
Date: Sun, 14 Jun 2026 22:43:11 +0800
Subject: [PATCH] pinctrl: airoha: fix led1 gpio11 typo and phy4 duplicated map
 value
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38415-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:lorenzo@kernel.org,m:linus.walleij@linaro.org,s:lists@lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[win847@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[win847@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2773D6814E6

Two bugs in LED1 configuration:

1. an7583_phy1_led1_func_group uses "gpio1" instead of "gpio11" for

   LAN3_LED1, causing wrong GPIO assignment (AN7583 only).

2. phy4_led1_func_group and an7583_phy4_led1_func_group use MAP(2)

   duplicated with phy3, should use MAP(3) to match phy4 sequence.

Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")

Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")

Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 995ba6175c..b20f2057cc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -1618,13 +1618,13 @@ static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group an7583_phy1_led0_func_group[] = {
@@ -1678,7 +1678,7 @@ static const struct airoha_pinctrl_func_group an7583_phy1_led1_func_group[] = {
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
 	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio1", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
@@ -1706,13 +1706,13 @@ static const struct airoha_pinctrl_func_group an7583_phy3_led1_func_group[] = {
 
 static const struct airoha_pinctrl_func_group an7583_phy4_led1_func_group[] = {
 	AIROHA_PINCTRL_PHY_LED1("gpio8", GPIO_LAN0_LED1_MODE_MASK,
-				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
+				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio9", GPIO_LAN1_LED1_MODE_MASK,
-				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
+				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio10", GPIO_LAN2_LED1_MODE_MASK,
-				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
+				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
 	AIROHA_PINCTRL_PHY_LED1("gpio11", GPIO_LAN3_LED1_MODE_MASK,
-				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
+				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
-- 
2.51.0


