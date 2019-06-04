Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A65344AB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 12:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfFDKpl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 06:45:41 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38707 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727356AbfFDKpC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jun 2019 06:45:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so15274941wrs.5
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jun 2019 03:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FFbRmXkMAE6sjv34a7ljnhiVGkAFw+tIZvmrUIY2GGo=;
        b=Y6qiFnTJ1MRpHUuCgNqujGVCKMSi3o1dTrg5paygrkOoY89q1o3/qKqVZda1lpsOEk
         aepjpT3mjU4Jdjty6fQnmvWB2Tz0hwigSNf52sJspJ7fiUowJiz/3HxN7sLf0BmtbclX
         1CYvUvUFCgmtIh5WO9E92aRfTfvmY2qVMebf3kSoqAxRiszD6jflq0TsLoqUZjsmMflP
         5Nn+i2AxwRqEHDKXGQFLfnIWghiz1Yx68Qod0Tn9bIasPgvwp/o0HsX32zKdRxB2q94L
         fedstP7MFi1DjVWWZ6Z6IVAdw+r6UsQ3ZyYEisYtl/QOcYnyFQBNJ07J8Ab2SH71T4nd
         i7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FFbRmXkMAE6sjv34a7ljnhiVGkAFw+tIZvmrUIY2GGo=;
        b=aLGR0AhFIqlRQgefcGzN4uHRSn3SiinM5sfGXINLmNC+XdthyynGn80OZmlG7Ckv+O
         c3SIXIXMDZRbUJ+HBVRP5WHDwI6NzCfpCqKWV95V/BML/ZqHNRlgWZVPHdPr05ZEJ/Pr
         JQN/SCiJLq3OzVs238h3WRWS6vc0K6KSXOoLfRFpDwo5v4JRLd7RsZ/YFeNiL6yfvkia
         8LzipsQtUJFfBCUwfiwbPN5ZMQSKlOF0cuxZ7yv8lmipPhr3pkathLW715pyprGde5an
         g0n0Dg2kdCBlV7+0KZ/T8taIkUqI6nB5dYeqO0/TV685SFOVFG8EGWlHGPFOVkZHbesh
         uDXQ==
X-Gm-Message-State: APjAAAVKdc3nEhwG0HfqzbNinlqekV6N//7tCTlc0+BVQ0QozV/VfO4N
        tpFsfptw+YjmL0Cvzu9kuPQJfw==
X-Google-Smtp-Source: APXvYqzAHuObwVNxDVyJmzaqwTimhhoqMZDjedQgwBDPmPMfg7OJ5wk7EqESgJS92PT4uisnRMrKQQ==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr21460783wrn.94.1559645100592;
        Tue, 04 Jun 2019 03:45:00 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id t140sm2718623wmt.0.2019.06.04.03.44.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 03:45:00 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Date:   Tue,  4 Jun 2019 11:44:49 +0100
Message-Id: <20190604104455.8877-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604104455.8877-1-lee.jones@linaro.org>
References: <20190604104455.8877-1-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Qualcomm Geni I2C driver currently probes silently which can be
confusing when debugging potential issues.  Add a low level (INFO)
print when each I2C controller is successfully initially set-up.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0fa93b448e8d..e27466d77767 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dev_info(&pdev->dev, "Geni-I2C adaptor successfully added\n");
+
 	return 0;
 }
 
-- 
2.17.1

