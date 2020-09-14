Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6CF268219
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 02:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgINAMg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 20:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbgINAMf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 20:12:35 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA53C061787
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 17:12:34 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u4so17051427ljd.10
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m6n5CDEGJ98PFYReYu5BYco2BEPl56wh33ijWe674VQ=;
        b=uRwsUj+MUWa078lii8vy0k1rxsdECNxiPXqzouIeMABqgxPPQUfBSupShgSHvlaA1b
         MigDbTrjWwQevXWk0Pl4YPHQjxLyWBEUiiGjJ28VKnpiGARdj/LD/tMAOw3upLbQgykA
         JJIb0mgbGF50LU5/VXeFOgvLri1fSSlA4bZTE40G600y5K25p6CbtxlmBWM5LvMrh3aW
         qKMulIRa1T+rYrfWD85EvoT3KdmzRqumdnhPWcWM2UCIrIRuf7fj+pHU6f63U9l6OGb4
         I2szfj33bBE26EBLDDIhGN4VHoGvo7nNmLnGmw9oJiIhNnbx5Lk0DqBDChqnHzZpUkpP
         tcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m6n5CDEGJ98PFYReYu5BYco2BEPl56wh33ijWe674VQ=;
        b=NXsQVmxoIoKZC5Eb7f6c1A6FPixNWc3YL+4q7GM6tTTKcNDbfw5M2BKsO2SDh9/I7c
         EZdX93ccjjyhsPBgV63ySQ2GuHqi9yiVid0L8TLFUzj1CQH6gbDw7eo8gVZqFDo9RW38
         r1l3Nu0w+1vES/nTkNOsquoH1PIk88+IAHQ+yGi5Tp30/AQ6u+ayWXKWJPBYwBgR/wBU
         w+8SPjxGpoG4p2uQLm5NtjrWpnJgpiXDRcOoS6Eyk5y7v1naz7l6uYBujtD/NxUgzYPJ
         jQRu2yGkaOf9CEerRzL7XDZ+yVbcf85E7RC5vMnWams2txr5ZxhbrA1+nT7pxMsAD8fG
         RH/w==
X-Gm-Message-State: AOAM530hZSV5XRdoG5tvJvBxLlKc661ujCjWqKm+4/WdO2UgYT34tPTS
        A4lHeBeRntiv3lvvjSTBw0SB/7ssE4b1Bw==
X-Google-Smtp-Source: ABdhPJx7Krni8hTCy3g25lX6vRAn5YkpD44YEg1cR4Sp8WlZrNQ7C9A3RpqJQQciL7dgxB6M+uxBDg==
X-Received: by 2002:a2e:8645:: with SMTP id i5mr4021161ljj.209.1600042352188;
        Sun, 13 Sep 2020 17:12:32 -0700 (PDT)
Received: from eriador.lan ([188.162.64.187])
        by smtp.gmail.com with ESMTPSA id e65sm2906694lfd.143.2020.09.13.17.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 17:12:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
Date:   Mon, 14 Sep 2020 03:12:29 +0300
Message-Id: <20200914001229.47290-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
180 GPIO pins).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index a660f1274b66..826df0d637ea 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1308,7 +1308,7 @@ static const struct msm_pingroup sm8250_groups[] = {
 	[178] = PINGROUP(178, WEST, _, _, _, _, _, _, _, _, _),
 	[179] = PINGROUP(179, WEST, _, _, _, _, _, _, _, _, _),
 	[180] = UFS_RESET(ufs_reset, 0xb8000),
-	[181] = SDC_PINGROUP(sdc2_clk, 0x7000, 14, 6),
+	[181] = SDC_PINGROUP(sdc2_clk, 0xb7000, 14, 6),
 	[182] = SDC_PINGROUP(sdc2_cmd, 0xb7000, 11, 3),
 	[183] = SDC_PINGROUP(sdc2_data, 0xb7000, 9, 0),
 };
-- 
2.28.0

