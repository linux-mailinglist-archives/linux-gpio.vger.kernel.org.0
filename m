Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E08A37ED27
	for <lists+linux-gpio@lfdr.de>; Thu, 13 May 2021 00:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbhELUN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 16:13:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352705AbhELSEF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 May 2021 14:04:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24A2F6143C;
        Wed, 12 May 2021 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620842577;
        bh=UjQUOpWqT3OOhOM23CXJxNmF8TRm8vywivc9vcIMoks=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F7NKzZfCG+eBRQ7DKoQMD25wS4MNBGxpY8xnGjBU0sswwD5aQ3g5XiF/UTrOF8TJy
         xntwvWrYAyD+YQR2ldIo8KA86awVlxUhGV/BFiZlWvJO/UYGrNDsrlfeoQw/x/Bm7t
         ZOV+P5h+bD8S7jjNBbZkcDM3zmeQ6FOVOUwB6WW4FLzPCwCgExoaxEJSzkR+INAcLj
         Bwpp1SVzHEkvLsRhbTzRcRadtCk2aJ8UM00BEHD0MF1vAoh1KJfJS+lIqHLGGi2HfK
         9RfjGg9Rq5xcG88TFMeDl1apaOpB6ddss63ffEbfBt2PyLh7HKxeue9XgtLzd9D2rD
         Tl7DHRBPHPgSg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 30/35] gpiolib: acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055
Date:   Wed, 12 May 2021 14:02:00 -0400
Message-Id: <20210512180206.664536-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180206.664536-1-sashal@kernel.org>
References: <20210512180206.664536-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit da91ece226729c76f60708efc275ebd4716ad089 ]

Like some other Bay and Cherry Trail SoC based devices the Dell Venue
10 Pro 5055 has an embedded-controller which uses ACPI GPIO events to
report events instead of using the standard ACPI EC interface for this.

The EC interrupt is only used to report battery-level changes and
it keeps doing this while the system is suspended, causing the system
to not stay suspended.

Add an ignore-wake quirk for the GPIO pin used by the EC to fix the
spurious wakeups from suspend.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpiolib-acpi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 1aacd2a5a1fd..174839f3772f 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1438,6 +1438,20 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.no_edge_events_on_boot = true,
 		},
 	},
+	{
+		/*
+		 * The Dell Venue 10 Pro 5055, with Bay Trail SoC + TI PMIC uses an
+		 * external embedded-controller connected via I2C + an ACPI GPIO
+		 * event handler on INT33FFC:02 pin 12, causing spurious wakeups.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Venue 10 Pro 5055"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_wake = "INT33FC:02@12",
+		},
+	},
 	{
 		/*
 		 * HP X2 10 models with Cherry Trail SoC + TI PMIC use an
-- 
2.30.2

