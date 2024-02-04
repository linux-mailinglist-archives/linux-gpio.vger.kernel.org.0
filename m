Return-Path: <linux-gpio+bounces-2915-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E63848F7B
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 17:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 183241C2164F
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Feb 2024 16:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABA623770;
	Sun,  4 Feb 2024 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="kyVUHIhf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0661823754
	for <linux-gpio@vger.kernel.org>; Sun,  4 Feb 2024 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707065986; cv=none; b=GzSd/fIwmaBtdQ7WQxjstGUf4CGCvYDKoF8GqlFIdc6t4aMZtVsC7ynmcjuIiY20K8oyuNh9uiUpcm9XOw1XrlXPg6AyyxZ3dZXrf396lq1/8DO69bW4LwY6SRzsuufnvaxVm6LZue0DwF4nkYptE9TCpoQ6nPJK3IO9joh8jyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707065986; c=relaxed/simple;
	bh=DBZ/WE6D+Fi7O27zqwzbAxoENTNSsxezdjn0kX3t45Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hnBG/yLQTkq0IttQp4TIO9pdZq/LGD/COJC4reQIcsHghf91tmb8u8cu2hhM43tYlSTmYMjSfG38Gk0xzADdiqJr8TxQ2Ehf9k0dXi+clBDZYWshG5wzlL/P8wlLE6mq5Zwwi4q0ToCwiC9UlgqU9Gdx/kOg8tbCZPHDqX8NFz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=kyVUHIhf; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1707065974; x=1707670774; i=wahrenst@gmx.net;
	bh=DBZ/WE6D+Fi7O27zqwzbAxoENTNSsxezdjn0kX3t45Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=kyVUHIhfv/ZhTiPosZmhEjAFVRwOSSwMX9hHKmVlp4S7Lp0Pv9sGTgfu6DROfUVB
	 9aFfCHH04ECO0Pf7VtVg8GLni5G/mguo/Zk7Vf7gYU81E6h4R4DA0q6zGZ757ZAkF
	 m2yxNdu9SEWAM1XDUOAdC46Adz6RqjHQ2IFm+2kBin+KhD35FaCYmJ8K7pwLMNZ6y
	 aB3dxAefwuQlAMNBxNUDX0IzSVpq1bV1lK72YdQUPbUWILLfrOK0TKeDNMGSecUWR
	 7OQawQR3+BWfef+xFrU1MVNDZk2HE1hMdlhSIh6AeYs1QrH9V1v+3U7wLACHnSgpA
	 bLra1Ke47e1VRzpduw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1qkjd231mY-00m43v; Sun, 04
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
Subject: [PATCH RFC 2/2] pinctrl: bcm2835: Implement bcm2711_pinconf_get
Date: Sun,  4 Feb 2024 17:58:52 +0100
Message-Id: <20240204165852.166157-3-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:vKoEQijiPr4U+aUr7LBczpsMZqtWF2eHsknplrEcfGWYxC7lQta
 HeSY8IKwU0ilC78q3ULHKYxD+CamHyvxbAvQ3Z85NPyut9ONN4ret5l5O1cU6tlWOpXIEOf
 JPSFt2AZCMmMPRE8yHNz0JfMG3fXGUAg2kkjtlEAY/Ehy3SsZ2m45Tmh/OGGN45+iNOH3Gs
 /ZsADbxEicMYr7/xr9y1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Lo0IAOSgyLY=;HnShHnaQic980/RWQLnD4OsvMKz
 fKZq1AZdvyQYw288NsQVQH9zehASlP0tvzX91yIoOV9agL3jvZ5CytbeSrYKJL36iz17NjXUq
 WOi7b/xyFzoq1HCA6obM1AApfz0uubEU1RwrZ+xJKZPCBf8jAL6D7UOCLiUpL9SVH6tEamKgU
 bxCf5Y/hyYlKBfzoqR0Dh+W5Sr4hSzSALFBvQFtzFG8jaTB8jr4bCPcftxFczfWMBI7tPmxBU
 vX+H7CHy+zoe05mV4CKeOZFdyvPvi9TDn5JPmMEdXBtwhas8oCVyxIJ2kg7ll7NvuqF8FijpY
 U0GakAmjiO1e5GtS4o63PXNe1IS8ybf9PE2FLqstLZkk1H7+H5oKPC+pYbF1SkWqabYvsnFjE
 LnmMdl7i1PLIqhl685+029Cc1z9KIayXWE3fuLIy1t5NZ4shQBxvBMxtd4JZwFO3QOVjpq5wW
 UrWN0MJ5ffV54OibueAEfy4zUhE3IZCgNa0dd/eP3Z5uCnccfiWF3gOAwxn+MSUlREZCtqSoD
 Jm9F0aHfHP5SoCNNeOCwWu7bAtE91S4cHflt94m5JRYL90AU/c3fYfiz2JEIb9gec6cu0EEVU
 7aC4AbJoKxt2M2FFFI+8dVNqEqLb1fuXw/C0D5zVCZd14lbFq8mkloBen09F2qFW6YAxisUEc
 Q5ZFOmJQ80VeMcNSv3w/zHp1qYf5FdIKbtnCVSoW2po3u4rIUY69eqmuDZ6Y8+F/snf7+IzsD
 41VCqPRsU9SBJIAPUa/6zFMsKJnXK0jRFDhAAWOO5p5JmpbbYR5edoIjZTwuxXpsohVGrNaFp
 lNyI+PzoD+uN1swZSJ/5r2p7mXevzZzeuUb365uMG9mWY=

The BCM2711 allows to read the bias config. So implement pin_conf_get
accordingly. The pull resistor values has been taken from the CM4
datasheet.

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
+			*config =3D pinconf_to_config_packed(param, 47000);
+			return 0;
+		} else {
+			return -EINVAL;
+		}
+
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		if (((val >> shift) & PUD_2711_MASK) =3D=3D BCM2711_PULL_DOWN) {
+			*config =3D pinconf_to_config_packed(param, 47000);
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


