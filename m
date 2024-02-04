Return-Path: <linux-gpio+bounces-2914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF15848F7C
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 17:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D8721F21E71
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 16:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211822377E;
	Sun,  4 Feb 2024 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="F0vNrEV3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CD523758
	for <linux-gpio@vger.kernel.org>; Sun,  4 Feb 2024 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707065985; cv=none; b=FDMzgY1D33Jc1FosThYFkOEeg9NZs/9Ok18bIFL+6PoeMtNxxqxEwfRgL8yrGbs77cRk+toW8PdrQjbiDIniwb3WXtWzAAnH7jL9qqd7oRXPNw7gBRZO/57EElYevOkeldQRxMlL8mkXfPgfXsSVzK/W3wRF8tQg3mNIcF63Zqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707065985; c=relaxed/simple;
	bh=vxjfUH6oE+5NHrasm9nsqIMIn8HoUbUx645/gxxS4D8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gj2GykHMQOPIBvZOIDi8EgbOLhb4U/RpbmvYog+Tw/xgprtb/a3jdSFsaAhffBUD0P6vSS4N+L6XtID59hVPwTNUpYxAjoODt+JzMytyYkpatSPsaPJUrM5WFYt8Jr9ng6KE9BCPdypv9NAxpKwgDV/I55sQ9IjRcILxHs8ruy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=F0vNrEV3; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1707065974; x=1707670774; i=wahrenst@gmx.net;
	bh=vxjfUH6oE+5NHrasm9nsqIMIn8HoUbUx645/gxxS4D8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=F0vNrEV3621PdX8nyXwp1IkK7SmUZ1Ljhi5Y7Phtw5+hGRN3GBEdk6Csi/U8Rbu3
	 BNHzgl277eesTz7KfPMYkxTdFoiEjcxGLiYWjAaRydm2kgjNFLbw8pvuJUfpbs88g
	 k/v/0fLoRYz0vc6f25smPmdg3Bve+IZDREVfNaba0B1RB11et08iHMqd5hitm91YB
	 L4Vv7gNH+NnQaE/jAWYuaJ9IW//5dUvp2+lMFVH5aJeYdQrwY00cpuz9k5POAcIWR
	 Wjddwc5x2MsWrG/OIP6w3re+aefYOzoU2U76PBlNizcn4YC0/w1RiAIXugDDo8REh
	 lhbG7aA3e1hqUUK48Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mv2xU-1rErwM1Mcy-00qyRJ; Sun, 04
 Feb 2024 17:59:34 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
Date: Sun,  4 Feb 2024 17:58:51 +0100
Message-Id: <20240204165852.166157-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240204165852.166157-1-wahrenst@gmx.net>
References: <20240204165852.166157-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xzTypoUdgbS5hEMlJo09VZ5gTXUWydVhAsmF0okdeDTHZCrxMpn
 XA+5PPcqZkAPE5Dczh/b9H4BHcPgOMEzwljBKPlff2vxvOZIP3wRBTV7WMGkoLZ/yLZItMR
 2SBbb1gFbxsc4k3Yx2vcNm7a+iO+YdKkJaXrUuZGRHwBXB6LoY4n37Nicm7Oo7WaFyBHITh
 NWa+8PSdSW3Cjt1u2gXkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:00r6adlArjk=;aP6V6y9/vrmu7dA8xq6+YgdAjU7
 p/VuGwX4LnuoDrIlo8UNwiBx21W/T8kHlrZsgrbywv6xUv+LGPPPKWP6j/Wi2Ou18W1ch1OwK
 CKtmgdrQiYkhhxGmuQp+Eeg3Uzei5M6stJ+oM7BmVtH4f0UILkdxzhxagjx++BBi5o0rdMsrE
 I/DZYQUAq2hxa25EwvYsXqHX5fof1xgPLxCVJHnbQpyEAevz0xFt/XAM4HOOJNbe/bsLdLtUk
 UDoqijl3UW4t1Hd1r7i6b3FZ1Lcfdbz8qasL83BF1hs478mtHd+FZ2FOpWJOav0IvrB7qAPV7
 UrxmRaBSDUflcpo24ekDA1gAaDbVQhAQzRogksDWgiDyX2IBT1J2XZJZwu5z7XKLTh2xoFdA4
 Ieg8mE8QW4hhQAXX7th69zKcOBQAjDjCLf0p4y7M0h1NSl6n5begZ1HBrSYD94mvvH32jp0p1
 WK3tgUUY0RwvJ22d/2nUMB+hkBWsVAS/LDh59opek3Ir/dPKRrI9PLDhW/VqDcyCB+6p3EMMV
 HPzvZxulvxJrid8QXvYwXzgjYdSH8ns12r9GlvQR33FCmdhkWHBG/mQapJBMTLRFcZ0cobAth
 2GJqomOFh8NGDPOMJ5iJaZU5q+0mfC0qMX8QoY1t+dp43laFfE2+6/usuVLXJwmg2fjJyngTt
 koekaNPRg/tST7jDLu5sCXxAtgI9db8xW1nVXTvgIw11YXh5kbOIICJfoO0svY0gF4wPEOTrT
 Z78cB6uoc219kW6ttw6+mWL6AFwoUPJMAMqU+EnGJpGf8QMyPG4Ap6EPRB17ZZgG1Otd7pIM0
 akBcIol0UlzHGmnzo6hzR6IpwbWYY4Ko1MU981hazcLjI=

Even the driver already has implemented pin_dbg_show, it could
be helpful to implement pin_conf_get for a more generic behavior.
Contrary to the BCM2711, the BCM2835 SOC doesn't allow to read
the bias config, so the implementation is limited to the basics.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 35 ++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index 1489191a213f..b37c86ec6915 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1003,7 +1003,40 @@ static const struct pinmux_ops bcm2835_pmx_ops =3D =
{
 static int bcm2835_pinconf_get(struct pinctrl_dev *pctldev,
 			unsigned pin, unsigned long *config)
 {
-	/* No way to read back config in HW */
+	enum pin_config_param param =3D pinconf_to_config_param(*config);
+	struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
+	enum bcm2835_fsel fsel =3D bcm2835_pinctrl_fsel_get(pc, pin);
+	u32 val;
+
+	/* No way to read back bias config in HW */
+
+	switch (param) {
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (fsel !=3D BCM2835_FSEL_GPIO_IN)
+			return -EINVAL;
+
+		*config =3D pinconf_to_config_packed(param, 1);
+		return 0;
+
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
+			return -EINVAL;
+
+		*config =3D pinconf_to_config_packed(param, 1);
+		return 0;
+
+	case PIN_CONFIG_OUTPUT:
+		if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
+			return -EINVAL;
+
+		val =3D bcm2835_gpio_get_bit(pc, GPLEV0, pin);
+		*config =3D pinconf_to_config_packed(param, val);
+		return 0;
+
+	default:
+		break;
+	}
+
 	return -ENOTSUPP;
 }

=2D-
2.34.1


