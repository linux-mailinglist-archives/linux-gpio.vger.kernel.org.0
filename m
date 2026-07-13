Return-Path: <linux-gpio+bounces-40004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xYcFAZRbVWo5nQAAu9opvQ
	(envelope-from <linux-gpio+bounces-40004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 23:41:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6BF74F510
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 23:41:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bxhAkBTg;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40004-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40004-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FE88302AE13
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 21:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0B935CBCB;
	Mon, 13 Jul 2026 21:41:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F1335AC03
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 21:41:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783978897; cv=none; b=Dt3qrAypwE1OsRx8L4ygLttqhuN4QFykvFlQRrdgthMU3i2LdWSy1/nJbBJfZAbLjqD/jZwCEHDL2s/Gv2zSgF3UJm+fKKV3RFcjPrNvtS0ICPjm48dOIK4Iam332cvGZNC0p6J158VJweFJuCBYNjYWcM8CZWiy/okzuK97iqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783978897; c=relaxed/simple;
	bh=W+EwZnLFKVj1h1rZe5PgiDii2PS5+D3kv689Az0HHns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HJplkz2Qrq0CXTlBnAUdn+DUMAzBypou1kxr6t7ECPkAkIFiqV2S/caNJajJx6Elf0NMtrOdO9Jm0bdfLLMtR5cEbtnrm2z+aBUQByIbf7/2rntapw6B0Sdcivp2RRJzKzpNG+RR7BddBJqOIl79tHH4xZpsMF3pWdFXhquLqSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxhAkBTg; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacb8416a1so2449895ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783978895; x=1784583695; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+T9ncXsQofNw87dQE5f2mF+cWycslyRRbsUPole34o=;
        b=bxhAkBTgM1Mx7Bf736Hc1nC1egZvJeLXvKmQMFLJo+3SPFTYwFf/VaJt8XH0OYTyM+
         +JfmQxiBQQzmHXTkrAw6f1kXNMTG8/eJkZCKcs2pBgMxnPUFbEGtESTM3i/R+mff8zhV
         zxSy2gBju6ZGkobXHvJD11Q8MRW6TgAvRzFMDEKx/A4/Xl1e2WqZb/yKG6/t1YOA+GsK
         ZjK84TSR7RS1gKf69dqNJqIr+E5lD+Nkm3MGF+8jqAcph1PbWMeOtrPC7wREaMJgy01n
         o/CpfbtM0Q9pKQ3pwzJ+uItyiWGWoor6VdKhN4XCErlqVtz2JVOjiPPcoxtLwij8xcaj
         0jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783978895; x=1784583695;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+T9ncXsQofNw87dQE5f2mF+cWycslyRRbsUPole34o=;
        b=k3zjgbcPxjSsADI72vBwSqDvP0jyPsOj/rGQgp2WsNRjHEQpGuPUBBSQ6MiUHOXvWH
         aCN4P8AMlmGHdIqJV+XFtIHTyFuHO8BFh07Ht1rF6SLUFIBFtt/H+qQs7ej1Gvy/oP6d
         +RY7iImcjXCluHz/C1A22FEV5NeqV2IOJS1GbCwq5HI6jY7/zEDupvPCISrWtcKxc6Wo
         sHMoKprexSpCkx9fec/WAMDbmbEsR3mVd0sTLqLRzq/jdZu0p1UtFZms/p5oZvNu7kJd
         BU2JR2KRQNmbGpv8ZEGD1bJ9Kie6XQ9b94Ln8KWqb7aLGG+BHczeCZkBeac9/Che2/WR
         OxZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp+AQbe4xyZPeXF+euD3Q/XSutjiYDyXiu+gpMFvhV3nxAh5wN+fkecF9EMmfhC+LNdIImiiOTio3Db@vger.kernel.org
X-Gm-Message-State: AOJu0YyVtZx0cAe/sRQCKsdgmt0pGtfpDcWMOA04Oe56egRnYudpSMYu
	TtHCAH6pxwCCeiYmzOyQi66tPanWiERF1uSUTQgZDAmulVRFbdC2bhzm8nDmXQ==
X-Gm-Gg: AfdE7cmyiTX5Trgr12oi2bka7xYxxBxEPMny0+6Ild1RBCTB4oq6tLx78HPALKqiaLN
	qRy5qGQuHMb3e6YaACDrlywCA7GcroDq2c4GEF+0Jx0AE0Kdap0ELTTprAmvMhogJRDQwO+xotK
	WMay/Si93OwL05UACQ7oSPv7J9rarRW5DITdRdM+Ri/XJDY+diBf/tdOMS5gwTCbiRORCBggxTD
	BbwuUuW1z6sqs6j7HLZnbNDSf9Q4a4QBDmjtQpotdOrF98K3DCPna8s8U3KUHim4SN4XgtJME3N
	P9+Z5NQm9LtjRmADPtrrEVKGedwGkLhu8rn+tRUEF/wsoWY1glGX6OmzZdQrdaoYe6+YgPZMgcI
	6B7L7juxnBN2Cfn5uXQ8ZV184Lt8kbwox2oqI4e7b07CsLlWBnWmZHeaLkKUr9m0cuWNVdiISFp
	9soFBNEsgWyNbB2/c8lmXIcjyyhk4jATXa9hngN26C3/yv6h65HLyxJHQtOWbiwcnJ
X-Received: by 2002:a05:6a20:431b:b0:3a3:327:c5c8 with SMTP id adf61e73a8af0-3c10fc4dac7mr11212239637.0.1783978895328;
        Mon, 13 Jul 2026 14:41:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e15f:5d5f:580b:f2e9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm62379929eec.20.2026.07.13.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:41:34 -0700 (PDT)
Date: Mon, 13 Jul 2026 14:41:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Brown <broonie@kernel.org>, jacopo mondi <jacopo@jmondi.org>, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RESEND PATCH] sh: ecovec24: use static device properties to
 describe the touchscreen
Message-ID: <alUyZ2zVWCPhyHHX@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40004-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:brgl@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:jacopo@jmondi.org,m:linux-sh@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A6BF74F510

Convert the board to use static device properties instead of platform
data to describe the touchscreen, so that support for platform data can
be removed from tsc2007 driver (ecovec24 is the last board using this
mechanism of describing tsc2007).

Device properties do not allow custom board methods, so the method for
getting "pen down" state was removed (the driver is capable of working
without it). If this functionality is needed proper pin control/gpio
support needs to be implemented so that the same pin can serve as an
input GPIO and an interrupt.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

This is a resend of the patch I sent in August of 2024. My fault of not
noticing reply from Adrian inquiring about potential negative impact
from not having GPIO-based "pen down" detection. I believe this is fine,
the "pen down" is an optional feature and the driver can detect the
touches even when it is not specified. Additionally, this is an
evaluation board, so user impact should be negligible.

However the bigger question is whether ecovec24 board still relevant.
According to my research it has the following regressions currently
unfixed:

5716fb9bd9c6 ("mmc: spi: Convert to use GPIO descriptors")
  - MMC SPI device naming broken (broke SD fallback mode)

9fda6693335c ("spi: sh-msiof: Convert to use GPIO descriptors")
  - SPI CS polarity inverted (broke initialization on the MSIOF0 SPI bus)

c2f9b05fd5c1 ("media: arch: sh: ecovec: Use new renesas-ceu camera driver")
  - Camera array sentinel missing (causes out-of-bounds reads and
    potentially kernel panics)
  - Camera standby polarity inverted (enadvertently keeps cameras
    permanently powered off)
  - Camera disabled iby default (board defconfig points to a deleted
    driver)

They are ~6 years old, so I wonder: do people actually *actively* use
this board with modern kernels? Should it simply be removed?

Thanks!

 arch/sh/boards/mach-ecovec24/setup.c | 38 ++++++++--------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index a641e26f8fdf..110a77f903b5 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -26,6 +26,7 @@
 #include <linux/platform_data/tmio.h>
 #include <linux/platform_data/tsc2007.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
 #include <linux/sh_eth.h>
@@ -589,39 +590,21 @@ static struct platform_device keysc_device = {
 /* TouchScreen */
 #define IRQ0 evt2irq(0x600)
 
-static int ts_get_pendown_state(struct device *dev)
-{
-	int val = 0;
-	gpio_free(GPIO_FN_INTC_IRQ0);
-	gpio_request(GPIO_PTZ0, NULL);
-	gpio_direction_input(GPIO_PTZ0);
-
-	val = gpio_get_value(GPIO_PTZ0);
-
-	gpio_free(GPIO_PTZ0);
-	gpio_request(GPIO_FN_INTC_IRQ0, NULL);
-
-	return val ? 0 : 1;
-}
-
-static int ts_init(void)
-{
-	gpio_request(GPIO_FN_INTC_IRQ0, NULL);
-	return 0;
-}
+static const struct property_entry tsc2007_properties[] = {
+	PROPERTY_ENTRY_U32("ti,x-plate-ohms", 180),
+	{ }
+};
 
-static struct tsc2007_platform_data tsc2007_info = {
-	.model			= 2007,
-	.x_plate_ohms		= 180,
-	.get_pendown_state	= ts_get_pendown_state,
-	.init_platform_hw	= ts_init,
+static const struct software_node tsc2007_swnode = {
+	.name = "tsc2007",
+	.properties = tsc2007_properties,
 };
 
 static struct i2c_board_info ts_i2c_clients = {
 	I2C_BOARD_INFO("tsc2007", 0x48),
 	.type		= "tsc2007",
-	.platform_data	= &tsc2007_info,
 	.irq		= IRQ0,
+	.swnode		= &tsc2007_swnode,
 };
 
 static struct regulator_consumer_supply cn12_power_consumers[] =
@@ -1242,8 +1225,9 @@ static int __init arch_setup(void)
 		gpio_direction_output(GPIO_PTF4, 1);
 
 		/* enable TouchScreen */
-		i2c_register_board_info(0, &ts_i2c_clients, 1);
+		gpio_request(GPIO_FN_INTC_IRQ0, NULL);
 		irq_set_irq_type(IRQ0, IRQ_TYPE_LEVEL_LOW);
+		i2c_register_board_info(0, &ts_i2c_clients, 1);
 	}
 
 	/* enable CEU0 */
-- 
2.55.0.795.g602f6c329a-goog


-- 
Dmitry

