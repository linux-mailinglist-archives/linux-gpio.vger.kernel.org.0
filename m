Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2491BBA29
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 11:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgD1Joh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 05:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727025AbgD1Jog (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 05:44:36 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DD0C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:44:36 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id g10so16262896lfj.13
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UwsKd6vtLSCO+MFkJGwQlziNOURozUhwGk20R/4vuY=;
        b=UzrziHufYg2IV1lUy1O45fipzDSH8BPk7s1ZbmSWgXVN+n9GnxcaReQ5cGUslhnEQZ
         4JHya+bD2zeWKzi5H+7AWh9YMUGX4C0zRrSSTdK8A77cLK8VLkrABNliLF/p6/hW92e1
         /MbDwESeW1WeukvySmU40LWggL/BNtzT6ahJ4+kwARYu3vKv49zUWPRhFH4SS0Z69N10
         pT1vn221GFY80EXfMZTxIn+R1Z0no2h7rpBwqlcb4i1er0vk78o1WfxjfsxrV8Z9AEoz
         5X0F3toGKfs7VvYB0Rx7v/8GpbJ4zQcMReY68MDfGFUwmZmm7WyG0TGxef4LuoWqFlHR
         LU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UwsKd6vtLSCO+MFkJGwQlziNOURozUhwGk20R/4vuY=;
        b=VwUadob88THbXlCBo7pEKjSG9FR0n4jeM9jgDVXvvQxKsFdCq7pifXbV424If5c/KR
         Gr7ynPzogt31m/fUOWsMuyGEkpfFeI0jHjEkp9AATZD4XLm8fvPfjOb1bAWKciV8BiEq
         fD3Ss/tX29RGBIEzhcV997asYao0jilulmpJTx/UcFkOPuCLe6su0bqqOYMBwbqLAmFl
         6XjgIFQ//ESCnhN1hiK6mUZzt1Uj44Clrar/w9T6hrf8gyDfpCKmIt1XOVbJPGQPad/M
         SNKbPSYzJIAP5CsWhxaKrmgvsumV0De5Lu1tkbNIrNEtVSofHFxwFmDrIMKjvZCuPXVJ
         70Fw==
X-Gm-Message-State: AGi0PuaCkIYIehkt1VYi1f0qJwjKePOk4ahS+THaeiS7hsoz93KRe3jy
        aSnD9IxjLA3yoczEhQlX/Oa40JDPXc8=
X-Google-Smtp-Source: APiQypIBKhDUiLxNAiSUtFtMDDZwJ8vw1Zk/y3Q8O4xhflXGe24Z5uCiL+QpLZQ1GNBGzp7zOzFjdQ==
X-Received: by 2002:a19:f70c:: with SMTP id z12mr19177901lfe.78.1588067074270;
        Tue, 28 Apr 2020 02:44:34 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id y9sm12213747ljm.11.2020.04.28.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 02:44:33 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] pinctrl: ab8505: Define group for GPIO pin 50
Date:   Tue, 28 Apr 2020 11:42:29 +0200
Message-Id: <20200428094229.843531-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Hulk robot reports an usused varible:

drivers/pinctrl/nomadik/pinctrl-ab8505.c:137:23: warning:
‘gpio50_a_1_pins’ defined but not used [-Wunused-const-variable=]
 static const unsigned gpio50_a_1_pins[] = { AB8505_PIN_L4 };
                       ^~~~~~~~~~~~~~~

This variable actually should be used. Probably an oversight
by the driver author.

Cc: Patrice Chotard <patrice.chotard@st.com>
Reported-by: Hulk Robot <hulkci@huawei.com>
Reported-by: Jason Yan <yanaijie@huawei.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/nomadik/pinctrl-ab8505.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/nomadik/pinctrl-ab8505.c b/drivers/pinctrl/nomadik/pinctrl-ab8505.c
index 5e6e7d28390a..b93af1fb37f0 100644
--- a/drivers/pinctrl/nomadik/pinctrl-ab8505.c
+++ b/drivers/pinctrl/nomadik/pinctrl-ab8505.c
@@ -178,6 +178,7 @@ static const struct abx500_pingroup ab8505_groups[] = {
 	AB8505_PIN_GROUP(gpio40_a_1, ABX500_ALT_A),
 	AB8505_PIN_GROUP(gpio41_a_1, ABX500_ALT_A),
 	AB8505_PIN_GROUP(uartrxdata_a_1, ABX500_ALT_A),
+	AB8505_PIN_GROUP(gpio50_a_1, ABX500_ALT_A),
 	AB8505_PIN_GROUP(gpio52_a_1, ABX500_ALT_A),
 	AB8505_PIN_GROUP(gpio53_a_1, ABX500_ALT_A),
 	AB8505_PIN_GROUP(pdmdata_b_1, ABX500_ALT_B),
-- 
2.25.2

