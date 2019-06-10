Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28B1A3B0E8
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 10:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388351AbfFJImj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 04:42:39 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50354 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388555AbfFJImZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 04:42:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id c66so7610341wmf.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2019 01:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=ErpuCgIKx7tdIhXc0Vgq27YYh5IdzYS8ZROzqkhZo992Lvnn19vfhbIqZzxfQ10161
         q/yb5S3UOlu7jVewR6gPOHtopPzH2mIm47P8H5DIDXJkkAvu/fVLeYL+XDHodIfbmI/Q
         CKa9e4AABXjZuSQiUwSxAL/oBnskNHq1jEInWN4Q5Tp+sQdhRKsiH2TxkMt482GTBNR7
         aY1rlYW3/QXDuFLndlbV2tpu9/XuFDuowc7j5gTlPoBAZBoUbY32p3JHHxZM6+39iUMi
         I88QsPzhpoQOgqfRr4ELN1VJv09S0GcBFZHzKYKYqObfTb0uzFEHbnk2tmqKPOZqSUBm
         gHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=cQyMt+SU/lVVMlJTY1H3Jkttwo44//TQ4ocO7nmsXXOeZJ7rZBxHBGPhPiMPtl5y5k
         cEnMsBMChxqJUDoBwWfWcOfhU9pvGAHUQucKlU3PMM1fqIu61HdxfpSBDaeS/ai3rwv9
         4sWXiPNmygKMIJ54ADdBkvoVAddtfGqEeb5V5Nn2SNVUHJ1mJHWJ7+n8JQa45mFbipgZ
         ZXQpne4BwqDI6ruxoEQjWlps41IH3ixpNuH0GI+jWiNMiHSgAPUpBuBWoWILc5EcnItR
         FnDf5wVzudL3691MyOlfgsz0u/XlFdBV6Uw82dx/AhDqLrtVNXFriGgV0gjt9xLJOxD/
         frVQ==
X-Gm-Message-State: APjAAAURh6w4eQYfIFA8W96zgoFhlwVZf7FU5jnHb/DC58+MgWydjxuu
        SBeCHIiizen9zU3BlccnSg9kTg==
X-Google-Smtp-Source: APXvYqyC2APpf/zAbitrU/BjHOuyVW/f2vbj2/AUhh+FVA31orPg+ghJwVZnl4+ZvUlYkGglrWpA1w==
X-Received: by 2002:a1c:35c9:: with SMTP id c192mr12941297wma.147.1560156143556;
        Mon, 10 Jun 2019 01:42:23 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a125sm9929670wmf.42.2019.06.10.01.42.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:42:23 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 8/8] usb: dwc3: qcom: Improve error handling
Date:   Mon, 10 Jun 2019 09:42:13 +0100
Message-Id: <20190610084213.1052-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610084213.1052-1-lee.jones@linaro.org>
References: <20190610084213.1052-1-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

dwc3_qcom_clk_init() is called with of_count_phandle_with_args() as an
argument.  If of_count_phandle_with_args() returns an error, the number
of clocks will be a negative value and will lead to undefined behaviour.

Ensure we check for an error before attempting to blindly use the value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 55ba04254e38..e4dac82abd7d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -409,6 +409,9 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	if (!np || !count)
 		return 0;
 
+	if (count < 0)
+		return count;
+
 	qcom->num_clocks = count;
 
 	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
-- 
2.17.1

