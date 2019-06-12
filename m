Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 672FF4290D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 16:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439647AbfFLO15 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 10:27:57 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35233 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439642AbfFLO1C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 10:27:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id c6so6790424wml.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 07:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sZgUWoDIjlp1AADdoY2p7F+W0Gj8IYxrvEu+mq9KTCQ=;
        b=ThCLa8t3mfLlLTD+JYyjOG6ksSBzbsRKPHrxJlijHkCpRc+/WWHb1OthqzocW1Q84S
         MpNp8Y/1dFfEsYS7a75G2juDpZzuA+kbzktHPUUG9uWEjmWQUZtj494NWkBUiypWi9yf
         n4LCAJFKzrB56BTYY41lJ17pCUELOG2TK1at6xcbda8EYVl/FG2i0UNTMxkgt3JpYYif
         r1NFHKJ2TRQNI4kIyOJIIORlJ0i5XNs5C/Jl+N02cMWrlXkK+HCqWMxLcTESMnd1Ka4p
         qVsL3oNmOhGVY/Ora0UysqUsr9VkoU4CJj/w9QNDA8hVNYXMGz6ooR1wRVzk4sEiP76M
         7lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sZgUWoDIjlp1AADdoY2p7F+W0Gj8IYxrvEu+mq9KTCQ=;
        b=e3qmHNxTDLLOfWCLmc7DntEEqdjR9Tbf7TYGwtfNC1DNhcPPgCOPtfEQdhX5J5C5lb
         WMRGSZIzf0qd22OYUTOnmiuLoxEJO1zkREyNswh7NqkzCh5lucME2dI8lhLpDsdueVJP
         8AmDzI4F9Auy/nmf+XSspybGwWl6PsP2mGoVttqkgeTffoY31X+qi9l+4S++lXOwHMzq
         zRMXh5Sb+hPTVbnmmJJcVpPMvxP9AE62skUgU9rKQNB+98b3/Qkv8QnbAOmpnFSSXhRk
         puFZtJXUnZWs6VN5D3FbsgrBwAioziXzCc/P9qZUPPDKF6/PCgu9F54QqcJrAMqhrQZV
         bJVw==
X-Gm-Message-State: APjAAAUt5RZWxkTzogxjys7+zvHDGVePE4cNlTGLcjtljLJyfTPdo8g1
        gToDTP+UPxDENaSfi1yIwt//KA==
X-Google-Smtp-Source: APXvYqyB5BLzCKR3nJOtnmcfyjuqV3SjjUH851bbpxYVxf/6JQ+1BprzeCx6NHeeU76rXYDOeSvIIw==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr21406913wmg.177.1560349620555;
        Wed, 12 Jun 2019 07:27:00 -0700 (PDT)
Received: from dell.watershed.co.uk ([185.80.132.160])
        by smtp.gmail.com with ESMTPSA id y18sm203959wmd.29.2019.06.12.07.26.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:27:00 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.or,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v4 2/6] i2c: i2c-qcom-geni: Signify successful driver probe
Date:   Wed, 12 Jun 2019 15:26:50 +0100
Message-Id: <20190612142654.9639-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612142654.9639-1-lee.jones@linaro.org>
References: <20190612142654.9639-1-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Qualcomm Geni I2C driver currently probes silently which can be
confusing when debugging potential issues.  Add a low level (INFO)
print when each I2C controller is successfully initially set-up.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 9e3b8a98688d..a89bfce5388e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -596,6 +596,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
+
 	return 0;
 }
 
-- 
2.17.1

