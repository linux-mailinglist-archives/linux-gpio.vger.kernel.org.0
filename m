Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583D31B486
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 13:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfEMLHB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 07:07:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54351 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727695AbfEMLHB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 07:07:01 -0400
Received: by mail-wm1-f67.google.com with SMTP id i3so7587759wml.4
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 04:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1kJnEa8RDaMnxmSLmQjp/08/aZcQnsPL4jepe6c15w=;
        b=W6w05X9b6LKwlmr9/aSTGtRU6SU4y1UV4A79Ib+jBLyF8eWJ2aSjluyrCDyrMLO9TU
         IxguoK/EtAq69OxCFj9sQSWbbSOMgKnxVkFsnVr+z4Eb4MA4DqPV4AzNXGKIv00IObqF
         Fw1UaXmbAEWUYbGg6pmlJ+y6DjsAma2BMW2ApyvRr0o4FeppmN3RfTxy66Te9UqTPJjX
         c7cZivnSmWdOEFIEuVVk5X6wZafig41aOdm/ZJrBNLFM9VQqN6xD60/7sj6KWpJbNtUI
         onTbET408FyJcyhDgQmh4vlC4RVy5gg07l/bf/lyBWuXJwSme3FIcmwBWxg5NhRVc5pE
         nVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v1kJnEa8RDaMnxmSLmQjp/08/aZcQnsPL4jepe6c15w=;
        b=B0CRcgZ8mTmxrYgvsQD21mhg7sCBsarrIGAgRnP2waQjHyxNhk/S3VfFLlxd/oCLcW
         iziCvL2nTIcpfJY3oPofAHmxXDUFGOgeMT31QB6Gw3YwJ8o7QX3u1iNwzIne4tUx63oB
         ca/SfENeSBAWW8q7d4Kw3HQs4zWvuEqjmuYipoKhAj1aDd/ZJgRHu4y8p7DCda9bp8B4
         ryYIOoQBfxV/bs6R2UX2bXimovtg4Y3x7ZmPlvGH/5zkQxxgH5UWlCP3ZkGwIOWhnbj9
         +c1kxul1h3tFLsLXwEaEMeVhJWh9YfOStHjLpOzATThrqyAE0lOYsZoHshhnh/djIPN1
         pQzw==
X-Gm-Message-State: APjAAAVe9VQ5fIquhdkCZTWUZCvU17t/FjRBOANSkTHA3iEODoInb68+
        WhvG64qjnnAKb1+xl8+l5fguZLOi2zs=
X-Google-Smtp-Source: APXvYqwYGVy2iawKNV8o99PSXU1pfaV6XdIqzi2nPwLMOf8e7EMXsvES+NnyX8slqS2UGtkSQDAG7Q==
X-Received: by 2002:a1c:3cc2:: with SMTP id j185mr15554020wma.26.1557745618870;
        Mon, 13 May 2019 04:06:58 -0700 (PDT)
Received: from jabjoe-thinkpad.lan ([141.105.200.141])
        by smtp.googlemail.com with ESMTPSA id r64sm29005194wmr.0.2019.05.13.04.06.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 04:06:58 -0700 (PDT)
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
To:     linux-gpio@vger.kernel.org
Cc:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: [PATCH 1/2] Expand MCP23S08 driver for use as interrupt controller.
Date:   Mon, 13 May 2019 12:06:54 +0100
Message-Id: <20190513110655.14920-1-joe.burmeister@devtank.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To be used as interrupt controller, pin control callbacks needed
to setup the registers.

Signed-off-by: Joe Burmeister <joe.burmeister@devtank.co.uk>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 98905d4a79ca..7334d8eb9135 100644
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
@@ -877,7 +890,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		return PTR_ERR(mcp->regmap);
 
 	mcp->chip.base = base;
-	mcp->chip.can_sleep = true;
+	mcp->chip.can_sleep = false;
 	mcp->chip.parent = dev;
 	mcp->chip.owner = THIS_MODULE;
 
-- 
2.20.1

