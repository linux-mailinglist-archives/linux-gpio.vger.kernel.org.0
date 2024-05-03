Return-Path: <linux-gpio+bounces-6024-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27B8BA704
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 08:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C611F2238E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 06:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08EC13A252;
	Fri,  3 May 2024 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="KKHbWn3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1511A13A245
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 06:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714717702; cv=none; b=ZBmOVeKjUCQXJk0h42bH8pxmmGF9mbl8P6LoRgwsI2PVOb7WbM+DjA8tnEHW09rwytx7+FvD94e4rG9kVOLAJpn/9NaQKx3w9DXGJSdE4n6Pyux+KFJXPmPho/0Wly3TznFRPYj32upVyLg5FSZeI563UU2/sNHFCzWTEk8Aw3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714717702; c=relaxed/simple;
	bh=IUwge+7iOSeg+/AHeqJXo1xPk55YNKp1I9CeP6EhQD4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=czQ1hjCTFxqtu4tFSiPmQM+4FFCbsuwkZsuDEFloHUjdMfup4hLZiNxxo8TJnDuHfzx+merU4F6lqKKKBDU3qe/SjJraWRBAElMiD3luchAcQfhd4dRrP+jyuwxf9lZFw69WYatLGjHUm2+r1nCuMbeHUm9LKdtvRdGXdQ5e6zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=KKHbWn3h; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714717689; x=1715322489; i=wahrenst@gmx.net;
	bh=Q1p9KR+G9aa+TDUZhbp6bfC0A0vuMuQ1F8vjV2eqkoc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KKHbWn3hp1xONDA1XvU7sihywV/duqD8qgW9txu+GmL8vlA0g7i31NJ8qrOK/+RM
	 5nthmlILyZVNc6NpQ6FGEgH1vG3/F/vrYnLMRQKJIuyhImmp0HzTwzVQEKNPcKNfa
	 jyMBU9/g/6eUvMYZXIuGXdcSQh/pG+QYV3g4fG9F2rDk/6vCDovOYMfWfSAKHIhal
	 knrkugOKWit/HWdYiBmgqkkB3o1tObh3Gb40uaZECT4abOV2DjBO+3k67gaS08LCu
	 tRq2ZprfFfYWGTR2wPHFYVj4f1Du8AeeHJIus2nIX6qCNWl64mRESIx2rPr5sJkP7
	 PA2SV+vPB2YHCWiFEw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFsUv-1rrZB944YJ-00HMbM; Fri, 03
 May 2024 08:28:09 +0200
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
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2] pinctrl: bcm2835: Make pin freeing behavior configurable
Date: Fri,  3 May 2024 08:27:45 +0200
Message-Id: <20240503062745.11298-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4U3OBSwNwE4ir9nLtcGNRIwLehYn5ZgXVQDgGfW5WPXLvk+lmwP
 7RHzHHmsubv9jYnStJXl4oZ8Kau5Mw0oZ56dvkGTKhI1aw43qVUm5zIQWk/OV5KQDpEU6pc
 8MPzSS95z5xQSNJLKk/Bhv668ezZELacIOvf6heSWtA8Ol3h195AtdNUWRgGe3DoxFecjMl
 hnP9tVEyjmTpPD0QrpluA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i7A+T2fS+eY=;9pgMDjQbnCzS1rdAajih5R5rwdd
 ahvm4KqcrcjJdFh+ZMhEiwqnQLC/M5aitUmexs4WoFPk6534saG666lk3kSWssds95GgN+nlj
 13euBSeENeryN6bJY15uvNzLsAg0++2DLVd7cuzfnuKQDaKl5qHPcJOjhk19BqgPOgzr1e6Fe
 D2T36LPdQXsX/wK613q4oDKjoVdU+45g/Gf96An8VxSo44Ew1XMNpPnzgfiAdhxni06K+Hxnz
 Oj3d3LHp4uUOMAzvqpvQQtwiVWjYDCsXPUw20zY2rAh3hdHRE0rnfTMbC67AjoKKzlHgPoj2I
 0d8WOhQvuUnK4ocgyNOvxaBvstBSzNErFI8Rf3xAEvooyDj3+0vzDVkXNuRMbs29QvI5chVTc
 c03pQ1E0B8YP1NGsWdvx0Hb/aeyRRbmU9zwESYSTSWJJJ1LXc2zbf5SkqSBRP43iop5py3OXA
 8PXa+UgqskHGMwkhCO0ATjR6TK5QY9JL5eox6HJWFzlPIQBPm+HRcFRBKcoHYGQyy2l+KFARF
 7/nnEn8lhVKuZf1UmLvFSw4HYCGDjtDwrt+E78HBhAVZCp87dDsExDbw2Ct1Wa86wkH/BuZaB
 nR3vlukwtQMBOzsLGzXx2ChZXVPQHyVwcE2Me3OpFZIW2l/WYk6jMZOuMbh8r5gwuQGa8man4
 sIdQOCgG9uBD9UnD27fUzth2KwPDd945q5+msL5Cl6bRH4/z4LCFjM/K9qMbl3aJkWSVq2uRo
 eBpV3yrBcrZKQqkQjg8YY8j+MCwqCbw9PcpH4eFULL9K5apP0Ysv2sqMaB50eoBY1K/3U666+
 wnfGNqr37es59uhGy2deohv6ezTBKp46lVZxQniMRawuc=

Until now after a bcm2835 pin was freed its pinmux was set to GPIO_IN.
So in case it was configured as GPIO_OUT before the configured output
level also get lost. As long as GPIO sysfs was used this wasn't
actually a problem because the pins and their possible output level
were kept by sysfs.

Since more and more Raspberry Pi users start using libgpiod they are
confused about this behavior. So make the pin freeing behavior of
GPIO_OUT configurable via module parameter. In case
pinctrl-bcm2835.persist_gpio_outputs is set to 1, the output level is
kept.

This patch based on the downstream work of Phil Elwell.

Link: https://github.com/raspberrypi/linux/pull/6117
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--

Changes in V2:
- improve parameter name as suggested by Kent Gibson

 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index f5a9372d43bd..b4293a827a89 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -244,6 +244,10 @@ static const char * const irq_type_names[] =3D {
 	[IRQ_TYPE_LEVEL_LOW] =3D "level-low",
 };

+static bool persist_gpio_outputs;
+module_param(persist_gpio_outputs, bool, 0644);
+MODULE_PARM_DESC(persist_gpio_outputs, "Enable GPIO_OUT persistence when =
pin is freed");
+
 static inline u32 bcm2835_gpio_rd(struct bcm2835_pinctrl *pc, unsigned re=
g)
 {
 	return readl(pc->base + reg);
@@ -926,6 +930,13 @@ static int bcm2835_pmx_free(struct pinctrl_dev *pctld=
ev,
 		unsigned offset)
 {
 	struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
+	enum bcm2835_fsel fsel =3D bcm2835_pinctrl_fsel_get(pc, offset);
+
+	if (fsel =3D=3D BCM2835_FSEL_GPIO_IN)
+		return 0;
+
+	if (persist_gpio_outputs && fsel =3D=3D BCM2835_FSEL_GPIO_OUT)
+		return 0;

 	/* disable by setting to GPIO_IN */
 	bcm2835_pinctrl_fsel_set(pc, offset, BCM2835_FSEL_GPIO_IN);
@@ -970,10 +981,7 @@ static void bcm2835_pmx_gpio_disable_free(struct pinc=
trl_dev *pctldev,
 		struct pinctrl_gpio_range *range,
 		unsigned offset)
 {
-	struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
-
-	/* disable by setting to GPIO_IN */
-	bcm2835_pinctrl_fsel_set(pc, offset, BCM2835_FSEL_GPIO_IN);
+	bcm2835_pmx_free(pctldev, offset);
 }

 static int bcm2835_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
@@ -1419,6 +1427,9 @@ static int bcm2835_pinctrl_probe(struct platform_dev=
ice *pdev)
 		goto out_remove;
 	}

+	dev_info(dev, "GPIO_OUT persistence: %s\n",
+		 persist_gpio_outputs ? "yes" : "no");
+
 	return 0;

 out_remove:
=2D-
2.34.1


