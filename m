Return-Path: <linux-gpio+bounces-5313-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA48A007C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 21:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8910E284DF0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 19:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67B5181312;
	Wed, 10 Apr 2024 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hCZIErzo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F94181307
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776620; cv=none; b=QAGpOP16dTJ0hTD1mvZxZTl+geR46uvp1PMrnWqZS2BjY5Rh/Ac5RgWFQoFLmiT4GH7hya0ERpXejuRIPWnl2NCKqhgQSQpJpiGNEJl9xCLdqFKIekPRQ6Z8SLbc8n0FlXm4iGzEaWCvUD/LXeAJ2zdHzG0tMYCyQxLkH+to/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776620; c=relaxed/simple;
	bh=keq9wFeCWs+V+ZDVEVhxsP6ZcTS1AXGJR1Daym07SGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aIxZQ6x13XlXVwCcgXhdIYk0MNx+2gttxrk82PzKZGahGZox7wEzeBCUsPEANl4rUR44MQKUNjqoNmNAR2f+Vn/vkKcfJwgh8e3V813bF6WPyRapcHS7/pHsy6J94k3NsAVltV+lwepNCttkbcd6EWiZrbWDp3VS8F/DyXKJ/AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hCZIErzo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712776617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEe5xvzdiAwyt39Duy5PUniyqKjdb302ZKuC+52931c=;
	b=hCZIErzo9ymcTq0UIFn6wUIfH45+A7SzAHKCPH5TQZQOeS5zHcpyxNaG20a1n7fWg014CG
	3OkbtjqmbC1g2yQ4H3aZY2qIAcA0HM5bgUF6UQ/vaX4aawcxycQ6myRqhkJYZjrvhp8yyV
	nScwgVwBiPCJm5UlCYiTN3/Rj1ZOXOQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-AGjiTB8rOriLVFSPCNDxzQ-1; Wed, 10 Apr 2024 15:16:52 -0400
X-MC-Unique: AGjiTB8rOriLVFSPCNDxzQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383B71044572;
	Wed, 10 Apr 2024 19:16:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2139744434E;
	Wed, 10 Apr 2024 19:16:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH v3 6/6] mmc: sdhci-acpi: Add quirk to enable pull-up on the card-detect GPIO on Asus T100TA
Date: Wed, 10 Apr 2024 21:16:39 +0200
Message-ID: <20240410191639.526324-7-hdegoede@redhat.com>
In-Reply-To: <20240410191639.526324-1-hdegoede@redhat.com>
References: <20240410191639.526324-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

The card-detect GPIO for the microSD slot on Asus T100TA / T100TAM models
stopped working under Linux after commit 6fd03f024828 ("gpiolib: acpi:
support bias pull disable").

The GPIO in question is connected to a mechanical switch in the slot
which shorts the pin to GND when a card is inserted.

The GPIO pin correctly gets configured with a 20K pull-up by the BIOS,
but there is a bug in the DSDT where the GpioInt for the card-detect is
configured with a PullNone setting:

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

Fixes: 6fd03f024828 ("gpiolib: acpi: support bias pull disable")
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Cc: Nuno Sá <nuno.sa@analog.com>
---
Changes v2:
- Add {} to else if (quirks & DMI_QUIRK_SD_CD_ENABLE_PULL_UP) branch
---
 drivers/mmc/host/sdhci-acpi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index f7d4808413cb..eb8f427f9770 100644
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
@@ -81,6 +82,7 @@ enum {
 	DMI_QUIRK_RESET_SD_SIGNAL_VOLT_ON_SUSP			= BIT(0),
 	DMI_QUIRK_SD_NO_WRITE_PROTECT				= BIT(1),
 	DMI_QUIRK_SD_CD_ACTIVE_HIGH				= BIT(2),
+	DMI_QUIRK_SD_CD_ENABLE_PULL_UP				= BIT(3),
 };
 
 static inline void *sdhci_acpi_priv(struct sdhci_acpi_host *c)
@@ -734,6 +736,14 @@ static const struct dmi_system_id sdhci_acpi_quirks[] = {
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
@@ -908,6 +918,9 @@ static int sdhci_acpi_probe(struct platform_device *pdev)
 				goto err_free;
 			dev_warn(dev, "failed to setup card detect gpio\n");
 			c->use_runtime_pm = false;
+		} else if (quirks & DMI_QUIRK_SD_CD_ENABLE_PULL_UP) {
+			mmc_gpiod_set_cd_config(host->mmc,
+						PIN_CONF_PACKED(PIN_CONFIG_BIAS_PULL_UP, 20000));
 		}
 
 		if (quirks & DMI_QUIRK_RESET_SD_SIGNAL_VOLT_ON_SUSP)
-- 
2.44.0


