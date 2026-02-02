Return-Path: <linux-gpio+bounces-31343-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UVG9L8N2gGmo8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-31343-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 11:04:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 349DECA73A
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 11:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AC52301BCC4
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 09:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33482F3C22;
	Mon,  2 Feb 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exYV/+xR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663282DFF19;
	Mon,  2 Feb 2026 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026293; cv=none; b=Vf863mQeCfn65w9kiSH+ZBUMEq3xarTtTDtU+BUbajRfKMgJ+zBzNN8G+uaK9gYkoDt3WXHDY4k7IS4dsfkOzvkLXFnLm0bpYi5XpFjYUTej0Gv+9ofOJPOd+k2fETesDW12pSFOlei4sd0OQVgru/KmpI0mk+ISFZSOpj+N/LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026293; c=relaxed/simple;
	bh=Cf1ff2+4Hjg82RtQy1tdmXSbTxrMORslHCaWq8LyXWA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kbnLo+wF6dnPG0hnxvNeOwlxplmFNiVqRUnGDQFQ9zhhDm15q3R+p/JT1NyOsivuFDJdOLkCfEvLkSosZogjjFjwI2cpd6JQLgOOc325uFHlAm/bHVKvH95DWEyRtULDY/ONZekuymtIdCGNBAZCR0s05ohXn80IugXuobJ9TOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exYV/+xR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FEEC116C6;
	Mon,  2 Feb 2026 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770026293;
	bh=Cf1ff2+4Hjg82RtQy1tdmXSbTxrMORslHCaWq8LyXWA=;
	h=From:To:Cc:Subject:Date:From;
	b=exYV/+xRPIeDePBGiakm160Lley0bJI3Ex/o7ApnYMAFoqkK5iz5dNqo1Ye8ONlvg
	 1a+KuBGWcM4co+7ki3y1EhvCehJq4dTJ9w8FPIYcqA2pckgf0TvnvUzWOFguDb9uXN
	 rbaxK5prnnUzJwsPEqUebaXn5zXhiPsnfjvsnkhvhgPMTjtiT217t9POx8DjmmZVD4
	 DICtGiImqS/lyC0kPxOl0f7RqxCYjGn406hMFO9N8eZllIfdQl+fgwzst+H3ml3yWe
	 5SciqEEUIFJDcAwG05P/p4Yl9U1F/O0xb+BnAhM1wx6cD/A4XxLJxD3ygrXi01CCYy
	 NGXa//M7dSLAQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: polarfire: restore GENERIC_PINCONF dependency
Date: Mon,  2 Feb 2026 10:58:03 +0100
Message-Id: <20260202095809.1318785-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31343-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: 349DECA73A
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

Changing over to the new CONFIG_GENERIC_PINCTRL dropped the GENERIC_PINCONF
option, causing a build failure:

WARNING: unmet direct dependencies detected for GENERIC_PINCTRL
  Depends on [n]: PINCTRL [=y] && GENERIC_PINCONF [=y] && GENERIC_PINCTRL_GROUPS [=n] && GENERIC_PINMUX_FUNCTIONS [=n]
  Selected by [y]:
  - PINCTRL_POLARFIRE_SOC [=y] && PINCTRL [=y] && (ARCH_MICROCHIP [=y] || COMPILE_TEST [=y]) && OF [=y]
drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c:296:29: error: 'pinctrl_generic_get_group_count' undeclared here (not in a function)
  296 |         .get_groups_count = pinctrl_generic_get_group_count,
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Select both GENERIC_PINCTRL and GENERIC_PINCONF to address this.

Fixes: 488d704ed7b7 ("pinctrl: add polarfire soc mssio pinctrl driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/microchip/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/microchip/Kconfig b/drivers/pinctrl/microchip/Kconfig
index e8bc01946324..a4ae57725fdb 100644
--- a/drivers/pinctrl/microchip/Kconfig
+++ b/drivers/pinctrl/microchip/Kconfig
@@ -12,6 +12,9 @@ config PINCTRL_POLARFIRE_SOC
 	bool "Polarfire SoC pinctrl drivers"
 	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
+	select GENERIC_PINCONF
 	select GENERIC_PINCTRL
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
 	help
 	  This selects the pinctrl drivers for Microchip Polarfire SoC.
-- 
2.39.5


