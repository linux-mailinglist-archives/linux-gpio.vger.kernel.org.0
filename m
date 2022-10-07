Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB025F7A60
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 17:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbiJGPQe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 11:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbiJGPQd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 11:16:33 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11097102505;
        Fri,  7 Oct 2022 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665155792; x=1696691792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uyj8DqFhpbM1/wLSJMXIY+gM5nzJCIoJpElW6X9DZRA=;
  b=J1d0hVHtiR5nWLN3lrGXN2jjLCb3SUFmJBqX3hh/QXy960C9Ve3aOFSb
   h1lvmP6j5tuLNxD7kmAgyTgkVfZcU7upUFtGU8ZL+Jo7PeZW7pMfcAowD
   LjduTrADzAmq4Xe+ukdVK4CWb7XzczgR+Iknswm6LK3+/9Dypd0j1aXVi
   Z9UpWwscKhADAZudOVK75vtCxKID3Yk25Ol+Cxwz6lQCexH15nXhLBKqJ
   XXkp0sIYLlKX3AwzDfaRESb4v6vK2VZPh4q33gQBn/mTNr+pDUXPxZodm
   t6Gl6KGImimjt4tHpMwRwZDVxis1H/cBSakrsf2XMhYCu7mOtiIQLMPkK
   g==;
X-IronPort-AV: E=Sophos;i="5.95,167,1661842800"; 
   d="scan'208";a="194275955"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2022 08:16:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 7 Oct 2022 08:16:23 -0700
Received: from ryan-Precision-5560.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 7 Oct 2022 08:16:23 -0700
From:   <Ryan.Wanner@microchip.com>
To:     <ludovic.desroches@microchip.com>, <linus.walleij@linaro.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@microchip.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 2/2] pinctrl: at91-pio4: Add persist state case in config
Date:   Fri, 7 Oct 2022 08:16:47 -0700
Message-ID: <20221007151647.98222-3-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007151647.98222-1-Ryan.Wanner@microchip.com>
References: <20221007151647.98222-1-Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Adding persist state case to atmel_conf_pin_config_group_set() function.
After adding configuration support for userspace gpiod api, there was an
extra flag PIN_CONFIG_PERSIST_STATE that was not passed in before.

Based on other drivers like TI drivers, added a switch case and return
ENOTSUPP in that case.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 13b77f1eb6e2..40f1b9397767 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -780,6 +780,8 @@ static int atmel_conf_pin_config_group_get(struct pinctrl_dev *pctldev,
 			return -EINVAL;
 		arg = (res & ATMEL_PIO_DRVSTR_MASK) >> ATMEL_PIO_DRVSTR_OFFSET;
 		break;
+	case PIN_CONFIG_PERSIST_STATE:
+		return -ENOTSUPP;
 	default:
 		return -ENOTSUPP;
 	}
@@ -888,6 +890,8 @@ static int atmel_conf_pin_config_group_set(struct pinctrl_dev *pctldev,
 				dev_warn(pctldev->dev, "drive strength not updated (incorrect value)\n");
 			}
 			break;
+		case PIN_CONFIG_PERSIST_STATE:
+			return -ENOTSUPP;
 		default:
 			dev_warn(pctldev->dev,
 				 "unsupported configuration parameter: %u\n",
-- 
2.34.1

