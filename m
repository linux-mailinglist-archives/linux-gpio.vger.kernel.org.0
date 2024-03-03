Return-Path: <linux-gpio+bounces-4083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F386F559
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 15:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97CDA285451
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 14:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57445A0FA;
	Sun,  3 Mar 2024 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="AJeokGLZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A82B5A79C
	for <linux-gpio@vger.kernel.org>; Sun,  3 Mar 2024 14:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709474543; cv=none; b=FlBTiEGtzLeYZtZZHKNZ+Ela4CJ1B3CxTAAoUzXKngBKfrGFz7g0syUTao+tFRXN7U35Jn2NDpXgoN2okNCb7j8bJLwObkG/6u/M+c+jY1NynUQpMBPXnke/O3jRPbWYybm7S35daRy4NmU/xWrf2Pe2dq9MbB9Uxr2haGZajPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709474543; c=relaxed/simple;
	bh=lECRiuSJWaP4QyRGREeVhkDPQQYnJwFCWuROb1bA+tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ewqc//Rg2nkTPaR9iu+fT/0D+p0ao4eYZ2fVplXbESEfD3ju2poEis7o7KBoYO7RV7ac73I3nPZO78PqRPG2MkmPrLhf14aFYVVvPhAHruyIwGSK8CqIKAJfzIH3ctHHwivr4B9oermOcQBUTkEWfb8UMiwSjT2A5IaSN0+SW+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=AJeokGLZ; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709474524; x=1710079324; i=wahrenst@gmx.net;
	bh=lECRiuSJWaP4QyRGREeVhkDPQQYnJwFCWuROb1bA+tc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=AJeokGLZI2lz0dpuM3pF25DydrqIzrZZ/+5ojyMSEZqZfzdxiAjcyo+aFZCsVElY
	 eMTSQFcLRBOn3R/BPVmOaZRdF9/ccSlzMFr48HNQlBJ3S+CXjAcN4/E66Vo5q890X
	 a6nPeGMkUsO7t+TTggBFyKSF3AghxHsQheZu5r0AjMlV58OcdgCFWgucZeTm89bL5
	 ac4C2pBaYnoyOzH3MYaVwZhpqU+oa9I48GBoIrLejfZuyP+pxl/c8e3Vptc0RiIJl
	 I7GMwqgWDmM2AMH37MruAbm4SLm7w2WTQ3wcjLvQ8XXRlTMZP9bPzMD/QpLeQlL+a
	 sTk92/IptgpXLZZVVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N79yG-1qmg7c37GO-017XgT; Sun, 03
 Mar 2024 15:02:04 +0100
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
Subject: [PATCH V3 2/2] pinctrl: bcm2835: Implement bcm2711_pinconf_get
Date: Sun,  3 Mar 2024 15:01:37 +0100
Message-Id: <20240303140137.157522-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240303140137.157522-1-wahrenst@gmx.net>
References: <20240303140137.157522-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bXCSHkyGiT5pFZpix0e5CvssCVAhBmhUQL5AHfxukT/TaeGfXW6
 hdjDEt6yvjLIFJpoXoitiR3qS3/OlQSs5ODWbMJpMGUHnCekmqtL/JTgiXkkHUGs/VuoXSB
 QTzIPirzIUuhkaavTB2SNkLQsOlC3eTzu5BrG4caWz/aFkS+86eLBq4H1YFxxBl83WBpU5g
 yPcsbQi/5n0HbYulC+EgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SP4B2YZj6Kg=;c8TgZYmBwovrbUH6iK/Q0h81KaI
 zZusHPy+ypC+f0122YbEX+iaqAbv9QryJzfKu0PCc6cjeMvAp7hifz+GYeUe6DrQFHfJuywSo
 QxguXzDONDwvMaCpBBRKODLI5tGOk3Hj5labo5w6OgZmTydq8yKeWcU9V65iqZJgfxhqzGURw
 WWqrVR/ME7Xp2E/nsCfzeZNfqo8jrtcs6elht98CIt+iEKOjVC1eITHx29MvdmiVy+d/kGmyQ
 G9sbqfHKiwjvKm49g6ZLzG6uCPwdn+pATNZt4T3u2HkCubR8YhwEPgY0kazGZyY40oDhLsJfr
 Ncb0xuZbABuc+HqdTZwEjN4JvcCHLJQuSA2qsvPqF6OPqMBtP81jTwjQNP/FtupdquDtoKH7Y
 9qbSyH+gGvWisgzJ/pVeK/E+A5LCjIqmVCGCSYctygPu/a21uF1J1pgU1hEtDJ/iVKEPHQGaX
 2IkUBT4L2AppR7n+wN1NS5Cun6SPjr0FEo5x65AJSCmv9Ybe9lk56SEGzq56GI2exat+MhQHL
 LdA6YIL4G+VO5z/JRPp35bbYG7hzcRtDhKvcOqTh9DoU12kNaacUTn3cK8b3w5D+e94UxVIGm
 zpnVVE17Zi9K/5XHZYIknRK91YJmvpzjK/52Gl2YRn4hrcavrw2XTwyZZHzDc+HM2MHiM3eqy
 fYa4z+WDUmgPQUGrPnNsNhFNRhf4x3+zPZki4ts4gDp8+2lrTbe5Ob4il1crvMp7SRF4ulrlH
 8OtEFlqYpOAvLt8WxbRoq3vOqR6rWrnggb659jrASQwAAdYW4Qddb91N3cGPT16c6jttl1mWW
 Jsi5Suh1kYLpwXuSTu95AHZfZz6lfWuZ7A514y4er14Rk=

The BCM2711 allows to read the bias config. So implement pin_conf_get
accordingly. The pull resistor values has been taken from the
BCM2711/7211 datasheet.

This implementation assumes that BCM7211 behaves the same way.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 41 ++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index ed768cefe5d0..7c88626af736 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1112,6 +1112,45 @@ static const struct pinconf_ops bcm2835_pinconf_ops=
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
+		if (((val >> shift) & PUD_2711_MASK) !=3D BCM2711_PULL_NONE)
+			return -EINVAL;
+
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_UP:
+		if (((val >> shift) & PUD_2711_MASK) !=3D BCM2711_PULL_UP)
+			return -EINVAL;
+
+		*config =3D pinconf_to_config_packed(param, 50000);
+		break;
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (((val >> shift) & PUD_2711_MASK) !=3D BCM2711_PULL_DOWN)
+			return -EINVAL;
+
+		*config =3D pinconf_to_config_packed(param, 50000);
+		break;
+
+	default:
+		return bcm2835_pinconf_get(pctldev, pin, config);
+	}
+
+	return 0;
+}
+
 static void bcm2711_pull_config_set(struct bcm2835_pinctrl *pc,
 				    unsigned int pin, unsigned int arg)
 {
@@ -1179,7 +1218,7 @@ static int bcm2711_pinconf_set(struct pinctrl_dev *p=
ctldev,

 static const struct pinconf_ops bcm2711_pinconf_ops =3D {
 	.is_generic =3D true,
-	.pin_config_get =3D bcm2835_pinconf_get,
+	.pin_config_get =3D bcm2711_pinconf_get,
 	.pin_config_set =3D bcm2711_pinconf_set,
 };

=2D-
2.34.1


