Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F28939B24D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 07:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhFDF6Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 01:58:24 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:44979 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbhFDF6Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 01:58:24 -0400
Received: by mail-wm1-f44.google.com with SMTP id p13-20020a05600c358db029019f44afc845so4903343wmq.3;
        Thu, 03 Jun 2021 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ed5WmJxyULQVRPs+5fQuuHUwaFXs2hZQ2esz5Jppxuk=;
        b=qUZ6rJR4eobG53nHZ9PYTiFV2U/yNDBXvlVJz8ikQ78q7eR49khspQ058zMZWbe+zt
         e6JKTIHB71VbpXFPsAEWLra6A3okfqMNU7CxwDKQt8Lnu8k6/YHscr0GC80RA7ho8ihR
         37EwnPnDJ27VyJi3GKbUGItAMQ570xrK1fczrCCjDu39e+pDg9tvcTd6v6qBSgrj/y9K
         zBVQClBeB1YXZHjVmKE+jzuAj5rhD6GPWlQNPbXPJ2YteWoorjBOTgJqZiTQKPqsn9A/
         UeESdM71LiE4PrBCj5f5vwDrwCgnx9rz8DiX/Ni+9HnmP1hY4gGvge37AOCsb//EEIW8
         ixbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ed5WmJxyULQVRPs+5fQuuHUwaFXs2hZQ2esz5Jppxuk=;
        b=Cs/iXer6/3Km9rP2C7xa+vGduM+SzRjP8/3URPF+rP1u73bvCXq/YZID1tdtwpFpeV
         14EqCNinH2OzUEQpLv3/GtdU1uqpubiJeZTuNT8P2O1WrcAaxU7ZFOqjg2BFqZyeWIAQ
         1UXRDATxP6X7jQ6J9PDOXPXgC/OPCFMCHKKNscf1t8I3PnbPubV1jDAbQ5prUJb519oU
         QHo4Cfn52iofa6RQydDjIiFeToMVgTEI/crHLASJKMOUZKVAERiqJGk32Nz7njv2iI5h
         PvyW2SiC7+MZ7AKLn32BaClqBA4WYlw+6OgOn+Ouqe8erK0N+T6lzSa3tHd4Qg0gB1eJ
         J8oQ==
X-Gm-Message-State: AOAM532te0VFR18tUTOY5NqgHSDbmenZsiTkfpNffoQpzRKmCMs9cpQl
        C74QaU7lo/QpAXuwpWWAUyuwneyNne/65A==
X-Google-Smtp-Source: ABdhPJyi0Alv7pFVidCUReBKXL0v1PEcVkKdiCQwBggSq9B1Ar9JTHKQqR6a/FYHt8EvMfoO71lMqw==
X-Received: by 2002:a05:600c:154:: with SMTP id w20mr1842917wmm.185.1622786138202;
        Thu, 03 Jun 2021 22:55:38 -0700 (PDT)
Received: from localhost.localdomain (113.red-88-4-247.dynamicip.rima-tde.net. [88.4.247.113])
        by smtp.gmail.com with ESMTPSA id x125sm1076150wmg.37.2021.06.03.22.55.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jun 2021 22:55:37 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: ralink: pinctrl-rt2880: avoid to error in calls if pin is already enabled
Date:   Fri,  4 Jun 2021 07:55:36 +0200
Message-Id: <20210604055536.20606-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In 'rt2880_pmx_group_enable' driver is printing an error and returning
-EBUSY if a pin has been already enabled. This becomes in anoying messages
in the caller when this happens like the following:

rt2880-pinmux pinctrl: pcie is already enabled
mt7621-pci 1e140000.pcie: Error applying setting, reverse things back

To avoid this just print the already enabled message in the pinctrl
driver and return 0 instead to don't confuse the user with a real
bad problem.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Changes in v2:
    - Fix commit message s/is/if

 drivers/pinctrl/ralink/pinctrl-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/ralink/pinctrl-rt2880.c b/drivers/pinctrl/ralink/pinctrl-rt2880.c
index 1f4bca854add..a9b511c7e850 100644
--- a/drivers/pinctrl/ralink/pinctrl-rt2880.c
+++ b/drivers/pinctrl/ralink/pinctrl-rt2880.c
@@ -127,7 +127,7 @@ static int rt2880_pmx_group_enable(struct pinctrl_dev *pctrldev,
 	if (p->groups[group].enabled) {
 		dev_err(p->dev, "%s is already enabled\n",
 			p->groups[group].name);
-		return -EBUSY;
+		return 0;
 	}
 
 	p->groups[group].enabled = 1;
-- 
2.25.1

