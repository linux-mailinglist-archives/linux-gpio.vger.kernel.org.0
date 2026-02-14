Return-Path: <linux-gpio+bounces-31681-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJHlOKrKj2ntTgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31681-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 02:06:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BC013A71D
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 02:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C7B23010B54
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 01:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AC2221F24;
	Sat, 14 Feb 2026 01:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVdBRpo+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC651E1E12;
	Sat, 14 Feb 2026 01:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031199; cv=none; b=k47fRIW1IHcLXoSEcKFZgMKrAhQ3v/YG1vLvw96wXQ1OdW2Ucm47aMZOl1LwaFWFvCoCgIHSkVxgDsA3WxvmEwXtadNpHEiOCU7//FPIhFgxtm88gc26LJQGNzhcGPjD/VicQ/YWo2HquoMTmsbdlQFhMrhhdDR6se1pqUfjMDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031199; c=relaxed/simple;
	bh=n2tjqytbYdaj8GUv6LUY405Nq71IvZ/joeUBGpYTSkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kaWlwugPfAZca7c5+funkZXuxEHdzzFvMp+jbgqzMAqgBKx9IJFU3UFRb5odtwkbkJcBXOSWjN20weXSMDMHYAs9A8ePktWRsMVn10u2IRk7hc+/797Rzxk3Xt3+IYS9Ms8yzQkA+8H1XkNhVRLVqBI45FZy+bTcc83cppHVDJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVdBRpo+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80735C116C6;
	Sat, 14 Feb 2026 01:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031199;
	bh=n2tjqytbYdaj8GUv6LUY405Nq71IvZ/joeUBGpYTSkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gVdBRpo+6AgWjdkyb+1qf2ki6KigrLLTb8wzOK6X99dAOKb5XqBUnAmaijrEOFXut
	 LAaCjhoZKJ+9sKvTPlYZzay074jMdmdPsqipQ7ClDARmqARag+b2odn48CLgIoA5Nm
	 KqzLlTXvDIkSwijR42UPAnhmIcHexokvEqeTwywTPb8djEx9/JnXKi02gxccFcO4cp
	 D7Vo/1+pznIr+ajxDoZibzbbQDnUrx81nBJDJ5KmL8rONGQPp24NOCUO+8rRVgP9fi
	 xnQcxTsRnha7Yyd+HGqZma7fn6mRC1M4ue6yJCmUve+Sl9GQ5BWmsF15ih6V0KChKX
	 CsL0Rbv/JMsQg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Jan Remmet <j.remmet@phytec.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linusw@kernel.org,
	brgl@kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] gpio: pca953x: Add support for TCAL6408 TCAL6416
Date: Fri, 13 Feb 2026 19:59:39 -0500
Message-ID: <20260214010245.3671907-99-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31681-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ti.com:url]
X-Rspamd-Queue-Id: B2BC013A71D
X-Rspamd-Action: no action

From: Jan Remmet <j.remmet@phytec.de>

[ Upstream commit a30a9cb9bca4296d25f253619883e7013b6be158 ]

TCAL6408 and TCAL6416 supports latchable inputs and maskable interrupt.
Tested on a TCAL6416, checked datasheets for the TCAL6408.

They use the same programming model ad the NXP PCAL64xx, but
support a lower supply power (1.08V to 3.6V) compared to PCAL
(1.65V to 5.5V)

Datasheet: https://www.ti.com/lit/ds/symlink/tcal6408.pdf
Datasheet: https://www.ti.com/lit/ds/symlink/tcal6416.pdf

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
Link: https://lore.kernel.org/r/20251216-wip-jremmet-tcal6416rtw-v2-3-6516d98a9836@phytec.de
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Good - there's no fallback compatible mechanism here. Each chip gets its
own compatible string.

## Complete Analysis

### 1. Commit Message Analysis

The commit message is clear and well-structured:
- Explicitly states the chips use "the same programming model as the NXP
  PCAL64xx"
- Only difference is supply voltage range (1.08V-3.6V vs 1.65V-5.5V)
- References both datasheets for verification
- States it was "Tested on a TCAL6416" — author has real hardware
- The author (from phytec.de, an embedded hardware company) has a clear
  use case

### 2. Code Change Analysis

The changes are **purely table additions**:

**I2C device ID table** (`pca953x_id[]`): Adds 2 entries:
- `{ "tcal6408", 8 | PCA953X_TYPE | PCA_LATCH_INT, }` — 8-bit GPIO
  expander with PCAL features
- `{ "tcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, }` — 16-bit GPIO
  expander with PCAL features

These use the exact same type flags (`PCA953X_TYPE | PCA_LATCH_INT`) as
the already-supported `pcal6408` and `pcal6416`, confirming identical
register layout handling.

**OF match table** (`pca953x_dt_ids[]`): Adds 2 entries:
- `{ .compatible = "ti,tcal6408", .data = OF_953X(8, PCA_LATCH_INT), }`
- `{ .compatible = "ti,tcal6416", .data = OF_953X(16, PCA_LATCH_INT), }`

**Kconfig**: Updates help text to list the new chip names (purely
cosmetic).

**No new code paths**, no new functions, no new registers, no new logic.
The `PCA_LATCH_INT` flag (`PCA_PCAL | PCA_INT`) already enables all the
extended PCAL register handling throughout the driver (input latching,
interrupt masking, pull-up/down config, interrupt status).

### 3. Classification

This is a textbook **new device ID** addition to an existing driver. The
analysis guidelines explicitly call this out:

> NEW DEVICE IDs (Very Common): Adding PCI IDs, USB IDs, ACPI IDs, etc.
to existing drivers. These are trivial one-line additions that enable
hardware support. Rule: The driver must already exist in stable; only
the ID is new.

The `pca953x` driver exists in all stable trees (it's been in the kernel
for over 15 years). The TCAL chips use the exact same PCAL register
model that's already fully supported.

### 4. Scope and Risk Assessment

- **Lines changed**: ~10 lines across 2 files (Kconfig help text +
  device tables)
- **Files touched**: 2 (`Kconfig`, `gpio-pca953x.c`)
- **Risk**: Essentially zero. Table entries can only affect systems with
  these specific chips. No existing functionality is modified.
- **Merge conflicts**: The entries are added at the end of their
  respective groups, so conflicts are unlikely unless another chip was
  added in the same spot.

### 5. User Impact

- Users with TCAL6408 or TCAL6416 on their boards (embedded systems,
  industrial boards) cannot use these chips without this patch
- Without this patch, the hardware is completely non-functional for
  these users
- Phytec (the author's company) ships embedded modules that likely use
  these chips

### 6. Dependencies

- The DT binding YAML update (patch 1-2 of the series) is needed for
  `dt_binding_check` but is NOT needed for the driver to function. A
  device tree using `compatible = "ti,tcal6408"` or `compatible =
  "ti,tcal6416"` will be matched by the driver with just this patch.
- No code dependencies on other patches.

### 7. Precedent

The exact same pattern has been used many times for this driver. For
example:
- `82466bb622e92` "gpio: pca953x: Add support for TI TCA9535 variant" —
  same pattern, same situation (lower voltage TI variant of NXP chip)
- `6c99a046edfac` "gpio: pca953x: Add support for TI TCA6418"
- `a9e49635e263b` "gpio: pca953xx: Add support for pca6408"

### Summary

This is a pure device ID addition to a well-established, widely-used
GPIO expander driver. The TCAL6408/TCAL6416 are Texas Instruments chips
that are register-compatible with the already-supported NXP
PCAL6408/PCAL6416. The change adds only table entries (I2C device IDs
and OF compatible strings) and zero new code logic. It enables real
hardware for real users (tested on actual hardware), with effectively
zero risk of regression to existing users. This is precisely the kind of
"device ID addition" that stable kernel guidelines explicitly allow as
an exception.

**YES**

 drivers/gpio/Kconfig        | 4 ++--
 drivers/gpio/gpio-pca953x.c | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bd185482a7fdf..3439e025ba1c6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1193,11 +1193,11 @@ config GPIO_PCA953X
 
 	  8 bits:       max7310, max7315, pca6107, pca9534, pca9538, pca9554,
 	                pca9556, pca9557, pca9574, tca6408, tca9554, xra1202,
-			pcal6408, pcal9554b, tca9538
+			pcal6408, pcal9554b, tca9538, tcal6408
 
 	  16 bits:      max7312, max7313, pca9535, pca9539, pca9555, pca9575,
 	                tca6416, pca6416, pcal6416, pcal9535, pcal9555a, max7318,
-			tca9539
+			tca9539, tcal6416
 
 	  18 bits:	tca6418
 
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f93a3dbb2daaf..52e96cc5f67bb 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -126,6 +126,9 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "tca9539", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "tca9554", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "xra1202", 8  | PCA953X_TYPE },
+
+	{ "tcal6408", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "tcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
@@ -1469,6 +1472,9 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,tca9538", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,tca9539", .data = OF_953X(16, PCA_INT), },
 
+	{ .compatible = "ti,tcal6408", .data = OF_953X( 8, PCA_LATCH_INT), },
+	{ .compatible = "ti,tcal6416", .data = OF_953X(16, PCA_LATCH_INT), },
+
 	{ .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "onnn,pca9655", .data = OF_953X(16, PCA_INT), },
-- 
2.51.0


