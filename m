Return-Path: <linux-gpio+bounces-26740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 363FFBB1CCF
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 23:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4CB2188A6B9
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 21:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDB130F931;
	Wed,  1 Oct 2025 21:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IY+Xe6w4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8603C2F
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 21:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759353860; cv=none; b=Tt2huTybdJ632IcfnkjBO7e2lk8MMyx0537n+HQ9bDK3rF8OL5dObc0t43maF5s+stlcGjApYopoviDIFCaRxqbB7NlN3LDI9Ecn6yOPLE2QP/Zlrd/Hvuzo5DQiNdWlPZ1FheCxzN9uShgZ8wiLKETgzXpXHTbXli3Pyt+L7B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759353860; c=relaxed/simple;
	bh=ZUQmR0SCd+wmmQnk+QcuqcdYswPEexzHIxvTJFyoleY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHLvuvcZ3qHRMeXbIEb97HwTbprasuBOXVLTXB6S6DlcYdjKodB0yLVp+sAUE/kKQ/awz8XNAWkmgqJnbZ3sYfR52WQTshl486VsXPNJ3odM4JfFXbshigUFc9R1IbipDze2MlZDDrIlNzc5a0iMn86PxEtc0Vu/g8ciUslkR68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IY+Xe6w4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E786C4CEF1;
	Wed,  1 Oct 2025 21:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759353859;
	bh=ZUQmR0SCd+wmmQnk+QcuqcdYswPEexzHIxvTJFyoleY=;
	h=From:To:Cc:Subject:Date:From;
	b=IY+Xe6w42ZA/0MZFwf6uJoJUP3wXXl5FZpH0vjP6qIrMUmXdk/uMrpUdJZe1hvnug
	 7hjzfXwsmX8cWBQrO4k1OppOL87UkshvpUEFjI5lyrEaFapvt1trcCM1Shz3jBJuP9
	 HoBb/9ym8aesle14dCJJWwh+DeHCyTXU82vYLz82hslBUXnwq2ZokWE9Y88mxXA7IU
	 y2hC0fRAUKCF9f//qvSbe3NWZ+spqw21C5A9q5dArWMfuzbQk94ekmf2JD3PM9/6Zs
	 xpJe04XqP9v4mZVLpSExSfx80IKE0m/PQZU1Bph8rG+Pq7vOND5Vif5RzNCfJi01cS
	 ANHGCIOZTQn+w==
From: Hans de Goede <hansg@kernel.org>
To: Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: usbio: Add ACPI device-id for MTL-CVF devices
Date: Wed,  1 Oct 2025 23:24:16 +0200
Message-ID: <20251001212416.4871-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "INTC10D1" ACPI device-id for MTL-CVF devices, like the Dell Latitude
7450.

Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2368506
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Note this applies on top of the addition of the new gpio-usbio driver which
is being merged through gregkh/usb.git usb-next
---
 drivers/gpio/gpio-usbio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
index e13c120824e3..34d42c743d5b 100644
--- a/drivers/gpio/gpio-usbio.c
+++ b/drivers/gpio/gpio-usbio.c
@@ -29,6 +29,7 @@ static const struct acpi_device_id usbio_gpio_acpi_hids[] = {
 	{ "INTC1007" }, /* MTL */
 	{ "INTC10B2" }, /* ARL */
 	{ "INTC10B5" }, /* LNL */
+	{ "INTC10D1" }, /* MTL-CVF */
 	{ "INTC10E2" }, /* PTL */
 	{ }
 };
-- 
2.51.0


