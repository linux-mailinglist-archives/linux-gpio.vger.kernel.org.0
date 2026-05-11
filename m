Return-Path: <linux-gpio+bounces-36606-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBSNNBcyAmrSowEAu9opvQ
	(envelope-from <linux-gpio+bounces-36606-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:46:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E735153BC
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A7A03037467
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 19:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DCA4D2EF5;
	Mon, 11 May 2026 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oh+rIPpR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686094D2EE1;
	Mon, 11 May 2026 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778528631; cv=none; b=Q8dbdg5fVuNHqUlhEPnGJ/seZnzbzmOCRjQBsGVqxKxDXnPvFJ+rvwfPIdB+UJDTdvjRIFXG8kKb0WVzGmjsEFUA+o/SIZ/FmkUwCnqkKsZ+S0zFbHPECSwM12/PRtnCLbwdGOU53cXFMkmUBRd8RKv4xHHlRYrXMYk8qgj89zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778528631; c=relaxed/simple;
	bh=izMZZxPZYY8BcL//pdG4YdjFUE8wgataJGyQ4m0bQAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHgGEaHiGO99LnwvuNGiGBDvvmQWtJFdQLpRVLOdVPNnpFREe0QjnFwwgPhS5yAjMwDKrVYp0+MYKwVlvMfaZffzYXgwtZHH28rJHnCyy/8c87cMQjtsHO2Z/CiO3+2+i5om9t/Lda4h9EW9dtaLWO2XES7ZS2X5y+Em48fBtl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oh+rIPpR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C27C2BCF5;
	Mon, 11 May 2026 19:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778528631;
	bh=izMZZxPZYY8BcL//pdG4YdjFUE8wgataJGyQ4m0bQAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oh+rIPpRGQtds0jC8lzPKkvriKxKIPItknATLvCnozoLBp8H5ZGHiZUfrFlkY9Tvm
	 zZPppcvNm81cOQq1LpIqKVbXOyJFR1HvzmEbaTAZJ4EXS1wgJ/Smng5eAwVFVEABwG
	 uS8T4DgHe1C3yBQzcqn1lVXXFlYQlMBdBVZeLHpxCepw5LDnlyiX2PFdzBExYRXiFw
	 ZfBCYOTeHp9it/mKk90ECXQyBinDR70U2gXJDhSiZit3Kw8x/tgaZeXi4WFdq85rXJ
	 UMEDKwIdimZA65QlD2n50S4TUGMpdmlYDq2FQeE6Ex8+GDodUDoqMjVBNHsZaFD2xf
	 H+BqCppY0U1jw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 21:43:44 +0200
Subject: [PATCH v3 2/2] gpio: regmap: Don't set a fixed direction line
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-regmap-gpio-sparse-fixed-dir-v3-2-1429ec453be7@kernel.org>
References: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
In-Reply-To: <20260511-regmap-gpio-sparse-fixed-dir-v3-0-1429ec453be7@kernel.org>
To: Alex Elder <elder@riscstar.com>, Michael Walle <mwalle@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 37E735153BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36606-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

If a GPIO line has a fixed direction, report an error
is a consumer anyway tries to set the direction to
something other than what it is hardcoded to.

This didn't happen much before because what we supported was
all lines input or output and then the implementer would
probably not specify the direction registers, but with
sparse fixed direction we can have a mixture so let's take
this into account.

As a consequence, since gpio_regmap_set_direction() can
now fail, alter the semantics in
gpio_regmap_direction_output() such that we first check
if we can set the direction to output before we set the
value and the direction.

Suggested-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260507-regmap-gpio-sparse-fixed-dir-v1-1-a2e5855e2701%40kernel.org
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpio/gpio-regmap.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index b3b4e77ec147..51b4d69b8740 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -196,6 +196,22 @@ static int gpio_regmap_get_direction(struct gpio_chip *chip,
 		return GPIO_LINE_DIRECTION_IN;
 }
 
+static int gpio_regmap_try_direction_fixed(struct gpio_regmap *gpio,
+					   unsigned int offset, bool output)
+{
+	if (test_bit(offset, gpio->fixed_direction_output)) {
+		if (output)
+			return 0;
+		else
+			return -EINVAL;
+	} else {
+		if (output)
+			return -EINVAL;
+		else
+			return 0;
+	}
+}
+
 static int gpio_regmap_set_direction(struct gpio_chip *chip,
 				     unsigned int offset, bool output)
 {
@@ -203,6 +219,13 @@ static int gpio_regmap_set_direction(struct gpio_chip *chip,
 	unsigned int base, val, reg, mask;
 	int invert, ret;
 
+	/*
+	 * If the direction is fixed, only accept the fixed
+	 * direction in this call.
+	 */
+	if (gpio_regmap_fixed_direction(gpio, offset))
+		return gpio_regmap_try_direction_fixed(gpio, offset, output);
+
 	if (gpio->reg_dir_out_base) {
 		base = gpio_regmap_addr(gpio->reg_dir_out_base);
 		invert = 0;
@@ -234,6 +257,20 @@ static int gpio_regmap_direction_input(struct gpio_chip *chip,
 static int gpio_regmap_direction_output(struct gpio_chip *chip,
 					unsigned int offset, int value)
 {
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	int ret;
+
+	/*
+	 * First check if this is gonna work on a fixed direction line,
+	 * if it doesn't (i.e. this is a fixed input line), then do not
+	 * attempt to set the output value either and just bail out.
+	 */
+	if (gpio_regmap_fixed_direction(gpio, offset)) {
+		ret = gpio_regmap_try_direction_fixed(gpio, offset, true);
+		if (ret)
+			return ret;
+	}
+
 	gpio_regmap_set(chip, offset, value);
 
 	return gpio_regmap_set_direction(chip, offset, true);

-- 
2.54.0


