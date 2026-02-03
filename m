Return-Path: <linux-gpio+bounces-31405-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAZJD7MzgmlTQgMAu9opvQ
	(envelope-from <linux-gpio+bounces-31405-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 18:43:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A0DCFDA
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 18:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D6CBF30513E7
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 17:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF6A32693E;
	Tue,  3 Feb 2026 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqMi7Xqw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79427E7EB;
	Tue,  3 Feb 2026 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139819; cv=none; b=XrWTHjiqtWAY6wbuEESKn27dly9pzWI5+lRSkHwFbzaMYIYNfOPq+mF80oHKlZJi0tWJnaQxLZJvy1P7eA9OhURErOhSQZ1GzA/hiIe6b9w+sZheZo7VFFv7QsF45EB0wGIA83U9Osd3oliH/gBmxuBFoBEWMW+jYlHwrqNU56k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139819; c=relaxed/simple;
	bh=CTakssbPD5mZa/dpW9T53W/pl1AiG+PjzXOlBCYHqos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DArta0OJMKkKL4yj0ElwakoXwNNS+AWC4rhvzrnZoZOh78GOWMmFKJ6ATFdqcAKcttqpUBAwqXu8uT6ylPJXMgGLxn/eqb4wlIPz34Mca5HRZURviaIPmEknh80IzUJ6qlIiTFCXSPsn9fkVr4Y8UT9fA5I5CNX0IPTEFLxyxnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqMi7Xqw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3671C19421;
	Tue,  3 Feb 2026 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770139818;
	bh=CTakssbPD5mZa/dpW9T53W/pl1AiG+PjzXOlBCYHqos=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fqMi7XqwPpWMGlrJrdRobcmf2ZFWBV02p0dttrUHipAZyGlKPvEtzQGK3TQ3CBRnk
	 6Q1K8SH9NrNsDElqNxI2GmTRHV4xR5JlBX8x73hwGK4e4Ya5gdrSq/2UTCAktxxT7S
	 NrktYVh63uRKwSApX4Ef5j8eEix97ccCpxbt391U9yXiRC1hlLSCNwjCnCxPIRmAYC
	 ZaL4/V4hlURfF/XTltPjnI0DjJNcYL7tgxulhgz9JyfXb06Lw9gAIGqmUVlNH7LHNt
	 1WWVkkKgabfG00QR4BQx0SFkpXHmfsj1GxF/woJV/YpoRPUydllrg939DKq7r3KNZL
	 BD0nivBT2DUDw==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [rfc 1/2] pinctrl: pinconf-generic: perform basic checks on pincfg properties
Date: Tue,  3 Feb 2026 17:29:42 +0000
Message-ID: <20260203-herald-wrench-990ca2aaed2a@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260203-device-unwashed-ed24f8592d79@spud>
References: <20260203-device-unwashed-ed24f8592d79@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4476; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=yMFtCzvyTWIGqd+o1eahXgukEiJT/4dN+e2EwxmDNM8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlNBjO+/bDWzXC/4Oh1pH8FQwc3r9/fm3KxW1Y8f7sl3 O/D2+hfHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIWSdGhrbeuwppgkLfOlyy Sias33g37bzD7Rs3Il5lTxdb8PnCmgkMfzh7lMImL5K4sfdIkluYkKfWXNdTB94zs/25dWjRPAn N28wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31405-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 963A0DCFDA
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

Some pinconf properties are mutually exclusive, either because they
convey the same information in different units or represent incompatible
configurations of the same pin. Attempt, in two ways, to prevent these
situations.

Firstly, for enable/disable properties, produce an error if both are
set. Since enable/disable properties share the same enum value, they can
be trivially checked via the newly added bitmap. Having both enable and
disable for the same config makes no sense at all, so produce an error
in this case.

For interactions between properties, doing them outside the loop makes
more sense as it can be evaluated once. In case there are some edge
cases that would be broken by producing an error, only warn for now.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
ngl, this is a bit of a lazy approach, and I just didn't bother checking
the more complex things that a simple bitmap scheme could not address.
Chief among the more complexes thing that I didn't do anything about is
that properties that I don't feel make sense when something is disabled
don't complain when they are present but the disabled property also is.
That's because enable and disable are the same bit in the bitmap, so
more info than just the bitmap would be required to perform that check.

Part of me says that that's okay and should be handled by dt tools, since
it's mostly harmless and that denying things that are effectively
undefined behaviour (well really, they're driver/implementation defined
behaviour) is what's actually valuable here.

I dunno about the tests being done as a sum, but I dunno if there's a
neater way to do that test without creating bitmaps to and with the
created one.
---
 drivers/pinctrl/pinconf-generic.c | 41 ++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 366775841c63..d182ec84e2df 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -222,7 +222,10 @@ static int parse_dt_cfg(struct device_node *np,
 			unsigned int count, unsigned long *cfg,
 			unsigned int *ncfg)
 {
-	int i;
+	unsigned long *properties;
+	int i, test;
+
+	properties = bitmap_zalloc(count, GFP_KERNEL);
 
 	for (i = 0; i < count; i++) {
 		u32 val;
@@ -251,11 +254,45 @@ static int parse_dt_cfg(struct device_node *np,
 		if (ret)
 			val = par->default_value;
 
+		/* if param is greater than count, these are custom properties */
+		if (par->param <= count) {
+			ret = test_and_set_bit(par->param, properties);
+			if (ret) {
+				pr_err("%s: conflicting setting detected for %s\n",
+				       np->name, par->property);
+				bitmap_free(properties);
+				return -EINVAL;
+			}
+		}
+
 		pr_debug("found %s with value %u\n", par->property, val);
 		cfg[*ncfg] = pinconf_to_config_packed(par->param, val);
 		(*ncfg)++;
 	}
 
+	if (test_bit(PIN_CONFIG_DRIVE_STRENGTH, properties) &&
+			test_bit(PIN_CONFIG_DRIVE_STRENGTH_UA, properties))
+		pr_err("%s: cannot have multiple drive strength properties\n",
+		       np->name);
+
+	test = test_bit(PIN_CONFIG_BIAS_BUS_HOLD, properties) +
+		test_bit(PIN_CONFIG_BIAS_DISABLE, properties) +
+		test_bit(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, properties) +
+		test_bit(PIN_CONFIG_BIAS_PULL_UP, properties) +
+		test_bit(PIN_CONFIG_BIAS_PULL_PIN_DEFAULT, properties) +
+		test_bit(PIN_CONFIG_BIAS_PULL_DOWN, properties);
+	if (test > 1)
+		pr_err("%s: cannot have multiple bias configurations\n",
+		       np->name);
+
+	test = test_bit(PIN_CONFIG_DRIVE_OPEN_DRAIN, properties) +
+		test_bit(PIN_CONFIG_DRIVE_OPEN_SOURCE, properties) +
+		test_bit(PIN_CONFIG_DRIVE_PUSH_PULL, properties);
+	if (test > 1)
+		pr_err("%s: cannot have multiple drive configurations\n",
+		       np->name);
+
+	bitmap_free(properties);
 	return 0;
 }
 
@@ -352,6 +389,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 	ret = parse_dt_cfg(np, dt_params, ARRAY_SIZE(dt_params), cfg, &ncfg);
 	if (ret)
 		return ret;
+
 	if (pctldev && pctldev->desc->num_custom_params &&
 		pctldev->desc->custom_params) {
 		ret = parse_dt_cfg(np, pctldev->desc->custom_params,
@@ -360,6 +398,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 			return ret;
 	}
 
+
 	/* no configs found at all */
 	if (ncfg == 0) {
 		*configs = NULL;
-- 
2.51.0


