Return-Path: <linux-gpio+bounces-5153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8BA89B3EF
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 22:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FEBC1C209ED
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Apr 2024 20:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68E83D55B;
	Sun,  7 Apr 2024 20:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dVOssdUo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1FF3D993
	for <linux-gpio@vger.kernel.org>; Sun,  7 Apr 2024 20:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712520312; cv=none; b=FHuBMlzmgooM5BL2qdnnRV+exMykkC4dtup//O06o3jSkHmEIYusybmrucoeUrIKOYfKZMBd2mXOsbdal4FhiYt1V1ZBtVad67ZyIkxFW8P8ywr0RoTvneXxkL6BoSmJf9SBZLBafW3q4kLfrcyLg8vROI9xBydtXv+c3crBSLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712520312; c=relaxed/simple;
	bh=OgvWH5rFLRMp9/Lp7+rzSqG9q7V8SUbiEUtnbLeyu+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=he0CP/0a2bv3vBgE9+wI1Ncy9mFfI9gv9QQlCHANXmM9hXgBlBhRUUHeKML9nJ/8aC0gL0I4JFNlv5U3gP9LAw1Y9FSWU7jyeksA7ICB7Q2Mz0QJLP77TucYtgouzmYi2wDEvDnpnEsgSSh5JvNXs4MBsC9yHumImyp1v+dOmSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dVOssdUo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712520310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3et/5FeyB/tFG1WRdy6xpIUU4iRwCxKWl6S6XWDRmVs=;
	b=dVOssdUo7t3ZZ1KUnrK1bUpLQQ/kvLHah5EjGG0/YZM0loYPHDGvJwXWJo+4/kfgvPtFRl
	xjayEoMVC3Zuys2lh1OyJxs1c6X5nJYuiY5LXJG0sXSFiwhtYDDCtQkTcmQjeMdFpbFUSs
	MGUZREqSEiVBTYA+dao3+pTNLhwEA5I=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-481-vwPz7Y89M-CRz7H9CGMZzg-1; Sun,
 07 Apr 2024 16:05:06 -0400
X-MC-Unique: vwPz7Y89M-CRz7H9CGMZzg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B75BC1C031A4;
	Sun,  7 Apr 2024 20:05:05 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 883C4100077A;
	Sun,  7 Apr 2024 20:05:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 6/6] mmc: sdhci-acpi: Add quirk to enable pull-up on the card-detect GPIO on Asus T100TA
Date: Sun,  7 Apr 2024 22:04:53 +0200
Message-ID: <20240407200453.40829-6-hdegoede@redhat.com>
In-Reply-To: <20240407200453.40829-1-hdegoede@redhat.com>
References: <20240407200453.40829-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

The card-detect GPIO for the microSD slot on Asus T100TA / T100TAM models
stopped working under Linux after commit 6fd03f024828 ("gpiolib: acpi:
support bias pull disable").

The GPIO in question is connected to a mechanical switch in the slot
which shorts the pin to GND when a card is inserted.

The GPIO pin correctly gets configured with a 20K pull-up by the BIOS,
but there is a bug in the DSDT where the GpioInt for the card-detect is
configured with a NoPull setting:

                GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x2710,
                    "\\_SB.GPO0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0026
                    }

Linux now actually honors the PullNone setting and disables the 20K pull-up
configured by the BIOS.

Add a new DMI_QUIRK_SD_CD_ENABLE_PULL_UP quirk which when set calls
mmc_gpiod_set_cd_config() to re-enable the pull-up and set this for
the Asus T100TA models to fix this.

Cc: Nuno Sá <nuno.sa@analog.com>
Fixes: 6fd03f024828 ("gpiolib: acpi: support bias pull disable")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mmc/host/sdhci-acpi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index ff45114bf886..2450617e99f0 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -10,6 +10,7 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/ioport.h>
 #include <linux/io.h>
@@ -82,6 +83,7 @@ enum {
 	DMI_QUIRK_SD_NO_WRITE_PROTECT				= BIT(1),
 	DMI_QUIRK_SD_NO_1_8_V					= BIT(2),
 	DMI_QUIRK_SD_CD_ACTIVE_HIGH				= BIT(3),
+	DMI_QUIRK_SD_CD_ENABLE_PULL_UP				= BIT(4),
 };
 
 static inline void *sdhci_acpi_priv(struct sdhci_acpi_host *c)
@@ -735,6 +737,14 @@ static const struct dmi_system_id sdhci_acpi_quirks[] = {
 		},
 		.driver_data = (void *)DMI_QUIRK_SD_NO_WRITE_PROTECT,
 	},
+	{
+		/* Asus T100TA, needs pull-up for cd but DSDT GpioInt has NoPull set */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "T100TA"),
+		},
+		.driver_data = (void *)DMI_QUIRK_SD_CD_ENABLE_PULL_UP,
+	},
 	{
 		/*
 		 * The Lenovo Miix 320-10ICR has a bug in the _PS0 method of
@@ -928,7 +938,9 @@ static int sdhci_acpi_probe(struct platform_device *pdev)
 				goto err_free;
 			dev_warn(dev, "failed to setup card detect gpio\n");
 			c->use_runtime_pm = false;
-		}
+		} else if (quirks & DMI_QUIRK_SD_CD_ENABLE_PULL_UP)
+			mmc_gpiod_set_cd_config(host->mmc,
+						PIN_CONF_PACKED(PIN_CONFIG_BIAS_PULL_UP, 20000));
 
 		if (quirks & DMI_QUIRK_RESET_SD_SIGNAL_VOLT_ON_SUSP)
 			c->reset_signal_volt_on_suspend = true;
-- 
2.44.0


