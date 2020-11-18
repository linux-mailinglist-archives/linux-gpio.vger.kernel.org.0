Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37ECF2B839F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 19:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgKRSKF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Nov 2020 13:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgKRSKF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Nov 2020 13:10:05 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4AFC0613D4;
        Wed, 18 Nov 2020 10:10:04 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id y17so4034786ejh.11;
        Wed, 18 Nov 2020 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pxELOt6GfZS0tNdRK6kX1TfQriizca3PB6DRDDt/oRE=;
        b=ARZ/DpQWE3vHp4KvYJiP0MPbTy8gGHTlVEzX8Q2sAyqbiwomX5JR9e0+Xq8P4ALeA9
         Cj/SbWXr3SfCCp3F8suHbL8HOtlkYdZg3yjtBG+YwlDvmzvXOaBdSjFvYGsrT7mRRDpW
         5uWclLo253shnOYvG7CD+UoEZ4eYKBwbZkgM257FpKwKvQxGJE21Rtq3Y8kYDp7mULvW
         SE99GdqcrfE2VFsSk7FhxfDZSz2xgfbL+uL1U2SqbZB0AA4QlYm9EVbB1J5UqA07WoRz
         +m47a+WerueTtR3wePnIEzsIaJa5bK9ekZ/VFrKaown7lSa+iL6bGwoaNRIdOea43meB
         dbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pxELOt6GfZS0tNdRK6kX1TfQriizca3PB6DRDDt/oRE=;
        b=hMwO1lj4qNpKCgLkJGDDmNgYQiMc6SMkaYN6Jm7EK2TC6rHJTTaMHrCh50TselbcVZ
         jh5k2W76RR5AjZSXVKzPTUpKTBYMmf+GaUHvCuawYLSQXnZbTQdsH/KJ65pLq4X2Pd+H
         mG4qFNWkvpW1RZ+vnMslw0HjAHDJbBIHYVCNwMnOUKTdkNKzJfN3EIqCV8OWLcBj1biN
         wQFFCvVlEWKNW795M/XtJWTLiJAW1D43hBudHnzlZjaksaUXpBgNQ1D8aKL7E22eAeXA
         sDXyFKqEH5EeUiXbPb3TccRcydjVA9NxWL91w1gZH/nIgReMHGrCHKOQ4veirE/2KK7D
         XZAQ==
X-Gm-Message-State: AOAM531HKlz6HexINDbcjJ0e7X9Qay5NfqvKvpAIuHV6RsNwd1JMO3z6
        7D8IBXHrARViGft37NwjlcThr+GH7qovVw==
X-Google-Smtp-Source: ABdhPJygaSh3dhehHH5Wu64My3bzhXbfEB6R0xPAHy3T+2lelDqTPu9nlj2EDqeFRWzMnKMkbhFHlg==
X-Received: by 2002:a17:906:ca83:: with SMTP id js3mr26018362ejb.42.1605723003484;
        Wed, 18 Nov 2020 10:10:03 -0800 (PST)
Received: from localhost.localdomain ([188.24.159.61])
        by smtp.gmail.com with ESMTPSA id dk8sm1483425ejb.88.2020.11.18.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 10:10:02 -0800 (PST)
From:   Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
To:     =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org
Subject: [PATCH 1/1] pinctrl: actions: pinctrl-s500: Constify s500_padinfo[]
Date:   Wed, 18 Nov 2020 20:10:00 +0200
Message-Id: <24505deb08d050eb4ce38f186f4037d7541ea217.1605722628.git.cristian.ciocaltea@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

s500_padinfo[] is never modified and should be made 'const' to allow
the compiler to optimize code generation, i.e. put it in the text
section instead of the data section.

Before:
   text    data     bss     dec     hex filename
  12503    5088       0   17591    44b7 drivers/pinctrl/actions/pinctrl-s500.o

After:
   text    data     bss     dec     hex filename
  14435    3156       0   17591    44b7 drivers/pinctrl/actions/pinctrl-s500.o

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
---
 drivers/pinctrl/actions/pinctrl-s500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-s500.c b/drivers/pinctrl/actions/pinctrl-s500.c
index 38e30914af6e..ced778079b76 100644
--- a/drivers/pinctrl/actions/pinctrl-s500.c
+++ b/drivers/pinctrl/actions/pinctrl-s500.c
@@ -1485,7 +1485,7 @@ static PAD_PULLCTL_CONF(DNAND_D6, 2, 2, 1);
 static PAD_PULLCTL_CONF(DNAND_D7, 2, 2, 1);
 
 /* Pad info table */
-static struct owl_padinfo s500_padinfo[NUM_PADS] = {
+static const struct owl_padinfo s500_padinfo[NUM_PADS] = {
 	[DNAND_DQS] = PAD_INFO_PULLCTL(DNAND_DQS),
 	[DNAND_DQSN] = PAD_INFO_PULLCTL(DNAND_DQSN),
 	[ETH_TXD0] = PAD_INFO_ST(ETH_TXD0),
-- 
2.29.2

