Return-Path: <linux-gpio+bounces-37180-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN5bDzZqDWqGxAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37180-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:00:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93810589492
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 10:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25B2230F7947
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF40372B31;
	Wed, 20 May 2026 07:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYbvvDc3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F8288C2F;
	Wed, 20 May 2026 07:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263492; cv=none; b=tXOTPFgRIaCgMZ3OdBG/8dZmZ6R1JDtdXCQ/6S2tqvaBzZgv8bQIaX2wobcASwzhjwL+Ane4ITv8aAT+pkmFnjmanuQkC8JFpzNm7tLaMNA4aM+nJSVmTOEHkk+4nYyJaspnCcdXoPbIWKleQ6J8CnP+QejJQmFBShu82/jdEw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263492; c=relaxed/simple;
	bh=QqZjQUMtvphhIdozodgs3IDhzTkoY3ES0FICL4++UAM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U+VAuRRd0kGy2lSAMnq12f3wWPZAS1Dcrf2R2IzxXVW4tANT5jld1C0/8BECMJK/qoRCUUHin1yvW53ursSWV6rmEVHjvQoJDE0fKqlKhc6dD4IsEuyGGmDQl8DZY6pPG23JiGVS8TuNkhP8nKirP1zhJ4YgbHYisA+fzFutGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYbvvDc3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0F11F000E9;
	Wed, 20 May 2026 07:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263490;
	bh=gjQmv/w5eq+BKgE/daZQXNBNMdpJtU+6pPBR+7Zmt+A=;
	h=From:To:Cc:Subject:Date;
	b=bYbvvDc364xWid1DdcNn0uMDr/d84X79C7yNQ4yvnaQb2l5d5kf10lIfR7gEgdEBk
	 MMK4tGkUNkzhqR0jsZbpgafiNzIB4bcRUVNeE0WXliJmgfItBGn2okHf2Q3Dy/PpO4
	 TwA/othEPlAkgdbW006ZWFuSoSXn3+ZemgMRzNnPbOfozqyii4JXwe4VyMcmHUbnfq
	 RAqyA/S+VY68UH0BqqTLGgCR5DbX/BkqMK/mUuAn8MQn1rLmL34AzTDJ/+lwbJ8DPq
	 X28/oL1cbE5J9SqbUCvUFnwlkXNopB5dJo4LqRjiIKKDGWrTmok3BgxeOfYoDqnkj5
	 8vklzIFyOSyGQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: avoid duplicate function definitions
Date: Wed, 20 May 2026 09:51:14 +0200
Message-Id: <20260520075125.1514312-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,intel.com,gmail.com,linaro.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37180-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arndb.de:email]
X-Rspamd-Queue-Id: 93810589492
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The pinctrl_generic_to_map() and pinctrl_generic_pins_function_dt_node_to_map()
functions are built whenever CONFIG_GENERIC_PINCTRL is enabled, including
configurations without CONFIG_OF.

When CONFIG_OF is disabled, the dummy definitions are also present in the header,
which causes the build to fail:

drivers/pinctrl/pinctrl-generic.c:20:5: error: conflicting types for 'pinctrl_generic_to_map'; have 'int(struct pinctrl_dev *, struct device_node *, struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int *, const char **, unsigned int,  const char **, unsigned int *, unsigned int)'
   20 | int pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
      |     ^~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/pinctrl/pinctrl-generic.c:16:
drivers/pinctrl/pinconf.h:193:1: note: previous definition of 'pinctrl_generic_to_map' with type 'int(struct pinctrl_dev *, struct device_node *, struct device_node *, struct pinctrl_map **, unsigned int *, unsigned int *, const char **, unsigned int,  const char **, unsigned int *, void *)'
  193 | pinctrl_generic_to_map(struct pinctrl_dev *pctldev, struct device_node *parent,
      | ^~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-generic.c:130:5: error: redefinition of 'pinctrl_generic_pins_function_dt_node_to_map'
  130 | int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinconf.h:184:1: note: previous definition of 'pinctrl_generic_pins_function_dt_node_to_map' with type 'int(struct pinctrl_dev *, struct device_node *, struct pinctrl_map **, unsigned int *)'
  184 | pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Removing either set of definitions is sufficient to avoid the problem.

Remove the copy from the header for simplicity.

Fixes: aaaf31be0426 ("pinctrl: extract pinctrl_generic_to_map() from pinctrl_generic_pins_function_dt_node_to_map()")
Fixes: 43722575e5cd ("pinctrl: add generic functions + pins mapper")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/pinconf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index fa8fb0d290d1..60c0e9ac0464 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -167,7 +167,7 @@ pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 }
 #endif
 
-#if defined(CONFIG_GENERIC_PINCTRL) && defined (CONFIG_OF)
+#if defined(CONFIG_GENERIC_PINCTRL)
 int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
 						 struct device_node *np,
 						 struct pinctrl_map **maps,
-- 
2.39.5


