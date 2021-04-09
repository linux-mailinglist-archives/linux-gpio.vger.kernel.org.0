Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D833597C9
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 10:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhDIIZl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 04:25:41 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:60083 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhDIIZl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 04:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617956728; x=1649492728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4H3DCv2rJZGlo//cFsdwjkvun9rW0cNQWVYoSvplp70=;
  b=dl22bEKehZUsbN1SdpITMjW0Nv9Z2/7deOrNoRMdr6OxRAqtHK86i+gN
   QOntUUZbp5VyuFzi4fvGnFTQAkwaJmAtR+YIwxtiAvtRLO/jeaD9k4s/7
   P4ol+XWv+anCLXzEsd5rdpyvj4F8t002O8YDcq/NvTN4J7JceGDii+A7l
   1Wptt+/zVhon62IquoXL3ll7g0OaY9CrN7kCW4Xy5/BwyuERscYqGTEWr
   4nm2mO4J4fV7a3O8KyPppoBsheJz4P7G05GY/sdeOrRlLnA3ynydeHMn/
   /gbkVUlb2HiGCn+YUzaWpcg77PCtpYmRUfFOlfH+98Y6aaYYcCFi9bUKj
   A==;
IronPort-SDR: PNfEfxS9qld+x8sKLRIlorTtZz+P54O6boNjGQj/g9ARreK39HF0VOnhDFUCadbKm18EuCqsw6
 mFyiOjTMlzxS7JrLVrKjba3ebGKz7K78TMAkgqYXmTtpEs8ISH97xDIfAc3lGxR/iEe6emT/Jw
 w3stGybC2F82yzGikYl7ie2rEQbj0vejngE8McC+tU+bVL/abx1JiWAGRWMUHRO9zwUNjIeMZ2
 YgwVEBviQ1kWksanIVYdWEx/cFaucWnPo9efK/rFDc2GRVDmQRNTv5+lf8+QyYI6GvlljBa1wC
 1fU=
X-IronPort-AV: E=Sophos;i="5.82,208,1613458800"; 
   d="scan'208";a="110235837"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Apr 2021 01:25:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 9 Apr 2021 01:25:27 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Fri, 9 Apr 2021 01:25:24 -0700
From:   Tudor Ambarus <tudor.ambarus@microchip.com>
To:     <ludovic.desroches@microchip.com>, <linus.walleij@linaro.org>,
        <claudiu.beznea@microchip.com>
CC:     <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] pinctrl: at91-pio4: Fix slew rate disablement
Date:   Fri, 9 Apr 2021 11:25:22 +0300
Message-ID: <20210409082522.625168-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The slew rate was enabled by default for each configuration of the
pin. In case the pin had more than one configuration, even if
we set the slew rate as disabled in the device tree, the next pin
configuration would set again the slew rate enabled by default,
overwriting the slew rate disablement.
Instead of enabling the slew rate by default for each pin configuration,
enable the slew rate by default just once per pin, regardless of the
number of configurations. This way the slew rate disablement will also
work for cases where pins have multiple configurations.

Fixes: 440b144978ba ("pinctrl: at91-pio4: add support for slew-rate")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index a5d328808e4c..4c01d8471ffa 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -801,6 +801,10 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 
 	conf = atmel_pin_config_read(pctldev, pin_id);
 
+	/* Keep slew rate enabled by default. */
+	if (atmel_pioctrl->slew_rate_support)
+		conf |= ATMEL_PIO_SR_MASK;
+
 	for (i = 0; i < num_configs; i++) {
 		unsigned int param = pinconf_to_config_param(configs[i]);
 		unsigned int arg = pinconf_to_config_argument(configs[i]);
@@ -808,10 +812,6 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 		dev_dbg(pctldev->dev, "%s: pin=%u, config=0x%lx\n",
 			__func__, pin_id, configs[i]);
 
-		/* Keep slew rate enabled by default. */
-		if (atmel_pioctrl->slew_rate_support)
-			conf |= ATMEL_PIO_SR_MASK;
-
 		switch (param) {
 		case PIN_CONFIG_BIAS_DISABLE:
 			conf &= (~ATMEL_PIO_PUEN_MASK);
-- 
2.25.1

