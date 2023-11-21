Return-Path: <linux-gpio+bounces-312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC467F286B
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 10:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BB101C2113E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 09:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBC214ABA;
	Tue, 21 Nov 2023 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB64B18E;
	Tue, 21 Nov 2023 01:11:27 -0800 (PST)
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AL9BMr041506565, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AL9BMr041506565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Nov 2023 17:11:22 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 21 Nov 2023 17:11:23 +0800
Received: from RTEXH36506.realtek.com.tw (172.21.6.27) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 21 Nov 2023 17:11:22 +0800
Received: from localhost.localdomain (172.21.252.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 21 Nov 2023 17:11:22 +0800
From: Tzuyi Chang <tychang@realtek.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Dan Carpenter <dan.carpenter@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tzuyi Chang <tychang@realtek.com>
Subject: [PATCH] pinctrl: realtek: Fix logical error when finding descriptor
Date: Tue, 21 Nov 2023 17:11:07 +0800
Message-ID: <20231121091107.5564-1-tychang@realtek.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-KSE-ServerInfo: RTEXMBS05.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

The pin descriptor should be returned if the name has been found in the
descriptor table. Remove the negation in the if statement for accurate
retrieval.

Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Realtek DHC RTD SoCs")
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 9c7a1af4ba69..208896593b61 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -146,7 +146,7 @@ static int rtd_pinctrl_get_function_groups(struct pinctrl_dev *pcdev,
 
 static const struct rtd_pin_desc *rtd_pinctrl_find_mux(struct rtd_pinctrl *data, unsigned int pin)
 {
-	if (!data->info->muxes[pin].name)
+	if (data->info->muxes[pin].name)
 		return &data->info->muxes[pin];
 
 	return NULL;
@@ -249,7 +249,7 @@ static const struct pinctrl_pin_desc
 static const struct rtd_pin_config_desc
 	*rtd_pinctrl_find_config(struct rtd_pinctrl *data, unsigned int pin)
 {
-	if (!data->info->configs[pin].name)
+	if (data->info->configs[pin].name)
 		return &data->info->configs[pin];
 
 	return NULL;
-- 
2.42.0


