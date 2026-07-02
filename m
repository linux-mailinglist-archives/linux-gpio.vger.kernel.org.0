Return-Path: <linux-gpio+bounces-39361-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZJTnIWAvRmpDLQsAu9opvQ
	(envelope-from <linux-gpio+bounces-39361-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 11:29:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 408196F53EE
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 11:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=realtek.com header.s=dkim header.b=TgE+OIyM;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39361-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39361-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=realtek.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D6C033150882
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 09:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985B0477988;
	Thu,  2 Jul 2026 09:02:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0FD3C553A;
	Thu,  2 Jul 2026 09:02:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782982923; cv=none; b=pME0fZLz4gPZK3/fvZhLCFgmyab4ePZ0XdauXS7JBavMHpm7SUSbID+zPS5U4y2DXkue6QKGyIrHjTP7lLfrIXUy+16DLP/A/XuVvcmbPm3HC/w7kW667pbY9L7BHm3VJ47xr2Oq7AKor76xfJDdzEypDaXKc9nU5esEkZbsSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782982923; c=relaxed/simple;
	bh=DVpsDdzrOHMA6LdjFsvJac779QssSsmuWMu/jA5SmSs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOL9Rk07McyqOJpnSiTMhKnhwBM/NreMubVphkfMhIlChsqViZX0qBtCcIgSlmN3yiGO+HiaBEEnEFlrlB9iLZZPQBhlSqJiWsHoZZrDA03Ngb8X+Tw8tKw8IguGK4SP8yjzWjVaexDwNkrhMfXeTy5g4w7dlAeQXeH+e2nW+MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=TgE+OIyM; arc=none smtp.client-ip=211.75.126.72
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66291GYc81817127, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782982876; bh=SGullVisBxHPtHXU0eHR73ezsi7O9eK9w2hPnqkLNfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=TgE+OIyMFlN+uSJvtM4qql8GfW+eq0G3JdQbOs+qaYad03MzACCopqyPxjcKtmlS2
	 C7rvGnDJH9RFyOoZD+0rY2aZZNW31BjRrLN147CvVLQLV7kXHJ4bN+f2GRub9pZyJ2
	 njqwRG7k7TVssEUuJI5vVoM7UgkziuS6rsqW8JVfQdjrenhQqeWLLSdeoF7Q9qVUKQ
	 8GLxYASQrn1YbUUdXXvlzTdXm5NH0G1HxMpcxPD7Br3W7OsfpAHzE4/0UEHpDnaecU
	 ST2iSP2x4W3vNJw13WZqIfYBLO+jc/J538pfEtq/BmcCRDqJKYfjyjKxRS17tX6WE/
	 hX8jmXVBXkvZQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66291GYc81817127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jul 2026 17:01:16 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 2 Jul 2026 17:01:16 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Jul 2026 17:01:16 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
	<mwalle@kernel.org>, <andriy.shevchenko@intel.com>, <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
	<stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
	<james.tai@realtek.com>
Subject: [PATCH v5 2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
Date: Thu, 2 Jul 2026 17:01:13 +0800
Message-ID: <20260702090115.2564318-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702090115.2564318-1-eleanor.lin@realtek.com>
References: <20260702090115.2564318-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39361-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:afaerber@suse.com,m:mwalle@kernel.org,m:andriy.shevchenko@intel.com,m:tychang@realtek.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-realtek-soc@lists.infradead.org,m:cy.huang@realtek.com,m:stanley_chang@realtek.com,m:eleanor.lin@realtek.com,m:james.tai@realtek.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[realtek.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,realtek.com:dkim,realtek.com:email,realtek.com:mid,realtek.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 408196F53EE

Replace "default y" with "default ARCH_REALTEK" to avoid bloating the build
for non-Realtek platforms when COMPILE_TEST is enabled on other platforms.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v5:
- None.
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 28cf6d2e83c2..ed2bc3113374 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -646,7 +646,7 @@ config GPIO_ROCKCHIP
 config GPIO_RTD
 	tristate "Realtek DHC GPIO support"
 	depends on ARCH_REALTEK || COMPILE_TEST
-	default y
+	default ARCH_REALTEK
 	select GPIOLIB_IRQCHIP
 	help
 	  This option enables support for GPIOs found on Realtek DHC(Digital
-- 
2.43.0


