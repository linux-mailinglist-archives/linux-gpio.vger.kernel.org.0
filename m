Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C42235B73
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2019 13:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727602AbfFELnR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Jun 2019 07:43:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51756 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbfFELnR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jun 2019 07:43:17 -0400
Received: by mail-wm1-f67.google.com with SMTP id f10so1928890wmb.1
        for <linux-gpio@vger.kernel.org>; Wed, 05 Jun 2019 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=QKMO16HzOa6yOl0TtOpHhtaz2SlgdqhYZJyTw38c30d4UIeX/UDQnVA2Q9d0ipicdD
         Emx8H2oabCuuVPEsxhBlwmfa+rkssHoxoqRU3YK8BQlbomqW5kzJbpEytzeiEhZgRzTj
         UuIbaCfiENidI6XCj4Q+ItiQk6OwNI+MlfHUM4Ee1wn3nAm4MbEgnWVI2SXMhsKUpm74
         uQFspWBHEtn7jRgazZmuN+pcHm22NJx+aTrImCUgcPsYActEEks62mCVCDgBdhq4xHqV
         aLwalHia+TPEdWi3LiXfCNf8Dzv+nwpo4e0Tsvy22vppNbw+xuPuEpZs6dyJHOhTwxZg
         pP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=PaomwLV+XvD5c94OaC1kkTzcJz+X3UDW/Vv6ksNlmzhZJPQqsdi3aac551V/M3Ghqi
         /JGV7IStDfB/Ewtckf8kT4zXF8gbLylyH9MIzmfYboUFo8dgU//u0o66u4u1lAImfD3A
         U7omeF5JDG5hqC/HaZB402mxpkK66EA8qcRS2tKHvrJiRmzjImNuzukSyhWdiVJ0hSDi
         F90SNWyLaYCMrbW4gTuEfbByr1P0/AuBuGOefE4xGbPj2dyLKHDd6YHyER2hwfZvo6bu
         O/MSR3NWfB9KP+omk5fYKn1cQMR9c2yiIfIt9/Rnbol++euSbvVY3TC0YZoAtWHz+dhE
         T5yA==
X-Gm-Message-State: APjAAAV5Zf4QRleCLWVxznPPwkT5gAySV3nDBVjnfpc8OYhwVkP5oGbX
        ev/43tiP2LKX9PfnZlJvnTu9tQ==
X-Google-Smtp-Source: APXvYqwEFvsfbNVarbCKn/CaPPWWGkVmIUJ55Mc+kqvQbIA3b9FWJAmPfuM+8mkgIFBS0YNQs5g27A==
X-Received: by 2002:a7b:cb06:: with SMTP id u6mr10100159wmj.170.1559734994798;
        Wed, 05 Jun 2019 04:43:14 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id 34sm27718740wre.32.2019.06.05.04.43.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:43:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 8/8] usb: dwc3: qcom: Improve error handling
Date:   Wed,  5 Jun 2019 12:43:02 +0100
Message-Id: <20190605114302.22509-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605114302.22509-1-lee.jones@linaro.org>
References: <20190605114302.22509-1-lee.jones@linaro.org>
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

