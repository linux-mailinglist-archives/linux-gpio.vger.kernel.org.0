Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92EF1290D0A
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Oct 2020 23:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409923AbgJPVAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Oct 2020 17:00:39 -0400
Received: from mxwww.masterlogin.de ([95.129.51.170]:58698 "EHLO
        mxwww.masterlogin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390931AbgJPVAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2020 17:00:38 -0400
Received: from mxout2.routing.net (unknown [192.168.10.82])
        by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 813742C460;
        Fri, 16 Oct 2020 20:40:47 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
        by mxout2.routing.net (Postfix) with ESMTP id 6AA0A5FA21;
        Fri, 16 Oct 2020 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
        s=20200217; t=1602880843;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Nq64YXij9tzn9ukxd1xli05D6EoZxP+TcI13tNDVaEk=;
        b=S4GwSQZHgZGnhYpsYIzMW4OWVfWIXiRYfXE3/EJ7LvcWBT9QJdacMxLESXBtbTyZ2UFbSC
        12BFYNZT2/v5bBlHIxIlkJ33lByNC2L4rF9LMPY6f6ZdgQOrM/NRq1UDrd0SnOKKIDtS8l
        jJjqIUwNFwBnq5OV+2Msr0pTcT/OKOk=
Received: from localhost.localdomain (fttx-pool-80.208.213.194.bambit.de [80.208.213.194])
        by mxbox3.masterlogin.de (Postfix) with ESMTPSA id CDF5836023B;
        Fri, 16 Oct 2020 20:40:42 +0000 (UTC)
From:   Frank Wunderlich <linux@fw-web.de>
To:     linux-mediatek@lists.infradead.org
Cc:     Frank Wunderlich <frank-w@public-files.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [RFC 3/3] pinctl: mt7622: drop pwm ch7 as mt7622 only has 6 channels
Date:   Fri, 16 Oct 2020 22:40:19 +0200
Message-Id: <20201016204019.2606-4-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016204019.2606-1-linux@fw-web.de>
References: <20201016204019.2606-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Frank Wunderlich <frank-w@public-files.de>

mt7622 is reported by mediatek to have only 6 pwm channels
so drop pindefines for 7th channel

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/pinctrl/mediatek/pinctrl-mt7622.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index ce4a8a0cc19c..260ffadd24e4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -439,12 +439,6 @@ static int mt7622_pwm_ch6_2_pins[] = { 81, };
 static int mt7622_pwm_ch6_2_funcs[] = { 4, };
 static int mt7622_pwm_ch6_3_pins[] = { 100, };
 static int mt7622_pwm_ch6_3_funcs[] = { 0, };
-static int mt7622_pwm_ch7_0_pins[] = { 70, };
-static int mt7622_pwm_ch7_0_funcs[] = { 3, };
-static int mt7622_pwm_ch7_1_pins[] = { 82, };
-static int mt7622_pwm_ch7_1_funcs[] = { 4, };
-static int mt7622_pwm_ch7_2_pins[] = { 101, };
-static int mt7622_pwm_ch7_2_funcs[] = { 0, };
 
 /* SD */
 static int mt7622_sd_0_pins[] = { 16, 17, 18, 19, 20, 21, };
@@ -611,9 +605,6 @@ static const struct group_desc mt7622_groups[] = {
 	PINCTRL_PIN_GROUP("pwm_ch6_1", mt7622_pwm_ch6_1),
 	PINCTRL_PIN_GROUP("pwm_ch6_2", mt7622_pwm_ch6_2),
 	PINCTRL_PIN_GROUP("pwm_ch6_3", mt7622_pwm_ch6_3),
-	PINCTRL_PIN_GROUP("pwm_ch7_0", mt7622_pwm_ch7_0),
-	PINCTRL_PIN_GROUP("pwm_ch7_1", mt7622_pwm_ch7_1),
-	PINCTRL_PIN_GROUP("pwm_ch7_2", mt7622_pwm_ch7_2),
 	PINCTRL_PIN_GROUP("sd_0", mt7622_sd_0),
 	PINCTRL_PIN_GROUP("sd_1", mt7622_sd_1),
 	PINCTRL_PIN_GROUP("snfi", mt7622_snfi),
@@ -700,9 +691,7 @@ static const char *mt7622_pwm_groups[] = { "pwm_ch1_0", "pwm_ch1_1",
 					   "pwm_ch4_3", "pwm_ch5_0",
 					   "pwm_ch5_1", "pwm_ch5_2",
 					   "pwm_ch6_0", "pwm_ch6_1",
-					   "pwm_ch6_2", "pwm_ch6_3",
-					   "pwm_ch7_0", "pwm_ch7_1",
-					   "pwm_ch7_2", };
+					   "pwm_ch6_2", "pwm_ch6_3", };
 static const char *mt7622_sd_groups[] = { "sd_0", "sd_1", };
 static const char *mt7622_spic_groups[] = { "spic0_0", "spic0_1", "spic1_0",
 					    "spic1_1", "spic2_0",
-- 
2.25.1

