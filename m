Return-Path: <linux-gpio+bounces-29243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B6035CA3148
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 10:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87F7730263DD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 09:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A50E3358C6;
	Thu,  4 Dec 2025 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyIjgxzp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87913314D9;
	Thu,  4 Dec 2025 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841773; cv=none; b=Fb8Pw/VHFKiAT5p3ZdBwMQ2SUj6nUPPBt3xZGEexQHmt1VQpvZBFzeucn5rxffwS5QvBZgxSShlByQ5KmKhzyGZASp7ebwUHq1xZt5tWnNnCEa3nXcmbOH7lgtNCgGYsFS74n0ukNWnIsdu+S2+5YMxRdFpdw1eAvFUCuFMcNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841773; c=relaxed/simple;
	bh=jfz7NmAVDFa3CA3dyZSJSNPm6fzOuUjkPwxNFu9012A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=txORfVdvpHpyn8soB3rhNhheMXVJnClSuMAxIaO9tp8+Sw5yS6gaGqRIPLo8ipwNbVEgcFmkG2lQzA6T7ekLdxLLkdhYEtYOvZRl2bqI5OcpJB5DdoG6OnUkni5wengFwvpyZbTRRsZc4GfSipvRAVPboUD9JngpVrZ7Cr/sOeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyIjgxzp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D30CC4CEFB;
	Thu,  4 Dec 2025 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841773;
	bh=jfz7NmAVDFa3CA3dyZSJSNPm6fzOuUjkPwxNFu9012A=;
	h=From:To:Cc:Subject:Date:From;
	b=kyIjgxzpC9317X4UHtl/W7QvnsM/C6tj3aPBufWNs6VZrPCy5D5Ddie4zZJ3DHnxQ
	 B/R2r0yXkG5RlxheHzQIBVOD91GKMIItvrc9oeCI1Z6C7Uz45HRG0P/WOd2Gp4lhGW
	 2QEHO8P8bRzv3ZhzPPim5mq/HY3w2BmJw0+kTdOKSdgY6jWTXB1My7Qzx3qQWCUc3+
	 ielIWgnY6EGRx6j6waj8gNWXMW4USdkU0mXymHiNUnwg7OgZ7P7KrOyKVRTAtZICp9
	 2MH1XQzW4yD7YooLMAwGfkw+mC0xdOi/hjBNTXaNscVZ0IbF2ZJOiaEeJcRTPd2Nts
	 9FeNIy2mo/4Tg==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Michael Walle <mwalle@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: qixis: select CONFIG_REGMAP_MMIO
Date: Thu,  4 Dec 2025 10:48:47 +0100
Message-Id: <20251204094928.1031494-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The regmap drivers need to be selected by each user, without that there
can be configurations that fail to link:

x86_64-linux-ld: drivers/gpio/gpio-qixis-fpga.o: in function `qixis_cpld_gpio_probe':
gpio-qixis-fpga.c:(.text+0x13a): undefined reference to `__devm_regmap_init_mmio_clk'

Fixes: e88500247dc3 ("gpio: add QIXIS FPGA GPIO controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 93ab737c6adb..a1fd130a2408 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1568,6 +1568,7 @@ config GPIO_QIXIS_FPGA
 	tristate "NXP QIXIS FPGA GPIO support"
 	depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
 	select GPIO_REGMAP
+	select REGMAP_MMIO
 	help
 	  This enables support for the GPIOs found in the QIXIS FPGA which is
 	  integrated on some NXP Layerscape boards such as LX2160ARDB and
-- 
2.39.5


