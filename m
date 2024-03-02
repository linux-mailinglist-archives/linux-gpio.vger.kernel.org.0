Return-Path: <linux-gpio+bounces-4060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FBF86EFF1
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 10:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCD87283A1D
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Mar 2024 09:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584C71428E;
	Sat,  2 Mar 2024 09:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="YuuGuCwX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BA213FF1
	for <linux-gpio@vger.kernel.org>; Sat,  2 Mar 2024 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709373303; cv=none; b=rbzfdBlwyjGqhiL0gObUqxWNwB75hlD4wM/lef1JT6GpVULuyLcGNqph+yjnk5vAFXEY85uz57iC9lGJskjAi7Q3SXQaNavUPNdrdGQ6qClowN7YCCp5/yZBDb1Kue6/H6w+M2zXY7GWpcm6olzuZIdxHfuEwb3Tn/JrngvpXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709373303; c=relaxed/simple;
	bh=vxjfUH6oE+5NHrasm9nsqIMIn8HoUbUx645/gxxS4D8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gL+YOettAg5U9LTdAHSgiEqqcMYm27zLfmuR5gq1FFws8n9Xdm1ZwhuxDF6Mjcgo/PcrejleBeiuUL27dA9jq+Kaonn1Q6XdnKr1sTG7vxf5yn42aXHgerY4lAyF2CbtxZ7LHtwkgHZRA1qj6RjctQp1C0JHSfSO+bO95Eg7MTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=YuuGuCwX; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1709373292; x=1709978092; i=wahrenst@gmx.net;
	bh=vxjfUH6oE+5NHrasm9nsqIMIn8HoUbUx645/gxxS4D8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=YuuGuCwXxQImDr5Hs9a/lqXPG4BrsZz9PjgU2C8ZdKrbWI/zWAkVmOIUdjxW4wGX
	 FXLGuijkkWy09qQM3LfryluRg31o8nDi1qFATLtihXfKVHTGuXJEzCR4uuRLnNLPM
	 wkiXER2UJx/aOe7QfPAzcCaNg7rsMtiTJ2xRZL1EbcYJnZqEIUm8Sbp9DvHoO74H1
	 RN6/iXaWzZdIXElIUdidQ3LM0dStbmznZErnITGWnDJlK6awk/nNQLN0lY/dAnKzb
	 WIjwSJjfLGALoa6x2sCwXmQ+DACp4alXJH20pB1zuTCiZpkwEeMl3mW5Zq03qiIt+
	 v5pZS22lftarXD1Nkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUowV-1rG7wo3lJZ-00QgHU; Sat, 02
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
Subject: [PATCH V2 1/2] pinctrl: bcm2835: Implement bcm2835_pinconf_get
Date: Sat,  2 Mar 2024 10:54:29 +0100
Message-Id: <20240302095430.4871-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:c15vxFlTnCc3Lz7gwS+zvXayDt6flnwermTsw0Q33JwhKKbEJn6
 esuilFN9XKlmjBBujcj74DWH4/v6lBiBfbMC7AKsx/i+s8tBTh3VH2McfxPlWdk6+6ObP+e
 2eoRiyV7UUTfEedkHTCOcwOxs2UjO88FFYDkwtIOxit5RQ4IPwlRVnWNV7O2xwZhqtfhVTL
 pIMy9WqBbd75wSW1HUc2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+kw/xRZqaEA=;8KNR/eJfixXGPAdEholcLjyz6Ec
 F2vQVi7yuCG4QqSL/2F/BEgm3Y9W6bh07KovZQym+ewClnjfJMGUSOdisXQg7OO5MDL9g1nVV
 G8FCboc6RRBC8xriamArXwQTH4c8vfSV19zvO6FyDggNtSOarqyD5azMF3ZhvgiFXaEaM9vjz
 w1m9JrbmEoCIe7zVDHHZBhmgtKjk17n2fKe9jLcc1W07sIb8usdHht2XP0zYLE0/QZdpcMzYQ
 +B5E60UbKyilY74Y9XFMVgznO4jeKpf3kNIKr7bzD0hBWsCeoPuYNfgNuk/HqmpY8Xgya2ltW
 EiAK19k+Qht3X2I93DT63GBd2d2errni3qZQb3dOADZqKXRzQt005T/tQ38m7FXue1dihXUns
 LFtHdj3xl8S05fs1A1aaxOY5Lxenxq16Xqgct/JJtqJg7AueQNHd38QddQIR4EHDulE08y6bk
 eJookqAfmHVxj/4w1xilq1hXNH+5I/h447eteJEPwmRNc0V0HTAvv0uM0V8tTlxHjkGcTKYzg
 3pzxljA5jFyzE8pbT8568PnMGCFl2cp7gVqV4Vj4bkDiaD+fhzB9KdGkixmwGiBSOl6JDL3QM
 Y5r09a703fjqB77HlPejcUMmxKSZ32ceNK1BABqx4EucdL6hhTgWkvFMlLhssx+9fG5vqy3zl
 B9Wz9yXEgwyn7o0HBc/djGKa1YEOAPR7hl5FV73RZiV65hnzci3mwAL39t1zUHJ00pkcio6+2
 bp5VKv33eBDPbNKlqTGmN29gld0oL4I6Z7Pgcn9hoKzzZQasUlIB/B+Zoz2wx4dTuAcCeHLbm
 osB0Hv7155Is4+73sAiWGDHopjvpp1vLdvBN4w3/Iur7s=

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


