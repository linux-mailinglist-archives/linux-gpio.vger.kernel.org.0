Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CA21A85A2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2020 18:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439869AbgDNQsd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Apr 2020 12:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440039AbgDNQsa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Apr 2020 12:48:30 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F17DC061A0C;
        Tue, 14 Apr 2020 09:48:30 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ay6so2890483pjb.0;
        Tue, 14 Apr 2020 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Bi99qAi48G22a67oDOvX8KlGshqRvGxoHEsTVpbL5dI=;
        b=ZnVBhoFn9z6HnvVhPA2/ThWZMjWCRzaYIE2bVZUXtpl+C66EYzX9Wp++J9SWLione8
         F2L0laXw2dDaWO9Bl7OP9A4iWzKY77iNVPYMrC1AEg+3WaTWPz3KD+fBuXCKEMMU4NF0
         bKd1xbPKc/Zei4IovL/Q9LPqiD/JAU2k11MPv4CGkWJlONShx7fFCwT+4YFiPRdPnY+d
         +a459hGG/a3wfRPoKcEuLnaGivSBkWZaVqs0YZjiOWxUvieSBVWx9MCzHWF5zRqBeXxp
         pFC+aWw65lElbbslhoDbM9KEWng9M6BgiTBT4MZn75EUVaiMhx8lsuH8oOqqZV+Mln+M
         B3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Bi99qAi48G22a67oDOvX8KlGshqRvGxoHEsTVpbL5dI=;
        b=Sh03drzfAE9B9AlNS+TkEPQbOGLVYW+mUahnDrN8wiKaMHfBX2yWHqpIa+e+zotK+e
         0G3lU2wUy2jsBi0YYqODp+/6SsB+qs0K7R5jHUg4LRUvz+lyLn2qEwtwgfSzbi02rq4r
         rPVJFEYnlLyLLoS3Lv3KR7UD8gE2x2xsSrRcYeYAWU01cyCT9cnxPnzLEVL/qok01mk8
         fyaiB2FL2H/q6PuA/yxKhQQy6kDyXtlPaaTJe0hcLeDsGkUMg+T/NIFXnRldoA0j5T30
         5/49tKJbkRIfqrfydZEUpngUmCG40ihaOT5qbiSP7fKmm2xaiFU1DOygrQAWX2uQUWkF
         2YdA==
X-Gm-Message-State: AGi0PuaYDxY9IQxhypOMP8Z6E5j2MfHN6h3pWUrSLqEMQ2Dg1hmRQEsR
        oa1jT+PC+XKvSNCQLqDejJEfPPw0Y1E=
X-Google-Smtp-Source: APiQypKNH3cxL/ORhZQPKFOs/upSB/tmbxxcoa+otSGlYdN27fy20e0G4BeN8qzoDDcGl0cUjV6SvA==
X-Received: by 2002:a17:902:b785:: with SMTP id e5mr715454pls.31.1586882909728;
        Tue, 14 Apr 2020 09:48:29 -0700 (PDT)
Received: from localhost.localdomain ([49.207.50.207])
        by smtp.gmail.com with ESMTPSA id k24sm11292993pfk.164.2020.04.14.09.48.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Apr 2020 09:48:28 -0700 (PDT)
From:   Rishi Gupta <gupt21@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, Rishi Gupta <gupt21@gmail.com>
Subject: [PATCH 1/1] HID: mcp2221: add GPIO functionality support
Date:   Tue, 14 Apr 2020 22:18:14 +0530
Message-Id: <1586882894-19905-1-git-send-email-gupt21@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

MCP2221 has 4 pins that can be used as GPIO or configured
for alternate functionality such as clock generation and
IRQ detection. This patch adds support for GPIO functionality.

To set direction of a pin or to toggle its state after it
has been configured as GPIO, driver sends command to mcp2221
and parses response received from mcp2221. Based on this
response either 0 or appropriate error code is returned to
GPIO framework.

To get the direction or current state of a pin, driver
sends command and read response from the device. Based on
the response received from device direction or value
is sent to the GPIO framework.

Command from driver to mcp2221 device are output report.
Response received from mcp2221 is input report.

Datasheet (page 45-48) contains details about how to decode
the response received from device:
http://ww1.microchip.com/downloads/en/DeviceDoc/20005565B.pdf

Signed-off-by: Rishi Gupta <gupt21@gmail.com>
---
 drivers/hid/hid-mcp2221.c | 169 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index d958475..e1b93ce3 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -15,6 +15,7 @@
 #include <linux/hid.h>
 #include <linux/hidraw.h>
 #include <linux/i2c.h>
+#include <linux/gpio/driver.h>
 #include "hid-ids.h"
 
 /* Commands codes in a raw output report */
@@ -27,6 +28,8 @@ enum {
 	MCP2221_I2C_PARAM_OR_STATUS	= 0x10,
 	MCP2221_I2C_SET_SPEED = 0x20,
 	MCP2221_I2C_CANCEL = 0x10,
+	MCP2221_GPIO_SET = 0x50,
+	MCP2221_GPIO_GET = 0x51,
 };
 
 /* Response codes in a raw input report */
@@ -42,6 +45,8 @@ enum {
 	MCP2221_I2C_WRADDRL_SEND = 0x21,
 	MCP2221_I2C_ADDR_NACK = 0x25,
 	MCP2221_I2C_READ_COMPL = 0x55,
+	MCP2221_ALT_F_NOT_GPIOV = 0xEE,
+	MCP2221_ALT_F_NOT_GPIOD = 0xEF,
 };
 
 /*
@@ -59,6 +64,9 @@ struct mcp2221 {
 	int rxbuf_idx;
 	int status;
 	u8 cur_i2c_clk_div;
+	struct gpio_chip *gc;
+	u8 gp_idx;
+	u8 gpio_dir;
 };
 
 /*
@@ -526,6 +534,110 @@ static const struct i2c_algorithm mcp_i2c_algo = {
 	.functionality = mcp_i2c_func,
 };
 
+static int mcp_gpio_get(struct gpio_chip *gc,
+				unsigned int offset)
+{
+	int ret;
+	struct mcp2221 *mcp = gpiochip_get_data(gc);
+
+	mcp->txbuf[0] = MCP2221_GPIO_GET;
+
+	mcp->gp_idx = (offset + 1) * 2;
+
+	mutex_lock(&mcp->lock);
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
+static void mcp_gpio_set(struct gpio_chip *gc,
+				unsigned int offset, int value)
+{
+	struct mcp2221 *mcp = gpiochip_get_data(gc);
+
+	memset(mcp->txbuf, 0, 18);
+	mcp->txbuf[0] = MCP2221_GPIO_SET;
+
+	mcp->gp_idx = ((offset + 1) * 4) - 1;
+
+	mcp->txbuf[mcp->gp_idx - 1] = 1;
+	mcp->txbuf[mcp->gp_idx] = !!value;
+
+	mutex_lock(&mcp->lock);
+	mcp_send_data_req_status(mcp, mcp->txbuf, 18);
+	mutex_unlock(&mcp->lock);
+}
+
+static int mcp_gpio_dir_set(struct mcp2221 *mcp,
+				unsigned int offset, u8 val)
+{
+	memset(mcp->txbuf, 0, 18);
+	mcp->txbuf[0] = MCP2221_GPIO_SET;
+
+	mcp->gp_idx = (offset + 1) * 5;
+
+	mcp->txbuf[mcp->gp_idx - 1] = 1;
+	mcp->txbuf[mcp->gp_idx] = val;
+
+	return mcp_send_data_req_status(mcp, mcp->txbuf, 18);
+}
+
+static int mcp_gpio_direction_input(struct gpio_chip *gc,
+				unsigned int offset)
+{
+	int ret;
+	struct mcp2221 *mcp = gpiochip_get_data(gc);
+
+	mutex_lock(&mcp->lock);
+	ret = mcp_gpio_dir_set(mcp, offset, 0);
+	mutex_unlock(&mcp->lock);
+
+	return ret;
+}
+
+static int mcp_gpio_direction_output(struct gpio_chip *gc,
+				unsigned int offset, int value)
+{
+	int ret;
+	struct mcp2221 *mcp = gpiochip_get_data(gc);
+
+	mutex_lock(&mcp->lock);
+	ret = mcp_gpio_dir_set(mcp, offset, 1);
+	mutex_unlock(&mcp->lock);
+
+	/* Can't configure as output, bailout early */
+	if (ret)
+		return ret;
+
+	mcp_gpio_set(gc, offset, value);
+
+	return 0;
+}
+
+static int mcp_gpio_get_direction(struct gpio_chip *gc,
+				unsigned int offset)
+{
+	int ret;
+	struct mcp2221 *mcp = gpiochip_get_data(gc);
+
+	mcp->txbuf[0] = MCP2221_GPIO_GET;
+
+	mcp->gp_idx = (offset + 1) * 2;
+
+	mutex_lock(&mcp->lock);
+	ret = mcp_send_data_req_status(mcp, mcp->txbuf, 1);
+	mutex_unlock(&mcp->lock);
+
+	if (ret)
+		return ret;
+
+	if (mcp->gpio_dir)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
 /* Gives current state of i2c engine inside mcp2221 */
 static int mcp_get_i2c_eng_state(struct mcp2221 *mcp,
 				u8 *data, u8 idx)
@@ -638,6 +750,39 @@ static int mcp2221_raw_event(struct hid_device *hdev,
 		complete(&mcp->wait_in_report);
 		break;
 
+	case MCP2221_GPIO_GET:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			if ((data[mcp->gp_idx] == MCP2221_ALT_F_NOT_GPIOV) ||
+				(data[mcp->gp_idx + 1] == MCP2221_ALT_F_NOT_GPIOD)) {
+				mcp->status = -ENOENT;
+			} else {
+				mcp->status = !!data[mcp->gp_idx];
+				mcp->gpio_dir = !!data[mcp->gp_idx + 1];
+			}
+			break;
+		default:
+			mcp->status = -EAGAIN;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
+	case MCP2221_GPIO_SET:
+		switch (data[1]) {
+		case MCP2221_SUCCESS:
+			if ((data[mcp->gp_idx] == MCP2221_ALT_F_NOT_GPIOV) ||
+				(data[mcp->gp_idx - 1] == MCP2221_ALT_F_NOT_GPIOV)) {
+				mcp->status = -ENOENT;
+			} else {
+				mcp->status = 0;
+			}
+			break;
+		default:
+			mcp->status = -EAGAIN;
+		}
+		complete(&mcp->wait_in_report);
+		break;
+
 	default:
 		mcp->status = -EIO;
 		complete(&mcp->wait_in_report);
@@ -702,8 +847,32 @@ static int mcp2221_probe(struct hid_device *hdev,
 	}
 	i2c_set_adapdata(&mcp->adapter, mcp);
 
+	/* Setup GPIO chip */
+	mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
+	if (!mcp->gc) {
+		ret = -ENOMEM;
+		goto err_gc;
+	}
+
+	mcp->gc->label = "mcp2221_gpio";
+	mcp->gc->direction_input = mcp_gpio_direction_input;
+	mcp->gc->direction_output = mcp_gpio_direction_output;
+	mcp->gc->get_direction = mcp_gpio_get_direction;
+	mcp->gc->set = mcp_gpio_set;
+	mcp->gc->get = mcp_gpio_get;
+	mcp->gc->ngpio = 4;
+	mcp->gc->base = -1;
+	mcp->gc->can_sleep = 1;
+	mcp->gc->parent = &hdev->dev;
+
+	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
+	if (ret)
+		goto err_gc;
+
 	return 0;
 
+err_gc:
+	i2c_del_adapter(&mcp->adapter);
 err_i2c:
 	hid_hw_close(mcp->hdev);
 err_hstop:
-- 
2.7.4

