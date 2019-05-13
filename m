Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58E811B593
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 14:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbfEMMNZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 08:13:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38225 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbfEMMNZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 08:13:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id v11so14999483wru.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xx1/BNKJkSZTh4qrBNcdndPwRJoZAQ0lryCakBXnIco=;
        b=QIsb/f0kUY9G788OSKOKni+2PTbGETRzifTPBWVznr+rsgjs14REMleEaOs3NMHzS9
         j3GAphur/KL1Ahc/3ZfKS9MV3vWi51VRps0Pq7yKHsrHReGNouMRRyCtz8/QShXhzVul
         bpx4ALaS0BAkmzG/OIJjqZQXKR6KXeonYr8BRU5pOTjxpdMr2rnzXvs8tx5R/tJuV+9N
         4XD+Co4RCCzlhgaJSzFgCswdMwi7Ch0PmzRyqjSJD1EURo+vkek87ATsdhrbaGfUExVk
         DlUhpxvMnjAiZKWzXjRU2EsXhTwSi8rgB1trhT93JOgYyU7tut4MkEy/T9pXudOWuLV5
         t1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xx1/BNKJkSZTh4qrBNcdndPwRJoZAQ0lryCakBXnIco=;
        b=d02VPokLZYhI/3GDaouQRpaf7nzdFmAqE1hqFpMUGtjlsad321+HMUtzatpincPva2
         gYZSMfo+6mMOCv2OwE47JpSGWsYsLxU/fAfbewxS7Im5NBiPA/P4JY/z7TBgIm3UWEwp
         yA7b3zFNzQE0CyvZ/YEWwsW1Dzj7IoM97q6hy2k+dVFvg08hkr6igPebEjzy0X3RzBbs
         vJP207Gkf7/kMu+5jQAc0e176h3YmH4wrLwiVZyjLom5Q9ecpObPMJ3s9REejokbxVLk
         xs0Ri2ZSvgaw749Ce7mVnEVDogwjnc8aQTX8anin7dOguYCec6zXbr/sey/hpGLph02C
         MAtg==
X-Gm-Message-State: APjAAAWfWw8vNs9OFTVkE4AlZcPJTNMEje1uazGn4UtOEZEzessPneU6
        2Cl45WnAbYBID2S14lT7chIE8nOS9gg=
X-Google-Smtp-Source: APXvYqwaGDMBdXy38w9hYdrFA4DiZiUg2a7WUberXgPw2cGrvmi3UWSrnOwEbdr5MnBakRu5kIMOgQ==
X-Received: by 2002:adf:f548:: with SMTP id j8mr10615048wrp.171.1557749603723;
        Mon, 13 May 2019 05:13:23 -0700 (PDT)
Received: from jabjoe-thinkpad.lan ([141.105.200.141])
        by smtp.googlemail.com with ESMTPSA id o8sm27689887wra.4.2019.05.13.05.13.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:13:23 -0700 (PDT)
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
To:     linux-gpio@vger.kernel.org
Cc:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: [PATCH 1/2] Expand MCP23S08 driver for use as interrupt controller.(v3)
Date:   Mon, 13 May 2019 13:13:19 +0100
Message-Id: <20190513121320.17917-1-joe.burmeister@devtank.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To be used as interrupt controller, pin control callbacks needed to
setup the registers.

Signed-off-by: Joe Burmeister <joe.burmeister@devtank.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 98905d4a79ca..3fc63cb5b332 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -264,6 +264,12 @@ static int mcp_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 			return ret;
 		status = (data & BIT(pin)) ? 1 : 0;
 		break;
+	case PIN_CONFIG_OUTPUT:
+		ret = mcp_read(mcp, MCP_IODIR, &data);
+		if (ret < 0)
+			return ret;
+		status = (data & BIT(pin)) ? 0 : 1; /* true is input */
+		break;
 	default:
 		dev_err(mcp->dev, "Invalid config param %04x\n", param);
 		return -ENOTSUPP;
@@ -291,6 +297,13 @@ static int mcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_BIAS_PULL_UP:
 			ret = mcp_set_bit(mcp, MCP_GPPU, pin, arg);
 			break;
+		case PIN_CONFIG_OUTPUT:
+			ret = mcp_set_bit(mcp, MCP_IODIR, pin, false);
+			if (!ret && arg)
+				ret = mcp_set_bit(mcp, MCP_GPPU, pin, true);
+			else
+				ret = mcp_set_bit(mcp, MCP_GPPU, pin, false);
+			break;
 		default:
 			dev_err(mcp->dev, "Invalid config param %04x\n", param);
 			return -ENOTSUPP;
-- 
2.20.1

