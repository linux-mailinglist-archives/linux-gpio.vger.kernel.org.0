Return-Path: <linux-gpio+bounces-34118-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALxFEsSyw2litgQAu9opvQ
	(envelope-from <linux-gpio+bounces-34118-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:02:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC183229A1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 11:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3191930360CC
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 10:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B37A38D00F;
	Wed, 25 Mar 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Do3onyXU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E33803FA;
	Wed, 25 Mar 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432910; cv=none; b=IENznz/MxSCt4370DIizxRONEFbSGM1yGckmyJDp8yzi5c/02Z1InY7nNlE71frh/3Bc3TWgDUR6wGiK7QU5HDf8iSSivrSkGZyyQVA2rkk4ShjqJ3DYvvuN93LAxjyrn+iDeoA8SaGuka56suMyghD30Oy5Ui+jWieqVUYTBg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432910; c=relaxed/simple;
	bh=Q0y68Sh0drunIWBrbPQGi+mpNZ+3qNgyIEg6q1TJwSs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nj/HgXlqEl5Ds7O843PYllsuk6FrLzpeiu9+OpETCC1++jyhjYOLuZFxSL+cgbglOTfMDVz0/ix1P/t7ZdhqwJbCV/iIEDJak7FHCOw7SBsVIf16ezYos4x2r4HxOy55cadO9IO9i0hXztlcoX0T0C7nf8jSShejicmgxsqUgLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Do3onyXU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778C0C4CEF7;
	Wed, 25 Mar 2026 10:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774432910;
	bh=Q0y68Sh0drunIWBrbPQGi+mpNZ+3qNgyIEg6q1TJwSs=;
	h=From:To:Cc:Subject:Date:From;
	b=Do3onyXUBuQV8Yzx8HEV2pWDywWlNUTdMFucTiA8sKEuTSZvjsuXkZiBhYiQBaNmf
	 Y+iVbspzq7WTgkCMPSfxwxyi7w+7hHkkLLOB9NRbgED2iF9PPm2TNAPqZpTShZ53sF
	 n80ZlTQ/6JXPKKVXoqDZ8H5NPvaGXc0XJ4RPboju1yAO0nOEJLmcn0OigEXJsKfLJd
	 bwHdtB8hgcryXtQkHLLX4dIp1PBRGLb22la0NEWVU+BnEfVZYG3IL7V1b9s8fhDyPb
	 hoSezUtwX0s+IBr73BbBMYs53KjrQxvgNDQo6tgcpCPCM61TncIyZKAlTES5nR+Rbs
	 +3BSYEOXGF5vA==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Yixun Lan <dlan@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] gpio: fix up CONFIG_OF dependencies
Date: Wed, 25 Mar 2026 11:01:14 +0100
Message-Id: <20260325100144.1696731-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34118-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8FC183229A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

A number of GPIO drivers that used to have a CONFIG_OF_GPIO dependency now fail
to build on targets without CONFIG_OF:

WARNING: unmet direct dependencies detected for GPIO_SYSCON
  Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
  Selected by [y]:
  - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && (ARCH_AT91 || COMPILE_TEST [=y])

drivers/gpio/gpio-mt7621.c: In function 'mediatek_gpio_bank_probe':
drivers/gpio/gpio-mt7621.c:254:20: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
  254 |         rg->chip.gc.of_gpio_n_cells = 2;
      |                    ^
drivers/gpio/gpio-tegra186.c: In function 'tegra186_gpio_of_xlate':
drivers/gpio/gpio-tegra186.c:502:25: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
  502 |         if (WARN_ON(chip->of_gpio_n_cells < 2))
      |                         ^~
drivers/gpio/gpio-lpc32xx.c: In function 'lpc32xx_gpio_probe':
drivers/gpio/gpio-lpc32xx.c:523:49: error: 'struct gpio_chip' has no member named 'of_xlate'
  523 |                         lpc32xx_gpiochip[i].chip.of_xlate = lpc32xx_of_xlate;
      |                                                 ^
drivers/gpio/gpio-spacemit-k1.c: In function 'spacemit_gpio_add_bank':
drivers/gpio/gpio-spacemit-k1.c:234:11: error: 'struct gpio_chip' has no member named 'of_gpio_n_cells'
  234 |         gc->of_gpio_n_cells     = 3;
      |           ^~

Bring that back as a dependency.

Fixes: 7803501e5754 ("gpio: drop unneeded Kconfig dependencies on OF_GPIO")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
There may be more fallout from the change, this is just what I found immediately,
but you could already fold the changes into the broken patch while I look
for additional ones.
---
 drivers/gpio/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e1e48e432133..bcb8ce89396c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -236,6 +236,7 @@ config GPIO_BRCMSTB
 	tristate "BRCMSTB GPIO support"
 	default y if (ARCH_BRCMSTB || BMIPS_GENERIC)
 	depends on ARCH_BRCMSTB || ARCH_BCM2835 || BMIPS_GENERIC || COMPILE_TEST
+	depends on OF
 	select GPIO_GENERIC
 	select IRQ_DOMAIN
 	help
@@ -450,6 +451,7 @@ config GPIO_LPC18XX
 config GPIO_LPC32XX
 	tristate "NXP LPC32XX GPIO support"
 	depends on ARCH_LPC32XX || COMPILE_TEST
+	depends on OF
 	help
 	  Select this option to enable GPIO driver for
 	  NXP LPC32XX devices.
@@ -492,6 +494,7 @@ config GPIO_MPC8XXX
 config GPIO_MT7621
 	bool "Mediatek MT7621 GPIO Support"
 	depends on SOC_MT7620 || SOC_MT7621 || COMPILE_TEST
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -632,6 +635,7 @@ config GPIO_RTD
 
 config GPIO_SAMA5D2_PIOBU
 	tristate "SAMA5D2 PIOBU GPIO support"
+	depends on OF
 	depends on MFD_SYSCON
 	depends on ARCH_AT91 || COMPILE_TEST
 	select GPIO_SYSCON
@@ -672,6 +676,7 @@ config GPIO_SNPS_CREG
 config GPIO_SPACEMIT_K1
 	tristate "SPACEMIT K1 GPIO support"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	help
@@ -737,6 +742,7 @@ config GPIO_TEGRA186
 	tristate "NVIDIA Tegra186 GPIO support"
 	default ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC
 	depends on ARCH_TEGRA_186_SOC || ARCH_TEGRA_194_SOC || ARCH_TEGRA_234_SOC || COMPILE_TEST
+	depends on OF
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY
 	help
-- 
2.39.5


