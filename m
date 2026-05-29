Return-Path: <linux-gpio+bounces-37666-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INp7NAtgGWpevwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37666-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 11:44:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3BC60021F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 11:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B59730B1E1F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 09:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961D03C4565;
	Fri, 29 May 2026 09:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V46jvatu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B003BE65C;
	Fri, 29 May 2026 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780047716; cv=none; b=uFXZ1bKU2YCCfyoUQzmYmvY8WHJ8oxL7sSdzxDUKxxMBcocAf1QHN9HW+bT464/P7WY228YbQXh35sItBpPoqMNh+3LQKu55j8lf+tLriJoMy5LwLUN19TNOdF/OroNIlheG/gydtP5ex8HTQC6jiwiubD2XEt7oBzSvD8zQtmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780047716; c=relaxed/simple;
	bh=7GHVraZ3a3dP9NyKaTJuNJ0p0Ir9cdaIwdui00yvYls=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f8dQX/5vPq7RYsIIDc0R3jL+AUkDD022HayQQf7z+x5M1JniLyPnC8GAfelwpYn0Cg2T4iOJB8dgwkQ8NJ/5L19Hsp0An4nbVsOkd6EINXarhnvstHLbr19LgiFm6tw6nPeiatKDV2u/sCsqsMg0eRDSd9Ik4hij4igbMUPdhZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V46jvatu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7D01F00893;
	Fri, 29 May 2026 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780047712;
	bh=Bo34nD4/JJ35MpvXhFaNLlUZZllsnL/xS0yGA4huxz0=;
	h=From:To:Cc:Subject:Date;
	b=V46jvatuenoWMU3dxDQ933HTcJNi292pLAXzLqpxhox9ne6vqPj6Q4eg8exebuEnf
	 HgYyTHWXhiYOcpqh1gLiSdHVpXy4FHE8p1Byk5TfpghHROSaW40CI2F6NsmIQ+ST1B
	 r6HK0MX0CuC7LqkzL1JW444eJf1qzc0zHD5SWOu0T+wveGMCCasaPkAtiej0VVv538
	 QPXH60CwMcp3SGPzicvGcDuNG+29U0pkVbBM/ZOOMhSBULMVUqjAHrNEXleRZC6Z1S
	 s6TicYD3tEV75gET7YblGlbD++fQFtiQY4+kIYrNoRkhmiZ+qGewf3u45l95D7qCz4
	 fN1/O4LkosiHA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prathamesh Shete <pshete@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: tegra238: remove unused entries
Date: Fri, 29 May 2026 11:41:20 +0200
Message-Id: <20260529094143.1872822-1-arnd@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37666-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4C3BC60021F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The -Wunused-const-variable check points out a number of added
entries that are currently not referenced:

drivers/pinctrl/tegra/pinctrl-tegra238.c:1169:27: error: 'soc_gpio86_phh3_pins' defined but not used [-Werror=unused-const-variable=]
 1169 | static const unsigned int soc_gpio86_phh3_pins[] = {
      |                           ^~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/tegra/pinctrl-tegra238.c:1165:27: error: 'uart5_cts_phh2_pins' defined but not used [-Werror=unused-const-variable=]
 1165 | static const unsigned int uart5_cts_phh2_pins[] = {
      |                           ^~~~~~~~~~~~~~~~~~~
drivers/pinctrl/tegra/pinctrl-tegra238.c:1161:27: error: 'uart5_rts_phh1_pins' defined but not used [-Werror=unused-const-variable=]
 1161 | static const unsigned int uart5_rts_phh1_pins[] = {
      |                           ^~~~~~~~~~~~~~~~~~~

Remove them for now, they can just be added back if they get
used in the future.

Fixes: 25cac7292d49 ("pinctrl: tegra: Add Tegra238 pinmux driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/tegra/pinctrl-tegra238.c | 96 ------------------------
 1 file changed, 96 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra238.c b/drivers/pinctrl/tegra/pinctrl-tegra238.c
index 421da334151c..c765b6b880e5 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra238.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra238.c
@@ -1074,102 +1074,6 @@ static const unsigned int pwm7_pee1_pins[] = {
 	TEGRA_PIN_PWM7_PEE1,
 };
 
-static const unsigned int soc_gpio49_pee2_pins[] = {
-	TEGRA_PIN_SOC_GPIO49_PEE2,
-};
-
-static const unsigned int soc_gpio82_pee3_pins[] = {
-	TEGRA_PIN_SOC_GPIO82_PEE3,
-};
-
-static const unsigned int soc_gpio50_pee4_pins[] = {
-	TEGRA_PIN_SOC_GPIO50_PEE4,
-};
-
-static const unsigned int soc_gpio83_pee5_pins[] = {
-	TEGRA_PIN_SOC_GPIO83_PEE5,
-};
-
-static const unsigned int soc_gpio69_pff0_pins[] = {
-	TEGRA_PIN_SOC_GPIO69_PFF0,
-};
-
-static const unsigned int soc_gpio70_pff1_pins[] = {
-	TEGRA_PIN_SOC_GPIO70_PFF1,
-};
-
-static const unsigned int soc_gpio71_pff2_pins[] = {
-	TEGRA_PIN_SOC_GPIO71_PFF2,
-};
-
-static const unsigned int soc_gpio72_pff3_pins[] = {
-	TEGRA_PIN_SOC_GPIO72_PFF3,
-};
-
-static const unsigned int soc_gpio73_pff4_pins[] = {
-	TEGRA_PIN_SOC_GPIO73_PFF4,
-};
-
-static const unsigned int soc_gpio74_pff5_pins[] = {
-	TEGRA_PIN_SOC_GPIO74_PFF5,
-};
-
-static const unsigned int soc_gpio80_pff6_pins[] = {
-	TEGRA_PIN_SOC_GPIO80_PFF6,
-};
-
-static const unsigned int soc_gpio76_pff7_pins[] = {
-	TEGRA_PIN_SOC_GPIO76_PFF7,
-};
-
-static const unsigned int soc_gpio77_pgg0_pins[] = {
-	TEGRA_PIN_SOC_GPIO77_PGG0,
-};
-
-static const unsigned int soc_gpio84_pgg1_pins[] = {
-	TEGRA_PIN_SOC_GPIO84_PGG1,
-};
-
-static const unsigned int uart2_tx_pgg2_pins[] = {
-	TEGRA_PIN_UART2_TX_PGG2,
-};
-
-static const unsigned int uart2_rx_pgg3_pins[] = {
-	TEGRA_PIN_UART2_RX_PGG3,
-};
-
-static const unsigned int uart2_rts_pgg4_pins[] = {
-	TEGRA_PIN_UART2_RTS_PGG4,
-};
-
-static const unsigned int uart2_cts_pgg5_pins[] = {
-	TEGRA_PIN_UART2_CTS_PGG5,
-};
-
-static const unsigned int soc_gpio85_pgg6_pins[] = {
-	TEGRA_PIN_SOC_GPIO85_PGG6,
-};
-
-static const unsigned int uart5_tx_pgg7_pins[] = {
-	TEGRA_PIN_UART5_TX_PGG7,
-};
-
-static const unsigned int uart5_rx_phh0_pins[] = {
-	TEGRA_PIN_UART5_RX_PHH0,
-};
-
-static const unsigned int uart5_rts_phh1_pins[] = {
-	TEGRA_PIN_UART5_RTS_PHH1,
-};
-
-static const unsigned int uart5_cts_phh2_pins[] = {
-	TEGRA_PIN_UART5_CTS_PHH2,
-};
-
-static const unsigned int soc_gpio86_phh3_pins[] = {
-	TEGRA_PIN_SOC_GPIO86_PHH3,
-};
-
 static const unsigned int sdmmc1_comp_pins[] = {
 	TEGRA_PIN_SDMMC1_COMP,
 };
-- 
2.39.5


