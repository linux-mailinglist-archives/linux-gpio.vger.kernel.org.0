Return-Path: <linux-gpio+bounces-35199-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJzGG1UF4WkuogAAu9opvQ
	(envelope-from <linux-gpio+bounces-35199-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 17:50:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D26004113C0
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 17:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41EF4301CFD8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 15:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD402773EC;
	Thu, 16 Apr 2026 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="MCl0POvd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4D219D093
	for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776354586; cv=none; b=kZol7OrhhcYrmzbjGBuM7598MBEw8FykOGC5kTHcvXS1LXX6B9pTB6VSVHivVGhaiEg4SB6lYAXlap3+2ozZfNqWmlzNF5Dd3XF3xCZ4nSs4KRj28wQCuZLuG53cxh6vKSunuqgTboobF3IkrywBvas41y73EMBmcWnp0RIKHPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776354586; c=relaxed/simple;
	bh=dWhMv0IKX0ffGXHPVfzmL6Pyd1ttdQOX1RRmdGuaPuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tMICYo3QEnKl1eLDN2NviKrbPHy9htyCbKuaAXrQw5KcJ0EL4uDujVN7w/TRAyyXpiDI827/4gYxplTxo56pYiS2b4zDQ92zpvTStOSExtMNzfItbxPpWeOjQUw61Bc2KQ6tnvls3Tm4X8Ttz9HMuDpXKKMq79jn+58HKdi6Ub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=MCl0POvd; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1776354578;
 bh=iZdfqgTzXtA3fPbIpl8GLH8neb3096MRhShKVT67buk=;
 b=MCl0POvdl4KVnynmurGEdVkDtm/c1qW5AF5DkD8NZh0TJg6D0xeNwzgvfsaKgi8IHVM3/b2YI
 /wYXvw2MmtY0qwObW/yAYFUYtx6JkyH90KmU5A09wvxv6IvsGpXT6qLHd69Cg8RY5TShEnlB20D
 dOveg6hE8AZ4JtSGStHf++HVSOL4vjc/CzD77wkBNs/m0dbVb5pHXm8dFeJJATLeuWyON4UgyG+
 bkpKwHV6XAxuoaR5FO/XWZe8YNnrK4wKiKq4d7w1vBGLG8VdgasSptSHU5u+Gq+vL9X1uRJT5kr
 fatwDmtQ9PVRVPJp8W75HOFombXGiedXnRkF1l0FIwJA==
X-Forward-Email-ID: 69e1050d06b3fda24d33d578
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.7.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
Date: Thu, 16 Apr 2026 15:49:28 +0000
Message-ID: <20260416154928.2103388-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35199-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ff720000:email,ff788000:email,ff780000:email,ff730000:email]
X-Rspamd-Queue-Id: D26004113C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The commit c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base
allocation") broke GPIO on devices using device trees which don't set
the gpio-ranges property, something only Rockchip RK35xx SoC DTs do.

On a Rockchip RK3399 device something like following is now observed:

[    0.082771] rockchip-gpio ff720000.gpio: probed /pinctrl/gpio@ff720000
[    0.083531] rockchip-gpio ff730000.gpio: probed /pinctrl/gpio@ff730000
[    0.084110] rockchip-gpio ff780000.gpio: probed /pinctrl/gpio@ff780000
[    0.084746] rockchip-gpio ff788000.gpio: probed /pinctrl/gpio@ff788000
[    0.085389] rockchip-gpio ff790000.gpio: probed /pinctrl/gpio@ff790000
--
[    0.212208] rockchip-pinctrl pinctrl: pin 637 is not registered so it cannot be requested
[    0.212271] rockchip-pinctrl pinctrl: error -EINVAL: pin-637 (gpio3:637)
[    0.212344] leds-gpio leds: error -EINVAL: Failed to get GPIO '/leds/led-0'
[    0.212389] leds-gpio leds: probe with driver leds-gpio failed with error -22
--
[    0.607545] rockchip-pinctrl pinctrl: pin 519 is not registered so it cannot be requested
[    0.608775] rockchip-pinctrl pinctrl: error -EINVAL: pin-519 (gpio0:519)
[    0.610003] dwmmc_rockchip fe320000.mmc: probe with driver dwmmc_rockchip failed with error -22
--
[    0.805882] rockchip-pinctrl pinctrl: pin 547 is not registered so it cannot be requested
[    0.806672] rockchip-pinctrl pinctrl: error -EINVAL: pin-547 (gpio1:547)
[    0.807301] reg-fixed-voltage regulator-vbus-typec: error -EINVAL: can't get GPIO
[    0.807307] rockchip-pinctrl pinctrl: pin 602 is not registered so it cannot be requested
[    0.807970] reg-fixed-voltage regulator-vbus-typec: probe with driver reg-fixed-voltage failed with error -22
[    0.808692] rockchip-pinctrl pinctrl: error -EINVAL: pin-602 (gpio2:602)
[    0.810279] reg-fixed-voltage regulator-vcc3v3-pcie: error -EINVAL: can't get GPIO
[    0.810284] rockchip-pinctrl pinctrl: pin 665 is not registered so it cannot be requested
[    0.810299] rockchip-pinctrl pinctrl: error -EINVAL: pin-665 (gpio4:665)
[    0.810960] reg-fixed-voltage regulator-vcc3v3-pcie: probe with driver reg-fixed-voltage failed with error -22
[    0.811679] reg-fixed-voltage regulator-vcc5v0-host: error -EINVAL: can't get GPIO
[    0.813943] reg-fixed-voltage regulator-vcc5v0-host: probe with driver reg-fixed-voltage failed with error -22
--
[    0.867788] rockchip-pinctrl pinctrl: pin 522 is not registered so it cannot be requested
[    0.868537] rockchip-pinctrl pinctrl: error -EINVAL: pin-522 (gpio0:522)
[    0.869166] pwrseq_simple sdio-pwrseq: error -EINVAL: reset GPIOs not ready
[    0.869798] pwrseq_simple sdio-pwrseq: probe with driver pwrseq_simple failed with error -22
--
[    0.940365] rockchip-pinctrl pinctrl: pin 623 is not registered so it cannot be requested
[    0.941084] rockchip-pinctrl pinctrl: error -EINVAL: pin-623 (gpio3:623)
[    0.941823] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: Cannot register the MDIO bus
[    0.942542] rk_gmac-dwmac fe300000.ethernet: error -EINVAL: MDIO bus (id: 0) registration failed
[    0.943772] rk_gmac-dwmac fe300000.ethernet: probe with driver rk_gmac-dwmac failed with error -22

Restore GPIO to a working state on devices using older Rockchip SoCs
and/or DTs not having the gpio-ranges property set by restoring prior
use of bank->pin_base as the pin_offset value.

Also change to use bank->nr_pins as the npins value to align and prevent
a possible future breakage if gc->ngpio is ever changed to match the 32
GPIOs each controller theoretically can handle.

Fixes: c8079f83e0bf ("gpio: rockchip: convert to dynamic GPIO base allocation")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpio/gpio-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 08ea64434f8f..44d7ebd12724 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -617,7 +617,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 			return -ENODEV;
 
 		ret = gpiochip_add_pin_range(gc, dev_name(pctldev->dev), 0,
-					     gc->base, gc->ngpio);
+					     bank->pin_base, bank->nr_pins);
 		if (ret) {
 			dev_err(bank->dev, "Failed to add pin range\n");
 			goto fail;
-- 
2.53.0


