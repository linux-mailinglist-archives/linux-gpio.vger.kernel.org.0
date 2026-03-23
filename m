Return-Path: <linux-gpio+bounces-34016-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOalOugfwWnCQwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34016-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 12:11:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 969FA2F0F16
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 12:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9008430E6D40
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAFF396D16;
	Mon, 23 Mar 2026 11:02:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED07A396B7F;
	Mon, 23 Mar 2026 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263727; cv=none; b=PvpDKFOyHEhymusCKePCvPYXJPZ0Ab0geXzfW/xgyhI8khCyeWHROG3O1Qc0NhgAMEYrnXUKBdllPkzzx+NsMU0nay0pII12+6VgBXlHlSDkewWKT4QdamhF9FzwlRE2LAj4k0SNFz9LBj5bKtqtAHgviu8UW2xosqdiuWEo/Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263727; c=relaxed/simple;
	bh=6LQoW6kQOfbEsfzMM/F1yWmTZlzQ6I3tofZzfSVmVy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBR3PQHGmzmZFRIQzXkywM2XqouCg010FzZz+opZcEEPb2uV2oqL6+Wr6gaVq1VlIh9WdbM6YKaF68D1GQ3r5tgkM78MZts+/CbspFb6ktUBwh9hBljcoktdtuchSErBpGQxy4Pp73Rt5xrRqJaJZIqxJUAERvKjqGUUE5gcXG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67EE31688;
	Mon, 23 Mar 2026 04:01:59 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C69DD3F73B;
	Mon, 23 Mar 2026 04:02:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] pinctrl: sunxi: Remove unneeded IRQ remuxing for some SoCs
Date: Mon, 23 Mar 2026 12:01:48 +0100
Message-ID: <20260323110151.2352832-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323110151.2352832-1-andre.przywara@arm.com>
References: <20260323110151.2352832-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,csie.org,gmail.com,sholland.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34016-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 969FA2F0F16
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
reflects the true GPIO state even with a pin configured to muxval 6
(IRQ). The workaround is just more costly, but doesn't break otherwise,
so this was probably never noticed by anyone.
Experiments confirm that the H5, H6, H616 and A523 do not need this
workaround, they show the GPIO line value with both muxval 0 and 6.

Remove the unneeded quirk from those SoC's pinctrl driver description.
This should have no obvious effect on the H5, H6, H616 (other than
being more efficient), but the workaround is broken for the A523, so
it fixes (one part of the) interrupt operation there.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 GPIO ports")
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c     | 2 --
 drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c     | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c   | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 -
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 1 -
 5 files changed, 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
index 669793c6578e..56ce0f78d4ba 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h5.c
@@ -533,7 +533,6 @@ static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data_broken = {
 	.pins = sun50i_h5_pins,
 	.npins = ARRAY_SIZE(sun50i_h5_pins),
 	.irq_banks = 2,
-	.irq_read_needs_mux = true,
 	.disable_strict_mode = true,
 };
 
@@ -541,7 +540,6 @@ static const struct sunxi_pinctrl_desc sun50i_h5_pinctrl_data = {
 	.pins = sun50i_h5_pins,
 	.npins = ARRAY_SIZE(sun50i_h5_pins),
 	.irq_banks = 3,
-	.irq_read_needs_mux = true,
 	.disable_strict_mode = true,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
index 517118341316..22f3d3875316 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h6.c
@@ -589,7 +589,6 @@ static const struct sunxi_pinctrl_desc h6_pinctrl_data = {
 	.npins = ARRAY_SIZE(h6_pins),
 	.irq_banks = 4,
 	.irq_bank_map = h6_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
index ecf6d2438e21..48cf114505e0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
@@ -875,7 +875,6 @@ static const struct sunxi_pinctrl_desc h616_pinctrl_data = {
 	.npins = ARRAY_SIZE(h616_pins),
 	.irq_banks = ARRAY_SIZE(h616_irq_bank_map),
 	.irq_bank_map = h616_irq_bank_map,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_CTL,
 };
 
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


