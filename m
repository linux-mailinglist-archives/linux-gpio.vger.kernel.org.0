Return-Path: <linux-gpio+bounces-31794-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFxWK0zClWmBUgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31794-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 14:44:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB17156CCF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 14:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D918D300D46F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 13:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9DE32721D;
	Wed, 18 Feb 2026 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrPVXGe+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ECC25F984;
	Wed, 18 Feb 2026 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422282; cv=none; b=HUA9mrF0Fbs5brXosWZG5T9/QoJ+PGrvFiGo93ROIgjW0j8iUgLD1OYE6gr+4llxnbF4eWB+bJtuSE7teRcwsK+TMNtPR58CE0NdW2VT79RUxPrAAbVCuTQBdpIKI03s7y6WfFzOyoDl6/BbG+X3w0DreDTW8ItP9iJXV0YXWiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422282; c=relaxed/simple;
	bh=LRzf+tcHihPY5HIRGI/oAgg3YAIzSJscQ/e9XCC8eJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S+7FyaL2TKlPbgQfJcbhescKNbokZhNXmB2yV6Jynm3ALUTTJPdqsqekFPM5wdN1JPowQ5sILLC4qj5cRyj1BnkLUU6rLCCGm80wf8aRZlJVuN8HE7L6NMAU+W2bxVHEjw8C//yiI+wZ0n2OjDGw4SzTxn7B9vk0N0fBkSWOVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrPVXGe+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DE1C19421;
	Wed, 18 Feb 2026 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771422281;
	bh=LRzf+tcHihPY5HIRGI/oAgg3YAIzSJscQ/e9XCC8eJY=;
	h=From:Date:Subject:To:Cc:From;
	b=lrPVXGe+RbFh9EYOXmJL5xXbuYXW1Q6+/aNlcf4FSk83DVoAQc/DDNLBUy3ePiuo2
	 OoZJMa6j/TgaFfRg/H4HY8dGo6QqnYqaTtl41swVzR5KmqI5LQjpu+Fx2M1jsXLWIs
	 7vkWjs4+iI3eWJfvgwXMxpobcmq5+4oFrWGctJHbGGzxgrxBcBU6oWV8FrYTet05el
	 gUOpsgidBAQvS9M/QgsBPoRO5B22xfvNg/9vbAfnhFKrkbH/XiZPi0gA8cIkjewK75
	 SX5DrprmyjWGH7ex26KBesxR82Ew+vtGOnkRdrooz+w0KuNVfO17ZkdUtnUxTU6E6Y
	 ZVADNmw792ZGw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Feb 2026 14:44:38 +0100
Subject: [PATCH] HID: mcp2221: Add module parameter to enfoce GPIO mode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-hid-mcp2221-gpio-v1-1-a2ba53867354@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBvQKUy6SrQIG2sWqShEIN09a
 fkW/1conIULzF2FzLcUiaFB9x24cwsHo+zNQIqMIm3xlB0vl4hI45Ek4mj85PRmButGaFnK7OX
 5l8v6vh/yYELzYgAAAA==
X-Change-ID: 20260218-hid-mcp2221-gpio-46f7c1a638c4
To: Rishi Gupta <gupt21@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31794-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2EB17156CCF
X-Rspamd-Action: no action

Add a module parameter to MCP2221 to enfor GPIO mode on the
general purpose pins GP0 thru GP3.

If I plug a device of this type into my machine, it will use the
GP0, GP1, GP2 and GP3 pins for IIO voltage readings by default
if CONFIG_IIO is set.

However there may be cases where IIO is available but we want to
use the GP0 thru GP3 lines for GPIO anyway.

Example use:

insmode hid-mcp2221.ko gpio_mode_enforce=1

Result in dmesg:
mcp2221 0003:04D8:00DD.0005: GPIO 0 not in gpio mode
mcp2221 0003:04D8:00DD.0005: GPIO 1 not in gpio mode
mcp2221 0003:04D8:00DD.0005: GPIO 2 not in gpio mode
mcp2221 0003:04D8:00DD.0005: GPIO 3 not in gpio mode
mcp2221 0003:04D8:00DD.0005: Set GPIO mode for gpio pin 0!
mcp2221 0003:04D8:00DD.0005: Set GPIO mode for gpio pin 1!
mcp2221 0003:04D8:00DD.0005: Set GPIO mode for gpio pin 2!
mcp2221 0003:04D8:00DD.0005: Set GPIO mode for gpio pin 3!

After this the gpiolib tools such as gpioset can be used to alter
the GPIO line values successfully.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/hid/hid-mcp2221.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 33603b019f97..58695f3f9e9d 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -19,8 +19,15 @@
 #include <linux/gpio/driver.h>
 #include <linux/iio/iio.h>
 #include <linux/minmax.h>
+#include <linux/moduleparam.h>
 #include "hid-ids.h"
 
+static bool gpio_mode_enforce;
+
+module_param(gpio_mode_enforce, bool, 0644);
+MODULE_PARM_DESC(gpio_mode_enforce,
+	 "Enfore GPIO mode for GP0 thru GP3 (default: false, will be used for IIO)");
+
 /* Commands codes in a raw output report */
 enum {
 	MCP2221_I2C_WR_DATA = 0x90,
@@ -648,7 +655,7 @@ static int mcp2221_check_gpio_pinfunc(struct mcp2221 *mcp)
 	int needgpiofix = 0;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_IIO))
+	if (IS_ENABLED(CONFIG_IIO) && !gpio_mode_enforce)
 		return 0;
 
 	ret = mcp_gpio_read_sram(mcp);
@@ -1043,7 +1050,8 @@ static void mcp2221_remove(struct hid_device *hdev)
 #if IS_REACHABLE(CONFIG_IIO)
 	struct mcp2221 *mcp = hid_get_drvdata(hdev);
 
-	cancel_delayed_work_sync(&mcp->init_work);
+	if (!gpio_mode_enforce)
+		cancel_delayed_work_sync(&mcp->init_work);
 #endif
 }
 
@@ -1317,8 +1325,10 @@ static int mcp2221_probe(struct hid_device *hdev,
 #endif
 
 #if IS_REACHABLE(CONFIG_IIO)
-	INIT_DELAYED_WORK(&mcp->init_work, mcp_init_work);
-	schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(100));
+	if (!gpio_mode_enforce) {
+		INIT_DELAYED_WORK(&mcp->init_work, mcp_init_work);
+		schedule_delayed_work(&mcp->init_work, msecs_to_jiffies(100));
+	}
 #endif
 
 	return 0;

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260218-hid-mcp2221-gpio-46f7c1a638c4

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


