Return-Path: <linux-gpio+bounces-33225-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEFrCfh3smm8MwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33225-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:23:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBAE26EDBD
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81D4030F1AD5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5731D28D8DA;
	Thu, 12 Mar 2026 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzWKz0Yd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182931A5B9E;
	Thu, 12 Mar 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303490; cv=none; b=bpyb4k0DGJk50OT6CoO0A0YzPZV1F73SB+y7hlTHahpghYG1Tcz0JXTTKG/Fc4ANuq917uw4gtxwn877jRBumZgc5JnjD7dzaIFqa0QDmGjYDlvboVt0j1WhiYVFeiHCKNA3eGczovuFp8SpVlCeaaatz50ysaoPIUL+xiAys0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303490; c=relaxed/simple;
	bh=O3Fh3S67E/vPFHLA+on14WMadPVsMRifIoX7seogsM4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bDsDUiFDtiRayfj2Zq4Qf4M4alnJlKOUshnuNwHPcBfNP116y/ei8YvvkNhQBxEElw+yngj2IWSO3WkJn31oQdtQP//6K7OjzR4VmTH0KAzZ/qf9qDG/fLZ6lgyVvKAFnsH9QtRArE5SHeALSxW2rF0TEWqhSO15glk6qVwXPIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzWKz0Yd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21461C4CEF7;
	Thu, 12 Mar 2026 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773303489;
	bh=O3Fh3S67E/vPFHLA+on14WMadPVsMRifIoX7seogsM4=;
	h=From:To:Cc:Subject:Date:From;
	b=jzWKz0YdtZiW8INeOnsuZAaxEfWKsVBxthoPjqpHKJVja2sb4U8xxrKT01cg+4c83
	 pPBJLuw1IT4eKZG7VgPQh/cvJfs8Imco9cTqDGsYt/6iSP04gPWcb4bJsVxrOobf+v
	 Fun6JMEMZNO8dz68GNygAMoZrJRvfgAdxMfwBkNlOeN4SZz3jcUHt0kjXmZJUZ849q
	 wgWs6GrVNBo0U4w61JSD2y45k4MBD+4EfNOPYqmc1JxlTvPVWRVcUSLZGfZ5snx420
	 XkMA39x1Kq73ePpdKry+UTJfwJNYy/zL5WK+uWJTxC7XAoxsPJqjdlwtUxw4o0Tzda
	 GZV3v9z3lQc7g==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: stmfx: fix mfd dependency
Date: Thu, 12 Mar 2026 09:17:44 +0100
Message-Id: <20260312081805.3020612-1-arnd@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33225-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FBAE26EDBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The PINCTRL_STMFX driver attempts to force-enable its MFD parent
driver, which is really the wrong way around compared to general
conventions. After the OF_GPIO dependency got dropped, this leads
to a harmless but annoying build warning:

WARNING: unmet direct dependencies detected for MFD_STMFX
  Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
  Selected by [m]:
  - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

Change the 'select' into a dependency instead. As this changes the
defconfig behavior, also change the generic arm defconfig file to enable
the other symbol instead.

Fixes: e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 03f2e3ee065f..51a2ddad2a48 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -550,9 +550,10 @@ config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
 	depends on HAS_IOMEM
+	depends on MFD_STMFX
+	default MFD_STMFX
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
-	select MFD_STMFX
 	help
 	  Driver for STMicroelectronics Multi-Function eXpander (STMFX)
 	  GPIO expander.
-- 
2.39.5


