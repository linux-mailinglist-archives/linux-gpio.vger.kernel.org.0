Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6888333722
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 09:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbhCJIRL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 03:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhCJIRB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 03:17:01 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB62FC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 00:17:00 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id hs11so36799866ejc.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 00:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3Yz3/NapStuDE+x+ZZl/tDltLKdbda90tbUvwhJ9e1s=;
        b=Sv0cLWYhmCUh8YdfxgJyfrGi6dqUoz1gT1CKoOPY1xRit3aV0WpSBVplnFeY4YPBao
         ybFdFpEIWsjPTOyg/HAzTSmlLCecF306hfaQF6KxEVrmcHPC97jb0oVcjTO00QToKXX0
         fufJyXV84DvMDHwoUmZi5IDsC2KrZtCReRQlgi+U7T8jkyu3WYRACB7QSJduykpPrWwH
         uvtPloc5adPXHp6D1oCzbRQZxVoLTnWXfPmezHx4RhI8qnUzlsJk2zXGkKrxZasZCYaP
         vbLgZ0gwZlywG2hxADX3PdYMcyDbTSlXkhk9Ff8oqPFodigGejMlq1o7yGVQ22ivaH9c
         uKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=3Yz3/NapStuDE+x+ZZl/tDltLKdbda90tbUvwhJ9e1s=;
        b=iLM7dp/EIR50ca/sJlHgDzTtfeocY1/Ij6hPw9qU5WvyS7oCQqUYlJOqzt7ENOQPtG
         /87egrdCSxJuowR5+J1zdGkRR2+7hYCpV8rVH1mWZJorgEsD4dJ8uKgX159EipaUHXuG
         vKvfzJrDeXofEV3N6UIfc413HsLRScjd9p1PAsLyxqVYBfC7BU7sJOqvyxwyU0WQ4HdJ
         TW/Ik8g2Ra+wisYq/Oa0y9JlI0lUifhGnDQU2kPXwLlMJzaY/5btd0MV+qrRNiEcymGP
         Li13tknxuPLNATqTcmaSZagF3OjRz4zzCRVzPjLRV/NwmjPC7TQ4jVXWAcJ1q8wMDqpv
         LUUg==
X-Gm-Message-State: AOAM531V1iFrGkBqozQwDTlk1F24EW3VsYxeABEqzI0CdsNe4SgGmlOr
        Wy7p+cGhK39bSc4usYXOwna6TSIQ/IUMbpPK
X-Google-Smtp-Source: ABdhPJz4ZTXnSuoq4KUK5DrPNX65o1gIe5a95m7wuEf/U2c1T8EoCxvSQV29LqaOQctTi/+vYBB5mA==
X-Received: by 2002:a17:907:9870:: with SMTP id ko16mr2344119ejc.227.1615364219497;
        Wed, 10 Mar 2021 00:16:59 -0800 (PST)
Received: from localhost ([2a02:768:2307:40d6:f666:9af6:3fed:e53b])
        by smtp.gmail.com with ESMTPSA id n25sm10513909edq.55.2021.03.10.00.16.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 00:16:58 -0800 (PST)
Sender: Michal Simek <monstr@monstr.eu>
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: core: Handling pinmux and pinconf separately
Date:   Wed, 10 Mar 2021 09:16:54 +0100
Message-Id: <cfbe01f791c2dd42a596cbda57e15599969b57aa.1615364211.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Right now the handling order depends on how entries are coming which is
corresponding with order in DT. We have reached the case with DT overlays
where conf and mux descriptions are exchanged which ends up in sequence
that firmware has been asked to perform configuration before requesting the
pin.
The patch is enforcing the order that pin is requested all the time first
followed by pin configuration. This change will ensure that firmware gets
requests in the right order.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 drivers/pinctrl/core.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 7d3370289938..f5c32d2a3c91 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1258,13 +1258,34 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 
 	p->state = NULL;
 
-	/* Apply all the settings for the new state */
+	/* Apply all the settings for the new state - pinmux first */
 	list_for_each_entry(setting, &state->settings, node) {
 		switch (setting->type) {
 		case PIN_MAP_TYPE_MUX_GROUP:
 			ret = pinmux_enable_setting(setting);
 			break;
 		case PIN_MAP_TYPE_CONFIGS_PIN:
+		case PIN_MAP_TYPE_CONFIGS_GROUP:
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+
+		if (ret < 0)
+			goto unapply_new_state;
+
+		/* Do not link hogs (circular dependency) */
+		if (p != setting->pctldev->p)
+			pinctrl_link_add(setting->pctldev, p->dev);
+	}
+
+	/* Apply all the settings for the new state - pinconf after */
+	list_for_each_entry(setting, &state->settings, node) {
+		switch (setting->type) {
+		case PIN_MAP_TYPE_MUX_GROUP:
+			break;
+		case PIN_MAP_TYPE_CONFIGS_PIN:
 		case PIN_MAP_TYPE_CONFIGS_GROUP:
 			ret = pinconf_apply_setting(setting);
 			break;
-- 
2.30.1

