Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A295C1B594
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 14:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbfEMMN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 08:13:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41029 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbfEMMN1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 08:13:27 -0400
Received: by mail-wr1-f68.google.com with SMTP id d12so14956272wrm.8
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 05:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/NYzTOOQ3lLvmk0BO2rLNRWWS5IETSgw25kSTV8/URI=;
        b=V2dBMG/o7M0FJJlvaFToscTeYhEfu35ytRtbAK903QQuJitamA2KCCqcddwFHdODO+
         BUdvfsxoHe9xj64HZtf5KiNcvVVVX22fxXGqx6Q9s3GcwBIT9l3cU8Y8PtM15eiKnaUo
         QWuJAIyK0FvuEJY3NScSPRIjw/917QilurWKeOvIJAcAdCvmc99NAjp3h9KnUZa+gVc7
         AQkAWhuW0UmBN2bw1oE5vvu1y9va9rp6rYU4nFqkt/RJ/UY7TrHNNfhkY5MsSm+tEYhM
         n24HX+la6pQu9PxsqHET3wJsJR4iUr3q7glFZW+tnYE5TbPP6+6EjdZvQXVKtuVG/1Em
         Tn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/NYzTOOQ3lLvmk0BO2rLNRWWS5IETSgw25kSTV8/URI=;
        b=pTvLQkwtskoMntzAPFkVFRAC35+h1xwrYk016rBYwc8TeO/AspOUvAU2hwTKIXJX9O
         fZJ1iMoV67vaNWEo27fxo0dDnfjLxcA4LLhrZ5rsc52C+WlXixUZdn5qDyKD3szijpvo
         oCamHjz6jh22+jTtVOp7DHVsOY6eFsu+phRGHEaDJrovDxB/LD1ez7rXy1JTgUKYZ41D
         RFCYh1XGdrIN/xS/5h7HgUyCk+fNUtwMsFZUiZ9Qgh39Q16OTzcgsbbE007pAm7co7Zj
         MYL9G00UhxMJRFKSG2Dd9SrScYmZAx1TmVLah5G9zMwgN1wzr6WNqZBIIZRo+pjtFDm1
         et6g==
X-Gm-Message-State: APjAAAUdkJxvcMnwUIlZid9EbTaKtvMai2QYcj4UVHD0iUfH9BN8bgxC
        Ybl6g9+8bYGpeNqOqiF6dmmFM15LWvs=
X-Google-Smtp-Source: APXvYqwn+9DgNXFU/ZPK1rpb9CCqtNhlDVVFTwW4B9DOFDSj/P1QuJA5ABC6m0bspdOO8n2bdoeCiw==
X-Received: by 2002:a05:6000:1203:: with SMTP id e3mr17563774wrx.300.1557749605400;
        Mon, 13 May 2019 05:13:25 -0700 (PDT)
Received: from jabjoe-thinkpad.lan ([141.105.200.141])
        by smtp.googlemail.com with ESMTPSA id o8sm27689887wra.4.2019.05.13.05.13.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:13:24 -0700 (PDT)
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
To:     linux-gpio@vger.kernel.org
Cc:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: [PATCH 2/2] Mark MCP23S08 as one that will not sleep.(v3)
Date:   Mon, 13 May 2019 13:13:20 +0100
Message-Id: <20190513121320.17917-2-joe.burmeister@devtank.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513121320.17917-1-joe.burmeister@devtank.co.uk>
References: <20190513121320.17917-1-joe.burmeister@devtank.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Though it has a 'standby' it doesn't appear to be an issue and
marking the chip with can_sleep means gpiolib.c won't allow its use
as a interrupt controller.

Signed-off-by: Joe Burmeister <joe.burmeister@devtank.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3fc63cb5b332..7334d8eb9135 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -890,7 +890,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		return PTR_ERR(mcp->regmap);
 
 	mcp->chip.base = base;
-	mcp->chip.can_sleep = true;
+	mcp->chip.can_sleep = false;
 	mcp->chip.parent = dev;
 	mcp->chip.owner = THIS_MODULE;
 
-- 
2.20.1

