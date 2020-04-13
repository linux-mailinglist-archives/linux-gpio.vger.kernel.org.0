Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD1A1A62E5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2020 08:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727909AbgDMGFb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Apr 2020 02:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgDMGFa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Apr 2020 02:05:30 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E9DC0A3BE0
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 23:05:29 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y12so2748108pll.2
        for <linux-gpio@vger.kernel.org>; Sun, 12 Apr 2020 23:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3v+VHCzqYa2nLQ9AKWVzgqder2TzAWcxRtJCS2UIKqM=;
        b=jCcsgLQN1TCT1fFcxUm0gcxSRENM1/x1T6fQkGr7zXONPtCqoXFsae7koZ+bGI9sw6
         jNUCQvj1/2bxAUgNkXgWMR0CyH/THSAQk82v1H1dIfQL1AW/8VKA34wtgj5+NF2dLg0W
         mmw+gH/Uri1VP1zxj6jjbz4MprcAcimlF8YgtVlJuppZdNayQXOBOuEF6vCKq4DC89Og
         zQNSiFFp2saVuc0232VufweD81WopKnaTUiAt7yZ5Cs+TIHiSq2KQHZHIJ/7TtnMVXPt
         QwCujg7ocwfhGraFDvd0k2g09aTh4Y+YtyiuwehDMicY2lsQze8H0VFVh9H0WQ+vN/KL
         OwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3v+VHCzqYa2nLQ9AKWVzgqder2TzAWcxRtJCS2UIKqM=;
        b=V0I0y9AgpL8NDWoQXHKGmfG97xHod8OiQyE7dn33eCGofcFPsSkSfnT2ON5853hggf
         QlZkE7BL2N1Het4UN08knrqIdeRKdgtsdIr/zMG+HbZAxJqAAPJziXJgxM/Zuz1ylT3T
         kmR1w3X0XMYKtdui0XLOUqOuMMOF89bYQ1/40soBRUG2yJtoGsvqowB2SNnMe6LiidtD
         vYSk8udXg+CugETjHkUGBhgNpGIl62RkSldKJZguMlDvqvvv+SYKO/2LrjQBXKgAcsOR
         6wxgcmiNgriDmhujhdJxu64wMyv0GJ2w8kykZFe5WvJ84bJvJgES45O+3r8bBfNzUPiU
         LruQ==
X-Gm-Message-State: AGi0PuZaDeTPV+M1tAWGj7jlMHOUanSTqEWZ1yh2R1cyvBOwt0v4IHKr
        JEg6EwSYEFgKt8D0jlmkswo=
X-Google-Smtp-Source: APiQypJeDgy30Co3y2RrOWtCgmpiisc6D8lUZn8SmfiDrs7bS8RTQo/09SGMvWPlOMpzAbl+k1tBEA==
X-Received: by 2002:a17:90a:df8b:: with SMTP id p11mr6363309pjv.67.1586757928742;
        Sun, 12 Apr 2020 23:05:28 -0700 (PDT)
Received: from localhost.localdomain ([106.215.20.24])
        by smtp.gmail.com with ESMTPSA id x4sm7687670pfa.191.2020.04.12.23.05.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:05:28 -0700 (PDT)
From:   Amit Singh Tomar <amittomer25@gmail.com>
To:     andre.przywara@arm.com, matheus@castello.eng.br,
        manivannan.sadhasivam@linaro.org, afaerber@suse.de,
        linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org,
        Amit Singh Tomar <amittomer25@gmail.com>
Subject: [PATCH v1] pinctrl: actions: fix function group name for i2c0_group
Date:   Mon, 13 Apr 2020 11:35:12 +0530
Message-Id: <1586757913-5438-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After commit 6f87359e8bca ("pinctrl: actions: Fix functions groups names
for S700 SoC") following error has been observed while booting Linux on
Cubieboard7-lite(based on S700 SoC).

[    1.206245] pinctrl-s700 e01b0000.pinctrl: invalid group "i2c0_mfp" for function "i2c0"

This commit fixes it by using correct name for i2c0_group.

Fixes: 6f87359e8bca ("pinctrl: actions: Fix functions groups names for S700 SoC")
Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>
---
Changes since previous version:
	* Removed the white space from commit message.
	* Used the 12 digits for commit hash.
	* Passed it through checkpatch script.
---
 drivers/pinctrl/actions/pinctrl-s700.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/actions/pinctrl-s700.c b/drivers/pinctrl/actions/pinctrl-s700.c
index 47a4ccd..f579a65 100644
--- a/drivers/pinctrl/actions/pinctrl-s700.c
+++ b/drivers/pinctrl/actions/pinctrl-s700.c
@@ -1435,7 +1435,7 @@ static const char * const sd2_groups[] = {
 static const char * const i2c0_groups[] = {
 	"uart0_rx_mfp",
 	"uart0_tx_mfp",
-	"i2c0_mfp_mfp",
+	"i2c0_mfp",
 };
 
 static const char * const i2c1_groups[] = {
-- 
2.7.4

