Return-Path: <linux-gpio+bounces-4061-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DD86EFF2
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 10:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D781283EBF
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 09:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C371428F;
	Sat,  2 Mar 2024 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="mBDip5kD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E73B79C8
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709373303; cv=none; b=VuHxWpt96cPuLAFrqAvEnxbeLsrnygbh2o9RTfMFEtrETLf5u++aoeIl5UiKpS8mwpkvAZCt4R4HcUSmIP8VxiPBUmVZyLFKqpSp73O3sLDv2qMFNnmIKbBq5NcES6FM2e8F4cRLX5YlfkAwPCCGUPZJsGwrzgXcmYSRJ1Nqjm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709373303; c=relaxed/simple;
	bh=pxvTbFrEhKnP34X+hqvpNu02JI9TDimz+eas9scR3aU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FslnoBRcFt+9rOlMuylQHZIJcnwyyn8wottwIf0SlGUYgl9QfgL7jv1S5cOdbTXZq2UK/Ig3o5/Dm3BbhpQMDtYKePCNJDjQvgm7Z0x6HegQWW8nOiRgvx/hGR4HcpQrt52xMfoXitejtrh0iYV02xJkH/3vfO8VPuO19ANUbls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=mBDip5kD; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709373292; x=1709978092; i=wahrenst@gmx.net;
	bh=pxvTbFrEhKnP34X+hqvpNu02JI9TDimz+eas9scR3aU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=mBDip5kDBI/j2foJXg/xgHdm/efhWcpXEZ2kr3zoJxm4YezrPEknQ2h9T7mcv2Jt
	 RPWMc9L8EpZyovdOcQPr5Qbtc1nIYZHnERLCcYVpYvvm+Hm78Mgk//C4mkHfQcxvh
	 iY7Ps7X1fOM+q7eDtz0Ae3UvnB+YU6kywHkzxhexA44aVK6phSkJt58N3XBMWkIp9
	 OenGC8G3csoRAtBdGbZ1u8gFeOOhfuWaKh5LDuKmr4Acd0xvydBNFoDrgWSOEKSBa
	 dgcFS0pDILeKP6CuwNoLdqZOSl7Ep+5M3tA5LwCIN+5GK8/RI2+P54t3NtkxC72Jv
	 EKgY9sdcheSojGJ2iA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MybKp-1qxJTN0zzZ-00yxq4; Sat, 02
 Mar 2024 10:54:52 +0100
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
Subject: [PATCH V2 2/2] pinctrl: bcm2835: Implement bcm2711_pinconf_get
Date: Sat,  2 Mar 2024 10:54:30 +0100
Message-Id: <20240302095430.4871-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240302095430.4871-1-wahrenst@gmx.net>
References: <20240302095430.4871-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G3xIv53yPqofak8lVAYgqEtlc/bPM6Ubbnh330WxX92F8L4rkJR
 aW4QYQIsexT0YvdXG3nHjRQFOVGvguePsDWYw/QM1Cefxjk61x/8sRl757JuO4/w6EkzdLN
 Ip7J9K3eIJIMIfpVMc5n2hCfEgO+vyqmc4RHAgSEBloG762ImyxREWam8itdZI2d9QUP265
 SZ4IxJrVHYp0Q6qT3/sOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pn8wpvsTGE0=;jnMDqSrCSfR2yFDaPTrCTi5GGEC
 EGSBPcTAoGO10YoI8jkWR9M0a8vNZfUSfVQCsSrvNDtayNU6JZUfZtsYwGqG6xcCFMN67CFZy
 h9NcW81BZ9O1pn8h8q95bhVZtKkcaSM1wyrN8DxfTKWVqjQW65yV+NCaSPrF+45o0OKtUoEKa
 yF+y6UM8+xQB1e4eCGsxTjN3cMc6Qe2BvTjPJiFJnZ5k84g0wgV6Af0d4agRwj902O+PCGHvB
 htgrs9vhafjOkVtGf18t9W2KZngiiigQRMWJT5ONrq8JGmto6Y33b/DiWVQENzQrHM8ZBnyz9
 ras/kyocUj/HuxDl74dD7LxQpXz1b8PG8TzCx6CZYuWDGg5fjvTEGNkYOVc/EdGHjgcn8r6kw
 /a+KyeK+wXQjgbuzabhsx9VtpH652VF+YmPSQuW4YZeLD0bmwEQ1lISlV/1Yf7jxxDEJPLUhp
 30SYVKPYhV6xKaOS8YgncUtjk6r37tC5jSuVMGjPOk7f8qBL1O0IwnRYbVQD1FR00El8J/l6X
 PNj09yyxv8MxiFZL4vgDYhVO1Q2hFcly4hcm6YqWaS1fN8NVdNE4FurPcVlfdlL19AWlYZXOd
 nDW5FwaCtTKvtXB2nTTXlmsdWGLjNfsWFc3WlJVhvT8zKocLqIRNCMPo3jbLOsce7odJbSr1y
 wwNOLyWD2pxAjcfZWZBUXfhVuuh9a+Ly6gcyUyEAP7eijJywz303dQIYjBmG88r1wWDO3hkme
 oGibWaTPLat2JAZakvLD6TToMEQpNOptJu/SKBlvVHRSU1W0ollxJ0aAxSC06kxjCrIsV6kZx
 WeXtGwElymQOJS9rdoYpgPZDsRQuVquNHJMU18rAGHDq4=

The BCM2711 allows to read the bias config. So implement pin_conf_get
accordingly. The pull resistor values has been taken from the
BCM2711/7211 datasheet.

This implementation assumes that BCM7211 behaves the same way.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 43 ++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index b37c86ec6915..fcb9ab6729c0 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1112,6 +1112,47 @@ static const struct pinconf_ops bcm2835_pinconf_ops=
 =3D {
 	.pin_config_set =3D bcm2835_pinconf_set,
 };

+static int bcm2711_pinconf_get(struct pinctrl_dev *pctldev, unsigned pin,
+			       unsigned long *config)
+{
+	struct bcm2835_pinctrl *pc =3D pinctrl_dev_get_drvdata(pctldev);
+	enum pin_config_param param =3D pinconf_to_config_param(*config);
+	u32 offset, shift, val;
+
+	offset =3D PUD_2711_REG_OFFSET(pin);
+	shift =3D PUD_2711_REG_SHIFT(pin);
+	val =3D bcm2835_gpio_rd(pc, GP_GPIO_PUP_PDN_CNTRL_REG0 + (offset * 4));
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		if (((val >> shift) & PUD_2711_MASK) =3D=3D BCM2711_PULL_NONE)
+			return 0;
+		else
+			return -EINVAL;
+
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (((val >> shift) & PUD_2711_MASK) =3D=3D BCM2711_PULL_UP) {
+			*config =3D pinconf_to_config_packed(param, 50000);
+			return 0;
+		} else {
+			return -EINVAL;
+		}
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (((val >> shift) & PUD_2711_MASK) =3D=3D BCM2711_PULL_DOWN) {
+			*config =3D pinconf_to_config_packed(param, 50000);
+			return 0;
+		} else {
+			return -EINVAL;
+		}
+
+	default:
+		break;
+	}
+
+	return bcm2835_pinconf_get(pctldev, pin, config);
+}
+
 static void bcm2711_pull_config_set(struct bcm2835_pinctrl *pc,
 				    unsigned int pin, unsigned int arg)
 {
@@ -1179,7 +1220,7 @@ static int bcm2711_pinconf_set(struct pinctrl_dev *p=
ctldev,

 static const struct pinconf_ops bcm2711_pinconf_ops =3D {
 	.is_generic =3D true,
-	.pin_config_get =3D bcm2835_pinconf_get,
+	.pin_config_get =3D bcm2711_pinconf_get,
 	.pin_config_set =3D bcm2711_pinconf_set,
 };

=2D-
2.34.1


