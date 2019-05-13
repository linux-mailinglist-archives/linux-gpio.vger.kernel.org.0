Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 645FD1B563
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 14:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbfEMMAj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 08:00:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36263 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728841AbfEMMAj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 08:00:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id o4so14960468wra.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 May 2019 05:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=devtank-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIPfv7Xwi72lPVyQgz558kp2pr0X5l2wG0qLp9fHfmw=;
        b=cCMVTgBmPR4Lm9wvTZF9En3Bl13V5EImz4YFbOL8nCnDEHhfUts9WT6m/bLlvDO/Xd
         YCwTRa9c7dl9aCQXabQuxiTqWJKyUvnuXFnGC/z+9VZeEZmoeRNgGbutWjoEU9lFxtA1
         cxIhfU037guRSCCw806zKw5beCSkD2Z8zI3rqwoRcU7BhisUkzTFvs2aN6jGxTlJkuF1
         +JOCf2jFbrfveMAyBP2JQArMD0INU0fwiZN3mSS02FjvhFmvzU3PN4BhpC3DK4UdGleh
         w9zdRrL7mW3LLu1W32QT9X9jBIfAQ5CdYkzUyFIa+KqiyQAN8/5mBI9cAM9w2hJM9SnL
         1MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIPfv7Xwi72lPVyQgz558kp2pr0X5l2wG0qLp9fHfmw=;
        b=GkkOZ+tt8HLu+FJbmzVrTBK7k03rjUFzV9LQw+07yC/CSdLgXajHIfqFue8vTxlV36
         KmD835zFwdf16fs14H6pVXrkNHlLJLnUNfCfDaR9jqNmhuoSLRKHL9QMIf5Sn8NjEIi6
         f5PKAszrYPluVr60aS0YIzmgoLt7681Le5z1bvRBARleZyrVaC2OuKpO2XhESiFSXVkS
         heGKHXz77Y6b4e9orQvdaoEZB+yEGtO9+XLcZ2il8BqKfSbEa0sgjduppi5XRBjJx9Fd
         9UifaSrha36dbg2fFo+FlBjBE+3ujnbw+gQji+r0FmILa87QzYZNFhvGPQhrrj4O5EEH
         30gg==
X-Gm-Message-State: APjAAAVPVRzVYJ3ib8e/owlk41olE59TzlLSWB4NeE+xyIzK4VXPhg2W
        i3CXo+APW4EUSyixzIvLw10/6N3uLUc=
X-Google-Smtp-Source: APXvYqx0xRuBkon71Yy7lphb8cRysfDkY6KpcqEqC012meRLLpHD/gzv9hPQv4vjyugSTNyfbYekuQ==
X-Received: by 2002:adf:ce88:: with SMTP id r8mr17579284wrn.191.1557748837352;
        Mon, 13 May 2019 05:00:37 -0700 (PDT)
Received: from jabjoe-thinkpad.lan ([141.105.200.141])
        by smtp.googlemail.com with ESMTPSA id 34sm5000102wre.32.2019.05.13.05.00.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:00:36 -0700 (PDT)
From:   Joe Burmeister <joe.burmeister@devtank.co.uk>
To:     linux-gpio@vger.kernel.org
Cc:     Joe Burmeister <joe.burmeister@devtank.co.uk>
Subject: [PATCH 1/2] (v2) Expand MCP23S08 driver for use as interrupt controller.
Date:   Mon, 13 May 2019 13:00:23 +0100
Message-Id: <20190513120024.17026-1-joe.burmeister@devtank.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To be used as interrupt controller, pin control callbacks needed to
setup the registers.
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

