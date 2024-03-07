Return-Path: <linux-gpio+bounces-4189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFE487486B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 08:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36BD528440D
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Mar 2024 07:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36A21CF8A;
	Thu,  7 Mar 2024 07:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="eqUErcwQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF19A1CD1E
	for <linux-gpio@vger.kernel.org>; Thu,  7 Mar 2024 07:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709794907; cv=none; b=d4N095WKWRfDiVamt5NKwHOF0NFON7erph3SrJMOWenOtd8UJrVwXAzNdcNsMFIMKlnyQ5buTFg5lgYyTy6iCSlcLfTiDQQEl6rKfOt70T3y6yJdXj4BTDHWhfM1g1RcYetlDeAVCu1tmd7JOFbp+AOZiX9gkSMyMd59eFOYXK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709794907; c=relaxed/simple;
	bh=ifYiOgp3knTsR6lC0MHYh79PwcVHlan23djwx4rl6OU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9mKq1D/tudV9Pbxy44xTZ/dU+ELOj4ntc0hubDTCqRzygU/WasPTbUGPqZMWg3flYzDO9gRNZGpOUMgEv6eXlCLwD6+1ENJF4tcvrYa8RBDzTjxAlIgS3RnLNGLTWQc33yAajAMpiN9JR3brtNlvlLjJDopAgj4Lz+CrwQhSuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=eqUErcwQ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709794895; x=1710399695; i=wahrenst@gmx.net;
	bh=ifYiOgp3knTsR6lC0MHYh79PwcVHlan23djwx4rl6OU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=eqUErcwQMb/NC0eL+Qu273xANDwup/kw4KBWDclbx8da76rWxjGTjN/l575VmS5Z
	 /8icEyxV9/Mbqi1pifCl5U0/HbLGfmjFpW4/iQ13SpuYcySDl1OlrERYeABZBC+Un
	 UChKOMILkV4QrvHGn4sKqZQXxgbZUB9oDYUgoms+PDzRMhMhG6oCULxinu9E/XP1L
	 vpGfdjMIqif4xe2XaWNNtCxrQ1THNRBs0DXllwzXRrgin7ivko081IR1Kb+nYYCEv
	 HQ/tzTH3V0MUs0cAnn7jKSoRCnSduHUGMq1S/MRqcLxuZfU29w/6u1fZVIR2TWWS9
	 O3I3gO6a7kRcvcihHA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My36T-1quzY02y47-00zSba; Thu, 07
 Mar 2024 08:01:35 +0100
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
Subject: [PATCH V4 2/2] pinctrl: bcm2835: Implement bcm2711_pinconf_get
Date: Thu,  7 Mar 2024 08:01:13 +0100
Message-Id: <20240307070113.4888-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240307070113.4888-1-wahrenst@gmx.net>
References: <20240307070113.4888-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DCccPuS8QyVdPnMEcwog/EF0++clZNFV5FmydDrTVqEaJx5LsSa
 I4KEmckJZowefSlMYv9rYno83+Bg8210wiTRtSIIp33KgcpT/l1N9UhDH+p0RcvQVbMp3dq
 luGMo9m6WJa6uAm+7R8v/xKp8sCHGa94b7rFk/BixUPMq2DBagRGAVcUnhzaad0p6Gsmiw7
 Bkr4G2Xsk+JkiUMimv34g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:11mm5wwasfY=;sWUeDeS0YKe2o8YXTrSL4SrjuaB
 iFhcu7nmkhM1FuTfPfRNqEA5OnkbaQLe3QtQHhGSVC9s+6qP2uRr2raJCgzcKLvLVUMdX1wKl
 7FiAP2EkYsCZRr9ln7U0zR6DMnPiGb/h9oSzU4u5AgtrsqzSvkfPjR57rm6WWwKj2rzvhZv6D
 MWmmRmr6hmfLucMVjpnxoH0hIuTkK0cxQIfNvV2/Oav1c+yJMGExXtsXLkmTLbBdMC+ZhoErO
 GXE78Y2T72PoULNPJ0s2mee05z2K6rxDONvTmWtn9VW6E3rSY4X9oL42/mrTUiqZNK7/yfXYb
 gw8xrcxrrCTWcwdRYTLUAO05iLTYYzjKJXei9UAGMTg89rgqdziPic6hnbexYLJkY32EHkLs2
 CjKRgXiBGwgganx7WYV/ep5sa+jrX9YB+0WXCvOZi7DXowZ2XhJHBJH1RXhKmVHXxtIdfBdvM
 YFdnFD5v9951S+Em4aze3zR8djFNVIjXlCogs1CIKwjfjTqzzVvPdCd+SBHHSB1hMB1YLWE9P
 t1toud1viYuSor/vOe4kdBulICzQ9UuTor1oY4uiyHy+BJtMlpCDEeqpW6zywsO4RsZL6SHKq
 SI9d59bDwYBrihyzBqFPNHvhyAVPiZyDFbglRgIV/GHiTJaQFeOE8wXatDnQtqAcJBfz5V1DZ
 hPzs/c9VijnEtsenGYvnBExvapuP9MEEOZoR8SoNhlNahBi29deVhrSlGxEUaHQXm7ekkoUuN
 k/XSBWj4pv4f7YggKVtzZaCqIOs20pSjqkM+xtr5QC5DutPPo4CRY14nolAL50hS5fvfeY+IH
 VCM63FxNBSxRawI7wmO9WRHmu7bgCSkFIvTsQQ/X8xgCA=

The BCM2711 allows to read the bias config. So implement pin_conf_get
accordingly. The pull resistor values has been taken from the
BCM2711/7211 datasheet.

This implementation assumes that BCM7211 behaves the same way.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 41 ++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index 5d2b188a1ef4..f5a9372d43bd 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1098,6 +1098,45 @@ static const struct pinconf_ops bcm2835_pinconf_ops=
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
@@ -1165,7 +1204,7 @@ static int bcm2711_pinconf_set(struct pinctrl_dev *p=
ctldev,

 static const struct pinconf_ops bcm2711_pinconf_ops =3D {
 	.is_generic =3D true,
-	.pin_config_get =3D bcm2835_pinconf_get,
+	.pin_config_get =3D bcm2711_pinconf_get,
 	.pin_config_set =3D bcm2711_pinconf_set,
 };

=2D-
2.34.1


