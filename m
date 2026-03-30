Return-Path: <linux-gpio+bounces-34426-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FAkMyVNymmb7QUAu9opvQ
	(envelope-from <linux-gpio+bounces-34426-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 12:15:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FC358FD0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 12:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F35230091CC
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 10:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C326B2C21C2;
	Mon, 30 Mar 2026 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="BrFMQqF5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m3269.qiye.163.com (mail-m3269.qiye.163.com [220.197.32.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF13E3B8BB1
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865335; cv=none; b=nybo1OqBdMKBXQpOFxcyiGv0J/6Ua0oGMgrnzCObbmr/VNjd3rFPTrioPuI1DTbIjhJo149MUS2Yp8lZyqToGViqDX9GijsY6Shd1s2U3n1+kJfJg6EJq7/+K2cvisN8mdECkM0btbQ4gOhWQ31PGjpE5MKVCI7bS78ZGlXmDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865335; c=relaxed/simple;
	bh=EnGv9fwAu+qOd2TBv7rbXm8NPbXre/r07erLTstlZ/I=;
	h=From:To:Cc:Subject:Date:Message-Id; b=JVdCOWtJ6nah93qxP2ihrq3E3Kq/8GWZctpG9yoDPQBXenFJbVXG1VSgd9hOVLXAnRgbuW5fl69RWSrohyRJ4ou8CTHnr5MWv2WX41eGGHljnMdPrciXACB2cd1AjpdE7HK4y4OKKhw2xIxMLNWryeYW8HR0Uy5Q1J84oGDsDkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=BrFMQqF5; arc=none smtp.client-ip=220.197.32.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38d16663a;
	Mon, 30 Mar 2026 17:53:24 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ye.zhang@rock-chips.com,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH] gpio: rockchip: convert to dynamic GPIO base allocation
Date: Mon, 30 Mar 2026 17:53:21 +0800
Message-Id: <1774864401-177149-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0a9d3e298fef09cckunm3d006f22e5d629
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk4YHVZJHx0YSU5CT0xMTxpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BrFMQqF5bRKjh0JmY4iB/LDDmGcn6MJoWAHKs5H1YMW0F8vRIpWmTsD4IXVZN2Hg3Gm2YbsZNWhiFfwFziOJfdy4ttNQ43f4cSXvHjVfA74mvgfImveYUoTss44vUUSu17psdCPFs1CS7VvKlhUHEqhpRZUTKGQhZ1JcCANw0/4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=zBgjeDrg+peaeJ/KCAvRmYyV+lBFW34M3AWXK7qHhu0=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34426-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shawn.lin@rock-chips.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 357FC358FD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This driver is used on device tree based platform. Use dynamic
GPIO numberspace base to suppress the warning:

gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/gpio/gpio-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index ac1b939..08ea644 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -582,7 +582,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	bank->gpio_chip = rockchip_gpiolib_chip;
 
 	gc = &bank->gpio_chip;
-	gc->base = bank->pin_base;
+	gc->base = -1;
 	gc->ngpio = bank->nr_pins;
 	gc->label = bank->name;
 	gc->parent = bank->dev;
-- 
2.7.4


