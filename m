Return-Path: <linux-gpio+bounces-195-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09B7EDF54
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 12:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DADB0280DF5
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 11:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012D72DF9A;
	Thu, 16 Nov 2023 11:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8075DA8;
	Thu, 16 Nov 2023 03:15:00 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AGBElcS62392432, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AGBElcS62392432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Nov 2023 19:14:47 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 16 Nov 2023 19:14:47 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 16 Nov 2023 19:14:47 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Thu, 16 Nov 2023 19:14:47 +0800
From: Tzuyi Chang <tychang@realtek.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, TY Chang <tychang@realtek.com>
Subject: [PATCH v2 0/2] Add gpio driver support for Realtek DHC SoCs
Date: Thu, 16 Nov 2023 19:14:38 +0800
Message-ID: <20231116111441.2339-1-tychang@realtek.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXDAG01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

These patches add the bindings and the gpio driver for Realtek
DHC(Digital Home Center) RTD SoCs, including RTD1295, RTD1395,
RTD1619, RTD1319, RTD1619B, RTD1319D and RTD1315E.

Change log:
v1->v2:
1. Add description for DHC RTD SoCs in the bindings.
2. Revise the compatible names in the bindings.
3. Transitioned from OF API to platform_device API.
4. Use u8 for the offset array within the rtd_gpio_info structure.
5. Record the size of each array within the rtd_gpio_info structure and
   implement checks to prevent out-of-bounds access.
6. Use GPIOLIB_IRQCHIP helpers to register interrupts.
7. Use dynamic allocation for GPIO base.

Tzuyi Chang (2):
  dt-bindings: gpio: realtek: Add realtek,rtd-gpio
  Add GPIO support for Realtek DHC(Digital Home Center) RTD SoCs.

 .../bindings/gpio/realtek,rtd-gpio.yaml       |  74 ++
 drivers/gpio/Kconfig                          |   9 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rtd.c                       | 736 ++++++++++++++++++
 4 files changed, 820 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd-gpio.yaml
 create mode 100644 drivers/gpio/gpio-rtd.c

-- 
2.42.0


