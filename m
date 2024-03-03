Return-Path: <linux-gpio+bounces-4082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB1A86F55A
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 15:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9B61F225EB
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Mar 2024 14:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A577F5A11A;
	Sun,  3 Mar 2024 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JjcLRKi3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485B75A4C0
	for <linux-gpio@vger.kernel.org>; Sun,  3 Mar 2024 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709474543; cv=none; b=Wm7msdIUWwR5cNaELNZHPGsRAC8eAxceCvT4JK0xV9bKjfst9tQJwspOChvXJZj3fF8ymBgzGueZAGSyJdtc+Cio/uM9AUtl1SQLXFxukNN+TezfYdSqHQjQU7gKPXcIW/Ad3OXTatjMEBdq8cTVF/iu50YTEJkGxk9DOT2+kH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709474543; c=relaxed/simple;
	bh=uCS91GZqow1KBZx5XBuDBENNSV0kJKJlai0KDN1MmPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C1wQkW8pl+fd6zVl1Azl/Ycb9D+KxT7WCxg1ay5nAK+2Gn38ZDnYgYlBNPezenEArpBA6DH3rmqUrR9ImO/kYM8tFS4SibqICsfNa/CaGREMgyh19nRw8LMbXNVjVoFlq0hy72Xa0Hs43mAx7ajX7Vbf1KzMdUzmRzaYXM4qo8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JjcLRKi3; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709474524; x=1710079324; i=wahrenst@gmx.net;
	bh=uCS91GZqow1KBZx5XBuDBENNSV0kJKJlai0KDN1MmPg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=JjcLRKi3zA54WGgX9gi5QGYdl8tG2IYdtTLY9pbYaakA61Szg3dLgN3pN+F5i4yb
	 FXl4Kb4VwAQwdvcXzGWsaDjt+sS6H/nKDVWK19YP7xyJBTpZmepQ1UG2rGpoxCysy
	 +j4jI/fUh+BCV59J5L+3X0NC/I1UR8puCxTnt39oim72BILcjz4wNzQTHPXTqUomt
	 ZLvMIyXatTARlz1g7wk1gkKmcBcfI5FQEuCp5rrP7UhI74Dhc+LIrOWwDQGNTVlSF
	 F8/YxOPikFlP7DHdFG/O4ZNsKQxCuaxWoPvCoCkdFJp8jz0zDercVpe0E+zKWCf0H
	 PSrfyrU7CxLEYbx4Qg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Daq-1rnPBE1Sye-006bK5; Sun, 03
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
Subject: [PATCH V3 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
Date: Sun,  3 Mar 2024 15:01:36 +0100
Message-Id: <20240303140137.157522-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:ojTc3Wuvgjf3lkvtPOyZl2Lyi3XdZi2DhfMS8D5tfy5ejZYBHQ/
 6NUSwi/E1itHud9lvcki2znPnG64QyXQ6kR63JiFX0yfVDnbHCOhfvKezpXCaDxMIngi/m1
 dhNyu9pp1lkm+cfqzWP87f3eCnW31tstv2VvFTEeX4SF7BM0ibddkh3Lp6BSh6OrbTNz0k8
 IVugUKuuYQYf+YxJoCOQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FYYktVhprKk=;iCgM8NGpKrZYQZH9sYQHhVxTG+y
 KBd2cBLQL3UAJzNNEf6JhwFIf9rAglTFB6ljajecu/Hyl2EFJrkxdtaMzQc8dP4xBOKY4s7pJ
 EjyiDnMHnaYkmUGNWsL1ZKRukXZs35NQNPp7AQoHirltks6zAKLKSK2ktbk3zIn+g3zOMWtPq
 HpxsDVHK8GMjI8ShYCmw5A+1yRhtd+JKgwt1N1ktkpEF7lqgMikln5Y81Io+qKOWIOzMUxdkk
 UHZJFKzyyQxV2jZ+2xcfodbVWLvL+y4Hatx/1iQdGp5iab8YQr69LPn9YravXqSuEvPMiVaGT
 +s/sa5s0nMWxMWDjkfUb6AqzwmVfWUUpg+8l7Z6pMfoQ1DFHe2vj0fOw1SRZ2aHv9K5pv2P/1
 953Ox9/GAZTuFi4DcMblYBSo2f9T2RsQcxqymxgA+Ei6BIJT2y+gpCbLVrJSxmafS0L5AsGiu
 YptfUMr8kXZiI7sY1AKE1vKr94abd5tld352ucaRdOx9NgFoTdxWRdLskvz2R9/c6jnlblT87
 TWWD1pFZk0qRkr92+KLQMe8kbUDl2xvhZ3abHPZMLKDIZqoakHA2iFd7DnqgafwtKon5fM888
 cdwyRPNmMR3hg02ryEpQhHzg8zgd5t+pPetYwAyJlp1b3hkkMRTzVeZgH1bVN2gRjsuTdykBx
 B9G3aTJ6iL8fNbvSRME61qJnFZu0wXSrk4vrNK/Sy45J/08z1M5Dgjm4tH8BC9+Kj06GEIbRP
 4tDlGdxXAy1tfMI7ycJzD+u9VghDgLfWVclSUF9kKtzQUH5X+kvP0DwTRPDMPDtNkacaKw4kn
 h1Tpbqa6zir8r46zGe9pZhAkovY9oMqpYO4P0lLpzjrHc=

Even the driver already has implemented pin_dbg_show, it could
be helpful to implement pin_conf_get for a more generic behavior.
Contrary to the BCM2711, the BCM2835 SOC doesn't allow to read
the bias config, so the implementation is limited to the basics.

Keep ENOTSUPP here, because it's only used internally.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 37 +++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/p=
inctrl-bcm2835.c
index 1489191a213f..ed768cefe5d0 100644
=2D-- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1003,8 +1003,41 @@ static const struct pinmux_ops bcm2835_pmx_ops =3D =
{
 static int bcm2835_pinconf_get(struct pinctrl_dev *pctldev,
 			unsigned pin, unsigned long *config)
 {
-	/* No way to read back config in HW */
-	return -ENOTSUPP;
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
+		break;
+
+	case PIN_CONFIG_OUTPUT_ENABLE:
+		if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
+			return -EINVAL;
+
+		*config =3D pinconf_to_config_packed(param, 1);
+		break;
+
+	case PIN_CONFIG_OUTPUT:
+		if (fsel !=3D BCM2835_FSEL_GPIO_OUT)
+			return -EINVAL;
+
+		val =3D bcm2835_gpio_get_bit(pc, GPLEV0, pin);
+		*config =3D pinconf_to_config_packed(param, val);
+		break;
+
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
 }

 static void bcm2835_pull_config_set(struct bcm2835_pinctrl *pc,
=2D-
2.34.1


