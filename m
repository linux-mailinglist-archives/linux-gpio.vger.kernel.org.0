Return-Path: <linux-gpio+bounces-31335-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NuXhHwJFfWkaRQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31335-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 00:55:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D1BF742
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jan 2026 00:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 335703008D20
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jan 2026 23:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDDC38B7D5;
	Fri, 30 Jan 2026 23:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCyTg56i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030C41EB9E1
	for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2026 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769817339; cv=none; b=oWM4gy+sr1BslNQgdJzQOyHbez2gOKZX8I5nJmx4URLwaKVhMkLHU2h/nSiuQDnNHkEFLcvcTn4lYyrAKETRytGeh8TG58LPLFZzpUtOkiVPQL7OQy9SNl1J5rlFx4sUIDzbKnRL3ActEamrmWtwUx0JA0bRBo9z4BQLygWisdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769817339; c=relaxed/simple;
	bh=VCXPxzapvFaTFZQUaplrMlj3PO8qJ5UGOPKGFUJE8iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TRdZcr2qYIfny/otZqC+32LBgUB4z/FGZ6LB8iyS7xUieQlTefwzclAuRLQD6mYT+ygcAuJEGRHkDHWUB+5UXc18NOnehY+0tSVHAh2YwpgPN78GIUCy10L7iZo1IyFOttLgI9VbgIg6ftjj9K7mpIyI+FBc7I7rcvnz7vNFifs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCyTg56i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DAEC4CEF7;
	Fri, 30 Jan 2026 23:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769817338;
	bh=VCXPxzapvFaTFZQUaplrMlj3PO8qJ5UGOPKGFUJE8iw=;
	h=From:To:Cc:Subject:Date:From;
	b=TCyTg56ivDgpDB6G9PlnMzQcH5XGNENaW18ORlbM3PHMVnohy2En0RLLkBfO+xXrW
	 FQ1/1JBW8JDQntQz/eCygvyMn4v3SkOXWnJxxMyoyqOCV9jKgSA6jjMQJjg1GeRxxa
	 +L+6BsybjCzKOYFmRhhd2xsNZ/uq2kLeSAVosCHfakNzw3DEXO+0uBCQWn4f6JMVTT
	 OryIInGyoy+fRqtYDPWzoGttgAg5oXdnVFa81YmZRet5e2/0kMhDU8wzfyCAm/chao
	 WukhX3N7XYD6HdzJF5yAYQU1jcVa7n4GpICxkiKgViuw3HGJU+AQwHSFCZGSM2POYf
	 ch7I64RNjSIHA==
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: conor@kernel.org,
	linux-gpio@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: fix kismet issues with GENERIC_PINCTRL
Date: Fri, 30 Jan 2026 23:55:30 +0000
Message-ID: <20260130-stoop-gleeful-29f2c525bd48@spud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ypIBk6eFfnGylwpdxt3IvQu3LdqtgaHvmEADBIgrpqE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm1Lh9fGYXvm/I4dbE8Y/iafKUb3BJr74sJGZ8LV1w8p 0jZPbq7o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABP5tpLhn371KcNt1SGqUZtK byg92ti88dahDxFa8VM+MahNfqAWcInhr6Dd+as3srez//nHpuKTYWevWG2y/f+reW/FVVS5pG5 s4QIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31335-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: AB6D1BF742
X-Rspamd-Action: no action

From: Conor Dooley <conor.dooley@microchip.com>

lkp reported that GENERIC_PINCTRL can be select when its dependencies
are not. Swap the "depends on" out for "select", as is used in other
parts of the pinctrl core that are expected to be selected by drivers.

Fixes: 43722575e5cd ("pinctrl: add generic functions + pins mapper")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601271725.gqlQ8Jl7-lkp@intel.com/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pinctrl/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 6cc5e214f4f3..afecd9407f53 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -27,9 +27,9 @@ config GENERIC_PINCONF
 
 config GENERIC_PINCTRL
 	bool
-	depends on GENERIC_PINCONF
-	depends on GENERIC_PINCTRL_GROUPS
-	depends on GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
 
 config DEBUG_PINCTRL
 	bool "Debug PINCTRL calls"
-- 
2.51.0


