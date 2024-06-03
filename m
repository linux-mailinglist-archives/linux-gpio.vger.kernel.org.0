Return-Path: <linux-gpio+bounces-7085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF028D8884
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 20:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D1071C21C2B
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 18:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55F21386AB;
	Mon,  3 Jun 2024 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Sr+KVKPt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20813440A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 18:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717438824; cv=none; b=ejPQxtw0qYUFul8tT9zQa6YVm3evjK9e3TMtLDvsrqZEM4m5Ux2e+rVZDcL5KKxBAIpP/4QejDBHGnlZAvZNrFRctqTsC9CGdEE/QqiRh42Njnui/9vPq7cO9vYQ5/ftKlakbltGSXbpBD7uHnZu3ESv7rRc/GG2/GF9CG8o2pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717438824; c=relaxed/simple;
	bh=6bUdGXU2A6onMeytnb3GO73q7Ar8QShjy7dwB5dI9sQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FKulT6Cq+MQeU637+xCFoxofKCKRpIAiuRo+cbBUYzLYDgx2+MFRHCMkOndckUQPqzRJw8xWeWIoXp9mFHITRy1MODF435Ppo7u3lWCyE+5o7h1YE0EQ8JNtfZAQhHkUl1fNGluZZSg7H8fF8EWwY/xbZJARGxY3P7gc4QnGFig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Sr+KVKPt; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717438809; x=1718043609; i=wahrenst@gmx.net;
	bh=6bUdGXU2A6onMeytnb3GO73q7Ar8QShjy7dwB5dI9sQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Sr+KVKPtdIg5/TA9Xht3YbJDTYP+ri6PMEdkK9N+4ICk8sJEy9AzA/0Uld9ce9/t
	 xWY8H6OcfWzKBxRHodJ2zZlEGtxKP9wqkNzywOibrvs5vWsF9Mi/gBzkvUnQNU6hy
	 sJM/Xe+We+18dIXP3aUwF8iNWN3ZfXh29Z6pHoNExukUEAFK0pb0oK+QVIY6Rxj6q
	 VcWnqXT5Iy5IIoXOqCHPgzOpVIL+zkU5rlHiA+jOYMz7kOBYBJN5pFRyQxG45NZPl
	 DCqlIbPSI0zhaymEPr/IsSim2tdQP2Gwfdr+vbcArHPP5t74GNhtA27CxvRvdN1EW
	 ZGh+54JJ0pPKHCdTjg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MjjCL-1stsu21qrD-00kBK8; Mon, 03
 Jun 2024 20:20:09 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Phil Elwell <phil@raspberrypi.com>,
	Kent Gibson <warthog618@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 1/2] pinctrl: bcm2835: Fix permissions of persist_gpio_outputs
Date: Mon,  3 Jun 2024 20:19:37 +0200
Message-Id: <20240603181938.76047-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603181938.76047-1-wahrenst@gmx.net>
References: <20240603181938.76047-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kSJyPk7F/4DwdX9PvDTr/PmZ6Qa/w7uaaHLq9hcbz6gkB4wmbr/
 vDOSDCGdatKPxpmW1taxJJK7UWU14ImSGtqK7LcoIozqxqXRaRIia03hPoGL8GVz797M0qy
 BBjQo7azAe5yafxzME7RGUwBBYMFEFqZVyLIAFrlyZlIzF7HrhFX/HLk0e7Zt2HiZek5ks+
 kc7yl/vPxe043lHTaRhqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6riRGvs0ng8=;02FUQSx1yhxhC5w7bcubTvWBIPe
 Fp9lRPLspi64sKc6G/25kmiwDuKMoRhbOSuD2bCYhwl8gGo11ZPmA33NKLGOdpkgauiPzmF24
 gw5oqOyC/c/zajapqWelFlGIWRoUJGcJGxapTcHOeqNFB2D4sYbU1hnmXpNFbIj3O72S/tatm
 Hg2UVIoNzuj9veXkP5oMgUuRq18DWYITs4JXVINsda/sTUnAu/Gvd0Jw3eUF496eQPEka3Abo
 BpPbAkefDUkQzbfNsHGXCpLqHyGVovCSQI7rY2NL2mO2wjFM1tvUudeC3f6msTXhVPsQO+HYU
 FrN4J3trw4GWcbM8TLldDhKk63XiyZJmL8fpp5CBgUthDwMpS/79suShhccR98fIWkIRCspR6
 FwG2LkH7LMIL/QhCq0ysxE6ziLe20ynUJums42ji/MpsTjmzz/cgWH4BHBfK7eVFaK1bDr0Pv
 ffBT8In739q8AEWr3I3OKYIKSWa0vcTdKLdNNNtX4FORAKRptK8ec5AUWrUvsEIyUGvn1Z87p
 K590xOB4zpcGyFjUarqORHUqcRRSJrEflbQIeKrX609feXnQ+kT84DbWvpy83cqEdZxilAtOH
 IZ4YpullkQFjyQ+IdIQOUoJu971DZwP3ENDawqfbxOLk6e5ZQg+9PcZJ2ZAXIabIlg2tLSdO1
 LVmWABFiSZ+/kUAI+FO1hKfNTpcmBbZjhJ0L+3tFotQ5/dMt11yvP6Hd4vSV+YasyE6K8iti2
 r9S2dv3kIj09Xx/ybpCSRCAZf4zQt5G/+YGi9gV99ksBOWvKfPqHIiGnDJb+O55C5mLBWNqR7
 muH9bNvYCDww2NpchH8KVe9r4ZnEg2+ZunKE+JukQTSXc=

The commit 8ff05989b44e ("pinctrl: bcm2835: Make pin freeing behavior
configurable") unintentionally made the module parameter
persist_gpio_outputs changeable at runtime. So drop the write permission
in order to make the freeing behavior predictable for user applications.

Fixes: 8ff05989b44e ("pinctrl: bcm2835: Make pin freeing behavior configur=
able")
Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Closes: https://lore.kernel.org/linux-gpio/Zjk-C0nLmlynqLAE@surfacebook.lo=
caldomain/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index 7178a38475cc..27fd54795791 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -245,7 +245,7 @@ static const char * const irq_type_names[] =3D {
 };

 static bool persist_gpio_outputs;
-module_param(persist_gpio_outputs, bool, 0644);
+module_param(persist_gpio_outputs, bool, 0444);
 MODULE_PARM_DESC(persist_gpio_outputs, "Enable GPIO_OUT persistence when =
pin is freed");

 static inline u32 bcm2835_gpio_rd(struct bcm2835_pinctrl *pc, unsigned re=
g)
=2D-
2.34.1


