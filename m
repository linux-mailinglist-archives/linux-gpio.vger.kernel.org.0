Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 212FE428E5
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 16:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439657AbfFLO1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 10:27:10 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33343 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439656AbfFLO1H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 10:27:07 -0400
Received: by mail-wm1-f65.google.com with SMTP id h19so4418119wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=K+P6qWGcKWtU/iGNHzOV9jjR+RXyRp8egtBtmeeUZNHtvIIVBJLVzsH3Vy3gAMuwgR
         Ao6Mudj+9wGNnHwdrOfxdgHdBdIcy5MyVOGRSFy+u/wbSjuIQHDF55F9J3zqhVi/3bzW
         5HtveVGkaSLRv+2iEeE0w1LhFjT4UWtVB79zLW2+qAbLhdEdMRRAWva9Df2T5N4cUgds
         7+g7+Wl3XKZO1rJ7uvAaX/LDxFQBwuJvjUCgufBdOzBsYf9UsfRDcBji+JpUDqmSS7Q4
         /AWCGhD4M9fDnPW+0gkmxkwUaYgWL72BfJzZ7ePa8q3MSEccMjIXUPf0b5gg6hRk1f2l
         pkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FalRLEADzMPtGyW8NIPAA0F5olxzxXGnPVoGFb+myak=;
        b=BmC15x3b1I078QvLUTzaygOrlLVPWlanK6w8i/Vu8ur/atNY+0mzq7O6aetOx17jxQ
         Cl3NiS3p5WcLJcYOjPyjoJ+29b1UwTUEz5mMeP10vWufqtC3kBon2s2n5KKLXinkI/yD
         iX5k47hnAjuyVimqx9ucUF/ur36swOGyo3CTjz2kbEiGVswroo5A2gCKlVUrgjpgKo9I
         /667oz830g3ioMcLUbFkyhqmHfn3cssfkA6moIhPSvEPAjlN9RzNMfJZP5uTO6QcEgNM
         BRzFfXtsvRE0bV69PUf3/lb8b13OsDjxzJpuNUDy34/QJA1NKGvYfhQ95ceqCkO8Pe7T
         R1Hg==
X-Gm-Message-State: APjAAAWe3AUP6n+8euU+xTRTmu88ij9mVX9SQ/7mcbsjJfow29sdHI7T
        XUZKpxl05qV62HkTZvDZbOV4ag==
X-Google-Smtp-Source: APXvYqzjB8dEwMcpuK7RiZ75qjBQSuVJatCq0iH0MPFGa+TZG6aAniFlqCXSYhHK14VPYk4WNlKsjA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr23429895wmf.154.1560349625039;
        Wed, 12 Jun 2019 07:27:05 -0700 (PDT)
Received: from dell.watershed.co.uk ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id y18sm203959wmd.29.2019.06.12.07.27.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:27:04 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 6/6] usb: dwc3: qcom: Improve error handling
Date:   Wed, 12 Jun 2019 15:26:54 +0100
Message-Id: <20190612142654.9639-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612142654.9639-1-lee.jones@linaro.org>
References: <20190612142654.9639-1-lee.jones@linaro.org>
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

