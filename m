Return-Path: <linux-gpio+bounces-37035-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP4IEQvQCmob8gQAu9opvQ
	(envelope-from <linux-gpio+bounces-37035-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:38:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EA568FA5
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 10:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47D8B3056DA1
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 08:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB9C3E7BB6;
	Mon, 18 May 2026 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFTFtOBs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9158E3E4C83;
	Mon, 18 May 2026 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092783; cv=none; b=CAARsSmeyorZ/025LHetFxAYrbQOz+TC5vFVHiDcABHZxypH5EocYl3c9xdKpeJXTylmXXMMv3NgsWsc4VJapqy3ya7LjsJeHrNMwjYCVQEf1q6j1GOPopFlgVeGzu4W85aJS/udlc/dIM+VOs6+eKpIv+t3XWUIt6zzQ8Z5vFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092783; c=relaxed/simple;
	bh=gF8Z0lDWvqPjxyeiNxBSuBywQXoR5uTnCFjFlTsul+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ma1nBT9jyHB3aPXIzSmY9jQdrHla1wJ/XY6uy5lm6curq12ZZhIKtjLNo6sfRHLos5+gzhpECmDP7dbr6qQhCPKRfi1E7Tl2dtgj7WN6Szm/ZpmAq7g7KH0yAyac3mi0hVvcrVKNKZRC2OHTt7EkywAxbLtG8dPCSOSyNtSRXKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFTFtOBs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 302C8C2BCC6;
	Mon, 18 May 2026 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779092783;
	bh=gF8Z0lDWvqPjxyeiNxBSuBywQXoR5uTnCFjFlTsul+w=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AFTFtOBszLvoMlud9z860++DzA04pwIvYtlIMxUN4swYXjLWVU7tLL+K78Wi30C4S
	 jIbR6aj2H3npLY+qzNewg79qPtreHLHwlKd/Oii0Xb919FSESb76bgUNSpWvnKUalN
	 XEU+wCUMFghSbAcBGaO4lscsoTP69iHdkB3UG8opj4iXn3YtoKVI7qRMi6FwObYfeJ
	 FEztjG37D2Mp+62tER9gl82Mpgu761zxsakSu8dzKUJ6ytmuEGuQN+K7RxJXl6p9wR
	 cz36sqgQsmlXK6wh7FW7qSESVwIC3RcFfnd6umgHxsYltkVXheX89z+ncdOv370TRF
	 z0d18VZDgYzLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F49DCD4F52;
	Mon, 18 May 2026 08:26:23 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 18 May 2026 08:26:20 +0000
Subject: [PATCH] pinctrl: meson: amlogic-a4: fix gpio output glitch
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-fix-set-value-glitch-v1-1-d350732dc934@amlogic.com>
X-B4-Tracking: v=1; b=H4sIACvNCmoC/x2MQQqAIBAAvxJ7biG1pPpKdBDdaiEstCIQ/550H
 JiZBJECU4SxShDo4ciHLyDqCuxm/ErIrjDIRuqmEz0u/GKkCx+z34TrzpfdcGmVdUprK4cOSno
 GKt6/neacP6WFXLJmAAAA
X-Change-ID: 20260518-fix-set-value-glitch-f43cd366c295
To: Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779092781; l=2464;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=HQut5DoHHLHMAAEMHfB1ndnbzPoAfeLWYAz1btYy/v4=;
 b=iSGDTNSp99CxN/n337nlmpKipA9olU98cB3IT8K22NnaIVpfwhI4C4MCEB0dIVlmR3IlTXd9Y
 FhrDNoLUCdxC0Nekxu1rUksY4RIWqW9zWwDlGWEmyCvbAmOWryO6CqJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
X-Rspamd-Queue-Id: D64EA568FA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37035-lists,linux-gpio=lfdr.de,xianwei.zhao.amlogic.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[xianwei.zhao@amlogic.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amlogic.com:email,amlogic.com:mid,amlogic.com:replyto]
X-Rspamd-Action: no action

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

When the system transitions from bootloader to kernel, the GPIO is
expected to keep driving high.

However, the Linux kernel first configures the pin direction and then
sets the output value. This may cause a brief low-level glitch on the
GPIO line, which can be problematic for regulator control.

By configuring the output value before switching the pin direction to
output, the glitch can be avoided.

This commit fixes the issue by swapping the configuration order.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
fix one issue when set gpio line high.
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 35d27626a336..1bd58fbbd26a 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -548,11 +548,11 @@ static int aml_pinconf_set_output_drive(struct aml_pinctrl *info,
 {
 	int ret;
 
-	ret = aml_pinconf_set_output(info, pin, true);
+	ret = aml_pinconf_set_drive(info, pin, high);
 	if (ret)
 		return ret;
 
-	return aml_pinconf_set_drive(info, pin, high);
+	return aml_pinconf_set_output(info, pin, true);
 }
 
 static int aml_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
@@ -921,15 +921,14 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 	unsigned int bit, reg;
 	int ret;
 
-	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
-	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
+	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+				 value ? BIT(bit) : 0);
 	if (ret < 0)
 		return ret;
 
-	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
-
-	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
-				  value ? BIT(bit) : 0);
+	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
 }
 
 static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)

---
base-commit: 73d4991a6949eedb51e442d4e81415017d85975b
change-id: 20260518-fix-set-value-glitch-f43cd366c295

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



