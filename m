Return-Path: <linux-gpio+bounces-37137-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGygHicxDGrdZAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37137-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:45:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E308A57B8AD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D90D930ECEA7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B107450911;
	Tue, 19 May 2026 09:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5R4J9RG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7FE44D6A1;
	Tue, 19 May 2026 09:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183455; cv=none; b=tKib/aEE3/xzO1cnG7YQ5O4PyrsLCAsEDF8UGYtrBYHyLur458OBXcwcAtOYZGKbxNQ0IqRi6ryUTMkTAQlD2ZDfL9At5fPfP6dc3BJEQcH2aRcHmliWNynKS59adjTChZftwyTaAXxJzIR8QZ+CVt4r/xs4HbcghjFCQaxcwNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183455; c=relaxed/simple;
	bh=xE0yM6A77psZsLR6G5jWJtzbeOJz9NLGG0dttBDqrrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dY2a+fMQD2eqs3+zSqrNl+JaFWcw7LSmtIxH9voCjn8WROoj1kY32Qjc/1kuDnE7x1aYEHizX+ozlLoyCox48bKTBoYxs6BsgRakunuV6JNJJu7vS0wfrzo35y0QVdYEAYROhMyYaUe7QkPWI/s9aHz/Ux53WltKCgWLfOrd3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5R4J9RG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30DBC2BCB3;
	Tue, 19 May 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779183454;
	bh=xE0yM6A77psZsLR6G5jWJtzbeOJz9NLGG0dttBDqrrY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A5R4J9RGWZrtC+CDtgo1UQygPvsSfAnVrI4nkqLzvtvP4JC2DNGad4E6ZEZPIu00g
	 WoMia1+XVWrtrha+EDztMWJviWsEhdU2SADjzmxcrlkTceEeI9eO9/Jy+h2JrfREOy
	 2bVYQ+KzW+6hRvgI//WkZcJRKfV2qI2sBJg0Hm41Nmd4GEPbloIfvgHxEPuLXCxrwB
	 jN10QHpucT/rlb4VYaCLZxOkjqUg/nDJJQWL4EabYDuERC12M/4jVAbDhvMnEr1GlO
	 bH2l1mVjI8ZiGm0Am/ZAOHZPb7+ifh4mvXQwsmohCrpCY5UJoTi1kLIqtlig0TmpBQ
	 sLLK5jthnoa1g==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v2 3/4] pinctrl: spacemit: delete spacemit_pctrl_check_power()
Date: Tue, 19 May 2026 10:37:24 +0100
Message-ID: <20260519-absinthe-undercook-95dcc685e90e@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
References: <20260519-germinate-ageless-631033d22797@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=nbzbm22qq7GdIPOZjV8ZHzX0ozzp95ML+4OpjtQggdc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFk8+sHGU3iyJrnkC3+a0tQp5SR4+rtVmljCz+NG0dl9W pxrdN93lLIwiHExyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCLenxn+6T4/LqVoo3Py1bRt n3ayPJ8xUbL81KvNGf0t2ZGqvt4C/owMb9fKyM6R4S85E/Hr3NtZM5XjC7WlvkoJJ+5r3OYwk4m ZAQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37137-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E308A57B8AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Conor Dooley <conor.dooley@microchip.com>

As far as I can tell spacemit_pctrl_check_power(), called during the
custom implementation of dt_node_to_map, is redundant because
the driver's implementation generate_config performs the check too.
Removing this would allow the driver to use the newly added common
function pinctrl_generic_pinmux_dt_node_to_map().

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 37 ---------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index b0be62b1c8161..95c891c4c8fb4 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -409,38 +409,6 @@ static inline u32 spacemit_get_drive_strength_mA(enum spacemit_pin_io_type type,
 	}
 }
 
-static int spacemit_pctrl_check_power(struct pinctrl_dev *pctldev,
-				      struct device_node *dn,
-				      struct spacemit_pin_mux_config *pinmuxs,
-				      int num_pins, const char *grpname)
-{
-	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	struct device *dev = pctrl->dev;
-	enum spacemit_pin_io_type type;
-	u32 power = 0, i;
-
-	of_property_read_u32(dn, "power-source", &power);
-
-	for (i = 0; i < num_pins; i++) {
-		type = spacemit_to_pin_io_type(pinmuxs[i].pin);
-
-		if (type != IO_TYPE_EXTERNAL)
-			continue;
-
-		switch (power) {
-		case PIN_POWER_STATE_1V8:
-		case PIN_POWER_STATE_3V3:
-			break;
-		default:
-			dev_err(dev, "group %s has unsupported power\n",
-				grpname);
-			return -ENOTSUPP;
-		}
-	}
-
-	return 0;
-}
-
 static void spacemit_set_io_pwr_domain(struct spacemit_pinctrl *pctrl,
 				      const struct spacemit_pin *spin,
 				      const enum spacemit_pin_io_type type)
@@ -548,11 +516,6 @@ static int spacemit_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				return dev_err_probe(dev, -ENODEV, "failed to get pin %d\n", pins[i]);
 		}
 
-		ret = spacemit_pctrl_check_power(pctldev, child, pinmuxs,
-						 npins, grpname);
-		if (ret < 0)
-			return ret;
-
 		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
 		map[nmaps].data.mux.function = np->name;
 		map[nmaps].data.mux.group = grpname;
-- 
2.53.0


