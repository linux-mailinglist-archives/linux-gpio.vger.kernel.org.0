Return-Path: <linux-gpio+bounces-40123-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /EHNFVh/V2qNTQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40123-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:38:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BC75E3D9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 14:38:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dcRxVWc8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40123-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40123-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0989A305549E
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 12:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D79E47F2F8;
	Wed, 15 Jul 2026 12:29:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13A478E57
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118591; cv=none; b=gtRjZ/rk6H/U2jR9gh/lUUnnn8YvBTbxO2zqg4Tv8VJ1HLGqNapwWSU3iPEuN0IRUbqRCOkmP1crx9P2JTmEeZwFsukQp2+dAyhH926LFYzKxgXE/S49FNqAo2pFW8loqIPGQEBtCej4LvX4DUWHZsds2pP7wlTtGU6jm2si9A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118591; c=relaxed/simple;
	bh=5JpeSSwHgB0viqpbPWpiG9Gu01KdGoubtMmMSudpcgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uFKEgsL5eYaObqSwYtIEbaEgdvZInRmmrRMMUelNuLcVVSr+9q7283wcW3HOKHmbtkKhgg5byKsnUpxUHPUBXAnEr0LFhAZciyv6z+ena1tgB+XRBFKohvuodsEDF9prW5gkqXBMTJzn79//uETIJIdvhNqorpZFTrEJqL1EHfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcRxVWc8; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso38123045e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118588; x=1784723388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOCtAIRvCDRCzbr/NHWJUu3GPBu0x+R/AFbuRiWrlMg=;
        b=dcRxVWc88NiTdrc4qTNT0UBaknJKhByfrJjHGj6fnv7FBcs0NBXPytRhBby63al+/W
         z8v+2kIYn7XU7cShxXWlzpY5q9BkmVE6THQtKHzyzP2n1GClYSPT5GT7c161IXLAT/UL
         zCJZsNlZhwYI9uKBgIVYiU0w8NsBqLhfjljZhWEw2Oy4xqVpFWk5Vml7nzFgtepDDuC5
         qmD/q+sExqk1m88MMSIxTu7op4wa2yINAsAWV5fkrSGTPf7qvuxE1VyT661wQ3TzSif2
         JQvseBe6sdvCikRCJSrxPm12jqUQ0X/WCkFLA3RWCc3BIsH7/POfbcWIRjw8jwl7VS4W
         JhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118588; x=1784723388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOCtAIRvCDRCzbr/NHWJUu3GPBu0x+R/AFbuRiWrlMg=;
        b=NH+IpuH6nPhFX2rgX+fNgycMUC3xlLYBdhKrgA9FXCK9fYOuHWg5OpbeyBt0z9vBJ/
         2Vw6qKMcnAYtm9yq42OSyM+gqLkg9Rjr50K7NNT6JGyY0ahhJ2Yyyb0LNtP9DUQvkBdu
         p8+MRed3RWbzmhPSDeIPBkIkeaN4tFLcjEMcNPWgPxwkjcg54YTfS6t0KO29Lr5hEPFR
         UhR28hDyvdn0W6rpib4FnHFlAoGi76J5sjYDdFPuW8tez8lDIACa3c3zOfsv4eKmIqeT
         QEujo4WUA4KfTHvrmC1Xk5rQ9UkEmGxwy9rKi852d2vyInZAOnRGCWO0LXurkwC8jV30
         4+zA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9sgeQG45jRk2IXfmFv+klZ1yJzDf44a9/+9NEmhyXY3mrJMxddkbQDDxmObw6ZQIigB//FrLfiLNa@vger.kernel.org
X-Gm-Message-State: AOJu0YwaviatnkJUbpxGQTN59smwJ0hBlD/az3Q7HroVDVxhNVMVNc++
	EmjHnOkQNq7igNkxdIu2o9622oIctCbbOaeP9v+TL7G0QMXC4BElh7ab
X-Gm-Gg: AfdE7cnyoqF9LtPQPuzvlSP3BIGBqSJkAh+zBDx8nQoLVsLXGJLTw6Ya1mLwxpqipj3
	oV2Nu2AmdOBWtS930FV58kMVbrfPHPcDgwfTNagsAiJmSbWcjpqK1ycQLYOTzvSDi/9FlG3QhS9
	LPl89UF+ksTf3Hjs758dFeHuCRBXWGrTFidP4poiO/pjT18XLTX88ZqdJpMaQMCB2+ODAN26oqc
	AKbfxDLgtubrASKifJ5SFglfDfqISGJ4xg+qUyyBKC22H+ie1ORj4OWqJ3ddwKOnLKSLz8ys9yN
	Bxb2JnF3QBnZ+IxTkDACzhdTga+6cSmipHJ7UKB0ym70S0I4BL9ja9Iyz5I2Cv6g5fhhHys9uVx
	iZlTmg+ASjmlzbISuNIdGvtqbdE0CrVhraoOp9BSBXih/qbyOI6mc8yx7q3Om5v+0r7gCjnHuOy
	PpWnekrOIyGu0CH0ulOQhbuy4=
X-Received: by 2002:a05:600d:6443:10b0:493:f762:45d4 with SMTP id 5b1f17b1804b1-495158c693bmr70101095e9.2.1784118587669;
        Wed, 15 Jul 2026 05:29:47 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:47 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 8/8] pinctrl: npcm8xx: fix debounce register selection
Date: Wed, 15 Jul 2026 15:29:23 +0300
Message-Id: <20260715122923.1938327-9-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,gmail.com,google.com];
	TAGGED_FROM(0.00)[bounces-40123-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:linusw@kernel.org,m:brgl@kernel.org,m:openbmc@lists.ozlabs.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:taliperry1@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E59BC75E3D9
X-Rspamd-Action: no action

Each DBNCS register programs debounce source selection for 16 GPIOs.
The current offset calculation advances the register address every four
GPIOs, so offsets 4-15 and 20-31 end up touching the wrong selector
register.

Advance the DBNCS offset per 16 GPIOs so each line uses the debounce
selector bank that matches the hardware layout.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index f94494b67..f9107f819 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2211,7 +2211,8 @@ static const struct pinmux_ops npcm8xx_pinmux_ops = {
 static int debounce_timing_setting(struct npcm8xx_gpio *bank, u32 gpio,
 				   u32 nanosecs)
 {
-	void __iomem *DBNCS_offset = bank->base + NPCM8XX_GP_N_DBNCS0 + (gpio / 4);
+	void __iomem *DBNCS_offset = bank->base + NPCM8XX_GP_N_DBNCS0 +
+				     (gpio / 16) * 4;
 	int gpio_debounce = (gpio % 16) * 2, debounce_select, i;
 	u32 dbncp_val, dbncp_val_mod;
 
-- 
2.34.1


