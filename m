Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA891B8967
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2020 22:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgDYUix (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Apr 2020 16:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgDYUix (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Apr 2020 16:38:53 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA99C09B04D;
        Sat, 25 Apr 2020 13:38:51 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id f8so10603098lfe.12;
        Sat, 25 Apr 2020 13:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IUZuK6LrVH3Ngu6B46nOOKkYisDzi/1XwA762HMgff0=;
        b=V2ezzqMUTDBZh9cXerwSV1N/6v6QpdkeM22Ea5I5UDtoo4CEea7X1Hxo0Fr7RCD1gC
         0hf45J6VrCrwHYTU+ESNXFHgS31f846moyZ9GTFiK0NGVuzGUrzpdpLIMr2ADOVkSfS7
         grx+gvWBqigYqt2TPdGg9I1apOQyptpwoLfFCWG1fQqBcVxdxrGhVvjulw0hEQFS9SIf
         VtGFTVO7gPIayq2OQnFWoNFYKRwHnMn39pU2Detvrh772ORrbs3SxS0XuXl7gZ5r+DXH
         5uLQK17roLW7wg0EA2FLBGbxOM+9qIcp0ge+F9aHD0MaoB3hkgduCXijXfmvBzVNqVX0
         QFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IUZuK6LrVH3Ngu6B46nOOKkYisDzi/1XwA762HMgff0=;
        b=h84Fc4r6Kcx+XJaNgRnpGAMfTPa27PXoSDglSgkvCn95aKH69eGC7yefFq6+yy73Lr
         7v5o7prlUWW0hNPvQ5t0aWAgr2rHwaf1n/0k12+us4rfcdrs8r3wnpurSGpRR5qv9ENX
         Fokbc3LB+zI3RCjIqkijvU81I+OYAUf7hpnnkT3b9/51ASfDfh20U+o3sf7m72lYHaX1
         d5Z7kBVQ9ntqd4cBStx6Nvlf1vGM3vgg2su/YJieI62cm1///rSLzHi5VAahRZ1X7CDx
         RpivgsQPc6NMdwUtxLvciLVvW+XuAqu00bMQSOmWIvQkPqThd7gn2wCvPFssS/sAVsPn
         TfEg==
X-Gm-Message-State: AGi0PuaVEMXMqdShL4XpUp3fl8Q6MsrS8yHBhXHhG4Xo1a2AcONwavtw
        7ARA7Hm654rBiaNyFQlZY4E926c+vkg=
X-Google-Smtp-Source: APiQypKWMYnecAtML7dO7IHXnSDWqvdkhR4jlNMbXyQK3Bxsqk9YJiG92B98HoHamKEkCbQYfzDUcQ==
X-Received: by 2002:a19:ee06:: with SMTP id g6mr10588140lfb.90.1587847129476;
        Sat, 25 Apr 2020 13:38:49 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-165.NA.cust.bahnhof.se. [82.196.111.165])
        by smtp.gmail.com with ESMTPSA id l7sm7981806lfg.79.2020.04.25.13.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 13:38:48 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, nishkadg.linux@gmail.com,
        matti.vaittinen@fi.rohmeurope.com, chenjh@rock-chips.com,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] pinctrl: rk805: Constify rk805_gpio_cfgs
Date:   Sat, 25 Apr 2020 22:38:13 +0200
Message-Id: <20200425203813.6442-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mark pin_cfg as const, allowing the compiler to put the struct in
.rodata instead of .data.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/pinctrl/pinctrl-rk805.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index cccbe072274e..c6f4229eb106 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -73,7 +73,7 @@ struct rk805_pctrl_info {
 	int num_pin_groups;
 	const struct pinctrl_pin_desc *pins;
 	unsigned int num_pins;
-	struct rk805_pin_config *pin_cfg;
+	const struct rk805_pin_config *pin_cfg;
 };
 
 enum rk805_pinmux_option {
@@ -121,7 +121,7 @@ static const struct rk805_pin_group rk805_pin_groups[] = {
 #define RK805_GPIO0_VAL_MSK	BIT(0)
 #define RK805_GPIO1_VAL_MSK	BIT(1)
 
-static struct rk805_pin_config rk805_gpio_cfgs[] = {
+static const struct rk805_pin_config rk805_gpio_cfgs[] = {
 	{
 		.reg = RK805_OUT_REG,
 		.val_msk = RK805_GPIO0_VAL_MSK,
-- 
2.26.2

