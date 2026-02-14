Return-Path: <linux-gpio+bounces-31680-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE4kNizLj2nMTgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31680-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 02:09:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C6F13A8A5
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 02:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2EC1307750F
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 01:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3996221CC51;
	Sat, 14 Feb 2026 01:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mnd8Lv+N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08081D54FA;
	Sat, 14 Feb 2026 01:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031131; cv=none; b=CjLMQSeW3Ldv9POA6qgEges20HCeZ1s2/ug3UMR1Njp4cGdTh2d8LiAS1EssDwOpfxxovkqGi2MjpeWZ0ALfb04gicblwp5/Kzr8EDGNK1TBVRIM4waYg5XKwA2W8ShFx2pp6yoyX9mPW70MCBABLZuU1TAAVGTISxBAKZMv6bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031131; c=relaxed/simple;
	bh=eBEsX1nyMrmXr/mfibb4cH9Xymd5V8ShqLBPnfWpmSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtI0MhUu/Fv8M3/b4R//hkMdFF9o7DHehsd/yG3bCH7G81bkUujB3fWNxyaN/FnL3WyJIpOrIpSEWtoST60DSxH6W8Ye4KdY4wh9zieoS6iGNKf320uUk2OvFRXob75MdVj1y2sOuSyheVOFJJB2Bx2+IPOjdp7RRUOugcAVaE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mnd8Lv+N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA1BC19423;
	Sat, 14 Feb 2026 01:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031130;
	bh=eBEsX1nyMrmXr/mfibb4cH9Xymd5V8ShqLBPnfWpmSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mnd8Lv+N72Pmpoq651k8GlpYaoE2hKL3IGdboT5PF608kwKOJd6WDBhASZnSAivX7
	 +JrMZ3Dlxg3lPWuhtRBIQNauBvsBxX2stLMHw+pGG/UPhM6u+bdYz8JzqxziDh64qY
	 zB5woGl9DJyCICmIchFYGbrpGaqXqi+KIIPIY64u3syO7Gp2H0g5vQK4zzuA0In05C
	 ALiRD42rOAV1ZazFP6cR+u0pL074k3844/D7g+Ynb4SfWVITQa04mTrpUjogL0I+N0
	 LRpKCH095zdZKo/z+YzVMk05PObxi9Qt5Hboci4jpFNVEJEei3LS9ML+anSRPk3XmR
	 M7aRbjwWxG/Yw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	brgl@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.19-5.10] gpio: aspeed-sgpio: Change the macro to support deferred probe
Date: Fri, 13 Feb 2026 19:59:14 -0500
Message-ID: <20260214010245.3671907-74-sashal@kernel.org>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31680-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aspeedtech.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 69C6F13A8A5
X-Rspamd-Action: no action

From: Billy Tsai <billy_tsai@aspeedtech.com>

[ Upstream commit e18533b023ec7a33488bcf33140ce69bbba2894f ]

Use module_platform_driver() to replace module_platform_driver_probe().
The former utilizes platform_driver_register(), which allows the driver to
defer probing when it doesn't acquire the necessary resources due to probe
order. In contrast, the latter uses __platform_driver_probe(), which
includes the comment "Note that this is incompatible with deferred
probing." Since our SGPIO driver requires access to the clock resource, the
former is more suitable.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Link: https://lore.kernel.org/r/20260123-upstream_sgpio-v2-1-69cfd1631400@aspeedtech.com
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of gpio: aspeed-sgpio: Change the macro to support deferred
probe

### Commit Message Analysis

The commit changes `module_platform_driver_probe()` to
`module_platform_driver()` in the Aspeed SGPIO driver. The motivation is
to support deferred probing — when the clock resource isn't available
yet at probe time due to probe ordering, the driver should be able to
defer and retry later. With `module_platform_driver_probe()` (which uses
`__platform_driver_probe()`), deferred probing is explicitly not
supported.

### Code Change Analysis

The changes are:

1. **Remove `__init` annotation** from `aspeed_sgpio_probe()` —
   necessary because with `module_platform_driver()`, the probe function
   can be called after init (during deferred probe), so it can't be in
   `.init` section.

2. **Move `.probe` into the `platform_driver` struct** — from being
   passed as a second argument to `module_platform_driver_probe()` to
   being set as `.probe = aspeed_sgpio_probe` in the struct.

3. **Replace `module_platform_driver_probe()` with
   `module_platform_driver()`** — the actual behavioral change.

The probe function itself is completely unchanged in logic.

### Bug Classification

This fixes a **real probe failure bug**. When the Aspeed SGPIO driver is
compiled and the clock resource it depends on isn't yet available
(common on device-tree platforms where probe order isn't guaranteed),
the driver will fail to probe and **never retry**. This means the SGPIO
hardware is permanently non-functional until reboot, and even then only
if probe order happens to be favorable.

This is a real-world issue on Aspeed BMC platforms (AST2400, AST2500,
AST2600) which are widely used in server management. GPIO functionality
being unavailable due to probe ordering is a tangible user-facing bug.

### Scope and Risk Assessment

- **Lines changed**: Very small — removal of `__init`, moving the
  `.probe` assignment, macro swap
- **Files touched**: 1 file
- **Risk**: Very low. The probe function logic is completely unchanged.
  The only behavioral difference is that:
  1. The probe function is no longer in `.init` section (minor memory
     impact, but standard practice)
  2. Deferred probing is now supported (fixes the bug)
  3. The probe function pointer is stored in the driver struct rather
     than being patched in at registration time

This is a well-understood pattern — many drivers have made this exact
same transition over the years. The `module_platform_driver_probe()` to
`module_platform_driver()` conversion is one of the most common and
safest changes in the kernel.

### Stable Criteria Check

1. **Obviously correct and tested**: Yes — reviewed by Linus Walleij
   (GPIO subsystem co-maintainer), standard pattern
2. **Fixes a real bug**: Yes — probe failure when clock resource isn't
   available due to ordering
3. **Important issue**: Moderate — makes hardware permanently non-
   functional on affected platforms
4. **Small and contained**: Yes — minimal changes to one file
5. **No new features**: Correct — deferred probing is an existing kernel
   mechanism, this just enables the driver to participate in it
6. **Applies cleanly**: Should apply cleanly to any stable tree that has
   this driver

### User Impact

Aspeed BMC platforms are common in enterprise server management
(OpenBMC). If SGPIO fails to probe due to clock resource ordering, GPIO
pins managed by the SGPIO controller become unavailable, which can
affect system monitoring, power control, and other BMC functions. This
is a real-world issue that affects actual deployments.

### Concerns

- The commit doesn't have a `Fixes:` tag, which is expected for commits
  under review
- No explicit mention of user reports, but the commit author is from
  Aspeed Technology, indicating this is a known issue in their platform
- Minor: probe function no longer freed after init, but this is
  negligible memory impact

### Decision

This is a small, well-understood fix for a real probe failure bug on
Aspeed BMC platforms. The pattern change (`module_platform_driver_probe`
→ `module_platform_driver`) is one of the safest and most common
conversions in the kernel. It fixes a real-world issue where hardware
becomes non-functional due to probe ordering. The risk is minimal and
the benefit is clear.

**YES**

 drivers/gpio/gpio-aspeed-sgpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 7622f9e9f54af..318cd0e397416 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -516,7 +516,7 @@ static const struct of_device_id aspeed_sgpio_of_table[] = {
 
 MODULE_DEVICE_TABLE(of, aspeed_sgpio_of_table);
 
-static int __init aspeed_sgpio_probe(struct platform_device *pdev)
+static int aspeed_sgpio_probe(struct platform_device *pdev)
 {
 	u32 nr_gpios, sgpio_freq, sgpio_clk_div, gpio_cnt_regval, pin_mask;
 	const struct aspeed_sgpio_pdata *pdata;
@@ -611,11 +611,12 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 }
 
 static struct platform_driver aspeed_sgpio_driver = {
+	.probe = aspeed_sgpio_probe,
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.of_match_table = aspeed_sgpio_of_table,
 	},
 };
 
-module_platform_driver_probe(aspeed_sgpio_driver, aspeed_sgpio_probe);
+module_platform_driver(aspeed_sgpio_driver);
 MODULE_DESCRIPTION("Aspeed Serial GPIO Driver");
-- 
2.51.0


