Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39623F7116
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Aug 2021 10:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhHYI0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Aug 2021 04:26:30 -0400
Received: from mx20.baidu.com ([111.202.115.85]:58754 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239005AbhHYI0a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 25 Aug 2021 04:26:30 -0400
Received: from BC-Mail-HQEX01.internal.baidu.com (unknown [172.31.51.57])
        by Forcepoint Email with ESMTPS id 1E71A41DADF01886D878;
        Wed, 25 Aug 2021 16:25:43 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-HQEX01.internal.baidu.com (172.31.51.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 25 Aug 2021 16:25:42 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 25 Aug 2021 16:25:42 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] pinctrl: nomadik: Kconfig: Remove repeated config dependency
Date:   Wed, 25 Aug 2021 16:25:36 +0800
Message-ID: <20210825082536.2547-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

remove it because "if (ARCH_U8500 || ARCH_NOMADIK)" is already used

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/pinctrl/nomadik/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
index d6d849e51c74..0fea167c283f 100644
--- a/drivers/pinctrl/nomadik/Kconfig
+++ b/drivers/pinctrl/nomadik/Kconfig
@@ -22,7 +22,6 @@ if (ARCH_U8500 || ARCH_NOMADIK)
 
 config PINCTRL_NOMADIK
 	bool "Nomadik pin controller driver"
-	depends on ARCH_U8500 || ARCH_NOMADIK
 	depends on OF && GPIOLIB
 	select PINMUX
 	select PINCONF
-- 
2.25.1

