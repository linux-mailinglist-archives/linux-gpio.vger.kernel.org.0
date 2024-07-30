Return-Path: <linux-gpio+bounces-8469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B4942378
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 01:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7793E1C23088
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 23:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B5A194123;
	Tue, 30 Jul 2024 23:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ek-dev.de header.i=@ek-dev.de header.b="gsmNAw5y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from server.cpprotect6.de (server.cpprotect6.de [185.225.135.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C72E18CC03;
	Tue, 30 Jul 2024 23:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.225.135.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722382706; cv=none; b=F6AjBF1hGSilsFEhnojG6eHS7QBBVJ0XCoaVNXxWngr2bzFO23+e5wDWyiKPDf2qWU/P7RcwtONcfpIh2qpHbaW96eekRurBIGI+O/k5/ClQYIfHV4YGcZ5oqMGN2Gxi+erDuWHfmXCXiuzrWReDTzuZS0oSCdu/TLmvboljn/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722382706; c=relaxed/simple;
	bh=3X/NlXDhom883Ym0Q2HQWNCIX5xq5rdeIKix2YEq0eo=;
	h=To:Cc:From:Subject:Message-ID:Date:MIME-Version:Content-Type; b=bbTkmg4KyZzNi196e7FJzzfvlH1KNU2ABjDVMj2Ync+AYdygBuin+np1mSlD5aP2fRbOT6ha12YBmgHzTJTMiGK3DdztJw+wXLsgsB3Nh5q0/V6ljnPJZTj1KbGeGtPsRTjN4yUrA8qZYtIhBJHPSTQtRBiodNnQaC5nCytIkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ek-dev.de; spf=pass smtp.mailfrom=ek-dev.de; dkim=pass (2048-bit key) header.d=ek-dev.de header.i=@ek-dev.de header.b=gsmNAw5y; arc=none smtp.client-ip=185.225.135.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ek-dev.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ek-dev.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ek-dev.de;
	s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
	Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ub6bitsfL2bAe5/YRicKaZIw/i3hZpWx6GHxBHvGEyA=; b=gsmNAw5yg7n9mouaiGJabU+beo
	KuVmXd10GVhqGE8H2aww3DrUPCBP4cPEc8EOiIdYzRpXKkl2m4sKHiwyuSZ+Lj+YZlym2wwefsca6
	NgN/1nRO4tu4Dx9fHpo/vnyqyGvtcrVpt5f85W5sfMjyoT3zKBZk26RrIU6ZC95e5ADbj95ARxLrq
	LcuTpGx3ClSiCZcFIly7kX/kMySjXZTZG01U2Hw0BJ3oaodFNcrz7Um2OyGRi4D2RQrv3o+cIFVQE
	j24o5w1Ii7aVSmnh6Hpbk5R9OKeesUutOrAYrHv3C5AomTk1WzUhkA4XkptFwFO6TTz/Qd+CagPu+
	2TdEqTnA==;
Received: from p508fb154.dip0.t-ipconnect.de ([80.143.177.84]:50278 helo=[192.168.178.50])
	by server.cpprotect6.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.97.1)
	(envelope-from <thomas.blocher@ek-dev.de>)
	id 1sYw53-00000002x2n-49ST;
	Wed, 31 Jul 2024 01:16:36 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: Thomas Blocher <thomas.blocher@ek-dev.de>
Subject: [PATCH] pinctrl: at91: make it work with current gpiolib
Message-ID: <5b992862-355d-f0de-cd3d-ff99e67a4ff1@ek-dev.de>
Date: Wed, 31 Jul 2024 01:16:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.cpprotect6.de
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ek-dev.de
X-Get-Message-Sender-Via: server.cpprotect6.de: authenticated_id: thomas.blocher@ek-dev.de
X-Authenticated-Sender: server.cpprotect6.de: thomas.blocher@ek-dev.de
X-Source: 
X-Source-Args: 
X-Source-Dir: 

pinctrl-at91 currently does not support the gpio-groups devicetree
property and has no pin-range.
Because of this at91 gpios stopped working since patch
commit 2ab73c6d8323fa1e ("gpio: Support GPIO controllers without pin-ranges")
This was discussed in the patches
commit fc328a7d1fcce263 ("gpio: Revert regression in sysfs-gpio (gpiolib.c)")
commit 56e337f2cf132632 ("Revert "gpio: Revert regression in sysfs-gpio (gpiolib.c)"")

As a workaround manually set pin-range via gpiochip_add_pin_range() until
a) pinctrl-at91 is reworked to support devicetree gpio-groups
b) another solution as mentioned in
commit 56e337f2cf132632 ("Revert "gpio: Revert regression in sysfs-gpio (gpiolib.c)"")
is found

Signed-off-by: Thomas Blocher <thomas.blocher@ek-dev.de>
---
 drivers/pinctrl/pinctrl-at91.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index b3c3f5fb2e2e..93ab277d9943 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1403,8 +1403,11 @@ static int at91_pinctrl_probe(struct platform_device *pdev)
 
 	/* We will handle a range of GPIO pins */
 	for (i = 0; i < gpio_banks; i++)
-		if (gpio_chips[i])
+		if (gpio_chips[i]) {
 			pinctrl_add_gpio_range(info->pctl, &gpio_chips[i]->range);
+			gpiochip_add_pin_range(&gpio_chips[i]->chip, dev_name(info->pctl->dev), 0,
+				gpio_chips[i]->range.pin_base, gpio_chips[i]->range.npins);
+		}
 
 	dev_info(dev, "initialized AT91 pinctrl driver\n");
 

base-commit: c91a7dee0555f6f9d3702d86312382e4c4729d0a
-- 
2.30.2


