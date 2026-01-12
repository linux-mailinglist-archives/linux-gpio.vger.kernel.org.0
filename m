Return-Path: <linux-gpio+bounces-30459-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A319D13EC3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 17:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A9EC302CBAB
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 16:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8810F3644C2;
	Mon, 12 Jan 2026 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WH5GfX31"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490CF36402C;
	Mon, 12 Jan 2026 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234500; cv=none; b=otel6CDiZQo8Pqnd7QQaZ6dW14VreizQlVqdQ3IyiSh8BKxOb83vw0nojks+DAiEvhlfPPYEqWrBlzO5/k0En1HlSCxgFFMclHEPuaTR+WDQEcsWJ9T3Yi97KoE5O1IU5Fxgrhmsy7J2iDTXo8dpy0ML51uGPjbKa+j0g4suBbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234500; c=relaxed/simple;
	bh=XAsw1Ng2RkdR08+1vG5HA7UnfGA93dXPoZepz7fgmwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=s9yumfQFe58ooWQqJY4vJ9AFh10QmJODG6mw2KDuRPuqxLiXay7ZtAnNhw9HWg1/2BEAtrkmiJCbkwHjwYmEBqB7QvOFeZFtSXRrV7/9J5+/BfQCy+JcijMO1msm7LyIEoiAjNTaxTRPxdvCBzqcU4Bz8nco1dk7lSgdYkXFCEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WH5GfX31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDC2C16AAE;
	Mon, 12 Jan 2026 16:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768234500;
	bh=XAsw1Ng2RkdR08+1vG5HA7UnfGA93dXPoZepz7fgmwo=;
	h=From:Date:Subject:To:Cc:From;
	b=WH5GfX31E+XGmUgjVXBkGW5hgwJ1AQaJFjz1h7eMhxvQDvG9kHP4FRPwN3Xz0Z+Vv
	 4weQI/KdtEKwzOoZKBAiWvBV+E09EQU2z4/zwcKA2h346Ie5WsgGWTr1oAD4oBN8vt
	 1APqxyAF2m5UroYVeL5ei/ti1mml1P5KHD5ZV0ugVF8vY9S7ZlfGN++nzqbwAQ02Ou
	 O/x/POUuA7ad0XLTzP9dB1y/mr3d05kEXPCAbMOz2lcnfq9EOaBrq/ZM0NgxTpzzwS
	 H2x19ArAlcalN9CqLQ05lXg/iuaZn/AKcV2Wct7PPHj1PWslSI0xEhwNHnw2zw60F8
	 bbmqv6+SsbI/w==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Jan 2026 17:14:52 +0100
Subject: [PATCH v11] mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-mfd-tn48m-v11-1-00c798d8cd2a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDA11FJSSM
 xLz0lN1M1OAAkpGBkZmBoaGRrq5aSm6JXkmFrm6lhYWSSZJqUaWKcmWSkD1BUWpaZkVYMOiY2t
 rAYzV/Y9cAAAA
X-Change-ID: 20260112-mfd-tn48m-988b4be29dc9
To: Lee Jones <lee@kernel.org>, Robert Marko <robimarko@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Robert Marko <robert.marko@sartura.hr>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

From: Robert Marko <robert.marko@sartura.hr>

Delta TN48M switches have a Lattice CPLD that serves
multiple purposes including being a GPIO expander.

So, lets use the simple I2C MFD driver to provide the MFD core.

Also add a virtual symbol which pulls in the simple-mfd-i2c driver and
provide a common symbol on which the subdevice drivers can depend on.

Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Link: https://lore.kernel.org/20220131133049.77780-2-robert.marko@sartura.hr
Link: https://lore.kernel.org/linux-gpio/20260112064950.3837737-1-rdunlap@infradead.org/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
This fell off the planet after the v5.18 merge window,
and now the subdrivers are facing deletion because the
main symbols for the driver are not there. (See Link:
tags.)

The driver has users, so here is the patch, rebased on
v6.19-rc1.

I dropped Lee's Acked-for-MFD tag because Lee will be
re-evaluating and eventually merging the patch anyway.
---
 drivers/mfd/Kconfig          | 11 +++++++++++
 drivers/mfd/simple-mfd-i2c.c |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index aace5766b38a..f7f12a0428aa 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -407,6 +407,17 @@ config MFD_CS47L92
 	help
 	  Support for Cirrus Logic CS42L92, CS47L92 and CS47L93 Smart Codecs
 
+config MFD_TN48M_CPLD
+	tristate "Delta Networks TN48M switch CPLD driver"
+	depends on I2C
+	depends on ARCH_MVEBU || COMPILE_TEST
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  Select this option to enable support for Delta Networks TN48M switch
+	  CPLD. It consists of reset and GPIO drivers. CPLD provides GPIOS-s
+	  for the SFP slots as well as power supply related information.
+	  SFP support depends on the GPIO driver being selected.
+
 config PMIC_DA903X
 	bool "Dialog Semiconductor DA9030/DA9034 PMIC Support"
 	depends on I2C=y
diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 8b751d8e3b5a..7315fad618e4 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -116,6 +116,7 @@ static const struct simple_mfd_data spacemit_p1 = {
 };
 
 static const struct of_device_id simple_mfd_i2c_of_match[] = {
+	{ .compatible = "delta,tn48m-cpld" },
 	{ .compatible = "fsl,ls1028aqds-fpga" },
 	{ .compatible = "fsl,lx2160aqds-fpga" },
 	{ .compatible = "fsl,lx2160ardb-fpga" },

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260112-mfd-tn48m-988b4be29dc9

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


