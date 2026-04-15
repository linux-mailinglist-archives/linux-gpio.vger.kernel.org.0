Return-Path: <linux-gpio+bounces-35159-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNwNMZ5n32lSSgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35159-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:25:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CE403441
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F833302F581
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 10:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 719D7344D9B;
	Wed, 15 Apr 2026 10:24:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DB6345734;
	Wed, 15 Apr 2026 10:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776248697; cv=none; b=EtBQY29iEBZoD363Cjm2JsJv7rtSL+yEIoF+UbW24KMa0RUgDhWEm70oqPfwPK99CpxoS+va92l5gGoZtNcjHQhqpWSPMtS2jH6qSvj9QEKt0puEDol3yYGNAolGHIcCb7kZxnSuE5s8gzcFBgBC8eUPib1Miqjnwvc1fxEpjfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776248697; c=relaxed/simple;
	bh=mm7hDoKN7iti+b5vLqDrPKkhJ+rkkywvY8n22UKL7Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=q+rbZ2TruZwe2I6bn0Ff0VmuGj1mPCkx9hIzVrE8C8agrJBcdSM7xOsI6hdn5LbhWCBVdt6ofki0yGDhCAsUNlApyomVAI7i5QpippboAQuc/fEzuxVq7GnNOPgOjoQcphS55A79SnyR1VvdF0n0WR92AkWgw8weYnegDk4gSwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 15 Apr
 2026 18:24:46 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 15 Apr 2026 18:24:46 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Wed, 15 Apr 2026 18:24:42 +0800
Subject: [PATCH] gpio: aspeed: fix AST2700 debounce selector bit
 definitions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260415-gpio-fix-v1-1-b08a89b31e6f@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAGln32kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0NT3fSCzHzdtMwKXUNzE1NTC+PU5DQDMyWg8oKiVKAw2Kjo2NpaADr
 KCulaAAAA
X-Change-ID: 20260415-gpio-fix-1745583ecf06
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
CC: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776248686; l=1387;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=mm7hDoKN7iti+b5vLqDrPKkhJ+rkkywvY8n22UKL7Q4=;
 b=xltRCYSWnLbGHqjv3iCcpoxcxMICHhXNHsq8rZVGdgeOxVKQIMYm7j5TcRzziaAqE2G5qfqW0
 t13s1XuI2pMA6PQpU3uoagyImsMSbktSm1U/OoH2Ac9o2mabPBnwVlk
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spamd-Result: default: False [0.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,aspeedtech.com:mid,aspeedtech.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-35159-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 202CE403441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The AST2700 datasheet defines reg_debounce_sel1 as the low bit and
reg_debounce_sel2 as the high bit. The current driver uses the AST2600
mapping instead, where sel1 is the high bit and sel2 is the low bit.

As a result, the debounce selector bits are programmed in reverse on
AST2700. Swap the G7 sel1/sel2 bit definitions so the driver matches the
hardware definition.

Fixes: b2e861bd1eaf ("gpio: aspeed: Support G7 Aspeed gpio controller")
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/gpio/gpio-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9115e56a1626..98b5bfbc04a3 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -42,8 +42,8 @@
 #define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)
 #define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)
 #define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)
-#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(7)
-#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(8)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(7)
+#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(8)
 #define GPIO_G7_CTRL_INPUT_MASK BIT(9)
 #define GPIO_G7_CTRL_IRQ_STS BIT(12)
 #define GPIO_G7_CTRL_IN_DATA BIT(13)

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260415-gpio-fix-1745583ecf06

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


