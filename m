Return-Path: <linux-gpio+bounces-35351-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL6MCr606GmIOwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35351-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:45:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA44458E4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 13:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7335304523A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 11:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C913D091F;
	Wed, 22 Apr 2026 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktOEzpdU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA3834F483;
	Wed, 22 Apr 2026 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776858260; cv=none; b=Nq8ZUzTR5qRR9a/VnsC9xWViOrIK8HSKxJ7cib0sbjz+UjV4eK6lKO1C4HVLOxq0n81SEdQoSn9a+GBLg0ztUFr73xozEAQMz6glV+oJ9IG6kT2ROZDYSjNyOGa3UnKkvL9lEOtUSKyUWpXB395ACNzp4yMiUJDU0thwKEupqEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776858260; c=relaxed/simple;
	bh=jhptRH9NwVJexkC7VbAUXdVKvsP7WnTfWca81DZoqAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ozs50aPlydTa6dGYMd/AwMFLRtNme7uZEcGyE3NK3KidstSGtGQ5TdFf4kCbV6VpZPQTsoGtIsYwQBhmc2vVYZAVUbctbBYzjZCFXanwrhUWKJd8pz14fwmkqfpBtUS29ZxHPr3lksM2bizREHeFDd9hj0F6BGXYRUBRrxz2nus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktOEzpdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCF58C19425;
	Wed, 22 Apr 2026 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776858259;
	bh=jhptRH9NwVJexkC7VbAUXdVKvsP7WnTfWca81DZoqAs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ktOEzpdUCP6JYApKumRzkyw9A55BDaNe2JPGU3uIYBglVVivVPROgbLfsXGzM2Xy+
	 Mxl3PnO5dFL9h6QevTzuBGa0CxQTXj4jrs4Y+JAJ3Pfj1X/agxRoPOBuUKs3x/RqXM
	 Hh4aI6kerDPAjte21w3No4CF6WbrMSKXgD45leMEdN2XMlBMYfa0vsDjcgKJ8whnho
	 shGzNpyIxet2vpdkF2rXmYfvPhy5LU5dFayMCuL4w4OWS2pIKmEezp1aiCeFxeUD/b
	 l6/4kpRyEfvse7z1UwnCv/lnPQbuKfmZLtZwmxl/Uf6fxisytXCQhlg2iqP3RyM3Xn
	 I/1HQvS82UaRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B70F94CBE;
	Wed, 22 Apr 2026 11:44:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 22 Apr 2026 11:44:13 +0000
Subject: [PATCH] pinctrl: meson: amlogic-a4: fix deadlock issue
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-fix-pinconf-v1-1-abb4d2e0da55@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAIy06GkC/x3NQQqDQAyF4atI1gY02C68inQxkyY1m4xkigji3
 Tt2+fP4eCdUCZMKc3dCyG7VircY+w54Tf4RtHdroIGew0SEagdu5lxccaIsIzPpIyk0kVMVzJG
 c19toCXQ5vve0hTT5P1pe1/UD9QwM4XgAAAA=
X-Change-ID: 20260422-fix-pinconf-42be1cc2f5af
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776858256; l=2200;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Ss1NSqKaiC5N5QiCWkTV2uRyv5Uo42HRnPH2RlMwg5E=;
 b=fr7u9d+eLFEa7sccl3XsNIMQoaiZ7WblPDxAAp4bIzh/HrYB6ydQXMiU1Ec+47fQmUWfWWegx
 Yj1u23N8KyqBcB7KMBYSwEMnn8XKl/x0IRNVvlYw3sfzP8B5LsRUsqG
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35351-lists,linux-gpio=lfdr.de,xianwei.zhao.amlogic.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[xianwei.zhao@amlogic.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amlogic.com:email,amlogic.com:replyto,amlogic.com:mid]
X-Rspamd-Queue-Id: 88DA44458E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Accessing the pinconf-pins sysfs node may deadlock.

pinconf_pins_show() holds pctldev->mutex, and the platform driver
calls pinctrl_find_gpio_range_from_pin(), which tries to acquire
the same mutex again, leading to a deadlock.

Use pinctrl_find_gpio_range_from_pin_nolock() to fix this issue.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix deadlock issue.
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index e2293a872dcb..35d27626a336 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -292,7 +292,7 @@ static int aml_calc_reg_and_bit(struct pinctrl_gpio_range *range,
 static int aml_pinconf_get_pull(struct aml_pinctrl *info, unsigned int pin)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit, val;
 	int ret, conf;
@@ -326,7 +326,7 @@ static int aml_pinconf_get_drive_strength(struct aml_pinctrl *info,
 					  u16 *drive_strength_ua)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit;
 	unsigned int val;
@@ -365,7 +365,7 @@ static int aml_pinconf_get_gpio_bit(struct aml_pinctrl *info,
 				    unsigned int reg_type)
 {
 	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(info->pctl, pin);
+			 pinctrl_find_gpio_range_from_pin_nolock(info->pctl, pin);
 	struct aml_gpio_bank *bank = gpio_chip_to_bank(range->gc);
 	unsigned int reg, bit, val;
 	int ret;

---
base-commit: bd7fd288490c64835a74c05e631c102ce056d5e1
change-id: 20260422-fix-pinconf-42be1cc2f5af

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



