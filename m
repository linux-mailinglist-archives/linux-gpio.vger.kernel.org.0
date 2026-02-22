Return-Path: <linux-gpio+bounces-32003-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KFTBWuSm2mj2QMAu9opvQ
	(envelope-from <linux-gpio+bounces-32003-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:34:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD08170C94
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 00:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88C11300C025
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 23:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D680735CBDD;
	Sun, 22 Feb 2026 23:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KPq57KBF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BtTz5Wkx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9C35CBC2
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771803235; cv=none; b=saniBoIL5E8i7zPrMcAiV+ZY9EZUdZZr3EeudOXHkH0Oo9UVyAq2O05n/NXSfgvw+h1fI1cJcPK54lTTlcDXHrQ5N8lx/zH5otS7JdKSXyCh0MqkmEzTaCaWSv3uRrO1ELtgbkpfooMkaMeKV2i9ujS+7mo7ph4iMDpqv7TKXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771803235; c=relaxed/simple;
	bh=qfk9RIw8aLiDXFujZqSUCQQVgiAa42peN2LIBr3oqys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ru1Qlx2s61sXkeHTeI1NP0qgV2MkT85cdxUqGewHp0LMBBBQNYyZrU65pFdVqCUawbHNYfW8FE9Ff4+AjvNSGYnPBsgsGeHPpRrv6LRYfyqA/KBjYE3mZ8uMT6EeEduBa4+T+p4bnKOgulFu7xXUmMIV/PUbbI7M62YdNd3kckY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KPq57KBF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BtTz5Wkx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771803233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I/A3nXcpdMXTSfC1uHXMAWjY4Q4mmNnRIiBq7kOJ2Bk=;
	b=KPq57KBFuFMHwJj3DOl839Z275i0owdTbzVxety81W+AmRiEFRxOzPvrJfNcxj2dLHm9Kw
	wGIZFOJEImoygJu8hdAikIykmUqXGlx2w0LsurfD6cdBS1jNW0XtZBy95dDrKz3rsy994D
	ECeoFch4tyzJi73Ts7XOdlunF0SStcQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-cElChiQeO3eXNoPEYmdp-w-1; Sun, 22 Feb 2026 18:33:51 -0500
X-MC-Unique: cElChiQeO3eXNoPEYmdp-w-1
X-Mimecast-MFC-AGG-ID: cElChiQeO3eXNoPEYmdp-w_1771803231
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506a9bf9b3aso44774101cf.2
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 15:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771803231; x=1772408031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/A3nXcpdMXTSfC1uHXMAWjY4Q4mmNnRIiBq7kOJ2Bk=;
        b=BtTz5Wkxn16X4IDlLbnl2SLKM+xaZ12ukb1difNLZrumkZ0PAu/139B763up0v84HS
         BxmisSh7zXODxVmJ4as5kYFvxm/P5kkhb5jSj3Rup7LfabSjDaYhul6pjPfl53XC0hSG
         /guqYf2IXAfKFjDYH5abtrHPOt2zkrY3OrCXGLCurvlnvDGA3z+SulaQqQ0Drk8ebjFd
         E0Zj8QEnU43zRRa3V3eBiw1UPGC4j/p+fKxKmoK03aLMX2A6uBWzFWdIJnfC5uNxiD2A
         1jH1z3BZq5K2ZIwWqaLlKbzAxWEMP9DjAmzYXucQOYsiatglFRwrKGmWKUjAOgHY18+U
         AceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771803231; x=1772408031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I/A3nXcpdMXTSfC1uHXMAWjY4Q4mmNnRIiBq7kOJ2Bk=;
        b=GoOemdZmSFZ+JjoGDq56Kz7PIxZ0aEW5it45UloPP+RUbde0gAxR3LK9nVpZ4u+ly5
         QoYLzpOOxPq2BIM87s+KJ99NthXfv+2q7kRHE4vemd/OVmc9+rMbXabynRc88PegMnZu
         HKCV4SoVPoDXETkHuAK1L3if5lxIuXdeQwqkH3USzphwcUfUi3jARunJ+7wz/o+Rn8sY
         jcGcBfLnrZXxQnfIfTDUcBzi8tT0RI6zKHZc/cxfR4yNy6GAR4y6x4gpz/ElPW/vA5X0
         ElBTZx2JLK8NEiVruNUirzTP/nWpcLoC2oaPSF4uuxx1LbogwOoKZF5OyLM8T+Gq0YLP
         /6PA==
X-Gm-Message-State: AOJu0Yym4XgETOGKtLwBvj4YzJH/GtRbXmFz/I4q8csMF7z0Jjj/URpm
	KlwrR6KChaLXyFotQKHvFVaNxKAzPbIv7cKqHrXwmkfB6rdxrbR00qsIP5xFtKPz20WY71Jwy/I
	16OcdhedxephvB77qkubpag7quDd08TQ18FD7R2ZadPeT763oqVe9C2DuKPDWsNk=
X-Gm-Gg: AZuq6aKQTM18JHjfcFzoGGOa5hrB8Ac1ZfQ9Ai6nsT0AErgGqDQdzLrG1Zxxdq2GqWu
	Yw+003gLbXyFmhlCav8wINYWM8krU5XtVClmfPEFb150psuby2BfTuSjJPxuxNAuGWgd3nY7sT0
	Is5Wsad4XSJv3WwZzj+6ytrw8F405eaqgvWLgSVfzI+slh/GPDJ0LKK8Q1Mx2LSPTFEhx2tyqUG
	aOB8iM2nkQntX9EB+MJTjI8evL5JNo3U4TubR+a4Jvf235mT9d/tbDFbjI1aqHryuBPEg3qjQFT
	11ykrX3e9lOISr+EdLfBi6BUj9gKQrOfkDAFQf18Js0uxrzhReFz5x+dXsRtdj4L52BiTkUKgm6
	i/xad5Oas0fzGKW7aXxjEDxhEqxRpuKB5Hy/iOzUYNwPKqZPcs7AGyksvBo53lA==
X-Received: by 2002:a05:622a:11c6:b0:4ff:7efd:54f6 with SMTP id d75a77b69052e-5070bbcde65mr95189941cf.20.1771803231378;
        Sun, 22 Feb 2026 15:33:51 -0800 (PST)
X-Received: by 2002:a05:622a:11c6:b0:4ff:7efd:54f6 with SMTP id d75a77b69052e-5070bbcde65mr95189721cf.20.1771803230949;
        Sun, 22 Feb 2026 15:33:50 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6a2759sm53231931cf.17.2026.02.22.15.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:33:49 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:33:29 -0500
Subject: [PATCH 1/3] pinctrl: pic32: change all cases of bare 'unsigned' to
 'unsigned int'
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-pinctrl-pic32-v1-1-db86248da18d@redhat.com>
References: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
In-Reply-To: <20260222-pinctrl-pic32-v1-0-db86248da18d@redhat.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Joshua Henderson <joshua.henderson@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6125; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=qfk9RIw8aLiDXFujZqSUCQQVgiAa42peN2LIBr3oqys=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnTwpR99pyi9e3zPDMLoNwZrVPsibzs6cxqbj05X3YO
 3W9Kc+6jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYSt5jhn9KkeZP/3ZmwVrZJ
 /Zxs476qoGV/GWRtZrLtfe+2t1LK9xcjw7NsndbuKW7eK1cLCyzntYj6fo9vj+vyNPOC/LxpH95
 vYgUA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32003-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AAD08170C94
X-Rspamd-Action: no action

Address the following warning from checkpatch.pl:

    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Fixes: 2ba384e6c3810 ("pinctrl: pinctrl-pic32: Add PIC32 pin control driver")
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/pinctrl/pinctrl-pic32.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index 16bbbcf7206288df5f91870e6233970582f7ef80..e97727a799d5f8a7f2ea76886af5174c863d8ae6 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -1696,7 +1696,7 @@ static inline struct pic32_gpio_bank *irqd_to_bank(struct irq_data *d)
 }
 
 static inline struct pic32_gpio_bank *pctl_to_bank(struct pic32_pinctrl *pctl,
-						unsigned pin)
+						unsigned int pin)
 {
 	return &pctl->gpio_banks[pin / PINS_PER_BANK];
 }
@@ -1709,7 +1709,7 @@ static int pic32_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *pic32_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
-						    unsigned group)
+						    unsigned int group)
 {
 	struct pic32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1717,9 +1717,9 @@ static const char *pic32_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
 }
 
 static int pic32_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
-					    unsigned group,
-					    const unsigned **pins,
-					    unsigned *num_pins)
+					    unsigned int group,
+					    const unsigned int **pins,
+					    unsigned int *num_pins)
 {
 	struct pic32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1745,7 +1745,7 @@ static int pic32_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
 }
 
 static const char *
-pic32_pinmux_get_function_name(struct pinctrl_dev *pctldev, unsigned func)
+pic32_pinmux_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
 {
 	struct pic32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1753,9 +1753,9 @@ pic32_pinmux_get_function_name(struct pinctrl_dev *pctldev, unsigned func)
 }
 
 static int pic32_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
-						unsigned func,
+						unsigned int func,
 						const char * const **groups,
-						unsigned * const num_groups)
+						unsigned int * const num_groups)
 {
 	struct pic32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
@@ -1766,7 +1766,7 @@ static int pic32_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
 }
 
 static int pic32_pinmux_enable(struct pinctrl_dev *pctldev,
-				   unsigned func, unsigned group)
+				   unsigned int func, unsigned int group)
 {
 	struct pic32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	const struct pic32_pin_group *pg = &pctl->groups[group];
@@ -1795,7 +1795,7 @@ static int pic32_pinmux_enable(struct pinctrl_dev *pctldev,
 
 static int pic32_gpio_request_enable(struct pinctrl_dev *pctldev,
 				     struct pinctrl_gpio_range *range,
-				     unsigned offset)
+				     unsigned int offset)
 {
 	struct pic32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct pic32_gpio_bank *bank = gpiochip_get_data(range->gc);
@@ -1810,7 +1810,7 @@ static int pic32_gpio_request_enable(struct pinctrl_dev *pctldev,
 }
 
 static int pic32_gpio_direction_input(struct gpio_chip *chip,
-					  unsigned offset)
+					  unsigned int offset)
 {
 	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
 	u32 mask = BIT(offset);
@@ -1820,7 +1820,7 @@ static int pic32_gpio_direction_input(struct gpio_chip *chip,
 	return 0;
 }
 
-static int pic32_gpio_get(struct gpio_chip *chip, unsigned offset)
+static int pic32_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
 
@@ -1842,7 +1842,7 @@ static int pic32_gpio_set(struct gpio_chip *chip, unsigned int offset,
 }
 
 static int pic32_gpio_direction_output(struct gpio_chip *chip,
-					   unsigned offset, int value)
+					   unsigned int offset, int value)
 {
 	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
 	u32 mask = BIT(offset);
@@ -1855,7 +1855,7 @@ static int pic32_gpio_direction_output(struct gpio_chip *chip,
 
 static int pic32_gpio_set_direction(struct pinctrl_dev *pctldev,
 					      struct pinctrl_gpio_range *range,
-					      unsigned offset, bool input)
+					      unsigned int offset, bool input)
 {
 	struct gpio_chip *chip = range->gc;
 
@@ -1876,12 +1876,12 @@ static const struct pinmux_ops pic32_pinmux_ops = {
 	.gpio_set_direction = pic32_gpio_set_direction,
 };
 
-static int pic32_pinconf_get(struct pinctrl_dev *pctldev, unsigned pin,
+static int pic32_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 				 unsigned long *config)
 {
 	struct pic32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct pic32_gpio_bank *bank = pctl_to_bank(pctl, pin);
-	unsigned param = pinconf_to_config_param(*config);
+	unsigned int param = pinconf_to_config_param(*config);
 	u32 mask = BIT(pin - bank->gpio_chip.base);
 	u32 arg;
 
@@ -1917,12 +1917,12 @@ static int pic32_pinconf_get(struct pinctrl_dev *pctldev, unsigned pin,
 	return 0;
 }
 
-static int pic32_pinconf_set(struct pinctrl_dev *pctldev, unsigned pin,
-				 unsigned long *configs, unsigned num_configs)
+static int pic32_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
+				 unsigned long *configs, unsigned int num_configs)
 {
 	struct pic32_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct pic32_gpio_bank *bank = pctl_to_bank(pctl, pin);
-	unsigned param;
+	unsigned int param;
 	u32 arg;
 	unsigned int i;
 	u32 offset = pin - bank->gpio_chip.base;
@@ -1987,7 +1987,7 @@ static struct pinctrl_desc pic32_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
-static int pic32_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
+static int pic32_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
 

-- 
2.53.0


