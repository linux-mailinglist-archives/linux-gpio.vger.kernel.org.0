Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1418C24D6E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 13:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbfEULBC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 07:01:02 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52201 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfEULBB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 May 2019 07:01:01 -0400
Received: by mail-wm1-f68.google.com with SMTP id c77so2512972wmd.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 May 2019 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xx1/BNKJkSZTh4qrBNcdndPwRJoZAQ0lryCakBXnIco=;
        b=SpZQwNgTSRiyQ6DY71OthziA8T03QR2+sh0+duUHXKDE9w/FfK9+SFj3tePZpI9t+X
         CB/aZijQou+wqa4zF0s5d36LQeQHrstYNbrCYtcO5pu+n9vA1NjvSDBSY0hNQA7/9T5T
         ArKvOMvH8+5sofSjvaUs7CRYxuMbrXTAWVEsoeNKTuhiq4VXX8jPnaYXxj1pdMz5NQmg
         mPGtv5RT9cx4VJhcvRw+QodTvplja5/NsTjFTEQ3cg2uR989zTzXNe9VHltZwQndwsfx
         RqnixB2C7NwbA2PQ33r7/3skJLfkuNRvqI8Bsyw24c2WpdZDwkozV1Wf0LaejCnJS+13
         +X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xx1/BNKJkSZTh4qrBNcdndPwRJoZAQ0lryCakBXnIco=;
        b=fytnRMxtvx84i9ZftfiFslx8Dl7WG0hntjmbiYmsPGS+2wddffzmeOVGTCIMFad/mn
         1grNJL2GkoCvydpYc3cK6hal6vw19j6F9wScK+xPWXzVOuaH3egEZSfsCAX1AQlFOuRf
         7TPbCY1nggYoiQC8oSJQr/ykjgWL8Yy5MdFmXCgZ1kMp62qVpfbjsJSDWpddcyrjnixc
         C0Tr4nT3xJDQPSw8zaWScThhPH/2Dxmt0Elcs4UZNvQqwhOnr642qiCM0i2M8r32XPj5
         r9Efqpq7Lf3CWBwMKNKxtsq7uXDMUzVyqaqF3S4SJQVUieSLj79RGYgqdGecD6GdLkJG
         lB9w==
X-Gm-Message-State: APjAAAV8+nBON4HitYMYHYKaaFq94WBNCwXY5qBEH69OWUFqSye3d//U
        Oi/+6QMmEufKbSaTUbR4eJM2rKhn5UE=
X-Google-Smtp-Source: APXvYqzw1jEkF3nq2qnkwFc/juGl3uCqe8Ce2/dmybDnG8a+n7Nxy9/Mu4fa0cAyf1uY/R+/Ep4U3g==
X-Received: by 2002:a05:600c:23d2:: with SMTP id p18mr2866724wmb.66.1558436459723;
        Tue, 21 May 2019 04:00:59 -0700 (PDT)
Received: from jabjoe-thinkpad.lan ([141.105.200.141])
        by smtp.googlemail.com with ESMTPSA id u7sm7278270wmg.25.2019.05.21.04.00.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 04:00:59 -0700 (PDT)
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
To:     linux-gpio@vger.kernel.org
Cc:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: [PATCH] Expand MCP23S08 driver for use as interrupt controller.(v3)
Date:   Tue, 21 May 2019 12:00:51 +0100
Message-Id: <20190521110051.3295-1-joe.burmeister@devtank.co.uk>
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

