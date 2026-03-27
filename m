Return-Path: <linux-gpio+bounces-34261-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFCfAc9qxmmkJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34261-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:32:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D053437FF
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E6AF306759E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5407634B425;
	Fri, 27 Mar 2026 11:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AErEQxpS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8822C3BF66E;
	Fri, 27 Mar 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611022; cv=none; b=NhPSIv4QrAejc3lIy65i6F5Q8Z7BxxbRGE0LSUgWZMDSTKwsPAh7m/amhTZ5XLZZPLZTytIkIsVj7RdLc8UDSNFyOP0wyBvXegk4CNgM7bm+eSwXzQM9ycaAxPf5QiMbqTBTvF7PRqfosH4UqwRedjIdSvlrfwVy0exc2C+KBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611022; c=relaxed/simple;
	bh=P+xaz+0AM8oCDJ+fmGXliUwK+vicc4AlZE4yIXarY4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gS8beZYdqZp+B8TBhEBOKzLcB6Kau1+B8skriA51ZCtCFCi/4S/HdkWu9tO6zQuDaMjT2Auseh43/4S4FGlTrwnOdMaHwf5XgQnVkqnTMEMkDFQ4n5LWDZgpMZQgeYvYSZiDDzljxV4KdpbapVnmiQJoqyQv111GGI4qztfrTQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AErEQxpS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B04A135A5;
	Fri, 27 Mar 2026 04:30:11 -0700 (PDT)
Received: from e142021.cambridge.arm.com (e142021.arm.com [10.1.36.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18AFE3F915;
	Fri, 27 Mar 2026 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774611017; bh=P+xaz+0AM8oCDJ+fmGXliUwK+vicc4AlZE4yIXarY4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AErEQxpSUdhG8nEWVAHMVM7xjAnbqOhcqrCDh7JsHrAs8oudY6AO9ntvfslMtBgny
	 LMsa1o8flPTUNvAx1+9UTyzXeBiFo87WT4urbLcLpBGYvXFHO+TJ9NN+Akt36kNN1n
	 7I1CX50Iaw4x2kFzc8HYE3VrsR9A+bSaE4VUJzbA=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
Date: Fri, 27 Mar 2026 11:30:04 +0000
Message-ID: <20260327113006.3135663-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
	TAGGED_FROM(0.00)[bounces-34261-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: 79D053437FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
that line is muxed for IRQ triggering (muxval 6), but only if it's
explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
behaviour, so we added a optional workaround, triggered by a quirk bit,
which triggers remuxing the pin when it's configured for IRQ, while we
need to read its value.

For some reasons this quirk flag was copied over to newer SoCs, even
though they don't show this behaviour, and the GPIO data register
reflects the true GPIO state even with a pin muxed to IRQ trigger.

Remove the unneeded quirk from the A523 family, where it's definitely
not needed (confirmed by experiments), and where it actually breaks,
because the workaround is not compatible with the newer generation
pinctrl IP used in that chip.

Together with a DT change this fixes GPIO IRQ operation on the A523
family of SoCs, as for instance used for the SD card detection.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 GPIO ports")
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 69cd2b4ebd7d..462aa1c4a5fa 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -26,7 +26,6 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
 	.irq_bank_map = a523_r_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 	.pin_base = PL_BASE,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 7d2308c37d29..b6f78f1f30ac 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -26,7 +26,6 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_irq_bank_map),
 	.irq_bank_map = a523_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
-- 
2.43.0


